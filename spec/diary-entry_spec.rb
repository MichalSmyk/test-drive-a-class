require_relative '../lib/diary-entry'

RSpec.describe DiaryEntry do 
    it "creates" do 
        diary_entry = DiaryEntry.new("the_title", "the_contents")
        expect(diary_entry.title).to eq "the_title"
        expect(diary_entry.contents).to eq "the_contents"
    end
    describe "#count_words" do 
        it 'returns the number of words' do
            diary_entry = DiaryEntry.new('my_title', "here are few words that need to be counted")
            expect(diary_entry.count_words).to eq 9
        end
        it 'returns zero when no content is given' do 
            diary_entry = DiaryEntry.new('my_title', "")
            expect(diary_entry.count_words).to eq 0
        end
    end
    describe '#reading_time' do
        context 'given words per min of sensible number' do
            it 'returns number of how long it takes to read the contents' do 
                diary_entry = DiaryEntry.new('my_title',"one " * 550)
                expect(diary_entry.reading_time(200)).to eq 3
            end
        end
        context 'when wpm is 0' do 
            it 'fails' do 
                diary_entry = DiaryEntry.new("my_title", "one two three")
                expect {diary_entry.reading_time(0) }.to raise_error "Reading time must be above 0"
            end
        end
    end
    describe '#reading_chunk' do 
        context 'with a conttents redable within the given minutes' do 
            it 'returns full contents' do
                diary_entry = DiaryEntry.new('my_title', "one two three")
                chunk = diary_entry.reading_chunk(200, 1)
                expect(chunk).to eq "one two three"
            end
        end
        context 'with a contents unredable within given minutes' do 
            it 'returns a readable chunk' do 
                diary_entry = DiaryEntry.new('my_title', "one two three")
                chunk = diary_entry.reading_chunk(2, 1)
                expect(chunk).to eq "one two"
            end
            it 'returns the next chunk, next time we are asked' do 
                diary_entry = DiaryEntry.new('my_title', 'one two three' )
                diary_entry.reading_chunk(2, 1)
                chunk = diary_entry.reading_chunk(2, 1)
                expect(chunk).to eq 'three'
            end
            it 'restarts after reading the whole contents' do 
                diary_entry = DiaryEntry.new('my_title', 'one two three' )
                diary_entry.reading_chunk(2, 1)
                diary_entry.reading_chunk(2, 1)
                chunk = diary_entry.reading_chunk(2, 1)
                expect(chunk).to eq 'one two'
            end
            it 'restarts if finishes exactly at end' do 
                diary_entry = DiaryEntry.new('my_title', 'one two three' )
                diary_entry.reading_chunk(2, 1)
                diary_entry.reading_chunk(1, 1)
                chunk = diary_entry.reading_chunk(2, 1)
                expect(chunk).to eq 'one two'
            end
        end

    end
    
end
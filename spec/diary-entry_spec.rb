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
    
end
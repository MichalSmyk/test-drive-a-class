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
    end
end
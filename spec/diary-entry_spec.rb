require_relative '../lib/diary-entry'

RSpec.describe DiaryEntry do 
    it "creates" do 
        diary_entry = DiaryEntry.new("the_title", "the_contents")
        expect(diary_entry.title).to eq "the_title"
        expect(diary_entry.contents).to eq "the_contents"
    end
    describe "#count_words"
end
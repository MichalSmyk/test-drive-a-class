require_relative '../lib/grammar_stats'

RSpec.describe GrammarStats do 
    it 'initializes' do
        grammar = GrammarStats.new
        expect(grammar).to be_kind_of(GrammarStats)
    end
    context "#check" do 
        it 'checks that the text is passed ' do 
            grammar = GrammarStats.new
            result = grammar.check(' ')
            expect(result).to eq false
        end
        it 'checks that the sentence starts with capital letter and stops with stopper' do 
            grammar = GrammarStats.new
            result = grammar.check("This is a text.")
            expect(result).to eq true 
        end
        it 'checks that the sentence starts with capital letter and  has no stopper' do 
            grammar = GrammarStats.new
            result = grammar.check("This is a text")
            expect(result).to eq false
        end
        it 'checks that the sentence starts with small letter and stops with stopper' do 
            grammar = GrammarStats.new
            result = grammar.check("this is a text.")
            expect(result).to eq false
        end
        it 'checks that the sentence starts with small letter and has no stopper' do 
            grammar = GrammarStats.new
            result = grammar.check("this is a text")
            expect(result).to eq false
        end
    end
    context "#percentage_good" do 
        it 'returns the number of texts checked as percentage' do
            grammar = GrammarStats.new
            expect(grammar.check("This is a text.")).to eq true
            expect(grammar.check("this is a text.")).to eq false
            expect(grammar.percentage_good).to eq 50
        end
    end
end 
%*************************************************************************%
% @BeginVerbatim
% Title: IndividualWord
% Description: This is the IndividualWord class that represents every
%              single word that occupies the population. Thank you.
% Version: v00.01
% Author: Kurl Angelo D. Palaganas
% Yr&Sec: 3-3
% @EndVerbatim
%*************************************************************************%

classdef IndividualWord
    % IndividualWord class
    % Represents every individual in a population
    
    properties(Access = private)
        guessWord   % Guessed word
        targetWord  % Word to be guessed
        fitness     % fitness of the word
    end
    
    methods
        function obj = IndividualWord(guessWord, targetWord)
            % IndividualWord constructor
            obj.guessWord  = guessWord;
            obj.targetWord = targetWord;
            obj.fitness = obj.calculateFitness(obj.getGuessWord()...
                , obj.getTargetWord());
        end
        
        function fitness = getFitness(obj)
            % Get the fitness of the word
            fitness = obj.fitness;
        end
        
        function size = getSize(obj)
            % Get the size of the word
            size = length(obj.guessWord);
        end
        
        function guessWord = getGuessWord(obj)
            % Get the actual word
            guessWord = obj.guessWord;
        end
        
        function targetWord = getTargetWord(obj)
            % Get the target word
            targetWord = obj.targetWord;
        end
        
        function mutatedWord = mutate(obj)
            % Mutate the word
            MUTATION_RATE = 0.015;
            word          = '';
            
            % Loop through the word
            for i = 1 : obj.getSize()
                % rand() generates value between 0 and 1
                if rand() <= MUTATION_RATE
                    % If the random value is less than mutation rate
                    % Generate a new letter
                    word = strcat(word...
                        , IndividualWord.generateRandomLetter());
                else 
                    % Else, just add the current letter
                    guessWordTemp = obj.getGuessWord();
                    word = strcat(word, guessWordTemp(i));
                end
            end
            
            % Return a new mutated IndividualWord object
            mutatedWord = IndividualWord(word, obj.getTargetWord());
        end
        
        function crossOverWord = crossOver(obj, partner)
            % Crossover the word with a parner
            word = '';
            CROSSOVER_RATE = 0.5;
            
            % Loop through the word
            for i = 1 : obj.getSize()
                % rand() generates value between 0 and 1
                if(rand() <= CROSSOVER_RATE)
                    % If the random value is less that crossover rate
                    % Get the current letter of parentA
                    guess_Word = obj.getGuessWord();
                    word = strcat(word, guess_Word(i));
                else
                    % Else, get the current letter of parentB
                    guess_Word = partner.getGuessWord();
                    word = strcat(word, guess_Word(i));
                end
            end
            
            % Return a new crossover IndividualWord object
            crossOverWord = IndividualWord(word, obj.getTargetWord());
        end
        
        function calcFitness = calculateFitness(~, guess_Word...
                , target_Word)
            % Calculate fitness of the word
            calcFitness  = 0;
            wordLength   = length(guess_Word);
            
            % Loop through the word
            for i = 1 : wordLength
                % Current letter of the guess word
                wordCurrentLetter = guess_Word(i);
                % Get the index of guess word in scoring via indexOf
                % method
                wordCurrentLetterIndex = ...
                    IndividualWord.indexOf(wordCurrentLetter);
                % Get the index of target word in scoring via indexOf
                % method
                targetWordCurrentLetterIndex = ...
                    IndividualWord.indexOf(target_Word(i));
                % Calculate the fitness by the given formula
                calcFitness = calcFitness + ((wordCurrentLetterIndex...
                    - targetWordCurrentLetterIndex) ^ 2);
            end
        end
    end
    
    methods(Static)
        function randomLetter = generateRandomLetter()
            % Generate random letter from a-Z
            alphabet = [('a':'z'), ('A':'Z')]; % Generate the alphabet
            randomLetter = alphabet(randi(size(alphabet)));
        end
        
        function index = indexOf(letter)
            % Get the index in scoring of letters a - 1 z - 26
            % A - 27 Z - 52
            alphabet = [('a':'z'), ('A':'Z')];
            index    = 0;
            
            for i = 1 : numel(alphabet)
                if alphabet(i) == letter
                    index = i;
                end
            end
        end
    end
    
end
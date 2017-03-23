%*************************************************************************%
% @BeginVerbatim
% Title: Population
% Description: This is the Population class that represents the population
% Version: v00.01
% Author: Kurl Angelo D. Palaganas
% Yr&Sec: 3-3
% @EndVerbatim
%*************************************************************************%

classdef Population
    % Population class
    % Represents the population
    
    properties(Access = private)
        words % Words to populate the population
              % POPULATION = ['words', 'words', 'words'...]
    end
    
    methods
        function obj = Population(populationSize, targetWord)
            % Population class constructor
            % Population the population with random words
            alphabet       = [('a':'z'),...
                              ('A':'Z')]; % Generate the alphabet
            individualWord = '';          % String random word
            obj.words      = [];          % Initialize population
            
            % Loop through the population size
            for i = 1 : populationSize
                % Loop throup the length of the target word
                for j = 1 : length(targetWord)
                    % Generate the random word
                    individualWord = strcat(individualWord,...
                        alphabet(randi(size(alphabet))));
                end
                % Add the word to population
                obj.words = [obj.words, IndividualWord(individualWord...
                    , targetWord)]; 
                % Re-initialize random word
                individualWord = '';
            end
        end
        
        
        function words = getWords(obj)
            % Returns the population
            words = obj.words;
        end
        
        function obj = setWords(obj, words)
            % Sets the population
            obj.words = [];
            obj.words = [obj.words, words];
        end
        
        function word = getWord(obj, index)
            % Get a single word in the population
            word = obj.words(index);
        end
       
        function popSize = getSize(obj)
            % Get the size of population
            popSize = numel(obj.words);
        end
        
        function fittest = getFittest(obj)
            % Get the fittest in the population
            population = obj.getWords();
            fittest    = population(1); % Initial fittest
            
            % Loop through the population
            for i = 1 : obj.getSize()
                % In java code, this uses < but here it uses >
                % I don't fucking understand. Hahaha.
                if fittest.getFitness() > population(i).getFitness()
                    fittest = population(i);
                end
            end
        end
        
        function newPopulation = evolvePopulation(obj, population)
            % Evolve the population
            newPopulation = []; 
            
            % Loop through population
            for i = 1 : obj.getSize()
                % Select parentA and parentB via tournament selection
                parentA = Selection.tournamentSelection(population);
                parentB = Selection.tournamentSelection(population);
                % Create child
                child = parentA.crossOver(parentB).mutate();
                % Add the child to the population
                newPopulation = [newPopulation, child];
            end
        end
    end
    
end


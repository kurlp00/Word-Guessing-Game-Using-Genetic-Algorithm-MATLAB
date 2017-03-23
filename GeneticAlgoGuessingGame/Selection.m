%*************************************************************************%
% @BeginVerbatim
% Title: Selection
% Description: This is the selection class that contains the static method
%              tournament selection that determines the parents.
% Version: v00.01
% Author: Kurl Angelo D. Palaganas
% Yr&Sec: 3-3
% @EndVerbatim
%*************************************************************************%

classdef Selection
    % Selection class
    % Determines the words in the next generation population
    
    properties
    end
    
    methods(Static)
        function bestFitness = tournamentSelection(population)
            % Selects parent via tournament selection
            
            % Initialize tournament size (k)
            TOURNAMENT_SIZE = 5;
            
            % Initialize best fitness
            bestFitness = population.getWord(randi(population.getSize()));
            
            % Loop through tournament size (k)
            for i = 1 : TOURNAMENT_SIZE
                % Get a random word in the population
                contFitness = population.getWord(...
                    randi(population.getSize()));
                % Compare their fitness with the initialize
                % fitness
                if(contFitness.getFitness() < bestFitness.getFitness())
                    % If contFitness is less than the other one
                    % The best fitness is contFitness. Hehe. OMG.
                    bestFitness = contFitness;
                end
            end
        end
    end
    
end


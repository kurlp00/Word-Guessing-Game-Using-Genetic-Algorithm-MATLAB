%*************************************************************************%
% @BeginVerbatim
% Title: Main
% Description: This is the main class where we compile everything and this
%              is where everything in genetic algorithm is happening. OMG
% Version: v00.01
% Author: Kurl Angelo D. Palaganas
% Yr&Sec: 3-3
% @EndVerbatim
%*************************************************************************%

classdef Main
    % Main class
    % What's happening in the genetic algorithm is here. :-)
    
    properties(Access = private)
        targetWord % Target word to be guessed
    end
    
    methods
        function obj = Main(targetWord)
            % Main class constructor
            obj.targetWord = targetWord;
        end   
        
        function targetWord = getTargetWord(obj)
            % Get the target word
            targetWord = obj.targetWord;
        end
        
        function launchGuessingGame(obj)
            % Main method for launching the game
            
            % Initialize population
            population = Population(10, obj.getTargetWord());
            
            % Initialize generation
            generation = 1;
            
            % For plotting
            xAxis = []; 
            yAxis = [];
            
            % While the fittest word in the population
            % is not equal with the target word,
            % repeat the genetic algo process
            while strcmp(population.getFittest().getGuessWord()...
                    , obj.getTargetWord()) ~= 1
                % Print the fittest word
                fprintf('Word : %s\n', population.getFittest()...
                   .getGuessWord());
                fprintf('Fitness : %d\n', population.getFittest()...
                    .getFitness());
                % Print the current generation
                fprintf('Generation : %d ', generation);
                fprintf('--- This will be LEGEN... WAIT FOR IT\n');
                
                % Evolve the population
                population = population.setWords(...
                    population.evolvePopulation(population));
                
                % Population xAxis and yAxis
                xAxis = [xAxis, generation];
                yAxis = [yAxis, population.getFittest().getFitness()];
                
                % Increment the generation
                generation = generation + 1;
            end
            
            % When the process is complete. The fucking end!!!!
            fprintf('Word : %s\n', population.getFittest().getGuessWord());
            fprintf('Generation : %d ', generation);
            fprintf('--- DARY!\n');
            fprintf('**          *       ******   *     *\n');
            fprintf('* *        * *      *    *    *   *\n');    
            fprintf('*  *      *   *     ******     * *\n');
            fprintf('*   *    *******    ***         *\n');
            fprintf('*  *    *       *   *  *        *\n');
            fprintf('* *    *         *  *   *       *\n');
            fprintf('**    *           * *    *      *\n');
            
            hold on
            plot(xAxis, yAxis); % plot the original points
            title('Word Guessing Game');
            xlabel('Generations');
            ylabel('Fitness');
            hold off
        end
    end
    
end


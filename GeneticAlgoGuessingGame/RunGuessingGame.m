%*************************************************************************%
% @BeginVerbatim
% Title: Genetic Algorithm-Based Word Guessing Game
% Description: This experiment named Word Guessing Game is a program that 
%              will try to do as the traditional Pinoy Henyoto guess a 
%              given word. The program will generate combination of 
%              letters in order to make up a word. 
% Version: v00.01
% Author: Kurl Angelo D. Palaganas
% Yr&Sec: 3-3
% @EndVerbatim
%*************************************************************************%

%*************************************************************************%
% @Main
%
%*************************************************************************%
% Get the targetword
targetWord = input('Enter word : ', 's');
% Launch the main class
main = Main(targetWord);
% Launch the main class main method
main.launchGuessingGame();
%*************************************************************************%
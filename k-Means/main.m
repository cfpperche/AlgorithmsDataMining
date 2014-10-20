%% (C) Copyright 2012. All rights reserved. Sotiris L Karavarsamis.
% Contact author at sokar@aiia.csd.auth.gr
% 
% This is an implementation of the k-means algorithm straight from the
% pseudocode description based on the book 'Introduction to Information
% Retrieval' by Manning, Schutze, Raghavan.
%{
Para simplificar a explica��o de como o algoritmo funciona vou apresentar o algoritmo K-Means em cinco passos:

PASSO 01: Fornecer
valores para os centr�ides.

Neste passo os k centr�ides devem receber valores iniciais. No in�cio do algoritmo geralmente escolhe-se os k primeiros pontos da tabela. Tamb�m � importante colocar todos os pontos em um centr�ide qualquer para que o algoritmo possa iniciar seu processamento.

PASSO 02: Gerar
uma matriz de dist�ncia entre cada ponto e os centr�ides.

Neste passo, a dist�ncia entre cada ponto e os centr�ides � calculada. A parte mais �pesada� de c�lculos ocorre neste passo pois se temos N pontos e k centr�ides teremos que calcular  N x k dist�ncias neste passo.

PASSO 03: Colocar
cada ponto nas classes de acordo com a sua dist�ncia do centr�ide
da classe.

Aqui, os pontos s�o classificados de acordo com sua dist�ncia dos centr�ides de cada classe. A classifica��o funciona assim: o centr�ide que est� mais perto deste ponto vai �incorpor�-lo�, ou seja, o ponto vai pertencer � classe representada pelo centr�ide que est� mais perto do ponto. � importante dizer que o algoritmo termina se nenhum ponto �mudar� de classe, ou seja, se nenhum ponto for �incorporado� a uma classe diferente da que ele estava antes deste passo.

PASSO 04: Calcular
os novos centr�ides para cada classe.

Neste momento, os valores das coordenadas dos centr�ides s�o refinados. Para cada classe que possui mais de um ponto o novo valor dos centr�ides � calculado fazendo-se a m�dia de cada atributo de todos os pontos que pertencem a esta classe.

PASSO 05: Repetir
at� a converg�ncia.

O algoritmo volta para o PASSO 02 repetindo iterativamente o refinamento do c�lculo das coordenadas dos centr�ides.
%}

clc; close all; clear all;

%% ================= Part 1: Find Closest Centroids ====================
%  To help you implement K-Means, we have divided the learning algorithm 
%  into two functions -- findClosestCentroids and computeCentroids. In this
%  part, you shoudl complete the code in the findClosestCentroids function. 
%
fprintf('Finding closest centroids.\n\n');

% Settings for running K-Means
% Coefficients
C = [1 1];
% Samples
S = 1000;
% Centroids
K = 3; 
% Max iterations
max_iters = 10;

% Load an example dataset that we will be using
X = generateDataset(C,S);

% Run K-Means algorithm. The 'true' at the end tells our function to plot
% the progress of K-Means
[centroids, idx] = runKMeans(X, K, max_iters, true);
fprintf('\nK-Means Done.\n\n');

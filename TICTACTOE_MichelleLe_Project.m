%This is the classic Tic Tac Toe game where the goal of the game is to get
%3 x or 3 o in a row to win. The game allows 2 players to play and also a
%one player mode where they will play against a computer
function TICTACTOE
close all
clear all

player2 = 0;

%This is to choose the player 2 mode. Tho loop will not exit unless the
%player enters a valid option
while 1
    player2 = input('Enter 1 if there is a second player or enter 2 if you would like to play against the computer')
    if player2 ==1 || player2 ==2
        break
    end
end

winner = 0;

moves=0; % marker to be used for a tie

%player2 will be 1 if a user is playing
%otherwise 0 will mean it will be an AI
turn =1;
figure; 
axis([0 3 0 3]);
xticks(0:1:3);
yticks(0:1:3);
grid on;
checkMove=1
x=0
y=0

% if its an even turn or zero then it is player one's turn
% if its an odd turn then it is players two's turn


gameBoard = [-1 0 0; 0 -2 0; 0 0 -3]
    while (winner ~= 1)  
            switch turn
                case 1
                        moves=moves+1
                    if moves == 10
                        winner = win(gameBoard,moves);
                    end
                    winner = win(gameBoard,moves);
                    if winner==1
                        if 1==mod(turn-1,2)    
                            title('Player 1 WINS!','fontsize', 20)
                        else
                            title('Player 2 WINS!', 'fontsize', 20)
                        end
                    elseif winner == 2
                        title('TIE', 'fontsize', 20)
                    else
                        winner=0
                    end
                    [x y] = ginput(1)
                    while 1
                        if check(x,y,gameBoard) == 1
                            [x y] = ginput(1)
                        else
                            break
                        end
                    
                    end
                        

                    gameBoard = draw(x,y,turn,gameBoard);
      
                case 2
                    moves=moves+1
                    if moves == 10
                        winner = win(gameBoard,moves);
                    end
                        winner = win(gameBoard,moves);
                        if winner==1
                            if 1==mod(turn-1,2)    
                                title('Player 1 WINS!','fontsize', 20)
                            else
                                title('Player 2 WINS!', 'fontsize', 20)
                            end
                        elseif winner == 2
                             title('TIE', 'fontsize', 20)
                        else
                            winner=0
                        end
                        
                        %Calling the function for players 2 moves
                        [x y] = play2 (player2,gameBoard);
                        gameBoard = draw(x,y,turn,gameBoard);
            end
         turn = turn+1
         turn = whos_turn(turn)         
    end
end

%%
%Input:The current gameboard and the number of moves
%Output: Will return a 1 to mean one of the winning placements has been
%acheived else a 2 for a tie else a 0 for neither a tie or win

function win = win(gameBoard, moves)
        if gameBoard (1,1) == gameBoard (1,2) && gameBoard (1,3) == gameBoard (1,2)
            win = 1
%             text(2,2, '1')
            return
            
        elseif gameBoard (2,1) == gameBoard (2,2) && gameBoard (2,3) == gameBoard (2,2)
            win = 1
%             text(2,2, '2')
            return
            
        elseif gameBoard (3,1) == gameBoard (3,2) && gameBoard (3,3) == gameBoard (3,2)
            win = 1
%           text(2,2, '3')
            return
        elseif gameBoard (1,1) == gameBoard (2,1) && gameBoard (3,1) == gameBoard (2,1)
            win = 1
%             text(2,2, '4')
            return
        elseif gameBoard (1,2) == gameBoard (2,2) && gameBoard (3,2) == gameBoard (2,2)
            win = 1
%             text(2,2, '5')
            return
        elseif gameBoard (1,3) == gameBoard (2,3) && gameBoard (3,3) == gameBoard (2,3)
            win = 1
%             text(2,2, '6')
            return
        elseif gameBoard (1,1) == gameBoard (2,2) && gameBoard (3,3) == gameBoard (2,2)
            win = 1
%             text(2,2, '7')
            return
        elseif gameBoard (1,3) == gameBoard (2,2) && gameBoard (3,1) == gameBoard (2,2)
            win = 1
%             text(2,2, '8')
            return
        elseif moves == 10
             win = 2
             return
        else 
            win=0
        end
end

%%
%The funciton decides whose turn it is
%Input: Turn count
%Output: A value of 1 or 2. 1 means it's player 1 and 2 means it's player 2
function whos_turn= whos_turn(turn)
if 1 == mod(turn,2)
    whos_turn = 1
elseif 0 == mod(turn,2)
    whos_turn=2
else
    text(2,2, 'whos_turn error')
end
end

%%
%Input: The current gameboard, the xy coordinates and the turn
%Output: The updated gameboard
function tempBoard = draw(x,y,turn, gameBoard)

    tempBoard = gameBoard; %temp board of the current gameBoard's state
    
    % even turns will draw a 'o' and odd turns will draw a 'x'
    if turn == 1
        marker = 'o';
    else
        marker ='x';
    end  
    
    %deciding where to draw the marker and updating the gameBoards state
    if x <= 1 && y <= 1
        hold on;
        plot(0.5,0.5,marker, 'markersize', 50)
        tempBoard(3,1) = whos_turn(turn)
    elseif x <= 2 && y <= 2 && x > 1 && y > 1
        hold on;
        plot(1.5,1.5,marker, 'markersize', 50)
        tempBoard(2,2) = whos_turn(turn)

    elseif x <= 3 && y <= 3 && x > 2 && y > 2
        hold on;
        plot(2.5,2.5,marker, 'markersize', 50)
        tempBoard(1,3) = whos_turn(turn)
    elseif x <= 3 && y <= 1 && x >2
        hold on;
        plot(2.5,0.5,marker, 'markersize', 50)
        tempBoard(3,3) = whos_turn(turn)
    elseif x <= 3 && y <= 2 && x >2 && y >1
        hold on;
        plot(2.5,1.5,marker, 'markersize', 50)
        tempBoard(2,3) = whos_turn(turn)
    elseif x <= 2 && y <= 3 && y > 2 && x>1
        hold on;
        plot(1.5,2.5,marker, 'markersize', 50)
        tempBoard(1,2) = whos_turn(turn)
    elseif x <= 2 && y <= 1 && x>1 
        hold on;
        plot(1.5,0.5,marker, 'markersize', 50) 
        tempBoard(3,2) = whos_turn(turn)
    elseif x <= 1 && y <= 2 && y >1
        hold on;
        plot(0.5,1.5,marker, 'markersize', 50)
        tempBoard(2,1) = whos_turn(turn)
    elseif x <= 1 && y <= 3 && y > 2
        hold on;
        plot(0.5,2.5,marker, 'markersize', 50)
        tempBoard(1,1) = whos_turn(turn)
    else 
        gameBoard
        hold on;
        text(2,2,'Something is wrong in the draw function') %Error checking
    end
  
end
%%
%play2 will Decide for if a player wants to play with 2 people or against a
%computer and will compute the moves for the computer
%Inputs: An integer of 1 or 2 to decide whether a user wants a 2-player
%game or play against a computer
%Ouputs: The coordiantes for player 2 moves
function [a,b] = play2(player2,gameBoard)
    if player2==1
        [a b] = ginput(1)
        while 1
            if check(a,b,gameBoard) == 1
                [a b] = ginput(1)
            else
                break
            end
        end
    else
        
%Future Implentation: A smarter AI
%         cases =[1 5 9; 
%                 3 5 7;
%                 1 2 3; 
%                 4 5 6; 
%                 7 8 9; 
%                 1 4 7;
%                 2 5 8;
%                 3 6 9];
% 
%         for i=1:8
%         temp = [0 0 0]
%         found = [0 0 0];
%         count =0;
%         count2 = 0;
%             for k=1:3
%                 temp(k) = cases(i,k)
%                 if gameBoard(cases(i,k)) == 2
%                     count = count+1
%                     found(k)=1
%                 end
%                 if count ==2
%                     find(found ==0)
%                     temp2=temp((find(found ==0)))
%                     [a b] = convertAI(gameBoard(temp2))
%                 end
%             end
%         end
%          
        for i=1:3
            for k=1:3
                if gameBoard(i,k) ~= 1 && gameBoard(i,k) ~= 2
                 [a b] = convert(i,k);   
                 return
                end
            end
        end
    end
end

%%
%This converts matrix inputs to graph coordinates for the figure
%Inputs: matrix row and colomn
%Outputs: graph coordiantes
function [conA,conB] = convert(i,k)
    if i ==1 && k == 1 
        conA = 1;
        conB = 3;
    elseif i ==1 &&k == 2 
        conA = 2;
        conB = 3;
    elseif i==1 &&k == 3
        conA = 3;
        conB = 3;
    elseif i==2 &&k == 1
        conA = 1;
        conB = 2;
    elseif i==2 &&k == 2
        conA = 2;
        conB = 2;
    elseif i==2 &&k == 3
        conA = 3;
        conB = 2;
    elseif i==3 &&k == 1
        conA = 1;
        conB = 1;
    elseif i==3 &&k == 2
        conA = 2;
        conB = 1;
    else i==3 &&k == 3
        conA = 3;
        conB = 1;
    end
end

%%
%This converts matlab matrix positions to graph coordinates for the figure
%Inputs: matrix position in array
%Outputs: graph coordiantes
function [conAIx, conAIy] = convertAI(x)
    if x == 1
        conAIx = 1
        conAIy = 3
    elseif x == 2
        conAIx = 2
        conAIy = 3
    elseif x == 3
        conAIx = 3
        conAIy = 3        
    elseif x == 4
        conAIx = 1
        conAIy = 2        
    elseif x == 5
        conAIx = 2
        conAIy = 2        
    elseif x == 6
        conAIx = 3
        conAIy = 2
    elseif x == 7
        conAIx = 1
        conAIy = 1
    elseif x == 8
        conAIx = 2
        conAIy = 1
    else x == 9
        conAIx = 3
        conAIy = 1
    end
end

function checkM = check(x,y,gameBoard)
%  if x <= 1 && y <= 1
%         hold on;
%         plot(0.5,0.5,marker, 'markersize', 50)
%         tempBoard(3,1) = whos_turn(turn)
%     elseif x <= 2 && y <= 2 && x > 1 && y > 1
%         hold on;
%         plot(1.5,1.5,marker, 'markersize', 50)
%         tempBoard(2,2) = whos_turn(turn)
% 
%     elseif x <= 3 && y <= 3 && x > 2 && y > 2
%         hold on;
%         plot(2.5,2.5,marker, 'markersize', 50)
%         tempBoard(1,3) = whos_turn(turn)
%     elseif x <= 3 && y <= 1 && x >2
%         hold on;
%         plot(2.5,0.5,marker, 'markersize', 50)
%         tempBoard(3,3) = whos_turn(turn)
%     elseif x <= 3 && y <= 2 && x >2 && y >1
%         hold on;
%         plot(2.5,1.5,marker, 'markersize', 50)
%         tempBoard(2,3) = whos_turn(turn)
%     elseif x <= 2 && y <= 3 && y > 2 && x>1
%         hold on;
%         plot(1.5,2.5,marker, 'markersize', 50)
%         tempBoard(1,2) = whos_turn(turn)
%     elseif x <= 2 && y <= 1 && x>1 
%         hold on;
%         plot(1.5,0.5,marker, 'markersize', 50) 
%         tempBoard(3,2) = whos_turn(turn)
%     elseif x <= 1 && y <= 2 && y >1
%         hold on;
%         plot(0.5,1.5,marker, 'markersize', 50)
%         tempBoard(2,1) = whos_turn(turn)

if x <= 2 && y <= 2 && x > 1 && y > 1 && gameBoard(2,2)== 1
    checkM=1
elseif x <= 2 && y <= 2 && x > 1 && y > 1 && gameBoard(2,2)== 2
    checkM=1
elseif x <= 1 && y <= 3 && y > 2 && gameBoard(1,1) ==1
    checkM=1
elseif x <= 1 && y <= 3 && y > 2 && gameBoard(1,1) ==2
    checkM=1
else
    checkM = 0
end
end
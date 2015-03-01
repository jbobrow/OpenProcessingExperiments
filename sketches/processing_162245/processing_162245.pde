
int rows = 6;
int cols = 7;
int tileSize = 32;
int offsetX = 0;
int offsetY = 1;
int xCoord = 0;
int yCoord = 0;
int mouseCoordX = 0;
int mouseCoordY = 0;
int winner = 0;
int lineProgress = 0;
int whiteGamesWon = 0;
int blackGamesWon = 0;
int[][] winnerStartAndEndPoints = {{-1, -1}, {-1, -1}};
String winnerText = "";
boolean gameOver = false;
boolean pressed = false;
boolean isWhiteTurn = true;
int[][] board = {};

void setup() { 
    size(500, 500);
    
    for(int r = 0; r < rows; r++) {
        board[r] = {};
        for(int c = 0; c < cols; c++) {
            board[r][c] = 0;
        }
    }

}

void insertTokenAtColumn(int col) {
    if(columnAvailable(col)) {
        int token = 0;
        if(isWhiteTurn) {
            token = 1;
            isWhiteTurn = false;
        } else {
            token = 2;
            isWhiteTurn = true;
        }
        
        
        int rowIndex = board.length() - 1;
        for(int r = 0; r < rows; r++) {
            if(board[r][col] != 0 && rowIndex >= 0) {
                rowIndex--;
            };
        }
        board[rowIndex][col] = token;
        winner = checkWinner();
        if(winner != 0) {
            showWinningScreen();
        }
    }
}

void showWinningScreen() {
    if(winner == 1) {
        winnerText = "Player 1";
        whiteGamesWon++;
    } else {
        winnerText = "Player 2";
        blackGamesWon++;
    }
    
    gameOver = true;
}

boolean columnAvailable(int col) {
    boolean result = true;
    int tokenCount = 0;
    for(int r = 0; r < rows; r++) {
        if(board[r][col] != 0) {
            tokenCount++;
        }
    }
    
    if(tokenCount >= rows) {
        result = false;
    }
    
    return result;
}

void convertMouseCoords() {
    mouseCoordX = floor(mouseX / tileSize) - offsetX;
    mouseCoordY = floor(mouseY / tileSize) - offsetY;
    print(mouseCoordX + " " + mouseCoordY);
    println("");
}

int checkWinner() {
    for(int r = 0; r < rows - 3; r++) {
        for(int c = 0; c < cols; c++) {
            if(board[r][c] != 0 &&
               board[r][c] == board[r+1][c] &&
               board[r][c] == board[r+2][c] &&
               board[r][c] == board[r+3][c]) {
                winnerStartAndEndPoints[0] = {c, r};
                winnerStartAndEndPoints[1] = {c, r + 3};
                return board[r][c];   
            }
        }
    }
    
    for(int r = 0; r < rows; r++) {
        for(int c = 0; c < cols - 3; c++) {
            if(board[r][c] != 0 &&
               board[r][c] == board[r][c+1] &&
               board[r][c] == board[r][c+2] &&
               board[r][c] == board[r][c+3]) {
               winnerStartAndEndPoints[0] = {c, r};
                winnerStartAndEndPoints[1] = {c + 3, r};
                return board[r][c];   
            }
        }
    }
    
    for(int r = 0; r < rows - 3; r++) {
        for(int c = 0; c < cols - 3; c++) {
            if(board[r][c] != 0 &&
               board[r][c] == board[r+1][c+1] &&
               board[r][c] == board[r+2][c+2] &&
               board[r][c] == board[r+3][c+3]) {
               winnerStartAndEndPoints[0] = {c, r};
                winnerStartAndEndPoints[1] = {c + 3, r + 3};
                return board[r][c];   
            }
        }
    }
    
    for(int r = 3; r < rows; r++) {
        for(int c = 0; c < cols - 3; c++) {
            if(board[r][c] != 0 &&
               board[r][c] == board[r-1][c+1] &&
               board[r][c] == board[r-2][c+2] &&
               board[r][c] == board[r-3][c+3]) {
               winnerStartAndEndPoints[0] = {c, r};
                winnerStartAndEndPoints[1] = {c + 3, r - 3};
                return board[r][c];   
            }
        }
    }
    
    return 0;
}

void restartGame() {
    for(int r = 0; r < rows; r++) {
        for(int c = 0; c < cols; c++) {
            board[r][c] = 0;
        }
    }
    winner = 0;
    isWhiteTurn = true;
    gameOver = false;
}

void mousePressed() {
    if(!pressed) {
        if(!gameOver)
            insertTokenAtColumn(mouseCoordX);
        else
            restartGame();
        pressed = true;
    }
}

void mouseReleased() {
    pressed = false;
}

void draw() {  
    convertMouseCoords();
    background(0);
    fill(255);
    text("Player 1 Games Won: " + whiteGamesWon, (cols + 1) * tileSize, (offsetY + 1) * tileSize);
    text("Player 2 Games Won: " + blackGamesWon, (cols + 1) * tileSize, (offsetY + 2) * tileSize);
    strokeWeight(1);
    for(int r = 0; r < rows; r++) {
        for(int c = 0; c < cols; c++) {
            fill(255);
            xCoord = (c + offsetX) * tileSize;
            yCoord = (r + offsetY) * tileSize;
            rect(xCoord, yCoord, tileSize, tileSize);
            if(board[r][c] == 1) {
                fill(255, 0, 0);
            } else if(board[r][c] == 2) {
                fill(0, 255, 0);   
            }
            
            if(board[r][c] != 0) {
                ellipse(xCoord + (tileSize / 2), yCoord + (tileSize / 2), tileSize, tileSize);
            }
        }
    }
    if(!gameOver) {    
        if(mouseCoordX >= 0 && mouseCoordX < cols) {
               if(isWhiteTurn) {
                   fill(255, 0, 0);
               } else {
                   fill(0, 255, 0);
               }
               ellipse((mouseCoordX + offsetX) * tileSize + (tileSize / 2), 
                       (offsetY - 1) * tileSize + (tileSize / 2), tileSize, tileSize);
        }
    } else {
        fill(255);
        text(winnerText + " won! Click anywhere to restart.", 100 , (rows + 2) * tileSize);
        strokeWeight(3);
        
        line((winnerStartAndEndPoints[0][0] + offsetX) * tileSize + (tileSize / 2),
             (winnerStartAndEndPoints[0][1] + offsetY) * tileSize + (tileSize / 2),
             (winnerStartAndEndPoints[1][0] + offsetX) * tileSize + (tileSize / 2),
             (winnerStartAndEndPoints[1][1] + offsetY) * tileSize + (tileSize / 2));
    }
    
}

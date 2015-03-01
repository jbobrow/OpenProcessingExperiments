
private boolean title = true;
    private boolean player1Turn = true;
    private int turn = 0;
    private int red = color(255,0,0);
    private int black = color(0);
    private int winner  = -1;
    private Tile[][] piece = new Tile[6][7];
    public void setup() {
        size(500, 500);
        background(241, 255, 52);
        textAlign(CENTER);
        for(int r = 0; r < 6; r++) {
            for(int c = 0; c < 7; c++) {
                piece[r][c] = new Tile(40 + (c*70), 110 + (r*70));
            }
        }
    }

    public void draw() {
        if(title) {
            fill(0);
            textSize(75);
            text("Connect 4", 250, 100);
            if(mouseX > 205 && mouseX < 300 && mouseY > 262 && mouseY < 300)
                fill(255, 0, 0);
            textSize(50);
            text("Play", 250, 300);
        }
        else {
            background(255);
            fill(241, 255, 52);
            rect(-1, 70, 501, 430);
            for(int r = 0; r < 6; r++) {
                for(int c = 0; c < 7; c++) {
                    fill(piece[r][c].getColor());
                    ellipse(piece[r][c].getX(), piece[r][c].getY(), 60, 60);
                }
            }
            if(winner == -1) {
                playGame();
                if(turn >= 7)
                    checkWin();
            }
            else if(winner == 0) {
                fill(0);
                textSize(50);
                text("Tied", 250, 50);
            }
            else if(winner == 1) {
                fill(0);
                textSize(50);
                text("Player 1 Wins", 250, 50);
            }               
            else if(winner == 2) {
                fill(0);
                textSize(50);
                text("Player 2 Wins", 250, 50);
            }
        }
    }
    
    public void playGame() {
        if(player1Turn)
            player1();
        else
            player2();
    }
    
    public void player1() {
        fill(255,0,0,100);
        if(mouseX > 10 && mouseX < 70)
            ellipse(40, 35, 60, 60);
        else if(mouseX > 80 && mouseX < 140)
            ellipse(110, 35, 60, 60);
        else if(mouseX > 150 && mouseX < 210)
            ellipse(180, 35, 60, 60);
        else if(mouseX > 220 && mouseX < 280)
            ellipse(250, 35, 60, 60);
        else if(mouseX > 290 && mouseX < 350)
            ellipse(320, 35, 60, 60);
        else if(mouseX > 360 && mouseX < 420)
            ellipse(390, 35, 60, 60);
        else if(mouseX > 430 && mouseX < 490)
            ellipse(460, 35, 60, 60);
    }
    
    public void player2() {
        fill(0, 0, 0, 100);
        if(mouseX > 10 && mouseX < 70)
            ellipse(40, 35, 60, 60);
        else if(mouseX > 80 && mouseX < 140)
            ellipse(110, 35, 60, 60);
        else if(mouseX > 150 && mouseX < 210)
            ellipse(180, 35, 60, 60);
        else if(mouseX > 220 && mouseX < 280)
            ellipse(250, 35, 60, 60);
        else if(mouseX > 290 && mouseX < 350)
            ellipse(320, 35, 60, 60);
        else if(mouseX > 360 && mouseX < 420)
            ellipse(390, 35, 60, 60);
        else if(mouseX > 430 && mouseX < 490)
            ellipse(460, 35, 60, 60);
    }
    
    public int checkSpace(int x) {
        for(int i = 5; i >= 0; i--) {
            if(get(x, 110 + (i*70)) == color(255))
                return i;
        }
        return -1;
    }
    
    public void checkWin() {
        for(int i = 5; i >= 0; i--) {
            for(int j = 0; j < 4; j++) {
                if(piece[i][j].getColor() == red && piece[i][j+1].getColor() == red &&
                        piece[i][j+2].getColor() == red && piece[i][j+3].getColor() == red)
                    winner = 1;
                if(piece[i][j].getColor() == black && piece[i][j+1].getColor() == black &&
                        piece[i][j+2].getColor() == black && piece[i][j+3].getColor() == black)
                    winner = 2;
            }
        }
        for(int j = 0; j < 7; j++) {
            for(int i = 5; i >=3; i--) {
                if(piece[i][j].getColor() == red && piece[i-1][j].getColor() == red &&
                        piece[i-2][j].getColor() == red && piece[i-3][j].getColor() == red)
                    winner = 1;
                if(piece[i][j].getColor() == black && piece[i-1][j].getColor() == black &&
                        piece[i-2][j].getColor() == black && piece[i-3][j].getColor() == black)
                    winner = 2;
            }
        }
        for(int i = 0; i < 3; i++) {
            for(int j = 0; j < 4; j++) {
                if(piece[i][j].getColor() == red && piece[i+1][j+1].getColor() == red &&
                        piece[i+2][j+2].getColor() == red && piece[i+3][j+3].getColor() == red)
                    winner = 1;
                if(piece[i][j].getColor() == black && piece[i+1][j+1].getColor() == black &&
                        piece[i+2][j+2].getColor() == black && piece[i+3][j+3].getColor() == black)
                    winner = 2;
            }
            for(int j = 6; j >= 3; j--) {
                if(piece[i][j].getColor() == red && piece[i+1][j-1].getColor() == red &&
                        piece[i+2][j-2].getColor() == red && piece[i+3][j-3].getColor() == red)
                    winner = 1;
                if(piece[i][j].getColor() == black && piece[i+1][j-1].getColor() == black &&
                        piece[i+2][j-2].getColor() == black && piece[i+3][j-3].getColor() == black)
                    winner = 2;
            }
        }
        if(turn >= 42 && winner == -1)
            winner = 0;
    }
    
    public void keyPressed() {
        if(winner != -1) {
            if(key == 'r') {
                for(Tile[] some : piece) {
                    for(Tile a : some) {
                        a.setColor(255);
                    }
                }
                player1Turn = true;
                turn = 0;
                winner = -1;
            }
        }
    }
    
    public void mouseReleased() {
        if(!title && winner == -1) {
            if(player1Turn) {
                if(mouseX > 10 && mouseX < 70)
                    if(checkSpace(40) != -1) {
                        piece[checkSpace(40)][0].setColor(red);
                        player1Turn = !player1Turn;
                        turn++;
                    }
                if(mouseX > 80 && mouseX < 140)
                    if(checkSpace(110) != -1) {
                        piece[checkSpace(110)][1].setColor(red);
                        player1Turn = !player1Turn;
                        turn++;
                    }
                if(mouseX > 150 && mouseX < 210)
                    if(checkSpace(180) != -1) {
                        piece[checkSpace(180)][2].setColor(red);
                        player1Turn = !player1Turn;
                        turn++;
                    }
                if(mouseX > 220 && mouseX < 280)
                    if(checkSpace(250) != -1) {
                        piece[checkSpace(250)][3].setColor(red);
                        player1Turn = !player1Turn;
                        turn++;
                    }
                if(mouseX > 290 && mouseX < 350)
                    if(checkSpace(320) != -1) {
                        piece[checkSpace(320)][4].setColor(red);
                        player1Turn = !player1Turn;
                        turn++;
                    }
                if(mouseX > 360 && mouseX < 420)
                    if(checkSpace(390) != -1) {
                        piece[checkSpace(390)][5].setColor(red);
                        player1Turn = !player1Turn;
                        turn++;
                    }
                if(mouseX > 430 && mouseX < 490)
                    if(checkSpace(460) != -1) {
                        piece[checkSpace(460)][6].setColor(red);
                        player1Turn = !player1Turn;
                        turn++;
                    }
            }
            else {
                if(mouseX > 10 && mouseX < 70)
                    if(checkSpace(40) != -1) {
                        piece[checkSpace(40)][0].setColor(black);
                        player1Turn = !player1Turn;
                        turn++;
                    }
                if(mouseX > 80 && mouseX < 140)
                    if(checkSpace(110) != -1) {
                        piece[checkSpace(110)][1].setColor(black);
                        player1Turn = !player1Turn;
                        turn++;
                    }
                if(mouseX > 150 && mouseX < 210)
                    if(checkSpace(180) != -1) {
                        piece[checkSpace(180)][2].setColor(black);
                        player1Turn = !player1Turn;
                        turn++;
                    }
                if(mouseX > 220 && mouseX < 280)
                    if(checkSpace(250) != -1) {
                        piece[checkSpace(250)][3].setColor(black);
                        player1Turn = !player1Turn;
                        turn++;
                    }
                if(mouseX > 290 && mouseX < 350)
                    if(checkSpace(320) != -1) {
                        piece[checkSpace(320)][4].setColor(black);
                        player1Turn = !player1Turn;
                        turn++;
                    }
                if(mouseX > 360 && mouseX < 420)
                    if(checkSpace(390) != -1) {
                        piece[checkSpace(390)][5].setColor(black);
                        player1Turn = !player1Turn;
                        turn++;
                    }
                if(mouseX > 430 && mouseX < 490)
                    if(checkSpace(460) != -1) {
                        piece[checkSpace(460)][6].setColor(black);
                        player1Turn = !player1Turn;
                        turn++;
                    }
            }
        }
        else {
            if(mouseX > 205 && mouseX < 300 && mouseY > 262 && mouseY < 300)
                    title = false;
        }
    }
    
    public class Tile {
        private int myColor, myX, myY;
        Tile(int x, int y) {
            myColor = (255);
            myX = x;
            myY = y;
        }
        public int getColor() { return myColor; }
        public void setColor(int mColor) { myColor = mColor; }
        public int getX() { return myX; }
        public int getY() { return myY; }
    }

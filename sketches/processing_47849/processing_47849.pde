
Store[] pieces;
int counter;

void setup() {
  size(450, 500);
  background(0); 
  pieces = new Store[180];
}

void draw() {
    drawBoard();
    if (pieceOnBoard) {
    counter += 1;
    pieces[counter] = new Piece(0,15);
    Piece.pieceSelect();
    }
}

void drawBoard() {
    rectMode(CENTER);
    rect(150,300,200,400);
    fill(234);
    stroke(255,100,200);
    strokeWeight(3);  
}

boolean pieceOnBoard() {
    return piece.yvelocity = 0;
}

class Piece {
    int a;
    xpos = 150;
    ypos = 107 + 1/2;
    float pieceRefx = xpos;
    float pieceRefy = ypos;
    
    Piece(int xvelocity, int yvelocity) {
    xvel = xvelocity;
    yvel = yvelocity;
    
    }

    void pieceSelect() {
    a = random(1,7);
    if (a == 6) {
        drawLong();
    } else if (a == 7) {
        drawBox();
    } else {
        drawMost();
    }
    }
    

    void pieceFall() {
    for(a = 0, a <= 60, a++) {
    if (a == 60) {
    pieceRefy += yvel;
    a = 0;
    }
    }
    }
    

    void drawMost( a>=1 && a<=5) {
    rectMode(CENTER);
    rect(pieceRefx, pieceRefy, 15, 15);
    if (a == 1) {
        rect(pieceRefx + 15, pieceRefy, 15, 15); //15depends on rotation
        rect(pieceRefx - 15, pieceRefy, 15, 15);
        rect(pieceRefx - 15, pieceRefy - 15, 15, 15);
    }
    if (a == 2) {
        rect(pieceRefx + 15, pieceRefy, 15, 15); //15depends on rotation
        rect(pieceRefx - 15, pieceRefy, 15, 15);
        rect(pieceRefx - 15, pieceRefy + 15, 15, 15);
    }
    if (a == 3) {
        rect(pieceRefx + 15, pieceRefy, 15, 15); //15depends on rotation
        rect(pieceRefx - 15, pieceRefy, 15, 15);
        rect(pieceRefx, pieceRefy + 15, 15, 15);
    }
    if (a == 4) {
        rect(pieceRefx + 15, pieceRefy, 15, 15); //15depends on rotation
        rect(pieceRefx + 15, pieceRefy + 15, 15, 15);
        rect(pieceRefx, pieceRefy - 15, 15, 15);
    }
    if (a == 5) {
        rect(pieceRefx - 15, pieceRefy, 15, 15); //15depends on rotation
        rect(pieceRefx - 15, pieceRefy - 15, 15, 15);
        rect(pieceRefx, pieceRefy + 15, 15, 15);
    }

/**    void drawLR() {

    }

    void drawT() {

    }

    void drawS() {

    }

    void drawSR() {

    }

**/

}

    void drawBox() {
    int boxRefx = xpos + 15;
    int boxRefy = ypos;
    rect(boxRefx, boxRefy, 
    }

    void drawLong() {

    }




}
                                                                                                                                                

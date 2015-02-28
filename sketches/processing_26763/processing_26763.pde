
int rows = 12;
int cols = 2;
int[][] pontok = new int[rows][cols];
int i, deg;

void setup() {
    size(200,200);
    frameRate(30);

    pontok[0][0] = -3; pontok[0][1] = 0;
    pontok[1][0] = -1; pontok[1][1] = 0;
    pontok[2][0] = -2; pontok[2][1] = -2;
    pontok[3][0] = 0; pontok[3][1] = -3;
    pontok[4][0] = 0; pontok[4][1] = -1;
    pontok[5][0] = 2; pontok[5][1] = -2;
    pontok[6][0] = 3; pontok[6][1] = 0;
    pontok[7][0] = 1; pontok[7][1] = 0;
    pontok[8][0] = 2; pontok[8][1] = 2;
    pontok[9][0] = 0; pontok[9][1] = 3;
    pontok[10][0] = 0; pontok[10][1] = 1;
    pontok[11][0] = -2; pontok[11][1] = 2;
}

void draw() {
    background(#3D4035);
    deg += 2;
    translate(width/2, height/2);
    rotate(radians(deg));
    
    beginShape();
        for (i=0; i<rows; i++) {
            vertex(30*pontok[i][0], 30*pontok[i][1]);
        }
    endShape(CLOSE);
    fill(#B9C0A2);
}


                
                                

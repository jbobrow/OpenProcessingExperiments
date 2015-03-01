
Circle[] circles;
int r = 10;
int s = 10;
PVector savedMouse; //The saved mouse position
int numCircles = 42;


void setup() {
    size(500, 500);
    background(220, 220, 220);
    savedMouse = new PVector(mouseX, mouseY); //Initialize the PVector

    // create an array and fill it with fixed circles
    circles = new Circle[42];
    circles[0] = new Circle(251, 64, r);
    circles[1] = new Circle(189, 80, r);
    circles[2] = new Circle(127, 253, r);
    circles[3] = new Circle(149, 315, r); // r3
    circles[4] = new Circle(178, 386, r);
    circles[5] = new Circle(205, 471, r); // g6
    circles[6] = new Circle(219, 481, r); // g5
    circles[7] = new Circle(217, 398, r); // g4
    circles[8] = new Circle(178, 386, r); //g7
    circles[9] = new Circle(123, 316, r); //g8
    circles[10] = new Circle(100, 248, r); //g9
    circles[11] = new Circle(113, 208, r); //g10
    circles[12] = new Circle(251, 64, r); // red finished here
    circles[13] = new Circle(168, 85, r);
    circles[14] = new Circle(130, 118, r);
    circles[15] = new Circle(130, 133, r);
    circles[16] = new Circle(155, 190, r);
    circles[17] = new Circle(212, 211, r);
    circles[18] = new Circle(231, 238, r);
    circles[19] = new Circle(273, 238, r);
    circles[20] = new Circle(292, 211, r);
    circles[21] = new Circle(349, 190, r);
    circles[22] = new Circle(374, 133, r);
    circles[23] = new Circle(374, 118, r);
    circles[24] = new Circle(336, 85, r);
    circles[25] = new Circle(251, 64, r); // pink finished
    circles[26] = new Circle(232, 213, r);
    circles[27] = new Circle(202, 322, r);
    circles[28] = new Circle(302, 322, r);
    circles[29] = new Circle(272, 213, r); //d one
    circles[30] = new Circle(251, 64, r); // blue finished
    circles[31] = new Circle(315, 80, r); // green begins, r1
    circles[32] = new Circle(377, 253, r); // red 2
    circles[33] = new Circle(355, 315, r); //r 3
    circles[34] = new Circle(288, 398, r); // g4
    circles[35] = new Circle(285, 481, r); //g5
    circles[36] = new Circle(299, 471, r); // g6
    circles[37] = new Circle(326, 386, r); //g7
    circles[38] = new Circle(381, 316, r); //g8
    circles[39] = new Circle(404, 248, r); //g9
    circles[40] = new Circle(391, 208, r); //g10
    circles[41] = new Circle(251, 64, r); // green finished

}


void draw() {

    // update and display the circles
    for (int i = 0; i < numCircles; i++) {
    circles[0].display();
        if (dist(circles[i].x, circles[i].y, mouseX, mouseY) < s) {
            circles[i+1].display();
        }
    }


    // look of the lines
    
    stroke(255, 100);
    strokeWeight(0.5);



    for (int i = 0; i < numCircles; i++) {
        if (dist(circles[i].x, circles[i].y, mouseX, mouseY) < s) {
            savedMouse.x = mouseX; //Save the mouse position;
            savedMouse.y = mouseY;
            
        } else if (dist(circles[i].x, circles[i].y, savedMouse.x, savedMouse.y) < s) {
            noFill();
            //fill(0, 60);
            //ellipse(mouseX, mouseY, 15, 15);
            //line(mouseX, mouseY, pmouseX, pmouseY);
            //line(savedMouse.x, savedMouse.y, circles[i].x, circles[i].y);
            line(savedMouse.x, savedMouse.y, circles[i+1].x, circles[i+1].y);
        }
    }

}


class Circle {
    float x, y, dia;

    Circle(float x, float y, float dia) {
        this.x = x;
        this.y = y;
        this.dia = dia;
    }


    void display() {
        // code for drawing the circles
        noStroke();
        fill(3, 3, 3, 60);
        ellipse(x, y, dia, dia);
    }
}

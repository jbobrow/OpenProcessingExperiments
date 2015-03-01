
MegaMan megaMan; //(ver2);
 
public void setup() {
  size(1000, 250);
  frameRate(12);
  megaMan = new MegaMan();
}
 
public void draw() {
  megaMan.move();
}
class MegaMan {
    int image = 0;
    PVector location;
    int runSpeed = 30;
    boolean facingRight = true;
     
    MegaMan() {
        location = new PVector(0, 0);
    }
     
    void move() {
        if (keyPressed) {
            if (keyCode == PConstants.RIGHT) {
                if (location.x >= 600) {
                    runSpeed = 0;
                } else {
                    runSpeed = 30;
                }
                 float aleatorio=random(100,150);
  float x = random(0,width);
  float y = random(0,height);
  background(aleatorio,255,255);
  fill(246,255,8);
  ellipse(x,y,50,50);

                facingRight = true;
                if (image == 0) {
                    runningRightOpen();
                    image = 1;
                    location.x += runSpeed;
                } else if (image == 1) {
                    runningRightMiddle();
                    image = 2;
                    location.x += runSpeed;
                } else if (image == 2) {
                    runningRightClose();
                    image = 3;
                    location.x += runSpeed;
                } else if (image == 3) {
                    runningRightMiddle();
                    image = 0;
                    location.x += runSpeed;
                }
            } else if (keyCode == PConstants.LEFT) {
                if (location.x <= 200) {
                    runSpeed = 0;
                } else {
                    runSpeed = 30;
                }
                facingRight = false;
                if (image == 0) {
                    runningLeftOpen();
                    image = 1;
                    location.x -= runSpeed;
                } else if (image == 1) {
                    runningLeftMiddle();
                    image = 2;
                    location.x -= runSpeed;
                } else if (image == 2) {
                    runningLeftClose();
                    image = 3;
                    location.x -= runSpeed;
                } else if (image == 3) {
                    runningLeftMiddle();
                    image = 0;
                    location.x -= runSpeed;
                }
            }
        } else {
            float x = random(0,width);
  float y = random(0,height);
    float aleatorio=random(100,150);
            background(aleatorio,255,255);
  fill(246,255,8);
  ellipse(x,y,50,50);
            if (facingRight) {
                standingRight();
                image = 0;
            } else {
                standingLeft();
                image = 0;
            }
             
        }
         
    }
     
    void standingRight() {
        noStroke();
        translate(location.x + 25, location.y);
        //row 1
        // black
        fill(0);
        rect(110, 10, 10, 10);
        rect(120, 10, 10, 10);
        rect(130, 10, 10, 10);
         
        //row 2
        // black
        fill(0);
        rect(90, 20, 10, 10);
        rect(100, 20, 10, 10);
        rect(110, 20, 10, 10);
        rect(140, 20, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(120, 20, 10, 10);
        rect(130, 20, 10, 10);
         
        //row 3
        // black
        fill(0);
        rect(80, 30, 10, 10);
        rect(120, 30, 10, 10);
        rect(150, 30, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(90, 30, 10, 10);
        rect(100, 30, 10, 10);
        rect(110, 30, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(130, 30, 10, 10);
        rect(140, 30, 10, 10);
         
        //row 4
        // black
        fill(0);
        rect(70, 40, 10, 10);
        rect(130, 40, 10, 10);
        rect(140, 40, 10, 10);
        rect(150, 40, 10, 10);
        rect(160, 40, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(80, 40, 10, 10);
        rect(90, 40, 10, 10);
        rect(100, 40, 10, 10);
        rect(110, 40, 10, 10);
        rect(120, 40, 10, 10);
         
        //row 5
        // black
        fill(0);
        rect(70, 50, 10, 10);
        rect(130, 50, 10, 10);
        rect(170, 50, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(80, 50, 10, 10);
        rect(90, 50, 10, 10);
        rect(100, 50, 10, 10);
        rect(110, 50, 10, 10);
        rect(120, 50, 10, 10);
        rect(160, 50, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(140, 50, 10, 10);
        rect(150, 50, 10, 10);
         
        //row 6
        // black
        fill(0);
        rect(60, 60, 10, 10);
        rect(140, 60, 10, 10);
        rect(150, 60, 10, 10);
        rect(170, 60, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(80, 60, 10, 10);
        rect(90, 60, 10, 10);
        rect(100, 60, 10, 10);
        rect(110, 60, 10, 10);
        rect(120, 60, 10, 10);
        rect(130, 60, 10, 10);
        rect(160, 60, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(70, 60, 10, 10);
         
        //row 7
        // black
        fill(0);
        rect(60, 70, 10, 10);
        rect(170, 70, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(80, 70, 10, 10);
        rect(90, 70, 10, 10);
        rect(140, 70, 10, 10);
        rect(150, 70, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(70, 70, 10, 10);
        //tan
        fill(247, 232, 166);
        rect(100, 70, 10, 10);
        //white
        fill(255);
        rect(110, 70, 10, 10);
        rect(120, 70, 10, 10);
        rect(130, 70, 10, 10);
        rect(160, 70, 10, 10);
         
        //row 8
        // black
        fill(0);
        rect(60, 80, 10, 10);
        rect(120, 80, 10, 10);
        rect(130, 80, 10, 10);
        rect(150, 80, 10, 10);
        rect(170, 80, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(80, 80, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(70, 80, 10, 10);
        //tan
        fill(247, 232, 166);
        rect(90, 80, 10, 10);
        rect(140, 80, 10, 10);
        //white
        fill(255);
        rect(100, 80, 10, 10);
        rect(110, 80, 10, 10);
        rect(160, 80, 10, 10);
 
        //row 9
        // black
        fill(0);
        rect(70, 90, 10, 10);
        rect(120, 90, 10, 10);
        rect(130, 90, 10, 10);
        rect(150, 90, 10, 10);
        rect(170, 90, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(80, 90, 10, 10);
        //tan
        fill(247, 232, 166);
        rect(90, 90, 10, 10);
        rect(140, 90, 10, 10);
        //white
        fill(255);
        rect(100, 90, 10, 10);
        rect(110, 90, 10, 10);
        rect(160, 90, 10, 10);
         
        //row 10
        // black
        fill(0);
        rect(60, 100, 10, 10);
        rect(70, 100, 10, 10);
        rect(170, 100, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(80, 100, 10, 10);
        //tan
        fill(247, 232, 166);
        rect(90, 100, 10, 10);
        rect(100, 100, 10, 10);
        rect(140, 100, 10, 10);
        rect(160, 100, 10, 10);
        //white
        fill(255);
        rect(110, 100, 10, 10);
        rect(120, 100, 10, 10);
        rect(130, 100, 10, 10);
        rect(150, 100, 10, 10);
         
        //row 11
        // black
        fill(0);
        rect(40, 110, 10, 10);
        rect(50, 110, 10, 10);
        rect(80, 110, 10, 10);
        rect(110, 110, 10, 10);
        rect(120, 110, 10, 10);
        rect(130, 110, 10, 10);
        rect(140, 110, 10, 10);
        rect(160, 110, 10, 10);
        rect(170, 110, 10, 10);
        rect(180, 110, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(90, 110, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(60, 110, 10, 10);
        rect(70, 110, 10, 10);
        //tan
        fill(247, 232, 166);
        rect(100, 110, 10, 10);
        rect(150, 110, 10, 10);
         
        //row 12
        // black
        fill(0);
        rect(30, 120, 10, 10);
        rect(90, 120, 10, 10);
        rect(150, 120, 10, 10);
        rect(190, 120, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(40, 120, 10, 10);
        rect(180, 120, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(50, 120, 10, 10);
        rect(60, 120, 10, 10);
        rect(70, 120, 10, 10);
        rect(80, 120, 10, 10);
        rect(160, 120, 10, 10);
        rect(170, 120, 10, 10);
        //tan
        fill(247, 232, 166);
        rect(100, 120, 10, 10);
        rect(110, 120, 10, 10);
        rect(120, 120, 10, 10);
        rect(130, 120, 10, 10);
        rect(140, 120, 10, 10);
         
        //row 13
        // black
        fill(0);
        rect(30, 130, 10, 10);
        rect(100, 130, 10, 10);
        rect(110, 130, 10, 10);
        rect(120, 130, 10, 10);
        rect(130, 130, 10, 10);
        rect(140, 130, 10, 10);
        rect(190, 130, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(40, 130, 10, 10);
        rect(50, 130, 10, 10);
        rect(170, 130, 10, 10);
        rect(180, 130, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(60, 130, 10, 10);
        rect(70, 130, 10, 10);
        rect(80, 130, 10, 10);
        rect(90, 130, 10, 10);
        rect(150, 130, 10, 10);
        rect(160, 130, 10, 10);
         
        //row 14
        // black
        fill(0);
        rect(20, 140, 10, 10);
        rect(70, 140, 10, 10);
        rect(150, 140, 10, 10);
        rect(200, 140, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(30, 140, 10, 10);
        rect(40, 140, 10, 10);
        rect(50, 140, 10, 10);
        rect(170, 140, 10, 10);
        rect(180, 140, 10, 10);
        rect(190, 140, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(60, 140, 10, 10);
        rect(80, 140, 10, 10);
        rect(90, 140, 10, 10);
        rect(100, 140, 10, 10);
        rect(110, 140, 10, 10);
        rect(120, 140, 10, 10);
        rect(130, 140, 10, 10);
        rect(140, 140, 10, 10);
        rect(160, 140, 10, 10);
         
        //row 15
        // black
        fill(0);
        rect(20, 150, 10, 10);
        rect(50, 150, 10, 10);
        rect(60, 150, 10, 10);
        rect(70, 150, 10, 10);
        rect(150, 150, 10, 10);
        rect(160, 150, 10, 10);
        rect(170, 150, 10, 10);
        rect(200, 150, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(30, 150, 10, 10);
        rect(40, 150, 10, 10);
        rect(180, 150, 10, 10);
        rect(190, 150, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(80, 150, 10, 10);
        rect(90, 150, 10, 10);
        rect(100, 150, 10, 10);
        rect(110, 150, 10, 10);
        rect(120, 150, 10, 10);
        rect(130, 150, 10, 10);
        rect(140, 150, 10, 10);
 
        //row 16
        // black
        fill(0);
        rect(20, 160, 10, 10);
        rect(60, 160, 10, 10);
        rect(70, 160, 10, 10);
        rect(150, 160, 10, 10);
        rect(160, 160, 10, 10);
        rect(200, 160, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(30, 160, 10, 10);
        rect(40, 160, 10, 10);
        rect(50, 160, 10, 10);
        rect(170, 160, 10, 10);
        rect(180, 160, 10, 10);
        rect(190, 160, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(80, 160, 10, 10);
        rect(90, 160, 10, 10);
        rect(100, 160, 10, 10);
        rect(110, 160, 10, 10);
        rect(120, 160, 10, 10);
        rect(130, 160, 10, 10);
        rect(140, 160, 10, 10);
         
        //row 17
        // black
        fill(0);
        rect(20, 170, 10, 10);
        rect(60, 170, 10, 10);
        rect(70, 170, 10, 10);
        rect(150, 170, 10, 10);
        rect(160, 170, 10, 10);
        rect(200, 170, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(30, 170, 10, 10);
        rect(40, 170, 10, 10);
        rect(50, 170, 10, 10);
        rect(170, 170, 10, 10);
        rect(180, 170, 10, 10);
        rect(190, 170, 10, 10);
        rect(80, 170, 10, 10);
        rect(90, 170, 10, 10);
        rect(100, 170, 10, 10);
        rect(110, 170, 10, 10);
        rect(120, 170, 10, 10);
        rect(130, 170, 10, 10);
        rect(140, 170, 10, 10);
         
        //row 18
        // black
        fill(0);
        rect(30, 180, 10, 10);
        rect(40, 180, 10, 10);
        rect(50, 180, 10, 10);
        rect(70, 180, 10, 10);
        rect(150, 180, 10, 10);
        rect(170, 180, 10, 10);
        rect(180, 180, 10, 10);
        rect(190, 180, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(80, 180, 10, 10);
        rect(90, 180, 10, 10);
        rect(100, 180, 10, 10);
        rect(110, 180, 10, 10);
        rect(120, 180, 10, 10);
        rect(130, 180, 10, 10);
        rect(140, 180, 10, 10);
         
        //row 19
        // black
        fill(0);
        rect(60, 190, 10, 10);
        rect(160, 190, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(90, 190, 10, 10);
        rect(100, 190, 10, 10);
        rect(110, 190, 10, 10);
        rect(120, 190, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(70, 190, 10, 10);
        rect(80, 190, 10, 10);
        rect(130, 190, 10, 10);
        rect(140, 190, 10, 10);
        rect(150, 190, 10, 10);
         
        //row 20
        // black
        fill(0);
        rect(50, 200, 10, 10);
        rect(110, 200, 10, 10);
        rect(170, 200, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(60, 200, 10, 10);
        rect(70, 200, 10, 10);
        rect(160, 200, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(80, 200, 10, 10);
        rect(90, 200, 10, 10);
        rect(100, 200, 10, 10);
        rect(120, 200, 10, 10);
        rect(130, 200, 10, 10);
        rect(140, 200, 10, 10);
        rect(150, 200, 10, 10);
         
        //row 21
        // black
        fill(0);
        rect(40, 210, 10, 10);
        rect(50, 210, 10, 10);
        rect(100, 210, 10, 10);
        rect(120, 210, 10, 10);
        rect(170, 210, 10, 10);
        rect(180, 210, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(60, 210, 10, 10);
        rect(70, 210, 10, 10);
        rect(80, 210, 10, 10);
        rect(140, 210, 10, 10);
        rect(150, 210, 10, 10);
        rect(160, 210, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(90, 210, 10, 10);
        rect(130, 210, 10, 10);
         
        //row 22
        // black
        fill(0);
        rect(20, 220, 10, 10);
        rect(30, 220, 10, 10);
        rect(90, 220, 10, 10);
        rect(130, 220, 10, 10);
        rect(190, 220, 10, 10);
        rect(200, 220, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(40, 220, 10, 10);
        rect(50, 220, 10, 10);
        rect(60, 220, 10, 10);
        rect(70, 220, 10, 10);
        rect(80, 220, 10, 10);
        rect(140, 220, 10, 10);
        rect(150, 220, 10, 10);
        rect(160, 220, 10, 10);
        rect(170, 220, 10, 10);
        rect(180, 220, 10, 10);
        //light blue
        fill(31, 128, 255);
         
        //row 23
        // black
        fill(0);
        rect(10, 230, 10, 10);
        rect(90, 230, 10, 10);
        rect(130, 230, 10, 10);
        rect(210, 230, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(20, 230, 10, 10);
        rect(30, 230, 10, 10);
        rect(40, 230, 10, 10);
        rect(50, 230, 10, 10);
        rect(60, 230, 10, 10);
        rect(70, 230, 10, 10);
        rect(80, 230, 10, 10);
        rect(140, 230, 10, 10);
        rect(150, 230, 10, 10);
        rect(160, 230, 10, 10);
        rect(170, 230, 10, 10);
        rect(180, 230, 10, 10);
        rect(190, 230, 10, 10);
        rect(200, 230, 10, 10);
         
        //row 24
        // black
        fill(0);
        rect(10, 240, 10, 10);
        rect(20, 240, 10, 10);
        rect(30, 240, 10, 10);
        rect(40, 240, 10, 10);
        rect(50, 240, 10, 10);
        rect(60, 240, 10, 10);
        rect(70, 240, 10, 10);
        rect(80, 240, 10, 10);
        rect(90, 240, 10, 10);
        rect(130, 240, 10, 10);
        rect(140, 240, 10, 10);
        rect(150, 240, 10, 10);
        rect(160, 240, 10, 10);
        rect(170, 240, 10, 10);
        rect(180, 240, 10, 10);
        rect(190, 240, 10, 10);
        rect(200, 240, 10, 10);
        rect(210, 240, 10, 10);
         
    }
     
    void runningRightOpen() {
        noStroke();
        translate(location.x + 35, location.y + 10);
        //row 1
        // black
        fill(0);
        rect(130, 10, 10, 10);
        rect(140, 10, 10, 10);
        rect(150, 10, 10, 10);
         
        //row 2
        // black
        fill(0);
        rect(110, 20, 10, 10);
        rect(120, 20, 10, 10);
        rect(130, 20, 10, 10);
        rect(160, 20, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(140, 20, 10, 10);
        rect(150, 20, 10, 10);
         
        //row 3
        // black
        fill(0);
        rect(100, 30, 10, 10);
        rect(140, 30, 10, 10);
        rect(170, 30, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(110, 30, 10, 10);
        rect(120, 30, 10, 10);
        rect(130, 30, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(150, 30, 10, 10);
        rect(160, 30, 10, 10);
         
        //row 4
        // black
        fill(0);
        rect(90, 40, 10, 10);
        rect(150, 40, 10, 10);
        rect(160, 40, 10, 10);
        rect(170, 40, 10, 10);
        rect(180, 40, 10, 10);       
        //dark blue
        fill(0, 104, 240);
        rect(100, 40, 10, 10);
        rect(110, 40, 10, 10);
        rect(120, 40, 10, 10);
        rect(130, 40, 10, 10);
        rect(140, 40, 10, 10);
 
        //row 5
        // black
        fill(0);
        rect(90, 50, 10, 10);
        rect(150, 50, 10, 10);
        rect(190, 50, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(100, 50, 10, 10);
        rect(110, 50, 10, 10);
        rect(120, 50, 10, 10);
        rect(130, 50, 10, 10);
        rect(140, 50, 10, 10);
        rect(180, 50, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(160, 50, 10, 10);
        rect(170, 50, 10, 10);
         
        //row 6
        // black
        fill(0);
        rect(60, 60, 10, 10);
        rect(70, 60, 10, 10);
        rect(80, 60, 10, 10);
        rect(160, 60, 10, 10);
        rect(170, 60, 10, 10);
        rect(190, 60, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(90, 60, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(100, 60, 10, 10);
        rect(110, 60, 10, 10);
        rect(120, 60, 10, 10);
        rect(130, 60, 10, 10);
        rect(140, 60, 10, 10);
        rect(150, 60, 10, 10);
        rect(180, 60, 10, 10);
         
        //row 7
        // black
        fill(0);
        rect(40, 70, 10, 10);
        rect(50, 70, 10, 10);
        rect(80, 70, 10, 10);
        rect(190, 70, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(60, 70, 10, 10);
        rect(70, 70, 10, 10);
        rect(90, 70, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(100, 70, 10, 10);
        rect(110, 70, 10, 10);
        rect(160, 70, 10, 10);
        rect(170, 70, 10, 10);
        //tan
        fill(247, 232, 166);
        rect(120, 70, 10, 10);
        //white
        fill(255);
        rect(130, 70, 10, 10);
        rect(140, 70, 10, 10);
        rect(150, 70, 10, 10);
        rect(180, 70, 10, 10);
         
        //row 8
        // black
        fill(0);
        rect(30, 80, 10, 10);
        rect(50, 80, 10, 10);
        rect(80, 80, 10, 10);
        rect(140, 80, 10, 10);
        rect(150, 80, 10, 10);
        rect(170, 80, 10, 10);
        rect(190, 80, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(40, 80, 10, 10);
        rect(100, 80, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(60, 80, 10, 10);
        rect(70, 80, 10, 10);
        rect(90, 80, 10, 10);
        //tan
        fill(247, 232, 166);
        rect(110, 80, 10, 10);
        rect(160, 80, 10, 10);
        //white
        fill(255);
        rect(120, 80, 10, 10);
        rect(130, 80, 10, 10);
        rect(180, 80, 10, 10);
         
        //row 9
        // black
        fill(0);
        rect(20, 90, 10, 10);
        rect(60, 90, 10, 10);
        rect(90, 90, 10, 10);
        rect(140, 90, 10, 10);
        rect(150, 90, 10, 10);
        rect(170, 90, 10, 10);
        rect(190, 90, 10, 10);
        rect(210, 90, 10, 10);
        rect(220, 90, 10, 10);
        rect(230, 90, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(30, 90, 10, 10);
        rect(40, 90, 10, 10);
        rect(50, 90, 10, 10);
        rect(100, 90, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(70, 90, 10, 10);
        rect(80, 90, 10, 10);
        //tan
        fill(247, 232, 166);
        rect(110, 90, 10, 10);
        rect(160, 90, 10, 10);
        //white
        fill(255);
        rect(120, 90, 10, 10);
        rect(130, 90, 10, 10);
        rect(180, 90, 10, 10);
         
        //row 10
        // black
        fill(0);
        rect(10, 100, 10, 10);
        rect(60, 100, 10, 10);
        rect(90, 100, 10, 10);
        rect(190, 100, 10, 10);
        rect(200, 100, 10, 10);
        rect(240, 100, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(20, 100, 10, 10);
        rect(30, 100, 10, 10);
        rect(40, 100, 10, 10);
        rect(50, 100, 10, 10);
        rect(100, 100, 10, 10);
        rect(210, 100, 10, 10);
        rect(220, 100, 10, 10);
        rect(230, 100, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(70, 100, 10, 10);
        rect(80, 100, 10, 10);
        //tan
        fill(247, 232, 166);
        rect(110, 100, 10, 10);
        rect(120, 100, 10, 10);
        rect(160, 100, 10, 10);
        rect(180, 100, 10, 10);
        //white
        fill(255);
        rect(130, 100, 10, 10);
        rect(140, 100, 10, 10);
        rect(150, 100, 10, 10);
        rect(170, 100, 10, 10);
         
        //row 11
        // black
        fill(0);
        rect(10, 110, 10, 10);
        rect(50, 110, 10, 10);
        rect(70, 110, 10, 10);
        rect(100, 110, 10, 10);
        rect(130, 110, 10, 10);
        rect(140, 110, 10, 10);
        rect(150, 110, 10, 10);
        rect(160, 110, 10, 10);
        rect(180, 110, 10, 10);
        rect(200, 110, 10, 10);
        rect(240, 110, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(20, 110, 10, 10);
        rect(30, 110, 10, 10);
        rect(40, 110, 10, 10);
        rect(110, 110, 10, 10);
        rect(210, 110, 10, 10);
        rect(220, 110, 10, 10);
        rect(230, 110, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(80, 110, 10, 10);
        rect(90, 110, 10, 10);
        //tan
        fill(247, 232, 166);
        rect(120, 110, 10, 10);
        rect(170, 110, 10, 10);
         
        //row 12
        // black
        fill(0);
        rect(10, 120, 10, 10);
        rect(50, 120, 10, 10);
        rect(70, 120, 10, 10);
        rect(110, 120, 10, 10);
        rect(170, 120, 10, 10);
        rect(190, 120, 10, 10);
        rect(200, 120, 10, 10);
        rect(240, 120, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(20, 120, 10, 10);
        rect(30, 120, 10, 10);
        rect(40, 120, 10, 10);
        rect(210, 120, 10, 10);
        rect(220, 120, 10, 10);
        rect(230, 120, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(80, 120, 10, 10);
        rect(90, 120, 10, 10);
        rect(100, 120, 10, 10);
        rect(180, 120, 10, 10);
        //tan
        fill(247, 232, 166);
        rect(120, 120, 10, 10);
        rect(130, 120, 10, 10);
        rect(140, 120, 10, 10);
        rect(150, 120, 10, 10);
        rect(160, 120, 10, 10);
         
        //row 13
        // black
        fill(0);
        rect(20, 130, 10, 10);
        rect(30, 130, 10, 10);
        rect(40, 130, 10, 10);
        rect(70, 130, 10, 10);
        rect(120, 130, 10, 10);
        rect(130, 130, 10, 10);
        rect(140, 130, 10, 10);
        rect(150, 130, 10, 10);
        rect(160, 130, 10, 10);
        rect(230, 130, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(80, 130, 10, 10);
        rect(200, 130, 10, 10);
        rect(210, 130, 10, 10);
        rect(220, 130, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(90, 130, 10, 10);
        rect(100, 130, 10, 10);
        rect(110, 130, 10, 10);
        rect(170, 130, 10, 10);
        rect(180, 130, 10, 10);
        rect(190, 130, 10, 10);
         
        //row 14
        // black
        fill(0);
        rect(40, 140, 10, 10);
        rect(50, 140, 10, 10);
        rect(70, 140, 10, 10);
        rect(160, 140, 10, 10);
        rect(220, 140, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(80, 140, 10, 10);
        rect(90, 140, 10, 10);
        rect(100, 140, 10, 10);
        rect(190, 140, 10, 10);
        rect(200, 140, 10, 10);
        rect(210, 140, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(110, 140, 10, 10);
        rect(120, 140, 10, 10);
        rect(130, 140, 10, 10);
        rect(140, 140, 10, 10);
        rect(150, 140, 10, 10);
        rect(170, 140, 10, 10);
        rect(180, 140, 10, 10);
         
         
        //row 15
        // black
        fill(0);
        rect(30, 150, 10, 10);
        rect(60, 150, 10, 10);
        rect(70, 150, 10, 10);
        rect(150, 150, 10, 10);
        rect(170, 150, 10, 10);
        rect(210, 150, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(40, 150, 10, 10);
        rect(50, 150, 10, 10);
        rect(80, 150, 10, 10);
        rect(90, 150, 10, 10);
        rect(100, 150, 10, 10);
        rect(110, 150, 10, 10);
        rect(120, 150, 10, 10);
        rect(130, 150, 10, 10);
        rect(190, 150, 10, 10);
        rect(200, 150, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(140, 150, 10, 10);
        rect(180, 150, 10, 10);
         
        //row 16
        // black
        fill(0);
        rect(20, 160, 10, 10);
        rect(70, 160, 10, 10);
        rect(80, 160, 10, 10);
        rect(140, 160, 10, 10);
        rect(180, 160, 10, 10);
        rect(190, 160, 10, 10);
        rect(200, 160, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(30, 160, 10, 10);
        rect(40, 160, 10, 10);
        rect(50, 160, 10, 10);
        rect(60, 160, 10, 10);
        rect(90, 160, 10, 10);
        rect(100, 160, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(110, 160, 10, 10);
        rect(120, 160, 10, 10);
        rect(130, 160, 10, 10);
         
        //row 17
        // black
        fill(0);
        rect(10, 170, 10, 10);
        rect(80, 170, 10, 10);
        rect(90, 170, 10, 10);
        rect(150, 170, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(20, 170, 10, 10);
        rect(30, 170, 10, 10);
        rect(40, 170, 10, 10);
        rect(50, 170, 10, 10);
        rect(60, 170, 10, 10);
        rect(100, 170, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(70, 170, 10, 10);
        rect(110, 170, 10, 10);
        rect(120, 170, 10, 10);
        rect(130, 170, 10, 10);
        rect(140, 170, 10, 10);
         
        //row 18
        // black
        fill(0);
        rect(10, 180, 10, 10);
        rect(40, 180, 10, 10);
        rect(100, 180, 10, 10);
        rect(110, 180, 10, 10);
        rect(160, 180, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(20, 180, 10, 10);
        rect(30, 180, 10, 10);
        rect(50, 180, 10, 10);
        rect(60, 180, 10, 10);
        rect(150, 180, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(70, 180, 10, 10);
        rect(80, 180, 10, 10);
        rect(90, 180, 10, 10);
        rect(120, 180, 10, 10);
        rect(130, 180, 10, 10);
        rect(140, 180, 10, 10);
        
        //row 19
        // black
        fill(0);
        rect(20, 190, 10, 10);
        rect(30, 190, 10, 10);
        rect(40, 190, 10, 10);
        rect(50, 190, 10, 10);
        rect(90, 190, 10, 10);
        rect(110, 190, 10, 10);
        rect(160, 190, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(60, 190, 10, 10);
        rect(120, 190, 10, 10);
        rect(130, 190, 10, 10);
        rect(140, 190, 10, 10);
        rect(150, 190, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(70, 190, 10, 10);
        rect(80, 190, 10, 10);
         
        //row 20
        // black
        fill(0);
        rect(60, 200, 10, 10);
        rect(70, 200, 10, 10);
        rect(80, 200, 10, 10);
        rect(110, 200, 10, 10);
        rect(150, 200, 10, 10);
        rect(160, 200, 10, 10);
        rect(170, 200, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(120, 200, 10, 10);
        rect(130, 200, 10, 10);
        rect(140, 200, 10, 10);
         
        //row 21
        // black
        fill(0);
        rect(100, 210, 10, 10);
        rect(180, 210, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(110, 210, 10, 10);
        rect(120, 210, 10, 10);
        rect(130, 210, 10, 10);
        rect(140, 210, 10, 10);
        rect(150, 210, 10, 10);
        rect(160, 210, 10, 10);
        rect(170, 210, 10, 10);
         
        //row 22
        // black
        fill(0);
        rect(100, 220, 10, 10);
        rect(110, 220, 10, 10);
        rect(120, 220, 10, 10);
        rect(130, 220, 10, 10);
        rect(140, 220, 10, 10);
        rect(150, 220, 10, 10);
        rect(160, 220, 10, 10);
        rect(170, 220, 10, 10);
        rect(180, 220, 10, 10);
 
    }
     
    void runningRightMiddle() {
        noStroke();
        translate(location.x + 65, location.y);
        //row 1
        // black
        fill(0);
        rect(100, 10, 10, 10);
        rect(110, 10, 10, 10);
        rect(120, 10, 10, 10);
         
        //row 2
        // black
        fill(0);
        rect(80, 20, 10, 10);
        rect(90, 20, 10, 10);
        rect(100, 20, 10, 10);
        rect(130, 20, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(110, 20, 10, 10);
        rect(120, 20, 10, 10);
 
        //row 3
        // black
        fill(0);
        rect(70, 30, 10, 10);
        rect(110, 30, 10, 10);
        rect(140, 30, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(120, 30, 10, 10);
        rect(130, 30, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(80, 30, 10, 10);
        rect(90, 30, 10, 10);
        rect(100, 30, 10, 10);
         
        //row 4
        // black
        fill(0);
        rect(60, 40, 10, 10);
        rect(120, 40, 10, 10);
        rect(130, 40, 10, 10);
        rect(140, 40, 10, 10);
        rect(150, 40, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(70, 40, 10, 10);
        rect(80, 40, 10, 10);
        rect(90, 40, 10, 10);
        rect(100, 40, 10, 10);
        rect(110, 40, 10, 10);
         
        //row 5
        // black
        fill(0);
        rect(60, 50, 10, 10);
        rect(120, 50, 10, 10);
        rect(160, 50, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(130, 50, 10, 10);
        rect(140, 50, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(70, 50, 10, 10);
        rect(80, 50, 10, 10);
        rect(90, 50, 10, 10);
        rect(100, 50, 10, 10);
        rect(110, 50, 10, 10);
        rect(150, 50, 10, 10);
         
        //row 6
        // black
        fill(0);
        rect(50, 60, 10, 10);
        rect(130, 60, 10, 10);
        rect(140, 60, 10, 10);
        rect(160, 60, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(60, 60, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(70, 60, 10, 10);
        rect(80, 60, 10, 10);
        rect(90, 60, 10, 10);
        rect(100, 60, 10, 10);
        rect(110, 60, 10, 10);
        rect(120, 60, 10, 10);
        rect(150, 60, 10, 10);
        //tan
        fill(247, 232, 166);
        //white
        fill(255);
         
        //row 7
        // black
        fill(0);
        rect(50, 70, 10, 10);
        rect(160, 70, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(60, 70, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(70, 70, 10, 10);
        rect(80, 70, 10, 10);
        rect(130, 70, 10, 10);
        rect(140, 70, 10, 10);
        //tan
        fill(247, 232, 166);
        rect(90, 70, 10, 10);
        //white
        fill(255);
        rect(100, 70, 10, 10);
        rect(110, 70, 10, 10);
        rect(120, 70, 10, 10);
        rect(150, 70, 10, 10);
         
        //row 8
        // black
        fill(0);
        rect(40, 80, 10, 10);
        rect(50, 80, 10, 10);
        rect(110, 80, 10, 10);
        rect(120, 80, 10, 10);
        rect(140, 80, 10, 10);
        rect(160, 80, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(60, 80, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(70, 80, 10, 10);
        //tan
        fill(247, 232, 166);
        rect(80, 80, 10, 10);
        rect(130, 80, 10, 10);
        //white
        fill(255);
        rect(90, 80, 10, 10);
        rect(100, 80, 10, 10);
        rect(150, 80, 10, 10);
         
        //row 9
        // black
        fill(0);
        rect(30, 90, 10, 10);
        rect(60, 90, 10, 10);
        rect(110, 90, 10, 10);
        rect(120, 90, 10, 10);
        rect(140, 90, 10, 10);
        rect(160, 90, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(40, 90, 10, 10);
        rect(50, 90, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(70, 90, 10, 10);
        //tan
        fill(247, 232, 166);
        rect(80, 90, 10, 10);
        rect(130, 90, 10, 10);
        //white
        fill(255);
        rect(90, 90, 10, 10);
        rect(100, 90, 10, 10);
        rect(150, 90, 10, 10);
         
        //row 10
        // black
        fill(0);
        rect(20, 100, 10, 10);
        rect(60, 100, 10, 10);
        rect(160, 100, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(30, 100, 10, 10);
        rect(40, 100, 10, 10);
        rect(50, 100, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(70, 100, 10, 10);
        //tan
        fill(247, 232, 166);
        rect(80, 100, 10, 10);
        rect(90, 100, 10, 10);
        rect(130, 100, 10, 10);
        rect(150, 100, 10, 10);
        //white
        fill(255);
        rect(100, 100, 10, 10);
        rect(110, 100, 10, 10);
        rect(120, 100, 10, 10);
        rect(140, 100, 10, 10);
         
        //row 11
        // black
        fill(0);
        rect(10, 110, 10, 10);
        rect(70, 110, 10, 10);
        rect(100, 110, 10, 10);
        rect(110, 110, 10, 10);
        rect(120, 110, 10, 10);
        rect(130, 110, 10, 10);
        rect(150, 110, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(20, 110, 10, 10);
        rect(30, 110, 10, 10);
        rect(40, 110, 10, 10);
        rect(50, 110, 10, 10);
        rect(60, 110, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(80, 110, 10, 10);
        //tan
        fill(247, 232, 166);
        rect(90, 110, 10, 10);
        rect(140, 110, 10, 10);
   
        //row 12
        // black
        fill(0);
        rect(10, 120, 10, 10);
        rect(50, 120, 10, 10);
        rect(80, 120, 10, 10);
        rect(140, 120, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(20, 120, 10, 10);
        rect(30, 120, 10, 10);
        rect(40, 120, 10, 10);
        rect(60, 120, 10, 10);
        rect(70, 120, 10, 10);
        //dark blue
        fill(0, 104, 240);
        //tan
        fill(247, 232, 166);
        rect(90, 120, 10, 10);
        rect(100, 120, 10, 10);
        rect(110, 120, 10, 10);
        rect(120, 120, 10, 10);
        rect(130, 120, 10, 10);;
         
        //row 13
        // black
        fill(0);
        rect(20, 130, 10, 10);
        rect(60, 130, 10, 10);
        rect(90, 130, 10, 10);
        rect(100, 130, 10, 10);
        rect(110, 130, 10, 10);
        rect(120, 130, 10, 10);
        rect(130, 130, 10, 10);
        rect(140, 130, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(70, 130, 10, 10);
        rect(80, 130, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(30, 130, 10, 10);
        rect(40, 130, 10, 10);
        rect(50, 130, 10, 10);
         
        //row 14
        // black
        fill(0);
        rect(20, 140, 10, 10);
        rect(70, 140, 10, 10);
        rect(80, 140, 10, 10);
        rect(130, 140, 10, 10);
        rect(150, 140, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(90, 140, 10, 10);
        rect(100, 140, 10, 10);
        rect(110, 140, 10, 10);
        rect(120, 140, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(30, 140, 10, 10);
        rect(40, 140, 10, 10);
        rect(50, 140, 10, 10);
        rect(60, 140, 10, 10);
        rect(140, 140, 10, 10);
         
        //row 15
        // black
        fill(0);
        rect(30, 150, 10, 10);
        rect(60, 150, 10, 10);
        rect(90, 150, 10, 10);
        rect(120, 150, 10, 10);
        rect(150, 150, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(100, 150, 10, 10);
        rect(110, 150, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(40, 150, 10, 10);
        rect(50, 150, 10, 10);
        rect(70, 150, 10, 10);
        rect(80, 150, 10, 10);
        rect(130, 150, 10, 10);
        rect(140, 150, 10, 10);
         
        //row 16
        // black
        fill(0);
        rect(40, 160, 10, 10);
        rect(90, 160, 10, 10);
        rect(110, 160, 10, 10);
        rect(120, 160, 10, 10);
        rect(130, 160, 10, 10);
        rect(140, 160, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(50, 160, 10, 10);
        rect(60, 160, 10, 10);
        rect(70, 160, 10, 10);
        rect(80, 160, 10, 10);
        rect(100, 160, 10, 10);
         
        //row 17
        // black
        fill(0);
        rect(50, 170, 10, 10);
        rect(80, 170, 10, 10);
        rect(100, 170, 10, 10);
        rect(120, 170, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(110, 170, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(60, 170, 10, 10);
        rect(70, 170, 10, 10);
        rect(90, 170, 10, 10);
         
        //row 18
        // black
        fill(0);
        rect(60, 180, 10, 10);
        rect(70, 180, 10, 10);
        rect(100, 180, 10, 10);
        rect(120, 180, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(80, 180, 10, 10);
        rect(90, 180, 10, 10);
        rect(110, 180, 10, 10);
         
        //row 19
        // black
        fill(0);
        rect(50, 190, 10, 10);
        rect(60, 190, 10, 10);
        rect(100, 190, 10, 10);
        rect(110, 190, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(70, 190, 10, 10);
        rect(80, 190, 10, 10);
        rect(90, 190, 10, 10);
         
        //row 20
        // black
        fill(0);
        rect(40, 200, 10, 10);
        rect(100, 200, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(50, 200, 10, 10);
        rect(60, 200, 10, 10);
        rect(70, 200, 10, 10);
        rect(80, 200, 10, 10);
        rect(90, 200, 10, 10);
         
        //row 21
        // black
        fill(0);
        rect(30, 210, 10, 10);
        rect(90, 210, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(40, 210, 10, 10);
        rect(50, 210, 10, 10);
        rect(60, 210, 10, 10);
        rect(70, 210, 10, 10);
        rect(80, 210, 10, 10);
         
        //row 22
        // black
        fill(0);
        rect(30, 220, 10, 10);
        rect(70, 220, 10, 10);
        rect(80, 220, 10, 10);
        rect(90, 220, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(40, 220, 10, 10);
        rect(50, 220, 10, 10);
        rect(60, 220, 10, 10);
         
        //row 23
        // black
        fill(0);
        rect(40, 230, 10, 10);
        rect(100, 230, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(50, 230, 10, 10);
        rect(60, 230, 10, 10);
        rect(70, 230, 10, 10);
        rect(80, 230, 10, 10);
        rect(90, 230, 10, 10);
         
        //row 24
        // black
        fill(0);
        rect(50, 240, 10, 10);
        rect(60, 240, 10, 10);
        rect(70, 240, 10, 10);
        rect(80, 240, 10, 10);
        rect(90, 240, 10, 10);
        rect(100, 240, 10, 10);
 
    }
     
    void runningRightClose() {
        noStroke();
        translate(location.x + 25, location.y + 10);
        //row 1
        // black
        fill(0);
        rect(140, 10, 10, 10);
        rect(150, 10, 10, 10);
        rect(160, 10, 10, 10);
         
      //row 2
        // black
        fill(0);
        rect(120, 20, 10, 10);
        rect(130, 20, 10, 10);
        rect(140, 20, 10, 10);
        rect(170, 20, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(150, 20, 10, 10);
        rect(160, 20, 10, 10);
         
      //row 3
        // black
        fill(0);
        rect(110, 30, 10, 10);
        rect(150, 30, 10, 10);
        rect(180, 30, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(160, 30, 10, 10);
        rect(170, 30, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(120, 30, 10, 10);
        rect(130, 30, 10, 10);
        rect(140, 30, 10, 10);
         
      //row 4
        // black
        fill(0);
        rect(100, 40, 10, 10);
        rect(160, 40, 10, 10);
        rect(170, 40, 10, 10);
        rect(180, 40, 10, 10);
        rect(190, 40, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(110, 40, 10, 10);
        rect(120, 40, 10, 10);
        rect(130, 40, 10, 10);
        rect(140, 40, 10, 10);
        rect(150, 40, 10, 10);
         
      //row 5
        // black
        fill(0);
        rect(100, 50, 10, 10);
        rect(160, 50, 10, 10);
        rect(200, 50, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(170, 50, 10, 10);
        rect(180, 50, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(110, 50, 10, 10);
        rect(120, 50, 10, 10);
        rect(130, 50, 10, 10);
        rect(140, 50, 10, 10);
        rect(150, 50, 10, 10);
        rect(190, 50, 10, 10);
         
      //row 6
        // black
        fill(0);
        rect(90, 60, 10, 10);
        rect(170, 60, 10, 10);
        rect(180, 60, 10, 10);
        rect(200, 60, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(100, 60, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(110, 60, 10, 10);
        rect(120, 60, 10, 10);
        rect(130, 60, 10, 10);
        rect(140, 60, 10, 10);
        rect(150, 60, 10, 10);
        rect(160, 60, 10, 10);
        rect(190, 60, 10, 10);
         
      //row 7
        // black
        fill(0);
        rect(90, 70, 10, 10);
        rect(200, 70, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(100, 70, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(110, 70, 10, 10);
        rect(120, 70, 10, 10);
        rect(170, 70, 10, 10);
        rect(180, 70, 10, 10);
        //tan
        fill(247, 232, 166);
        rect(130, 70, 10, 10);
        //white
        fill(255);
        rect(140, 70, 10, 10);
        rect(150, 70, 10, 10);
        rect(160, 70, 10, 10);
        rect(190, 70, 10, 10);
         
      //row 8
        // black
        fill(0);
        rect(70, 80, 10, 10);
        rect(80, 80, 10, 10);
        rect(90, 80, 10, 10);
        rect(150, 80, 10, 10);
        rect(160, 80, 10, 10);
        rect(180, 80, 10, 10);
        rect(200, 80, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(100, 80, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(110, 80, 10, 10);
        //tan
        fill(247, 232, 166);
        rect(120, 80, 10, 10);
        rect(170, 80, 10, 10);
        //white
        fill(255);
        rect(130, 80, 10, 10);
        rect(140, 80, 10, 10);
        rect(190, 80, 10, 10);
         
      //row 9
        // black
        fill(0);
        rect(50, 90, 10, 10);
        rect(60, 90, 10, 10);
        rect(100, 90, 10, 10);
        rect(150, 90, 10, 10);
        rect(160, 90, 10, 10);
        rect(180, 90, 10, 10);
        rect(200, 90, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(70, 90, 10, 10);
        rect(80, 90, 10, 10);
        rect(90, 90, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(110, 90, 10, 10);
        //tan
        fill(247, 232, 166);
        rect(120, 90, 10, 10);
        rect(170, 90, 10, 10);
        //white
        fill(255);
        rect(130, 90, 10, 10);
        rect(140, 90, 10, 10);
        rect(190, 90, 10, 10);
         
      //row 10
        // black
        fill(0);
        rect(40, 100, 10, 10);
        rect(110, 100, 10, 10);
        rect(200, 100, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(80, 100, 10, 10);
        rect(90, 100, 10, 10);
        rect(100, 100, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(50, 100, 10, 10);
        rect(60, 100, 10, 10);
        rect(70, 100, 10, 10);
        //tan
        fill(247, 232, 166);
        rect(120, 100, 10, 10);
        rect(130, 100, 10, 10);
        rect(170, 100, 10, 10);
        rect(190, 100, 10, 10);
        //white
        fill(255);
        rect(140, 100, 10, 10);
        rect(150, 100, 10, 10);
        rect(160, 100, 10, 10);
        rect(180, 100, 10, 10);
         
      //row 11
        // black
        fill(0);
        rect(30, 110, 10, 10);
        rect(100, 110, 10, 10);
        rect(140, 110, 10, 10);
        rect(150, 110, 10, 10);
        rect(160, 110, 10, 10);
        rect(170, 110, 10, 10);
        rect(190, 110, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(80, 110, 10, 10);
        rect(90, 110, 10, 10);
        rect(110, 110, 10, 10);
        rect(120, 110, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(40, 110, 10, 10);
        rect(50, 110, 10, 10);
        rect(60, 110, 10, 10);
        rect(70, 110, 10, 10);
        //tan
        fill(247, 232, 166);
        rect(130, 110, 10, 10);
        rect(180, 110, 10, 10);
         
      //row 12
        // black
        fill(0);
        rect(30, 120, 10, 10);
        rect(70, 120, 10, 10);
        rect(80, 120, 10, 10);
        rect(90, 120, 10, 10);
        rect(180, 120, 10, 10);
        rect(190, 120, 10, 10);
        rect(200, 120, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(100, 120, 10, 10);
        rect(110, 120, 10, 10);
        rect(120, 120, 10, 10);
        rect(130, 120, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(40, 120, 10, 10);
        rect(50, 120, 10, 10);
        rect(60, 120, 10, 10);
        rect(140, 120, 10, 10);
        //tan
        fill(247, 232, 166);
        rect(150, 120, 10, 10);
        rect(160, 120, 10, 10);
        rect(170, 120, 10, 10);
         
      //row 13
        // black
        fill(0);
        rect(30, 130, 10, 10);
        rect(70, 130, 10, 10);
        rect(90, 130, 10, 10);
        rect(150, 130, 10, 10);
        rect(160, 130, 10, 10);
        rect(170, 130, 10, 10);
        rect(210, 130, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(100, 130, 10, 10);
        rect(110, 130, 10, 10);
        rect(120, 130, 10, 10);
        rect(130, 130, 10, 10);
        rect(140, 130, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(40, 130, 10, 10);
        rect(50, 130, 10, 10);
        rect(60, 130, 10, 10);
        rect(180, 130, 10, 10);
        rect(190, 130, 10, 10);
        rect(200, 130, 10, 10);
         
      //row 14
        // black
        fill(0);
        rect(40, 140, 10, 10);
        rect(50, 140, 10, 10);
        rect(60, 140, 10, 10);
        rect(80, 140, 10, 10);
        rect(110, 140, 10, 10);
        rect(210, 140, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(100, 140, 10, 10);
        rect(130, 140, 10, 10);
        rect(140, 140, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(90, 140, 10, 10);
        rect(120, 140, 10, 10);
        rect(150, 140, 10, 10);
        rect(160, 140, 10, 10);
        rect(170, 140, 10, 10);
        rect(180, 140, 10, 10);
        rect(190, 140, 10, 10);
        rect(200, 140, 10, 10);
         
      //row 15
        // black
        fill(0);
        rect(30, 150, 10, 10);
        rect(60, 150, 10, 10);
        rect(70, 150, 10, 10);
        rect(80, 150, 10, 10);
        rect(120, 150, 10, 10);
        rect(210, 150, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(110, 150, 10, 10);
        rect(140, 150, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(40, 150, 10, 10);
        rect(50, 150, 10, 10);
        rect(90, 150, 10, 10);
        rect(100, 150, 10, 10);
        rect(130, 150, 10, 10);
        rect(150, 150, 10, 10);
        rect(160, 150, 10, 10);
        rect(170, 150, 10, 10);
        rect(180, 150, 10, 10);
        rect(190, 150, 10, 10);
        rect(200, 150, 10, 10);
         
      //row 16
        // black
        fill(0);
        rect(20, 160, 10, 10);
        rect(70, 160, 10, 10);
        rect(130, 160, 10, 10);
        rect(140, 160, 10, 10);
        rect(150, 160, 10, 10);
        rect(160, 160, 10, 10);
        rect(170, 160, 10, 10);
        rect(180, 160, 10, 10);
        rect(190, 160, 10, 10);
        rect(200, 160, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(80, 160, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(30, 160, 10, 10);
        rect(40, 160, 10, 10);
        rect(50, 160, 10, 10);
        rect(60, 160, 10, 10);
        rect(90, 160, 10, 10);
        rect(100, 160, 10, 10);
        rect(110, 160, 10, 10);
        rect(120, 160, 10, 10);
         
      //row 17
        // black
        fill(0);
        rect(10, 170, 10, 10);
        rect(170, 170, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(70, 170, 10, 10);
        rect(80, 170, 10, 10);
        rect(90, 170, 10, 10);
        rect(140, 170, 10, 10);
        rect(150, 170, 10, 10);
        rect(160, 170, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(20, 170, 10, 10);
        rect(30, 170, 10, 10);
        rect(40, 170, 10, 10);
        rect(50, 170, 10, 10);
        rect(60, 170, 10, 10);
        rect(100, 170, 10, 10);
        rect(110, 170, 10, 10);
        rect(120, 170, 10, 10);
        rect(130, 170, 10, 10);
         
      //row 18
        // black
        fill(0);
        rect(10, 180, 10, 10);
        rect(40, 180, 10, 10);
        rect(100, 180, 10, 10);
        rect(110, 180, 10, 10);
        rect(120, 180, 10, 10);
        rect(180, 180, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(70, 180, 10, 10);
        rect(80, 180, 10, 10);
        rect(90, 180, 10, 10);
        rect(130, 180, 10, 10);
        rect(140, 180, 10, 10);
        rect(150, 180, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(20, 180, 10, 10);
        rect(30, 180, 10, 10);
        rect(50, 180, 10, 10);
        rect(60, 180, 10, 10);
        rect(160, 180, 10, 10);
        rect(170, 180, 10, 10);
         
      //row 19
        // black
        fill(0);
        rect(20, 190, 10, 10);
        rect(30, 190, 10, 10);
        rect(40, 190, 10, 10);
        rect(50, 190, 10, 10);
        rect(90, 190, 10, 10);
        rect(130, 190, 10, 10);
        rect(180, 190, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(80, 190, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(60, 190, 10, 10);
        rect(70, 190, 10, 10);
        rect(140, 190, 10, 10);
        rect(150, 190, 10, 10);
        rect(160, 190, 10, 10);
        rect(170, 190, 10, 10);
         
      //row 20
        // black
        fill(0);
        rect(60, 200, 10, 10);
        rect(70, 200, 10, 10);
        rect(80, 200, 10, 10);
        rect(130, 200, 10, 10);
        rect(170, 200, 10, 10);
        rect(180, 200, 10, 10);
        rect(190, 200, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(140, 200, 10, 10);
        rect(150, 200, 10, 10);
        rect(160, 200, 10, 10);
         
      //row 21
        // black
        fill(0);
        rect(120, 210, 10, 10);
        rect(200, 210, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(130, 210, 10, 10);
        rect(140, 210, 10, 10);
        rect(150, 210, 10, 10);
        rect(160, 210, 10, 10);
        rect(170, 210, 10, 10);
        rect(180, 210, 10, 10);
        rect(190, 210, 10, 10);
         
      //row 22
        // black
        fill(0);
        rect(120, 220, 10, 10);
        rect(130, 220, 10, 10);
        rect(140, 220, 10, 10);
        rect(150, 220, 10, 10);
        rect(160, 220, 10, 10);
        rect(170, 220, 10, 10);
        rect(180, 220, 10, 10);
        rect(190, 220, 10, 10);
        rect(200, 220, 10, 10);
 
}
     
    void standingLeft() {
        noStroke();
        translate(location.x + 25, location.y);
        //row 1
        // black
        fill(0);
        rect(110, 10, 10, 10);
        rect(100, 10, 10, 10);
        rect(90, 10, 10, 10);
         
        //row 2
        // black
        fill(0);
        rect(130, 20, 10, 10);
        rect(120, 20, 10, 10);
        rect(110, 20, 10, 10);
        rect(80, 20, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(100, 20, 10, 10);
        rect(90, 20, 10, 10);
         
        //row 3
        // black
        fill(0);
        rect(140, 30, 10, 10);
        rect(100, 30, 10, 10);
        rect(70, 30, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(130, 30, 10, 10);
        rect(120, 30, 10, 10);
        rect(110, 30, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(90, 30, 10, 10);
        rect(80, 30, 10, 10);
         
        //row 4
        // black
        fill(0);
        rect(150, 40, 10, 10);
        rect(90, 40, 10, 10);
        rect(80, 40, 10, 10);
        rect(70, 40, 10, 10);
        rect(60, 40, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(140, 40, 10, 10);
        rect(130, 40, 10, 10);
        rect(120, 40, 10, 10);
        rect(110, 40, 10, 10);
        rect(100, 40, 10, 10);
         
        //row 5
        // black
        fill(0);
        rect(150, 50, 10, 10);
        rect(90, 50, 10, 10);
        rect(50, 50, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(140, 50, 10, 10);
        rect(130, 50, 10, 10);
        rect(120, 50, 10, 10);
        rect(110, 50, 10, 10);
        rect(100, 50, 10, 10);
        rect(60, 50, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(80, 50, 10, 10);
        rect(70, 50, 10, 10);
         
        //row 6
        // black
        fill(0);
        rect(160, 60, 10, 10);
        rect(80, 60, 10, 10);
        rect(70, 60, 10, 10);
        rect(50, 60, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(140, 60, 10, 10);
        rect(130, 60, 10, 10);
        rect(120, 60, 10, 10);
        rect(110, 60, 10, 10);
        rect(100, 60, 10, 10);
        rect(90, 60, 10, 10);
        rect(60, 60, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(150, 60, 10, 10);
         
        //row 7
        // black
        fill(0);
        rect(160, 70, 10, 10);
        rect(50, 70, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(140, 70, 10, 10);
        rect(130, 70, 10, 10);
        rect(80, 70, 10, 10);
        rect(70, 70, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(150, 70, 10, 10);
        //tan
        fill(247, 232, 166);
        rect(120, 70, 10, 10);
        //white
        fill(255);
        rect(110, 70, 10, 10);
        rect(100, 70, 10, 10);
        rect(90, 70, 10, 10);
        rect(60, 70, 10, 10);
         
        //row 8
        // black
        fill(0);
        rect(160, 80, 10, 10);
        rect(100, 80, 10, 10);
        rect(90, 80, 10, 10);
        rect(70, 80, 10, 10);
        rect(50, 80, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(140, 80, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(150, 80, 10, 10);
        //tan
        fill(247, 232, 166);
        rect(130, 80, 10, 10);
        rect(80, 80, 10, 10);
        //white
        fill(255);
        rect(120, 80, 10, 10);
        rect(110, 80, 10, 10);
        rect(60, 80, 10, 10);
 
        //row 9
        // black
        fill(0);
        rect(150, 90, 10, 10);
        rect(100, 90, 10, 10);
        rect(90, 90, 10, 10);
        rect(70, 90, 10, 10);
        rect(50, 90, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(140, 90, 10, 10);
        //tan
        fill(247, 232, 166);
        rect(130, 90, 10, 10);
        rect(80, 90, 10, 10);
        //white
        fill(255);
        rect(120, 90, 10, 10);
        rect(110, 90, 10, 10);
        rect(60, 90, 10, 10);
         
        //row 10
        // black
        fill(0);
        rect(160, 100, 10, 10);
        rect(150, 100, 10, 10);
        rect(50, 100, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(140, 100, 10, 10);
        //tan
        fill(247, 232, 166);
        rect(130, 100, 10, 10);
        rect(120, 100, 10, 10);
        rect(80, 100, 10, 10);
        rect(60, 100, 10, 10);
        //white
        fill(255);
        rect(110, 100, 10, 10);
        rect(100, 100, 10, 10);
        rect(90, 100, 10, 10);
        rect(70, 100, 10, 10);
         
        //row 11
        // black
        fill(0);
        rect(180, 110, 10, 10);
        rect(170, 110, 10, 10);
        rect(140, 110, 10, 10);
        rect(110, 110, 10, 10);
        rect(100, 110, 10, 10);
        rect(90, 110, 10, 10);
        rect(80, 110, 10, 10);
        rect(60, 110, 10, 10);
        rect(50, 110, 10, 10);
        rect(40, 110, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(130, 110, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(160, 110, 10, 10);
        rect(150, 110, 10, 10);
        //tan
        fill(247, 232, 166);
        rect(120, 110, 10, 10);
        rect(70, 110, 10, 10);
         
        //row 12
        // black
        fill(0);
        rect(190, 120, 10, 10);
        rect(130, 120, 10, 10);
        rect(70, 120, 10, 10);
        rect(30, 120, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(180, 120, 10, 10);
        rect(40, 120, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(170, 120, 10, 10);
        rect(160, 120, 10, 10);
        rect(150, 120, 10, 10);
        rect(140, 120, 10, 10);
        rect(60, 120, 10, 10);
        rect(50, 120, 10, 10);
        //tan
        fill(247, 232, 166);
        rect(120, 120, 10, 10);
        rect(110, 120, 10, 10);
        rect(100, 120, 10, 10);
        rect(90, 120, 10, 10);
        rect(80, 120, 10, 10);
         
        //row 13
        // black
        fill(0);
        rect(190, 130, 10, 10);
        rect(120, 130, 10, 10);
        rect(110, 130, 10, 10);
        rect(100, 130, 10, 10);
        rect(90, 130, 10, 10);
        rect(80, 130, 10, 10);
        rect(30, 130, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(180, 130, 10, 10);
        rect(170, 130, 10, 10);
        rect(50, 130, 10, 10);
        rect(40, 130, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(160, 130, 10, 10);
        rect(150, 130, 10, 10);
        rect(140, 130, 10, 10);
        rect(130, 130, 10, 10);
        rect(70, 130, 10, 10);
        rect(60, 130, 10, 10);
         
        //row 14
        // black
        fill(0);
        rect(200, 140, 10, 10);
        rect(150, 140, 10, 10);
        rect(70, 140, 10, 10);
        rect(20, 140, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(190, 140, 10, 10);
        rect(180, 140, 10, 10);
        rect(170, 140, 10, 10);
        rect(50, 140, 10, 10);
        rect(40, 140, 10, 10);
        rect(30, 140, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(160, 140, 10, 10);
        rect(140, 140, 10, 10);
        rect(130, 140, 10, 10);
        rect(120, 140, 10, 10);
        rect(110, 140, 10, 10);
        rect(100, 140, 10, 10);
        rect(90, 140, 10, 10);
        rect(80, 140, 10, 10);
        rect(60, 140, 10, 10);
         
        //row 15
        // black
        fill(0);
        rect(200, 150, 10, 10);
        rect(170, 150, 10, 10);
        rect(160, 150, 10, 10);
        rect(150, 150, 10, 10);
        rect(70, 150, 10, 10);
        rect(60, 150, 10, 10);
        rect(50, 150, 10, 10);
        rect(20, 150, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(190, 150, 10, 10);
        rect(180, 150, 10, 10);
        rect(40, 150, 10, 10);
        rect(30, 150, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(140, 150, 10, 10);
        rect(130, 150, 10, 10);
        rect(120, 150, 10, 10);
        rect(110, 150, 10, 10);
        rect(100, 150, 10, 10);
        rect(90, 150, 10, 10);
        rect(80, 150, 10, 10);
 
        //row 16
        // black
        fill(0);
        rect(200, 160, 10, 10);
        rect(160, 160, 10, 10);
        rect(150, 160, 10, 10);
        rect(70, 160, 10, 10);
        rect(60, 160, 10, 10);
        rect(20, 160, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(190, 160, 10, 10);
        rect(180, 160, 10, 10);
        rect(170, 160, 10, 10);
        rect(50, 160, 10, 10);
        rect(40, 160, 10, 10);
        rect(30, 160, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(140, 160, 10, 10);
        rect(130, 160, 10, 10);
        rect(120, 160, 10, 10);
        rect(110, 160, 10, 10);
        rect(100, 160, 10, 10);
        rect(90, 160, 10, 10);
        rect(80, 160, 10, 10);
         
        //row 17
        // black
        fill(0);
        rect(200, 170, 10, 10);
        rect(160, 170, 10, 10);
        rect(150, 170, 10, 10);
        rect(70, 170, 10, 10);
        rect(60, 170, 10, 10);
        rect(20, 170, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(190, 170, 10, 10);
        rect(180, 170, 10, 10);
        rect(170, 170, 10, 10);
        rect(50, 170, 10, 10);
        rect(40, 170, 10, 10);
        rect(30, 170, 10, 10);
        rect(140, 170, 10, 10);
        rect(130, 170, 10, 10);
        rect(120, 170, 10, 10);
        rect(110, 170, 10, 10);
        rect(100, 170, 10, 10);
        rect(90, 170, 10, 10);
        rect(80, 170, 10, 10);
         
        //row 18
        // black
        fill(0);
        rect(190, 180, 10, 10);
        rect(180, 180, 10, 10);
        rect(170, 180, 10, 10);
        rect(150, 180, 10, 10);
        rect(70, 180, 10, 10);
        rect(50, 180, 10, 10);
        rect(40, 180, 10, 10);
        rect(30, 180, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(140, 180, 10, 10);
        rect(130, 180, 10, 10);
        rect(120, 180, 10, 10);
        rect(110, 180, 10, 10);
        rect(100, 180, 10, 10);
        rect(90, 180, 10, 10);
        rect(80, 180, 10, 10);
         
        //row 19
        // black
        fill(0);
        rect(160, 190, 10, 10);
        rect(60, 190, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(130, 190, 10, 10);
        rect(120, 190, 10, 10);
        rect(110, 190, 10, 10);
        rect(100, 190, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(150, 190, 10, 10);
        rect(140, 190, 10, 10);
        rect(90, 190, 10, 10);
        rect(80, 190, 10, 10);
        rect(70, 190, 10, 10);
         
        //row 20
        // black
        fill(0);
        rect(170, 200, 10, 10);
        rect(110, 200, 10, 10);
        rect(50, 200, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(160, 200, 10, 10);
        rect(150, 200, 10, 10);
        rect(60, 200, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(140, 200, 10, 10);
        rect(130, 200, 10, 10);
        rect(120, 200, 10, 10);
        rect(100, 200, 10, 10);
        rect(90, 200, 10, 10);
        rect(80, 200, 10, 10);
        rect(70, 200, 10, 10);
         
        //row 21
        // black
        fill(0);
        rect(180, 210, 10, 10);
        rect(170, 210, 10, 10);
        rect(120, 210, 10, 10);
        rect(100, 210, 10, 10);
        rect(50, 210, 10, 10);
        rect(40, 210, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(160, 210, 10, 10);
        rect(150, 210, 10, 10);
        rect(140, 210, 10, 10);
        rect(80, 210, 10, 10);
        rect(70, 210, 10, 10);
        rect(60, 210, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(130, 210, 10, 10);
        rect(90, 210, 10, 10);
         
        //row 22
        // black
        fill(0);
        rect(20, 220, 10, 10);
        rect(30, 220, 10, 10);
        rect(90, 220, 10, 10);
        rect(130, 220, 10, 10);
        rect(190, 220, 10, 10);
        rect(200, 220, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(40, 220, 10, 10);
        rect(50, 220, 10, 10);
        rect(60, 220, 10, 10);
        rect(70, 220, 10, 10);
        rect(80, 220, 10, 10);
        rect(140, 220, 10, 10);
        rect(150, 220, 10, 10);
        rect(160, 220, 10, 10);
        rect(170, 220, 10, 10);
        rect(180, 220, 10, 10);
        //light blue
        fill(31, 128, 255);
         
        //row 23
        // black
        fill(0);
        rect(10, 230, 10, 10);
        rect(90, 230, 10, 10);
        rect(130, 230, 10, 10);
        rect(210, 230, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(20, 230, 10, 10);
        rect(30, 230, 10, 10);
        rect(40, 230, 10, 10);
        rect(50, 230, 10, 10);
        rect(60, 230, 10, 10);
        rect(70, 230, 10, 10);
        rect(80, 230, 10, 10);
        rect(140, 230, 10, 10);
        rect(150, 230, 10, 10);
        rect(160, 230, 10, 10);
        rect(170, 230, 10, 10);
        rect(180, 230, 10, 10);
        rect(190, 230, 10, 10);
        rect(200, 230, 10, 10);
         
        //row 24
        // black
        fill(0);
        rect(10, 240, 10, 10);
        rect(20, 240, 10, 10);
        rect(30, 240, 10, 10);
        rect(40, 240, 10, 10);
        rect(50, 240, 10, 10);
        rect(60, 240, 10, 10);
        rect(70, 240, 10, 10);
        rect(80, 240, 10, 10);
        rect(90, 240, 10, 10);
        rect(130, 240, 10, 10);
        rect(140, 240, 10, 10);
        rect(150, 240, 10, 10);
        rect(160, 240, 10, 10);
        rect(170, 240, 10, 10);
        rect(180, 240, 10, 10);
        rect(190, 240, 10, 10);
        rect(200, 240, 10, 10);
        rect(210, 240, 10, 10);
         
    }
     
    void runningLeftOpen() {
        noStroke();
        translate(location.x + 15, location.y + 10);
        //row 1
        // black
        fill(0);
        rect(90, 10, 10, 10);
        rect(80, 10, 10, 10);
        rect(70, 10, 10, 10);
         
        //row 2
        // black
        fill(0);
        rect(110, 20, 10, 10);
        rect(100, 20, 10, 10);
        rect(90, 20, 10, 10);
        rect(60, 20, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(80, 20, 10, 10);
        rect(70, 20, 10, 10);
         
        //row 3
        // black
        fill(0);
        rect(120, 30, 10, 10);
        rect(80, 30, 10, 10);
        rect(50, 30, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(110, 30, 10, 10);
        rect(100, 30, 10, 10);
        rect(90, 30, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(70, 30, 10, 10);
        rect(60, 30, 10, 10);
         
        //row 4
        // black
        fill(0);
        rect(130, 40, 10, 10);
        rect(70, 40, 10, 10);
        rect(60, 40, 10, 10);
        rect(50, 40, 10, 10);
        rect(40, 40, 10, 10);       
        //dark blue
        fill(0, 104, 240);
        rect(120, 40, 10, 10);
        rect(110, 40, 10, 10);
        rect(100, 40, 10, 10);
        rect(90, 40, 10, 10);
        rect(80, 40, 10, 10);
 
        //row 5
        // black
        fill(0);
        rect(130, 50, 10, 10);
        rect(70, 50, 10, 10);
        rect(30, 50, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(120, 50, 10, 10);
        rect(110, 50, 10, 10);
        rect(100, 50, 10, 10);
        rect(90, 50, 10, 10);
        rect(80, 50, 10, 10);
        rect(40, 50, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(60, 50, 10, 10);
        rect(50, 50, 10, 10);
         
        //row 6
        // black
        fill(0);
        rect(160, 60, 10, 10);
        rect(150, 60, 10, 10);
        rect(140, 60, 10, 10);
        rect(60, 60, 10, 10);
        rect(50, 60, 10, 10);
        rect(30, 60, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(130, 60, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(120, 60, 10, 10);
        rect(110, 60, 10, 10);
        rect(100, 60, 10, 10);
        rect(90, 60, 10, 10);
        rect(80, 60, 10, 10);
        rect(70, 60, 10, 10);
        rect(40, 60, 10, 10);
         
        //row 7
        // black
        fill(0);
        rect(180, 70, 10, 10);
        rect(170, 70, 10, 10);
        rect(140, 70, 10, 10);
        rect(30, 70, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(160, 70, 10, 10);
        rect(150, 70, 10, 10);
        rect(130, 70, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(120, 70, 10, 10);
        rect(110, 70, 10, 10);
        rect(60, 70, 10, 10);
        rect(50, 70, 10, 10);
        //tan
        fill(247, 232, 166);
        rect(100, 70, 10, 10);
        //white
        fill(255);
        rect(90, 70, 10, 10);
        rect(80, 70, 10, 10);
        rect(70, 70, 10, 10);
        rect(40, 70, 10, 10);
         
        //row 8
        // black
        fill(0);
        rect(190, 80, 10, 10);
        rect(170, 80, 10, 10);
        rect(140, 80, 10, 10);
        rect(80, 80, 10, 10);
        rect(70, 80, 10, 10);
        rect(50, 80, 10, 10);
        rect(30, 80, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(180, 80, 10, 10);
        rect(120, 80, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(160, 80, 10, 10);
        rect(150, 80, 10, 10);
        rect(130, 80, 10, 10);
        //tan
        fill(247, 232, 166);
        rect(110, 80, 10, 10);
        rect(60, 80, 10, 10);
        //white
        fill(255);
        rect(100, 80, 10, 10);
        rect(90, 80, 10, 10);
        rect(40, 80, 10, 10);
         
        //row 9
        // black
        fill(0);
        rect(200, 90, 10, 10);
        rect(160, 90, 10, 10);
        rect(130, 90, 10, 10);
        rect(80, 90, 10, 10);
        rect(70, 90, 10, 10);
        rect(50, 90, 10, 10);
        rect(30, 90, 10, 10);
        rect(10, 90, 10, 10);
        rect(0, 90, 10, 10);
        rect(-10, 90, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(190, 90, 10, 10);
        rect(180, 90, 10, 10);
        rect(170, 90, 10, 10);
        rect(120, 90, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(150, 90, 10, 10);
        rect(140, 90, 10, 10);
        //tan
        fill(247, 232, 166);
        rect(110, 90, 10, 10);
        rect(60, 90, 10, 10);
        //white
        fill(255);
        rect(100, 90, 10, 10);
        rect(90, 90, 10, 10);
        rect(40, 90, 10, 10);
         
        //row 10
        // black
        fill(0);
        rect(210, 100, 10, 10);
        rect(160, 100, 10, 10);
        rect(130, 100, 10, 10);
        rect(30, 100, 10, 10);
        rect(20, 100, 10, 10);
        rect(-20, 100, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(200, 100, 10, 10);
        rect(190, 100, 10, 10);
        rect(180, 100, 10, 10);
        rect(170, 100, 10, 10);
        rect(120, 100, 10, 10);
        rect(10, 100, 10, 10);
        rect(0, 100, 10, 10);
        rect(-10, 100, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(150, 100, 10, 10);
        rect(140, 100, 10, 10);
        //tan
        fill(247, 232, 166);
        rect(110, 100, 10, 10);
        rect(100, 100, 10, 10);
        rect(60, 100, 10, 10);
        rect(40, 100, 10, 10);
        //white
        fill(255);
        rect(90, 100, 10, 10);
        rect(80, 100, 10, 10);
        rect(70, 100, 10, 10);
        rect(50, 100, 10, 10);
         
        //row 11
        // black
        fill(0);
        rect(210, 110, 10, 10);
        rect(170, 110, 10, 10);
        rect(150, 110, 10, 10);
        rect(120, 110, 10, 10);
        rect(90, 110, 10, 10);
        rect(80, 110, 10, 10);
        rect(70, 110, 10, 10);
        rect(60, 110, 10, 10);
        rect(40, 110, 10, 10);
        rect(20, 110, 10, 10);
        rect(-20, 110, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(200, 110, 10, 10);
        rect(190, 110, 10, 10);
        rect(180, 110, 10, 10);
        rect(110, 110, 10, 10);
        rect(10, 110, 10, 10);
        rect(0, 110, 10, 10);
        rect(-10, 110, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(140, 110, 10, 10);
        rect(130, 110, 10, 10);
        //tan
        fill(247, 232, 166);
        rect(100, 110, 10, 10);
        rect(50, 110, 10, 10);
         
        //row 12
        // black
        fill(0);
        rect(210, 120, 10, 10);
        rect(170, 120, 10, 10);
        rect(150, 120, 10, 10);
        rect(110, 120, 10, 10);
        rect(50, 120, 10, 10);
        rect(30, 120, 10, 10);
        rect(20, 120, 10, 10);
        rect(-20, 120, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(200, 120, 10, 10);
        rect(190, 120, 10, 10);
        rect(180, 120, 10, 10);
        rect(10, 120, 10, 10);
        rect(0, 120, 10, 10);
        rect(-10, 120, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(140, 120, 10, 10);
        rect(130, 120, 10, 10);
        rect(120, 120, 10, 10);
        rect(40, 120, 10, 10);
        //tan
        fill(247, 232, 166);
        rect(100, 120, 10, 10);
        rect(90, 120, 10, 10);
        rect(80, 120, 10, 10);
        rect(70, 120, 10, 10);
        rect(60, 120, 10, 10);
         
        //row 13
        // black
        fill(0);
        rect(200, 130, 10, 10);
        rect(190, 130, 10, 10);
        rect(180, 130, 10, 10);
        rect(150, 130, 10, 10);
        rect(100, 130, 10, 10);
        rect(90, 130, 10, 10);
        rect(80, 130, 10, 10);
        rect(70, 130, 10, 10);
        rect(60, 130, 10, 10);
        rect(-10, 130, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(140, 130, 10, 10);
        rect(20, 130, 10, 10);
        rect(10, 130, 10, 10);
        rect(0, 130, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(130, 130, 10, 10);
        rect(120, 130, 10, 10);
        rect(110, 130, 10, 10);
        rect(50, 130, 10, 10);
        rect(40, 130, 10, 10);
        rect(30, 130, 10, 10);
         
        //row 14
        // black
        fill(0);
        rect(180, 140, 10, 10);
        rect(170, 140, 10, 10);
        rect(150, 140, 10, 10);
        rect(60, 140, 10, 10);
        rect(0, 140, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(140, 140, 10, 10);
        rect(130, 140, 10, 10);
        rect(120, 140, 10, 10);
        rect(30, 140, 10, 10);
        rect(20, 140, 10, 10);
        rect(10, 140, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(110, 140, 10, 10);
        rect(100, 140, 10, 10);
        rect(90, 140, 10, 10);
        rect(80, 140, 10, 10);
        rect(70, 140, 10, 10);
        rect(50, 140, 10, 10);
        rect(40, 140, 10, 10);
         
         
        //row 15
        // black
        fill(0);
        rect(190, 150, 10, 10);
        rect(160, 150, 10, 10);
        rect(150, 150, 10, 10);
        rect(70, 150, 10, 10);
        rect(50, 150, 10, 10);
        rect(10, 150, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(180, 150, 10, 10);
        rect(170, 150, 10, 10);
        rect(140, 150, 10, 10);
        rect(130, 150, 10, 10);
        rect(120, 150, 10, 10);
        rect(110, 150, 10, 10);
        rect(100, 150, 10, 10);
        rect(90, 150, 10, 10);
        rect(30, 150, 10, 10);
        rect(20, 150, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(80, 150, 10, 10);
        rect(40, 150, 10, 10);
         
        //row 16
        // black
        fill(0);
        rect(200, 160, 10, 10);
        rect(150, 160, 10, 10);
        rect(140, 160, 10, 10);
        rect(80, 160, 10, 10);
        rect(40, 160, 10, 10);
        rect(30, 160, 10, 10);
        rect(20, 160, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(190, 160, 10, 10);
        rect(180, 160, 10, 10);
        rect(170, 160, 10, 10);
        rect(160, 160, 10, 10);
        rect(130, 160, 10, 10);
        rect(120, 160, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(110, 160, 10, 10);
        rect(100, 160, 10, 10);
        rect(90, 160, 10, 10);
         
        //row 17
        // black
        fill(0);
        rect(210, 170, 10, 10);
        rect(140, 170, 10, 10);
        rect(130, 170, 10, 10);
        rect(70, 170, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(200, 170, 10, 10);
        rect(190, 170, 10, 10);
        rect(180, 170, 10, 10);
        rect(170, 170, 10, 10);
        rect(160, 170, 10, 10);
        rect(120, 170, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(150, 170, 10, 10);
        rect(110, 170, 10, 10);
        rect(100, 170, 10, 10);
        rect(90, 170, 10, 10);
        rect(80, 170, 10, 10);
         
        //row 18
        // black
        fill(0);
        rect(210, 180, 10, 10);
        rect(180, 180, 10, 10);
        rect(120, 180, 10, 10);
        rect(110, 180, 10, 10);
        rect(60, 180, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(200, 180, 10, 10);
        rect(190, 180, 10, 10);
        rect(170, 180, 10, 10);
        rect(160, 180, 10, 10);
        rect(70, 180, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(150, 180, 10, 10);
        rect(140, 180, 10, 10);
        rect(130, 180, 10, 10);
        rect(100, 180, 10, 10);
        rect(90, 180, 10, 10);
        rect(80, 180, 10, 10);
        
        //row 19
        // black
        fill(0);
        rect(200, 190, 10, 10);
        rect(190, 190, 10, 10);
        rect(180, 190, 10, 10);
        rect(170, 190, 10, 10);
        rect(130, 190, 10, 10);
        rect(110, 190, 10, 10);
        rect(60, 190, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(160, 190, 10, 10);
        rect(100, 190, 10, 10);
        rect(90, 190, 10, 10);
        rect(80, 190, 10, 10);
        rect(70, 190, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(150, 190, 10, 10);
        rect(140, 190, 10, 10);
         
        //row 20
        // black
        fill(0);
        rect(160, 200, 10, 10);
        rect(150, 200, 10, 10);
        rect(140, 200, 10, 10);
        rect(110, 200, 10, 10);
        rect(70, 200, 10, 10);
        rect(60, 200, 10, 10);
        rect(50, 200, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(100, 200, 10, 10);
        rect(90, 200, 10, 10);
        rect(80, 200, 10, 10);
         
        //row 21
        // black
        fill(0);
        rect(120, 210, 10, 10);
        rect(40, 210, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(110, 210, 10, 10);
        rect(100, 210, 10, 10);
        rect(90, 210, 10, 10);
        rect(80, 210, 10, 10);
        rect(70, 210, 10, 10);
        rect(60, 210, 10, 10);
        rect(50, 210, 10, 10);
         
        //row 22
        // black
        fill(0);
        rect(120, 220, 10, 10);
        rect(110, 220, 10, 10);
        rect(100, 220, 10, 10);
        rect(90, 220, 10, 10);
        rect(80, 220, 10, 10);
        rect(70, 220, 10, 10);
        rect(60, 220, 10, 10);
        rect(50, 220, 10, 10);
        rect(40, 220, 10, 10);
    }
     
    void runningLeftMiddle() {
        noStroke();
        translate(location.x - 15, location.y);
        //row 1
        // black
        fill(0);
        rect(120, 10, 10, 10);
        rect(110, 10, 10, 10);
        rect(100, 10, 10, 10);
         
        //row 2
        // black
        fill(0);
        rect(140, 20, 10, 10);
        rect(130, 20, 10, 10);
        rect(120, 20, 10, 10);
        rect(90, 20, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(110, 20, 10, 10);
        rect(100, 20, 10, 10);
 
        //row 3
        // black
        fill(0);
        rect(150, 30, 10, 10);
        rect(110, 30, 10, 10);
        rect(80, 30, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(100, 30, 10, 10);
        rect(90, 30, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(140, 30, 10, 10);
        rect(130, 30, 10, 10);
        rect(120, 30, 10, 10);
         
        //row 4
        // black
        fill(0);
        rect(160, 40, 10, 10);
        rect(100, 40, 10, 10);
        rect(90, 40, 10, 10);
        rect(80, 40, 10, 10);
        rect(70, 40, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(150, 40, 10, 10);
        rect(140, 40, 10, 10);
        rect(130, 40, 10, 10);
        rect(120, 40, 10, 10);
        rect(110, 40, 10, 10);
         
        //row 5
        // black
        fill(0);
        rect(160, 50, 10, 10);
        rect(100, 50, 10, 10);
        rect(60, 50, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(90, 50, 10, 10);
        rect(80, 50, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(150, 50, 10, 10);
        rect(140, 50, 10, 10);
        rect(130, 50, 10, 10);
        rect(120, 50, 10, 10);
        rect(110, 50, 10, 10);
        rect(70, 50, 10, 10);
         
        //row 6
        // black
        fill(0);
        rect(170, 60, 10, 10);
        rect(90, 60, 10, 10);
        rect(80, 60, 10, 10);
        rect(60, 60, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(160, 60, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(150, 60, 10, 10);
        rect(140, 60, 10, 10);
        rect(130, 60, 10, 10);
        rect(120, 60, 10, 10);
        rect(110, 60, 10, 10);
        rect(100, 60, 10, 10);
        rect(70, 60, 10, 10);
         
        //row 7
        // black
        fill(0);
        rect(170, 70, 10, 10);
        rect(60, 70, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(160, 70, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(150, 70, 10, 10);
        rect(140, 70, 10, 10);
        rect(90, 70, 10, 10);
        rect(80, 70, 10, 10);
        //tan
        fill(247, 232, 166);
        rect(130, 70, 10, 10);
        //white
        fill(255);
        rect(120, 70, 10, 10);
        rect(110, 70, 10, 10);
        rect(100, 70, 10, 10);
        rect(70, 70, 10, 10);
         
        //row 8
        // black
        fill(0);
        rect(180, 80, 10, 10);
        rect(170, 80, 10, 10);
        rect(110, 80, 10, 10);
        rect(100, 80, 10, 10);
        rect(80, 80, 10, 10);
        rect(60, 80, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(160, 80, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(150, 80, 10, 10);
        //tan
        fill(247, 232, 166);
        rect(140, 80, 10, 10);
        rect(90, 80, 10, 10);
        //white
        fill(255);
        rect(130, 80, 10, 10);
        rect(120, 80, 10, 10);
        rect(70, 80, 10, 10);
         
        //row 9
        // black
        fill(0);
        rect(190, 90, 10, 10);
        rect(160, 90, 10, 10);
        rect(110, 90, 10, 10);
        rect(100, 90, 10, 10);
        rect(80, 90, 10, 10);
        rect(60, 90, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(180, 90, 10, 10);
        rect(170, 90, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(150, 90, 10, 10);
        //tan
        fill(247, 232, 166);
        rect(140, 90, 10, 10);
        rect(90, 90, 10, 10);
        //white
        fill(255);
        rect(130, 90, 10, 10);
        rect(120, 90, 10, 10);
        rect(70, 90, 10, 10);
         
        //row 10
        // black
        fill(0);
        rect(200, 100, 10, 10);
        rect(160, 100, 10, 10);
        rect(60, 100, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(190, 100, 10, 10);
        rect(180, 100, 10, 10);
        rect(170, 100, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(150, 100, 10, 10);
        //tan
        fill(247, 232, 166);
        rect(140, 100, 10, 10);
        rect(130, 100, 10, 10);
        rect(90, 100, 10, 10);
        rect(70, 100, 10, 10);
        //white
        fill(255);
        rect(120, 100, 10, 10);
        rect(110, 100, 10, 10);
        rect(100, 100, 10, 10);
        rect(80, 100, 10, 10);
         
        //row 11
        // black
        fill(0);
        rect(210, 110, 10, 10);
        rect(150, 110, 10, 10);
        rect(120, 110, 10, 10);
        rect(110, 110, 10, 10);
        rect(100, 110, 10, 10);
        rect(90, 110, 10, 10);
        rect(70, 110, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(200, 110, 10, 10);
        rect(190, 110, 10, 10);
        rect(180, 110, 10, 10);
        rect(170, 110, 10, 10);
        rect(160, 110, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(140, 110, 10, 10);
        //tan
        fill(247, 232, 166);
        rect(130, 110, 10, 10);
        rect(80, 110, 10, 10);
   
        //row 12
        // black
        fill(0);
        rect(210, 120, 10, 10);
        rect(170, 120, 10, 10);
        rect(140, 120, 10, 10);
        rect(80, 120, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(200, 120, 10, 10);
        rect(190, 120, 10, 10);
        rect(180, 120, 10, 10);
        rect(160, 120, 10, 10);
        rect(150, 120, 10, 10);
        //tan
        fill(247, 232, 166);
        rect(130, 120, 10, 10);
        rect(120, 120, 10, 10);
        rect(110, 120, 10, 10);
        rect(100, 120, 10, 10);
        rect(90, 120, 10, 10);;
         
        //row 13
        // black
        fill(0);
        rect(200, 130, 10, 10);
        rect(160, 130, 10, 10);
        rect(130, 130, 10, 10);
        rect(120, 130, 10, 10);
        rect(110, 130, 10, 10);
        rect(100, 130, 10, 10);
        rect(90, 130, 10, 10);
        rect(80, 130, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(150, 130, 10, 10);
        rect(140, 130, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(190, 130, 10, 10);
        rect(180, 130, 10, 10);
        rect(170, 130, 10, 10);
         
        //row 14
        // black
        fill(0);
        rect(200, 140, 10, 10);
        rect(150, 140, 10, 10);
        rect(140, 140, 10, 10);
        rect(90, 140, 10, 10);
        rect(70, 140, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(130, 140, 10, 10);
        rect(120, 140, 10, 10);
        rect(110, 140, 10, 10);
        rect(100, 140, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(190, 140, 10, 10);
        rect(180, 140, 10, 10);
        rect(170, 140, 10, 10);
        rect(160, 140, 10, 10);
        rect(80, 140, 10, 10);
         
        //row 15
        // black
        fill(0);
        rect(190, 150, 10, 10);
        rect(160, 150, 10, 10);
        rect(130, 150, 10, 10);
        rect(100, 150, 10, 10);
        rect(70, 150, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(120, 150, 10, 10);
        rect(110, 150, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(180, 150, 10, 10);
        rect(170, 150, 10, 10);
        rect(150, 150, 10, 10);
        rect(140, 150, 10, 10);
        rect(90, 150, 10, 10);
        rect(80, 150, 10, 10);
         
        //row 16
        // black
        fill(0);
        rect(180, 160, 10, 10);
        rect(130, 160, 10, 10);
        rect(110, 160, 10, 10);
        rect(100, 160, 10, 10);
        rect(90, 160, 10, 10);
        rect(80, 160, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(170, 160, 10, 10);
        rect(160, 160, 10, 10);
        rect(150, 160, 10, 10);
        rect(140, 160, 10, 10);
        rect(120, 160, 10, 10);
         
        //row 17
        // black
        fill(0);
        rect(170, 170, 10, 10);
        rect(140, 170, 10, 10);
        rect(120, 170, 10, 10);
        rect(100, 170, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(110, 170, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(160, 170, 10, 10);
        rect(150, 170, 10, 10);
        rect(130, 170, 10, 10);
         
        //row 18
        // black
        fill(0);
        rect(160, 180, 10, 10);
        rect(150, 180, 10, 10);
        rect(120, 180, 10, 10);
        rect(100, 180, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(140, 180, 10, 10);
        rect(130, 180, 10, 10);
        rect(110, 180, 10, 10);
         
        //row 19
        // black
        fill(0);
        rect(170, 190, 10, 10);
        rect(160, 190, 10, 10);
        rect(120, 190, 10, 10);
        rect(110, 190, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(150, 190, 10, 10);
        rect(140, 190, 10, 10);
        rect(130, 190, 10, 10);
         
        //row 20
        // black
        fill(0);
        rect(180, 200, 10, 10);
        rect(120, 200, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(170, 200, 10, 10);
        rect(160, 200, 10, 10);
        rect(150, 200, 10, 10);
        rect(140, 200, 10, 10);
        rect(130, 200, 10, 10);
         
        //row 21
        // black
        fill(0);
        rect(190, 210, 10, 10);
        rect(130, 210, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(180, 210, 10, 10);
        rect(170, 210, 10, 10);
        rect(160, 210, 10, 10);
        rect(150, 210, 10, 10);
        rect(140, 210, 10, 10);
         
        //row 22
        // black
        fill(0);
        rect(190, 220, 10, 10);
        rect(150, 220, 10, 10);
        rect(140, 220, 10, 10);
        rect(130, 220, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(180, 220, 10, 10);
        rect(170, 220, 10, 10);
        rect(160, 220, 10, 10);
         
        //row 23
        // black
        fill(0);
        rect(180, 230, 10, 10);
        rect(120, 230, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(170, 230, 10, 10);
        rect(160, 230, 10, 10);
        rect(150, 230, 10, 10);
        rect(140, 230, 10, 10);
        rect(130, 230, 10, 10);
         
        //row 24
        // black
        fill(0);
        rect(170, 240, 10, 10);
        rect(160, 240, 10, 10);
        rect(150, 240, 10, 10);
        rect(140, 240, 10, 10);
        rect(130, 240, 10, 10);
        rect(120, 240, 10, 10);
    }
     
    void runningLeftClose() {
        noStroke();
        translate(location.x + 25, location.y + 10);
        //row 1
        // black
        fill(0);
        rect(80, 10, 10, 10);
        rect(70, 10, 10, 10);
        rect(60, 10, 10, 10);
         
      //row 2
        // black
        fill(0);
        rect(100, 20, 10, 10);
        rect(90, 20, 10, 10);
        rect(80, 20, 10, 10);
        rect(50, 20, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(70, 20, 10, 10);
        rect(60, 20, 10, 10);
         
      //row 3
        // black
        fill(0);
        rect(110, 30, 10, 10);
        rect(70, 30, 10, 10);
        rect(40, 30, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(60, 30, 10, 10);
        rect(50, 30, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(100, 30, 10, 10);
        rect(90, 30, 10, 10);
        rect(80, 30, 10, 10);
         
      //row 4
        // black
        fill(0);
        rect(120, 40, 10, 10);
        rect(60, 40, 10, 10);
        rect(50, 40, 10, 10);
        rect(40, 40, 10, 10);
        rect(30, 40, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(110, 40, 10, 10);
        rect(100, 40, 10, 10);
        rect(90, 40, 10, 10);
        rect(80, 40, 10, 10);
        rect(70, 40, 10, 10);
         
      //row 5
        // black
        fill(0);
        rect(120, 50, 10, 10);
        rect(60, 50, 10, 10);
        rect(20, 50, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(50, 50, 10, 10);
        rect(40, 50, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(110, 50, 10, 10);
        rect(100, 50, 10, 10);
        rect(90, 50, 10, 10);
        rect(80, 50, 10, 10);
        rect(70, 50, 10, 10);
        rect(30, 50, 10, 10);
         
      //row 6
        // black
        fill(0);
        rect(130, 60, 10, 10);
        rect(50, 60, 10, 10);
        rect(40, 60, 10, 10);
        rect(20, 60, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(120, 60, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(110, 60, 10, 10);
        rect(100, 60, 10, 10);
        rect(90, 60, 10, 10);
        rect(80, 60, 10, 10);
        rect(70, 60, 10, 10);
        rect(60, 60, 10, 10);
        rect(30, 60, 10, 10);
         
      //row 7
        // black
        fill(0);
        rect(130, 70, 10, 10);
        rect(20, 70, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(120, 70, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(110, 70, 10, 10);
        rect(100, 70, 10, 10);
        rect(50, 70, 10, 10);
        rect(40, 70, 10, 10);
        //tan
        fill(247, 232, 166);
        rect(90, 70, 10, 10);
        //white
        fill(255);
        rect(80, 70, 10, 10);
        rect(70, 70, 10, 10);
        rect(60, 70, 10, 10);
        rect(30, 70, 10, 10);
         
      //row 8
        // black
        fill(0);
        rect(150, 80, 10, 10);
        rect(140, 80, 10, 10);
        rect(130, 80, 10, 10);
        rect(70, 80, 10, 10);
        rect(60, 80, 10, 10);
        rect(40, 80, 10, 10);
        rect(20, 80, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(120, 80, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(110, 80, 10, 10);
        //tan
        fill(247, 232, 166);
        rect(100, 80, 10, 10);
        rect(50, 80, 10, 10);
        //white
        fill(255);
        rect(90, 80, 10, 10);
        rect(80, 80, 10, 10);
        rect(30, 80, 10, 10);
         
      //row 9
        // black
        fill(0);
        rect(170, 90, 10, 10);
        rect(160, 90, 10, 10);
        rect(120, 90, 10, 10);
        rect(70, 90, 10, 10);
        rect(60, 90, 10, 10);
        rect(40, 90, 10, 10);
        rect(20, 90, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(150, 90, 10, 10);
        rect(140, 90, 10, 10);
        rect(130, 90, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(110, 90, 10, 10);
        //tan
        fill(247, 232, 166);
        rect(100, 90, 10, 10);
        rect(50, 90, 10, 10);
        //white
        fill(255);
        rect(90, 90, 10, 10);
        rect(80, 90, 10, 10);
        rect(30, 90, 10, 10);
         
      //row 10
        // black
        fill(0);
        rect(180, 100, 10, 10);
        rect(110, 100, 10, 10);
        rect(20, 100, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(140, 100, 10, 10);
        rect(130, 100, 10, 10);
        rect(120, 100, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(170, 100, 10, 10);
        rect(160, 100, 10, 10);
        rect(150, 100, 10, 10);
        //tan
        fill(247, 232, 166);
        rect(100, 100, 10, 10);
        rect(90, 100, 10, 10);
        rect(50, 100, 10, 10);
        rect(30, 100, 10, 10);
        //white
        fill(255);
        rect(80, 100, 10, 10);
        rect(70, 100, 10, 10);
        rect(60, 100, 10, 10);
        rect(40, 100, 10, 10);
         
      //row 11
        // black
        fill(0);
        rect(190, 110, 10, 10);
        rect(120, 110, 10, 10);
        rect(80, 110, 10, 10);
        rect(70, 110, 10, 10);
        rect(60, 110, 10, 10);
        rect(50, 110, 10, 10);
        rect(30, 110, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(140, 110, 10, 10);
        rect(130, 110, 10, 10);
        rect(110, 110, 10, 10);
        rect(100, 110, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(180, 110, 10, 10);
        rect(170, 110, 10, 10);
        rect(160, 110, 10, 10);
        rect(150, 110, 10, 10);
        //tan
        fill(247, 232, 166);
        rect(90, 110, 10, 10);
        rect(40, 110, 10, 10);
         
      //row 12
        // black
        fill(0);
        rect(190, 120, 10, 10);
        rect(150, 120, 10, 10);
        rect(140, 120, 10, 10);
        rect(130, 120, 10, 10);
        rect(40, 120, 10, 10);
        rect(30, 120, 10, 10);
        rect(20, 120, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(120, 120, 10, 10);
        rect(110, 120, 10, 10);
        rect(100, 120, 10, 10);
        rect(90, 120, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(180, 120, 10, 10);
        rect(170, 120, 10, 10);
        rect(160, 120, 10, 10);
        rect(80, 120, 10, 10);
        //tan
        fill(247, 232, 166);
        rect(70, 120, 10, 10);
        rect(60, 120, 10, 10);
        rect(50, 120, 10, 10);
         
      //row 13
        // black
        fill(0);
        rect(190, 130, 10, 10);
        rect(150, 130, 10, 10);
        rect(130, 130, 10, 10);
        rect(70, 130, 10, 10);
        rect(60, 130, 10, 10);
        rect(50, 130, 10, 10);
        rect(10, 130, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(120, 130, 10, 10);
        rect(110, 130, 10, 10);
        rect(100, 130, 10, 10);
        rect(90, 130, 10, 10);
        rect(80, 130, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(180, 130, 10, 10);
        rect(170, 130, 10, 10);
        rect(160, 130, 10, 10);
        rect(40, 130, 10, 10);
        rect(30, 130, 10, 10);
        rect(20, 130, 10, 10);
         
      //row 14
        // black
        fill(0);
        rect(180, 140, 10, 10);
        rect(170, 140, 10, 10);
        rect(160, 140, 10, 10);
        rect(140, 140, 10, 10);
        rect(110, 140, 10, 10);
        rect(10, 140, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(120, 140, 10, 10);
        rect(90, 140, 10, 10);
        rect(80, 140, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(130, 140, 10, 10);
        rect(100, 140, 10, 10);
        rect(70, 140, 10, 10);
        rect(60, 140, 10, 10);
        rect(50, 140, 10, 10);
        rect(40, 140, 10, 10);
        rect(30, 140, 10, 10);
        rect(20, 140, 10, 10);
         
      //row 15
        // black
        fill(0);
        rect(190, 150, 10, 10);
        rect(160, 150, 10, 10);
        rect(150, 150, 10, 10);
        rect(140, 150, 10, 10);
        rect(100, 150, 10, 10);
        rect(10, 150, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(110, 150, 10, 10);
        rect(80, 150, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(180, 150, 10, 10);
        rect(170, 150, 10, 10);
        rect(130, 150, 10, 10);
        rect(120, 150, 10, 10);
        rect(90, 150, 10, 10);
        rect(70, 150, 10, 10);
        rect(60, 150, 10, 10);
        rect(50, 150, 10, 10);
        rect(40, 150, 10, 10);
        rect(30, 150, 10, 10);
        rect(20, 150, 10, 10);
         
      //row 16
        // black
        fill(0);
        rect(200, 160, 10, 10);
        rect(150, 160, 10, 10);
        rect(90, 160, 10, 10);
        rect(80, 160, 10, 10);
        rect(70, 160, 10, 10);
        rect(60, 160, 10, 10);
        rect(50, 160, 10, 10);
        rect(40, 160, 10, 10);
        rect(30, 160, 10, 10);
        rect(20, 160, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(140, 160, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(190, 160, 10, 10);
        rect(180, 160, 10, 10);
        rect(170, 160, 10, 10);
        rect(160, 160, 10, 10);
        rect(130, 160, 10, 10);
        rect(120, 160, 10, 10);
        rect(110, 160, 10, 10);
        rect(100, 160, 10, 10);
         
      //row 17
        // black
        fill(0);
        rect(210, 170, 10, 10);
        rect(50, 170, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(150, 170, 10, 10);
        rect(140, 170, 10, 10);
        rect(130, 170, 10, 10);
        rect(80, 170, 10, 10);
        rect(70, 170, 10, 10);
        rect(60, 170, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(200, 170, 10, 10);
        rect(190, 170, 10, 10);
        rect(180, 170, 10, 10);
        rect(170, 170, 10, 10);
        rect(160, 170, 10, 10);
        rect(120, 170, 10, 10);
        rect(110, 170, 10, 10);
        rect(100, 170, 10, 10);
        rect(90, 170, 10, 10);
         
      //row 18
        // black
        fill(0);
        rect(210, 180, 10, 10);
        rect(180, 180, 10, 10);
        rect(120, 180, 10, 10);
        rect(110, 180, 10, 10);
        rect(100, 180, 10, 10);
        rect(40, 180, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(150, 180, 10, 10);
        rect(140, 180, 10, 10);
        rect(130, 180, 10, 10);
        rect(90, 180, 10, 10);
        rect(80, 180, 10, 10);
        rect(70, 180, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(200, 180, 10, 10);
        rect(190, 180, 10, 10);
        rect(170, 180, 10, 10);
        rect(160, 180, 10, 10);
        rect(60, 180, 10, 10);
        rect(50, 180, 10, 10);
         
      //row 19
        // black
        fill(0);
        rect(200, 190, 10, 10);
        rect(190, 190, 10, 10);
        rect(180, 190, 10, 10);
        rect(170, 190, 10, 10);
        rect(130, 190, 10, 10);
        rect(90, 190, 10, 10);
        rect(40, 190, 10, 10);
        //light blue
        fill(31, 128, 255);
        rect(140, 190, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(160, 190, 10, 10);
        rect(150, 190, 10, 10);
        rect(80, 190, 10, 10);
        rect(70, 190, 10, 10);
        rect(60, 190, 10, 10);
        rect(50, 190, 10, 10);
         
      //row 20
        // black
        fill(0);
        rect(160, 200, 10, 10);
        rect(150, 200, 10, 10);
        rect(140, 200, 10, 10);
        rect(90, 200, 10, 10);
        rect(50, 200, 10, 10);
        rect(40, 200, 10, 10);
        rect(30, 200, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(80, 200, 10, 10);
        rect(70, 200, 10, 10);
        rect(60, 200, 10, 10);
         
      //row 21
        // black
        fill(0);
        rect(100, 210, 10, 10);
        rect(20, 210, 10, 10);
        //dark blue
        fill(0, 104, 240);
        rect(90, 210, 10, 10);
        rect(80, 210, 10, 10);
        rect(70, 210, 10, 10);
        rect(60, 210, 10, 10);
        rect(50, 210, 10, 10);
        rect(40, 210, 10, 10);
        rect(30, 210, 10, 10);
         
      //row 22
        // black
        fill(0);
        rect(100, 220, 10, 10);
        rect(90, 220, 10, 10);
        rect(80, 220, 10, 10);
        rect(70, 220, 10, 10);
        rect(60, 220, 10, 10);
        rect(50, 220, 10, 10);
        rect(40, 220, 10, 10);
        rect(30, 220, 10, 10);
        rect(20, 220, 10, 10);
     
    }
}

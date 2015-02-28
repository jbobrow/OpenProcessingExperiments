
//Chun Yi Wu
//eat ball / my small yellows

Player p;
float mm = 250 ;
float nn = 250 ;
void setup() {
  size(300, 300);
  smooth();
  noStroke();
  
  p = new Player(width/2, height/2);
}

void draw() {
  background(0);
  fill(255);
  noStroke();
  rect(0,0,250,250);

  p.move();
  p.display();
}


//--------------------------------------
//KEYBOARD INPUT

void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      p.moveLeft = true;
    } 
    else if (keyCode == RIGHT) {
      p.moveRight = true;
    } 
    else if (keyCode == UP) {
      p.moveUp = true;
    } 
    else if (keyCode == DOWN) {
      p.moveDown = true;
    }
  }
}

void keyReleased() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      p.moveLeft = false;
    } 
    else if (keyCode == RIGHT) {
      p.moveRight = false;
    } 
    else if (keyCode == UP) {
      p.moveUp = false;
    } 
    else if (keyCode == DOWN) {
      p.moveDown = false;
    }
  }
}



//--------------------------------------
//PLAYER CLASS

class Player {
  float xPos;
  float yPos;
  float speed = 2;
  boolean moveLeft, moveRight, moveUp, moveDown = false;

  Player(float x_in, float y_in) {
    xPos = x_in;
    yPos = y_in;
  }
  /////////////////////
  void display() {

    //red ball

    if (xPos <= mm & yPos <= nn) {
      fill(255, 0, 0);
      noStroke();
      ellipse(xPos-20, yPos-20, 30, 30);
      //head  
      fill(255,255,0);
      noStroke();
      strokeWeight(1);
      line(xPos-50, yPos, xPos, yPos);
      line(xPos, yPos, xPos-(60*cos(45)*cos(45)), yPos-(60*sin(45)*sin(45)));
      arc(xPos, yPos, 100, 100, - PI * 11/ 18, PI ); // lower quarter circle 
      fill(0);
      noStroke();
      ellipse(xPos+20, yPos-25, 25,25);
      stroke(0);
      strokeWeight(3);
      line(xPos+20, yPos-25,xPos+40, yPos+5);
      line(xPos+40, yPos+5,xPos+30, yPos+15);
      //body
      noFill();  
      stroke(random(255),random(255), random(255), 220);
      strokeWeight(10);  
      beginShape();
      curveVertex(xPos+37, yPos+37);
      curveVertex(xPos+37, yPos+37);
      curveVertex(280, 250);
      curveVertex(300, 300);
      curveVertex(300, 300);
      endShape();
    }

    else {
      fill(255, 0, 0);
      noStroke();
      ellipse(mm-20, nn-20, 30, 30);
      stroke(255, 0, 0);
      line(mm-20, 0, mm-20, nn-20);
      //body
      noFill();  
      stroke(255, 255, 0, 220);
      strokeWeight(10);  
      beginShape();
      curveVertex(xPos+5, yPos+5);
      curveVertex(xPos+5, yPos+5);
      curveVertex(280, 250);
      curveVertex(300, 300);
      curveVertex(300, 300);
      endShape();
      //head  
      fill(255, 255, 0);
      noStroke();
      strokeWeight(1);
      line(xPos-50, yPos, xPos, yPos);
      line(xPos, yPos, xPos-(60*cos(45)*cos(45)), yPos-(60*sin(45)*sin(45)));
      arc(xPos, yPos, 100, 100, - PI * 11/ 18, PI ); // lower quarter circle 
      fill(random(100), random(100), 0);
      noStroke();
      ellipse(xPos+20, yPos-25, random(15), random(15));
    }
  }
  // keyboard up down
  void move() {
    if (moveLeft) xPos -= speed;
    if (moveRight) xPos += speed;
    if (moveUp) yPos -= speed;
    if (moveDown) yPos += speed;
  }
}




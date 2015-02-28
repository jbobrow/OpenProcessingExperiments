
class Balloon {
  float x;
  float y;

  Balloon(float balloonX, float balloonY) {
    x = balloonX;
    y = balloonY;
  }

  void drawBalloon() {
    pushMatrix();
    translate(x, y);

    pushMatrix();
    translate(-360, -250);

    //balloon
    fill(random(100,125), 175, random(97,110));                            
    ellipse(360, 180, 275, 275);    
    noFill();                          
    arc(410, 180, 300, 300, radians(115), radians(245));
    arc(310, 180, 300, 300, radians(295), radians(425));  
    arc(225, 180, 385, 385, radians(315), radians(405)); 
    arc(495, 180, 385, 385, radians(135), radians(225)); 
    line(360, 42, 360, 317);

    //flags
    fill(175, 97, 97);                             
    triangle(223, 180, 260, 180, 240, 205);        
    fill(131, 97, 175);                                
    triangle(260, 180, 302, 180, 280, 205);         
    fill(97, 120, 175);                          
    triangle(302, 180, 360, 180, 330, 205);       
    fill(97, 175, 168);                                 
    triangle(360, 180, 418, 180, 390, 205);          
    fill(174, 175, 97);                               
    triangle(418, 180, 460, 180, 440, 205);            
    fill(196, 155, 105);                               
    triangle(460, 180, 497, 180, 480, 205);            

    // rope
    strokeWeight(3);
    line(327, 312, 300, 480);
    line(393, 312, 420, 480); 
    line(347, 312, 345, 500); 
    line(373, 312, 375, 500);

    popMatrix();
    popMatrix();
  }

  void update() {
    x = mouseX;
    y = mouseY;
  }
}

void drawAT(float x, float y) {

  strokeWeight(1);
  fill(random(135, 175), random(102, 132), random(205, 255));

  pushMatrix();
  translate(x, y);

  pushMatrix();
  translate(-100, 200);

  pushMatrix();
  scale(1);
  translate(30, 30);

  pushMatrix();
  rotate(radians(30));
  rect(0, 0, 10, 60);
  popMatrix();

  pushMatrix();
  rotate(radians(-30));
  rect(0, 0, 10, 60);
  popMatrix();

  rect(-15, 30, 40, 10);

  popMatrix();

  pushMatrix();
  translate(130, 50);

  rect(-50, 0, 50, 10);
  rect(-30, -20, 10, 50);

  popMatrix();

  pushMatrix();
  translate(140, 25);

  rect(0, 0, 60, 10);
  rect(25, 0, 10, 60);

  popMatrix();

  popMatrix();

  popMatrix();
}

Balloon myBalloon;

void setup() {
  size(500, 500);
  background(255);
  myBalloon = new Balloon(mouseX, mouseY);
}

void draw() {

  background(255);

  drawAT(mouseX, mouseY);

  myBalloon.update();
  myBalloon.drawBalloon();
}


int circleSize = 2;
int circleX = 200;
int circleX2 = 0;
int circleY = 100;
int circleY2 = 200;
int circleY3 = 300;
int ellipseX = 100;
int ellipseX2 = 200;
int ellipseX3 = 300;
int ellipseY = 0;

void setup() {
  size(400,400);
  frameRate(2);
}

void draw() {
 background(random(255),random(255),random(255));
 //background changes color
 
 noStroke();
 fill(150,50,150,150);
 ellipse(circleX,circleY2,circleSize*10,circleSize*10);
 circleSize++;
 smooth(); 
 //circle grows
 
 fill(50,200,200,200);
 triangle((random(0,400)),(random(0,400)),(random(0,400)),(random(0,400)),(random(0,400)),(random(0,400))); 
 //triangle moves and changes shape
 
 fill(250,50,50,150);
 quad((random(0,200)),(random(0,200)),(random(200,400)),(random(0,200)),(random(200,400)),(random(200,400)),(random(0,200)),(random(200,400)));
 //quad moves and changes shape
 
 strokeWeight(15);
 stroke(255,150);
 line(0,(random(0,400)),400,(random(0,400))); 
 //horizontal line moves 
 
 strokeWeight(50);
 stroke(255,100);
 line(0,(random(175,225)),400,(random(175,255))); 
 //horizontal line2 moves 
 
 strokeWeight(1);
 stroke(255);
 line(0,(random(0,400)),400,(random(0,400))); 
 //horizontal line3 moves 
 
 strokeWeight(15);
 stroke(255,150);
 line((random(0,400)),0,(random(0,400)),400); 
 //vertical line moves
 
 strokeWeight(50);
 stroke(255,100);
 line((random(175,225)),0,(random(175,225)),400); 
 //vertical line2 moves
 
 strokeWeight(1);
 stroke(255);
 line((random(0,400)),0,(random(0,400)),400); 
 //vertical line3 moves
 
 strokeWeight(10);
 stroke(255,150);
 line((random(0,400)),(random(0,400)),(random(0,400)),(random(0,400))); 
 //line moves and changes size
 
 strokeWeight(random(5,100));
 stroke((random(0,255)),(random(0,255)),(random(0,255)));
 point((random(5,395)),(random(5,395))); 
 //point moves,changes size, and changes color
 
 noStroke();
 fill(150,100,250,150);
 rectMode(CENTER);
 rect((random(50,350)),(random(50,350)),100,100); 
 //square moves
 
 fill(100,50,150,175);
 rectMode(CENTER);
 rect((random(25,375)),(random(25,375)),50,50); 
 //smaller square moves
 
 fill(200,150,100,200);
 rectMode(CENTER);
 rect((random(13,387)),(random(13,387)),25,25); 
 //smallest square moves
 
 circleX2 = constrain(circleX2,0,430);
 fill(50,200,100);
 ellipse(circleX2,circleY,50,50);
 circleX2 = circleX2 + 2;
 smooth(); 
 
 fill(50,200,100);
 ellipse(circleX2,circleY2,50,50);
 circleX2 = circleX2 + 2;
 smooth(); 
 
 fill(50,200,100);
 ellipse(circleX2,circleY3,50,50);
 circleX2 = circleX2 + 2;
 smooth(); 
 //circles moves across screen
 
 fill(150,50,150);
 ellipse(ellipseX,ellipseY,25,50);
 ellipseY = ellipseY + 2;
 smooth(); 
 
 fill(150,50,150);
 ellipse(ellipseX2,ellipseY,25,50);
 ellipseY = ellipseY + 2;
 smooth(); 
 
 fill(150,50,150);
 ellipse(ellipseX3,ellipseY,25,50);
 ellipseY = ellipseY + 2;
 smooth(); 
 //ellipses move down screen
}





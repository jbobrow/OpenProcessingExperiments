
//Setup backround to white, face to yellow, size of sketch.
float rX, rY;

void setup() {
frameRate(15);
  size(450,400);
  int value = 0;
 background(255);
 noStroke();
 fill(255,222,0);
 ellipse(225, 200, 375, 375);
 fill(0);
 
  
}

void draw() {
rX = random(-20, 20);
rY = random(-20, 20);
  //neutral expression
 if (keyPressed) {
   if (key == CODED) {
    if (keyCode == UP) 
     background(255);
      noStroke();
 fill(255,222,0);
 ellipse(rX+225, rY+200, 375, 375);
    fill(0);
    ellipse(rX+100,rY+150,25,25);
    ellipse(rX+350,rY+150,25,25);
arc(rX+225,rY+175,100,200,0,PI);
  fill(255,222,0);
   ellipse(rX+150,rY+150,25,60);
    ellipse(rX+300,rY+150,25,60);
    rect(rX+150, rY+350, 150, 8);
}
  } else {
    //happy expression
     background(255);
      noStroke();
 fill(255,222,0);
 ellipse(225, 200, 375, 375);
    fill(0);
    ellipse(150,150,25,60);
    ellipse(300,150,25,60);
    rect(150, 350, 150, 8);
    fill(255,222,0);
     ellipse(100,150,25,25);
    ellipse(350,150,25,25);
arc(225,175,100,200,0,PI);
  }
}

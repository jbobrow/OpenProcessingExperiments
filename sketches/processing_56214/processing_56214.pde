
color greenBlue = color(15, 121, 115,200);
color yellow = color(234, 247, 97, 200);
color mustard = color(157, 146, 24,200);
color brown = color(59,50, 5,200);
color mint = color(103, 237, 190, 200);

int value = (0);
float s = 0.0;
float i = 0.4;
float x;
float y;
float speed = 7;



void setup(){
  size(600,600);
  background(128);
  frameRate(30);
}
    void mousePressed() {
  x = mouseX;
  y = mouseY;
}



void draw(){
  rectOne();
  rectTwo();
  rectThree();
  rectFour();
  s = s + 0.04;
}


void rectOne(){
  pushMatrix();
  fill(greenBlue);
  //translate(width/2, height/2);
  rect(0,0,width,height);
  translate(width/2, height/2);
  popMatrix();

}

void rectTwo(){
  pushMatrix();
  fill(yellow);
  rect(80,160, width-150,height-180);
  translate(width/2, height/2);
  popMatrix();
}

void rectThree(){
  fill(mustard);
  scale(s); 
  rect(136, 255, width-267, height-300);
  translate(width/2, height/2);
}

void rectFour(){
  pushMatrix();
  fill(brown);
  scale(s*0.4); 
  stroke(133, 147, 142, 200);
  strokeWeight(3);
  rect(197, 330, width-390, height-400);
  translate(width/2, height/2);
  popMatrix();


if (mouseX < 300) {
    s = 0.0;
  }
  else if (mouseY > 300) {
    s = 0.0;
  }


   

}



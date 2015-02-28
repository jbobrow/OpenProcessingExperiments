
// Jenny McCarthy - recreating Georg Nees' Squares (2/22/14)

int columns = 15;
int rows = 24; 
int size = 25; //size of squares
float r = 0; //total rotation value
int margin = 50;
float v; //random value for translation and rotation

void setup(){
  size(500,700);
  background(255);
  noFill();
  rectMode(CENTER);
  noLoop();
}

void draw(){
  for(int y=1; y<=rows; y++){
    r =r+(y*0.25); //as y increases, the rotation value increases
    for(int x=1; x<=columns; x++){
      pushMatrix();
      v = random(-r,r);
      translate(margin+(x*size)+(v*.35),margin+(y*size)+(v*.35));
      rotate(radians(random(r))); //converts random rotation value r (degrees) into radians
      rect(0,0,size,size);
      popMatrix();
    }
  }
}




int columns = 15;
int size = 20;
int rows = 20; 
float r = 0; 
int margin = 60;
float v; 
 
void setup(){
  size(450,600);
  background(255);
  noFill();
  rectMode(CENTER);
  noLoop();
}
 
void draw(){
  for(int y=1; y<=rows; y++){
    r =r+(y*0.20); //
    for(int x=1; x<=columns; x++){
      pushMatrix();
      v = random(-r,r);
      translate(margin+(x*size)+(v*.35),margin+(y*size)+(v*.35));
      rotate(radians(random(r))); 
      rect(0,0,size,size);
      popMatrix();
    }
  }
}


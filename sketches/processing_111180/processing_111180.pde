
size(800,800);
background(255);

int xLoc = width/2; //loaction of origin
int yLoc = height/2;

float rotation = -HALF_PI;
int sides = 1;
int radius = width/2 -20;

beginShape ();
for (int i=0; i<width; i++){
  
  float theta;
  if (i%6==2||i%6==5){
  theta = i+TWO_PI/sides;
}
else{
  theta = i;
}
  
  float rf;  //radius factor
  if (i%2==1||i%4==3) {
    rf=0.5;
   }
  else {
    rf=1;
  }
  
  float x = rf*radius*cos(theta+rotation)+xLoc;
  float y = rf*radius*sin(theta+rotation)+yLoc;
  noFill();
  stroke(255,200,i);
  strokeWeight(1);
  //point(x, y);
  vertex(x, y);
}
  endShape();
  



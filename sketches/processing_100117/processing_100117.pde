
void setup(){
  size(500,500);
}

void tri ()
{
  frameRate(15);
 background(0,0,0); 
  float x=random(250);
  float y=random(500);
  float z=random(500);
  strokeWeight(40);
  stroke(x,x,x,x);
 triangle(150,350,250,150,350,350);

stroke(x,255,255);
strokeWeight(5);
line(x,y,250,250);

stroke(255,x,255);
line(250,250,500-x,z);

}

void draw(){
tri();
}




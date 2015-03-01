
void setup(){
  size(500,500);
  smooth();
  frameRate(30);
  float o=random(150,255);
  float j=random(150,255);
  float p=random(150,200);
  background(255);

}
 
void draw(){
  background(0);
  //eyeball
  fill(255); 
  ellipse(width/2,height/2,200,200);
  fill(0);

    //iris
  int x = constrain (mouseX, 200, 300);
 noStroke();
  ellipseMode(CENTER);
  ellipse(x,250,90,90);
  
  //eyelid
  rect(0,map(mouseY,0,height,100,135),width,height/6);
 
}

void mousePressed() //opens the eye
{
  frameRate(1);
  fill(255); 
 ellipse(width/2,height/2,200,200);  
 frameRate(2);
  noStroke();
 float o=random(255);
  float j=random(255);
  float p=random(255);

int x = constrain (mouseX, 200, 300);
 noStroke();
  ellipseMode(CENTER);
  fill(p,o,j)
 ellipse(mouseX,height/2,90,90);
  int x = constrain (mouseX, 200, 300);
 noStroke();
  ellipseMode(CENTER);
    fill(o,j,p);
 ellipse(mouseX,height/2,50,50);
 int x = constrain (mouseX, 200, 300);
 noStroke();
  ellipseMode(CENTER);
  fill(j,o,p)
 ellipse(mouseX,height/2,20,20);
}

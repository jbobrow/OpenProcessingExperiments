
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
 
    //normal iris
  int x = constrain (mouseX, 200, 200);
 normaleye (90,90);
 fill(0);
   
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
 for (int o=0; o<=100; o=o+10)
  {
     for (int j=100; j<=200; j=j+20)
     {
  float p=random(255);
 
int x = constrain (mouseX, 200, 300);
crazyeye(90,90);
  fill(p,o,j);
  int y = constrain (mouseX, 200, 300);
 crazyeye (50,50);
    fill(o,j,p);
 int z = constrain (mouseX, 200, 300);
crazyeye(20,20);
  fill(j,o,p);
}
  }
}
 void crazyeye (int x, int y){
 ellipse(mouseX,height/2,x,y);
 ellipseMode(CENTER);
 noStroke();
 }
 void normaleye (int x, int y){
    noStroke();
  ellipseMode(CENTER);
  ellipse(mouseX,250,x,y);
 }  
 

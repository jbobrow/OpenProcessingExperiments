
int myX;
int myY;
  
void setup()
{
  size(640, 360);
  background(0);
    myX=100;
    myY=100;   
}
 
void draw()
{
  myX=mouseX;
  myY=mouseY;
  frameRate(30);
  //fill(7,0,24,80); //causes a fading effect
  //rect(mouseX,mouseY,-130,100); //rectangle
  noStroke();
  if(mousePressed) {
fill(255,0,0,90); //red
    rect(myX-120,myY+28,150,10, pmouseX, pmouseY);
fill(255,128,0,90); //organge
    rect(myX-120,myY+35,150,10, pmouseX, pmouseY);
fill(255,255,0,90); //yellow
    rect(myX-120,myY+42,150,10, pmouseX, pmouseY);
fill(44,222,0,90); //green
    rect(myX-120,myY+48,150,10, pmouseX, pmouseY);
fill(104,65,252,90); //blue
    rect(myX-120,myY+55,150,10, pmouseX, pmouseY);
fill(64,20,105,90); //indigo
    rect(myX-120,myY+62,150,10, pmouseX, pmouseY);
  }
}   
   

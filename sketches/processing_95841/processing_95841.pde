
Cloud myCloud;


void setup() {
  size(400,400);
  smooth();
  myCloud= new Cloud();
}

void draw() {
  background(162,221,250);
  ellipseMode(CENTER);
  myCloud.move();
  myCloud.display();
  
  
  //foot
  stroke(0);
  fill(10);
  ellipse(mouseX+35,mouseY+45,45,20);
  
  fill(0);
  ellipse(mouseX-35,mouseY+45,45,20);
  //toy
  
  stroke(0);
  fill(35,193,97);
  ellipse(mouseX,mouseY,100,100);
  //eyes
  fill(21,211,227);
  ellipse(mouseX-25,mouseY-35, 40, 40);
 
  fill(21,211,227);
  ellipse(mouseX+25,mouseY-35,40,40);
  
  fill(237,230,10);
  ellipse(mouseX-30,mouseY-45,20,20);
  
  fill(237,230,10);
  ellipse(mouseX+20,mouseY-45,20,20);
  //mouth
  fill(93,7,7);
  ellipse(mouseX,mouseY+25,60,40);
  
  //sun
  stroke(1000);
  fill(252,222,110);
  ellipse(40,35, 150,150);
  fill(250,213,78);
  ellipse(40,35,120,120);
  fill(250,202,25);
  ellipse(40,35,80,80);
}
class Cloud{
  color c;
  float xpos;
  float ypos;
  float xspeed;
  
  Cloud() {
    c=color(255);
    xpos=width/2;
    ypos=height/2;
    xspeed=1;
  }
  void display(){
    ellipseMode(CENTER);
    stroke(1000);
    fill(c);
    ellipse(xpos-150,ypos-150,50,30);
    ellipse(xpos,ypos-170,40,30);
    ellipse(xpos-200,ypos-120,60,40);
  }
  void move(){
    xpos=xpos+xspeed;
    if (xpos>width){
    }
  }
}
  


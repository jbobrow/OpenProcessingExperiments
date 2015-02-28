
float tetha= 1; 
float speed=1;
float x1= 10;
float y1= 10;
float r=10; 
float xp= r*cos(tetha)/50;
float yp= r*sin(tetha)/50;
float ran = random(1,100);

void setup(){
  size(500,500);
  smooth();
  background(0);
}

void draw(){
 
noFill();
strokeWeight(1);
stroke(255);

  if(mousePressed)
  {
     float ran = random(75);
  ellipse(mouseX+xp,mouseY+yp,ran,ran);
  }
  
  
}
  void keyPressed() 
{

     if (key == 'r') {
    fill(0);
        rect(0,0,500,500);
    }

}

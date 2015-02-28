
void setup() {
  size(500,300);
  background(0);
  stroke(18,189,205);
  strokeWeight(1);
  line(0,50,500,50);
  line(0,100,500,100);
  line(0,150,500,150);
  line(0,200,500,200);
  line(0,250,500,250);
  
  line(50,0,50,300);
  line(100,0,100,300);
  line(150,0,150,300);
  line(200,0,200,300);
  line(250,0,250,300);
  line(300,0,300,300);
  line(350,0,350,300);
  line(400,0,400,300);
  line(450,0,450,300);
  smooth();
}
 

 
 
void draw() {
 
  
  
  if (mousePressed==true && (mouseButton == LEFT) )
{
 
  strokeWeight(2);
  stroke (255,215,139);
  point(mouseX--, mouseY++);
  }
  else if (mousePressed && (mouseButton == RIGHT)) 
{
   
   strokeWeight(2);
   stroke (255,215,139);
   point(mouseX, mouseY++);
  }

 
    }
 

 

  


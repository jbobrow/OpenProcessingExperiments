
//Samyukta Madhu
//Febuary 23rd, 2013
//Creative Computing
//Assignment- Moving Objects




float a;
int speed=15;
float b =150;
float c = 7;    
float incr = 0.002;
int d=1;
  
void setup()
{
  size(800, 800);
  smooth();
  noStroke();
  ellipseMode(CENTER);
  
}
  
void draw()
{
  background(0);
  translate(width/2, height/2);
  
  a += incr;
  for(int s = 0; s < speed; s++)
  {
    fill(190,19,229,30);
    if(mousePressed==true){
      fill(132,247,10,30);
    }
    
    rotate(a);
    ellipse(mouseX-100,
   
    mouseY-400,
    mouseX+400,
    
    mouseY+100);
  }
}


void setup() 
{
  size(800, 600);
  background(75,75,75);
//background(One number <= 255) gives grayscale  
  
  strokeWeight(2);
  fill(170,220,135,130);
//4th fill argument is opacity
}

void draw() 
{ 
    stroke(75,75,255);
    triangle(10,10,10,120,50,10);
//coordinates
    
    stroke(255,75,75);
    rect(100,10,60,60);
//coordinates,length, height

    stroke(75,255,75);
    quad(70,20,30,130,30,180,70,220);
//coordinates

    point(165,165);
    
    stroke(255,255,255);
    line(160,100,160,150);
//coordinates
    
    stroke(255,0,0);
    bezier(300,300,490,530,570,250,560,500);
}

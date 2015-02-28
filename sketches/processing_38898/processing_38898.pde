
void setup()
{
   size(1024, 768);
   stroke(255);
   background(192, 64, 0);
   
  // PFont font;
//  font = loadFont("FFScala-Bold-12.vlw"); 
 // textFont(font); 
  String s = "Give the Mouse buttons a try";
  text(s, height/10, width/10, 150, 150);
} 

void draw() 
{
    if (mousePressed && (mouseButton == LEFT))
    {
       ellipse(mouseX, mouseY,random(width/4), random(height/4));
       stroke(random(255),random(255),random(255));
       fill(random(255),random(255),random(255));
    }
    else if(mousePressed && (mouseButton == RIGHT))
    {  
       line(random(width), random(height), mouseX, mouseY);
       stroke(random(255),random(255),random(255));
       
    }
    else
    {
       ellipse(width/2, height/2,mouseX*2, mouseY*2);
       stroke(random(255),random(255),random(255));
       fill(random(255),random(255),random(255));
    }
}


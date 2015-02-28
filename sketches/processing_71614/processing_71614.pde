
//homework 5
//Emily Wobb, ewobb, copyright wobb, Pittsburgh

PImage truck;
float d;



void setup()
{
 size(400, 400);
 smooth();
 truck = loadImage("monstertruck.jpg");
 d = 0;
 imageMode(CENTER);
}

void draw()
{
  translate(width/2,height/2);
  rotate(radians(d));
  image(truck, mouseX - width/2, mouseY - height/2);
  
  if (mousePressed)
  {
      if(mouseButton == RIGHT)
       {
            d++;
       }
       else
       {
         d--;
         
       }
  }

}

void keyReleased()
{
  if (key==' ')
  
  background( random(255), random(255), random(255));
}




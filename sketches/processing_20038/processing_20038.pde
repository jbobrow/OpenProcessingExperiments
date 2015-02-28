
float easing = 0.1;
float speed = 0.0;
float x = 0;
float xA = 1024;
int counter = 0;
int counterReset = 0;
int bgReset = 0;

void setup()
{
  size(1024, 500);
  background(0);
  smooth();
  
}

void draw()
{
  background(0);
//   noFill();
//   stroke(39,232,48, 3);  
//   line(0,0, mouseX, mouseY);
//   line(0, height, mouseX, mouseY);
   stroke(39,232,244, 3);  
//   line(width,0, mouseX, mouseY);
//   line(width, height, mouseX, mouseY);
 
   
   
   
   
 
  float target = dist(mouseX, mouseY, pmouseX, pmouseY);
  speed += (target-speed) * easing;
  
  float d = speed *5;
  
   
   for(int y = 20; y <= height -20; y+= 50)
   {
      for (int x = 20; x <= width -20; x += 50)
      {
        //rotate(1);
        strokeWeight(1);
        stroke(39,232,244, 100); 
        ellipse(x,y,d,d);
        
        fill(39,232,48, 15);
        strokeWeight(3);
        stroke(15,255,152, 100); 
        ellipse(x+25,y+25,d/2,d/2);

      }
    }
   
  
  
  //ellipse(width/2, height/2, d,d);
 
   strokeWeight(3*d/2);
   stroke(235,43,15, 100);   
   //fill(235,43,15,20);
   fill(255, 0);
 
   ellipse(mouseX+30+cos(d), mouseY+50+sin(d), d+20, d+20);
   ellipse(mouseX+80+cos(d), mouseY+10+sin(d), d+20, d+20);
   ellipse(mouseX-10+cos(d), mouseY+20+sin(d), d+40, d+40);
   ellipse(mouseX-50+cos(d), mouseY-50+sin(d), d+80, d+80);
   ellipse(mouseX+50+cos(d), mouseY+50+sin(d), d+80, d+80);
   ellipse(mouseX-10+cos(d), mouseY-50+sin(d), d+20, d+20);
   ellipse(mouseX+60+cos(d), mouseY-70+sin(d), d+20, d+20);//top right   
   ellipse(mouseX+70+cos(d), mouseY+70+sin(d), d+20, d+20);   
   ellipse(mouseX+cos(d), mouseY+110+sin(d), d+20, d+20);   
   ellipse(mouseX-60+cos(d), mouseY+60+sin(d), d+35, d+35); 
   ellipse(mouseX-12+cos(d), mouseY+47+sin(d), d+10, d+10);  
   ellipse(mouseX-12+cos(d), mouseY+10+sin(d), d+20, d+20);     
}



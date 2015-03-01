
Bubble b;
color c;

void setup(){
  size(700, 700);
 
  noStroke();
  background(0,160,230);
  b= new Bubble(150,50,8,4);
  c=color(random(255),random(255),random(255));
  


}

 
void draw()
{

  stroke(255);
  noFill();
  translate(width/2, height/2);
  background(0,160,230);
   

  
 
   for(int i = 0; i < 700; i+=3)
  {
    float n = sin(radians(i));
    float x = sin(radians(i+frameCount*(n*2)))*(i/( noise(i/12)*10));
    float y = cos(radians(i+frameCount*(n*2)))*(i/( noise(i/12)*10));
    ellipse(x, y, noise(i)*10 , noise(i)*10);
    
   
    
  }
}

void mouseClicked()
{
  b.drawBubble();
}


class Bubble

{
  float xpos;
  float ypos;
  float xvel;
  float yvel;
  float size;

  
   Bubble(float x, float y, float xv, float yv)
  {
    xpos = x;
    ypos = y;
    xvel = xv;
    yvel = yv;
    size = 20;

  }
  void drawBubble()
  {
    
    
    ellipse(xpos,ypos,size,size);
    noFill();
    stroke(0);
  }

}


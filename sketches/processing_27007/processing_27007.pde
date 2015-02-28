
import ddf.minim.*;

ArrayList creatures;
float Csize = 80;

Minim minim;
AudioPlayer pop;
AudioPlayer boing;


void setup()
{
  size(500,500);
  smooth();

  minim = new Minim(this);
    pop= minim.loadFile("Balloon Popping.wav");
     boing= minim.loadFile("boing.wav");

creatures=new ArrayList();

//creatures.add(new Kreature()*****;

}


void draw()
{
  background(255);
  
  for(int i=creatures.size()-1; i >=0; i--)
  {
    Kreature creature_ = (Kreature) creatures.get(i);
    creature_.move();
    creature_.display();
    
    if (creature_.finished())
    {
      pop.loop(0);
      creatures.remove(i);
      
    }
  }
}

void mousePressed()
{
  creatures.add(new Kreature(mouseX,mouseY,Csize));
}

class Kreature
{
  float x;
  float y;
  float speed;
  float gravity;
  float w;
  float life=255;
  
  Kreature(float X_, float Y_, float W_)
  {
    x= X_;
    y= Y_;
    w= W_;
    gravity= 0.1;
  }
  
  void move()
  {
    speed += gravity;
    y += speed;
    if(y> height)
    {
      speed= speed *-0.8;
      y= height;
      boing.loop(0);
    }
  }
  
  boolean finished()
  {
    life--;
    if(life< 0)
    {
      return true;
    }
    else
    {
      return false;
    }
  }
  
 void display()
{
  fill(0,0,255,life);
  ellipse(x,y,w,w);
 fill(255);
  ellipse(x-20,y,40,40);
   ellipse(x+20,y,40,40);
    fill(0);
   ellipse(x-20,y,10,10);
   ellipse(x+20,y,10,10);
   strokeWeight(2);
   line(x-25,y+30,x+15,y+25);
}

     
}   
  
  void stop()
{
    pop.close();
    boing.close();
    minim.stop();
    super.stop();
}
    
    


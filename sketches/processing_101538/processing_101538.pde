
PFont font;
PImage [] img;
void setup()
{
  size(640,480);  
  noStroke();
  imageMode(CENTER);
  img = loadImages("images/target-",".png",77);
  font = loadFont("UbuntuMono-Italic-17.vlw");
  textFont(font,20);
}
float r, g, b,rad,op=255.0,speed;
float a=1.0;
float x,y,ang=0,ang1;
float currentfr=0;
void draw()
{
   fill(0);
  boolean transp = true;
  r=map(mouseX,0,width/2,40,200);
  g=map(mouseY,0,height/2,40,200);
  b=map(mouseX+mouseY,0,width+height,40,200);
  op=map(dist(pmouseX,pmouseY,mouseX,mouseY),0,100,0,255);
  fill(255,op);
  text("R : Reset",25,360);
  text("I/D : Increase/Decrease radius", 25, 400);
  rectMode(CENTER);
  float imgop = currentfr;
  if(mousePressed)
  {
    tint(255,imgop);
    image(img[floor(currentfr)],width/2,height/2,width,height);
    currentfr=currentfr + 0.3;
    if(transp)
    { imgop+=40;
    }
    if(currentfr>=77)
    {
      transp = false;
      currentfr=0;
    }
   }
  
  if(mousePressed==false)
  {  
    fill(230,3);
  rect(width/2,height/2,width,height);
  fill(r,g,b);
  rad = (map((mouseX-width/2)*(mouseY-height/2),0,8000,10,60))*a;
  ellipse(mouseX,mouseY,rad,rad);
   }
}


void keyPressed()
{
  if (key=='r')
  {
   fill(0,op);
  rect(width/2,height/2,width,height);
  }
  else
    if(key=='i')
    { a+=0.5;
    }
  else
    if(key=='d')
    { if(a==0.5)
      return;
      a-=0.5;
    }
}
PImage [] loadImages(String name, String ext, int num)
{
  PImage [] room1 = new PImage[0];
  PImage img1;
  for(int i=0; i<=num;i++)
  { 
    
    img1 = loadImage(name+i+ext);
    
    if(img1 != null)
    {
      room1 = (PImage [])append(room1,img1);
    }
    else
    { break;
    }
  }
    return room1;
}




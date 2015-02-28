
PImage img;
int x,y,z,index,a;
boolean clear,repeat;
void setup()
{
  size(800,400); 
  img = loadImage("heightmap.jpg");
  repeat = true;
}
void keyPressed()
{
  if(key == 'q'){a = 255;} 
  if(key == 'a'){a = 0;} 
  if(key == 'w'){clear = true;}
  if(key == 's'){clear = false;}
  if(key == 'd'){repeat = false;}   
  if(key == 'e'){repeat = true;}
}
void draw()
{
  if(clear){background(255);}
  if(index>=img.height){index=0;}
  image(img,width/2,0);
  
  fill(color(255,255,255,0));
  //---
  beginShape();
  vertex(0,height);
  for(x=0;x<width/2;x++)
  {
    for(y=0;y<height;y++)
    {
       z=(int)red(img.get(x,index));
    }
    vertex(x,-z+height*0.9);
    stroke(color(img.get(x,index)));
    line(x,height,x,-z+height*0.9);
    stroke(color(255,0,0,a));
  }
  vertex(width/2,height);
  endShape(CLOSE);
  //---
  stroke(color(0,255,0)); strokeWeight(1);
  
  line(width/2,index,width,index);
  if(repeat){index++;}
  else{index=mouseY;}
}


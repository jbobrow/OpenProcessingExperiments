
import ddf.minim.*;
 
Minim minim;
AudioPlayer bali;
AudioPlayer lark;
 

void setup()
{
size(500, 500);
smooth();
background(0);
colorMode(HSB);
minim = new Minim(this);

bali = minim.loadFile("bali.wav");
lark = minim.loadFile("lark.wav");


  
  
}

void draw()

{

if (frameCount % 1000 == 999)
background(0);

if (mousePressed) 

{

stroke(random(255),random(255),random(255));
strokeWeight (random(10));
line (mouseX, mouseY, mouseX, mouseY);
noStroke();


if (mousePressed && (mouseButton == LEFT))

{

stroke(random(255),255,255);
strokeWeight (random(10));
line (mouseX, mouseY, mouseX, mouseY);
noStroke();

}

}
else
strokeWeight(random(10))
;
line (mouseX,mouseY, mouseX, mouseY);
stroke(255, 0,255) ;





}

void mousePressed(){
  if (mouseButton == RIGHT)
{ bali.loop(); 
}

  if (mouseButton == LEFT)
  
  
  {lark.loop ();
  }

  

}

void mouseReleased() {
  if (mouseButton ==RIGHT)
  {bali.pause ();}
  if (mouseButton == LEFT)
  {lark.pause ();}
  
}

void stop()
{
  
  bali.close();
 lark.close();
  minim.stop();
 super.stop();
}


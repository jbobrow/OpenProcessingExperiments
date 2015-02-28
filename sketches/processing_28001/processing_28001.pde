
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

if (frameCount % 1500 == 1499)
background(0);

if (mousePressed)

{
//colour dots draw code
stroke(random(255),255,255);
strokeWeight (random(10));
line (mouseX, mouseY, mouseX, mouseY);
noStroke();


if (mousePressed && (mouseButton == RIGHT))

{
//triangle draw code
stroke(random(255),random(255),random(255));
triangle (mouseX, mouseY, mouseX+0.5, mouseY-1, mouseX+1, mouseY);
noStroke();

}

}
//white dots draw code
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


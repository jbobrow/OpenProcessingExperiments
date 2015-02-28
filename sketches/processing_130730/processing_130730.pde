
//credits
//http://forum.processing.org/one/topic/rotate-triangle-around-own-axis.html


float r; //brush rotate
float s; //brush scale
color brushColor;
float counter; //rotation thing, (counter*TWO_PI/360)
PImage CW;
float t;








void setup()
{
  size(900,900);
  background(255,255,255,255);
  colorMode(HSB);
frameRate(30);

s = 0.5;

r = 0;

CW = loadImage("ColorWheel-Base.png");
}



void draw()
{
  imageMode(CORNER);
image (CW, 0,0);

  if (mouseButton == LEFT)
  {
    noStroke();
    fill(brushColor);
    pushMatrix();
    translate(mouseX,mouseY);
    rotate(r);
    scale(s);
    triangle(30,0,0,30,-30,0);
  
    
  popMatrix();
  }
//if (keyPressed == )
//{
//(0,0,0,0);
//stroke(random(255),random(255),random(255),random(255));
//}

//}//Left MB command end

if(mouseButton ==RIGHT)
{
 noStroke();  
  fill(brushColor);
  pushMatrix();
  translate(mouseX,mouseY);
  scale(s);
  ellipse(0,0,30,30);
  popMatrix();
}//Right RB command end

if(mouseButton ==CENTER)
{ 
  noStroke();
  fill(brushColor);
 
 pushMatrix();
  translate(mouseX,mouseY);
  scale(s);
   rotate(r);
    rectMode(CENTER);
rect(0,0,100,100);

popMatrix();


}//Center MB command end

}//void draw end


void keyPressed(){
 if(key ==CODED){
   if(keyCode ==UP){
     s = s+0.1;
   }
 }
if(keyCode ==DOWN){
  s = s-0.1;
}
if(keyCode ==RIGHT){
  r = r+0.1;
}
if (keyCode==LEFT){
  r = r-0.1;
}

if(keyCode ==CONTROL){
filter(INVERT);
}
if (keyCode == SHIFT){
  brushColor = get(mouseX,mouseY);
}


}

  



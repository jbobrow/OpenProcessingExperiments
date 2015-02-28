
PImage ennui;
PImage me;
void setup(){
size(800, 600);
smooth();
background(208,80,84);

}
void draw(){
background(0);
ennui = loadImage("ennui2.jpg");
me = loadImage("me.jpg");
strokeWeight(.7); 
stroke(108,14,11);
for(int y = 0; y < 600; y +=20){ 
for (int x = 0; x < 800; x +=25){ 
fill(random(255),0,0);
rect(x,random(y),random(20),random(20));
noFill();
ellipse(x,y,random(150),random(200));

float currentTime = millis() / 1000.0;
noStroke();
if(currentTime<1)
{
  image(ennui,200,200);
}
if(currentTime>1 && currentTime<8)
{
  image(ennui,200,200);
}
if(currentTime>8 && currentTime<20)
{
  image(me,0,0);
}
}
}
}


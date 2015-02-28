
PImage picture;
void setup(){
size(682,383);
picture=loadImage("Ian.jpg");}
void draw(){
image(picture,0,0);
picture. resize(682,383);
filter(GRAY);
noStroke();

for (int i = 1; i<80; i++)
{
  fill(i*2,i*2,i*2,7);
  ellipse(10*i, 376-(2*i), 55+i*10, 255+i*1);
}
}



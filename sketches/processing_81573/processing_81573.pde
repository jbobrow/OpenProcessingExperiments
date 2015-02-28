
PImage img;
PImage bg;
PFont font;
char[] charArr = {'p', 'e', 'r', 'f', 'u', 'm', 'e' };//defining chars
void setup()
{
size(550, 550);
smooth();
bg = loadImage("chloe.jpg");
font= loadFont("Bodoni-PosterItalic-12.vlw");

}
  
void draw()
{
  background(bg);
  if(mousePressed){// spray letters
  strokeWeight (1);
  for(int i=1;i<random(5000);i+=1){
  stroke(#FFFAD1);
  fill(int(#FFFAD1),int(i));
  textFont(font,8);
  text(charArr[int(random(0,7))],random(2*i-i+270,2*i), random(2*i-i+100,2*i));

 }
  }}



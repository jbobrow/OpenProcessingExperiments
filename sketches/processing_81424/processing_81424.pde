
PFont font;
PImage img;
char[] charArr = {'m', '6', 'L', 'm', 'r', '3'};//defining chars
void setup()
{
size(500, 500);
img = loadImage("tv.png");
font= loadFont("DecoTypeNaskh-48.vlw");
}
  
void draw()
{
  background(0);
  image(img,0,0);
  if(mousePressed){// spray letters
  strokeWeight (1);
  for(int i=5;i<random(2000);i+=1){
  fill(int(random(100,200)),int(i));
  textFont(font,15);
  text(charArr[int(random(0,6))],random(2*i-i+5,2*i), random(5*i-i+10,2*i));
 }
  }

  strokeWeight(2);
  stroke(#ff80c0);
}






PFont font;
char[] charArr = {'m', '6', 'L', 'm', 'r', '3'};//defining chars
void setup()
{
size(250, 250);
background(#ffe2fb);
smooth();
font= loadFont("Gulim-48.vlw");
}
 
void draw()
{
  if(mousePressed){// spray letters
  strokeWeight (1);
  for(int i=0;i<random(2000);i+=1){
  stroke(255);
  fill(int(random(100,200)),int(i));
  textFont(font,10);
  text(charArr[int(random(0,6))],random(2*i-i+5,2*i), random(2*i-i+10,2*i));
 }
  }
  for(int a=40; a>0;a-=10)// the pink button
{ 
  strokeWeight(2); 
  stroke(#ff80c0);
  ellipse(0,0,a,a);}
}



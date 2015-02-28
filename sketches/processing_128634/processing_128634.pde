
starrlen = 3;
String[] starr = {
  "skip, hop, jump!",
  "funiculars are fun!",
  "who wants pancakes?"
  };
  
int i=0;

void setup()
{
  frameRate(1);
  size(200,50);
}

void draw()
{
  background(150);
  fill(0);
  text(i + " " + starr[i],10,height/2); 
  println(i + " " + starr[i]);
  i++;
  if( i == starrlen ) i = 0;
}


//Setpember 10 
//homework 4
//Shanna Chan 

float x, y, wd, ht; 

void setup ( )
{
  size (400,400); 
  fill (167); 
  x= width*.5;
  y=height*.5;
  textSize(10);
  background (251,237,255);
//String s = "TYPE A MESSAGE";
//float sw = textWidth(s);
//text(s, 0, 40);




}
void draw ()
{
String s = "TYPE A MESSAGE";
float sw = textWidth(s);
text(s, 0, 40);
 if (mousePressed == true) {
colorMode(HSB,360,100,100,100);
background(random(360),20,99,10);
}
}
void keyPressed( )

{
  fill(251,237,255,10);
  rect(0,0,400,400);
  noStroke();
  if ( key == CODED )
    if(keyCode == UP)
    {
      key=' ';
      y = y - 5;
    }
    else if (keyCode == DOWN)
    {
      key=' ';
      y = y + 5;
    }
    else if(keyCode == LEFT)
    {
      key=' ';
      x = x - 5;
    }
    else if(keyCode == RIGHT){
      key=' ';
      x = x + 5;
    }
    fill (153);
  
if (key!='a');

else {
  fill (255,126,126);
  
}

char ch=key;
float sw=textWidth(ch);

text(key,x-150,y);
x=x+sw;





}





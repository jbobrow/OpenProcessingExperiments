
String myString= "";

void setup()
{
 size(400,400);
 background(255);
}

void draw()
{
fill(0);  
text(myString,10,15);
}

void keyTyped()
{
  myString=myString + key;
}





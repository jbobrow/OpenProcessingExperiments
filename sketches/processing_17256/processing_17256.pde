
float x = random(50);
float y = random(360);
int numArray = 10;
int i = 0;
int j = 0;
int k = 0;
float w2 = width/2;
float h2 = height/2;
void setup()
{
size (550,500);
PFont theFont;
theFont = loadFont("DialogInput.bold-50.vlw"); 
textFont(theFont);
background(0,0,0);
}

void draw()
{
  fill(255);
 // smooth();
  char ttt[] = {'H','E','L','L','O','W','O','R','L','D'};
 // text ("Welcome World");
    stroke(0,255,0,155);
    strokeWeight(1);
    line(width/2,height/2,j,k);
    j = j + 20;
    k = k + 25;
if(keyPressed == true && i < numArray)
  {
    fill(0,255,0);
    text(ttt[i],58*i,height/2 );
    textSize(50);
    delay(50);
    i++; 
  }
  else if (i == numArray )
  {
    i = 0;
   noStroke();
  }

 noStroke();
 fill(0, 0, 0, 5);
 rect(0, 0, width, height);
}



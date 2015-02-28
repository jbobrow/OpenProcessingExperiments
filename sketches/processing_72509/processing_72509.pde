
//L:ucky Lui Computer Prog 1 mods(14-15)
//Tickling Penguin
int x=100;
int y=300;
void setup()
{
 
  size(600,600);
}
void draw()
{
   fill(0,0,0,10);
  rect(0,0,600,600);
  fill(2,277,30);
  stroke(2,277,30);

  //body,head
  ellipse(x,y,100,100);
  ellipse(x+75,y-10,100,100);
  ellipse(x+150,y,100,100);
  ellipse(x+225,y-10,100,100);
  ellipse(x+300,y,100,100);
  ellipse(x+375,y-10,125,125);
  //spots
  fill(250,15,15);
  ellipse(x,y,25,25);
  ellipse(x+75,y-10,25,25);
  ellipse(x+150,y,25,25);
  ellipse(x+225,y-10,25,25);
  ellipse(x+300,y,25,25);
  //eyes
  stroke(0);
  fill(255);
  ellipse(x+370,y-30,15,15);
  ellipse(x+390,y-30,15,15);
  fill(0);
  ellipse(x+370,y-30,5,5);
  ellipse(x+390,y-30,5,5); 
  //mouth
  ellipse(x+380,y+10,50,50);
  fill(247,0,45);
   stroke(247,0,45);
  ellipse(x+380,y+25,40,18); 
  
  if (mousePressed==true && mouseButton==LEFT)
  {
  x=x+int(random(-2,2));
  y=y+int(random(-2,2));
  }
}

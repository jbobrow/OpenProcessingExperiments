
//Derek King, Eight Ball, CP1 mods 14-15
//http://dereklucca.webs.com/Eight Ball.html

String [] answers = {"I love Preston","Derek is great","Definite no","Yes","No","I could care less","(:","Ask somebody else", "My guees is no","Annoying question..","Deuces?","Stupid question","Try again later"};
boolean mode=true;
boolean click=true;
int z=0;
int r=0;
void setup()
{
  size(300,325);
}
void draw()
{
  background(255);
  fill(255);
  rect(0,278,300,47);
  fill(0);
  ellipse(150,150,250,250);
  if (mode==true)
  {
    fill(0);
    textAlign(CENTER);
    text("Ask me a yes/no question. Right click for an answer.",150,290);
    fill(255);
    noStroke();
    ellipse(150,75,70,65);
    noFill();
    stroke(10);
    ellipse(150,57,30,25);
    ellipse(150,84,40,30);
     
  }
  while(z<1)
  {
   z=z+1;
   r=int(random(-1,10));
  }
  if (mode==false)
  {
    fill(0);
    textAlign(CENTER);
    text("Right click to reset.",150,290);
    fill(237,74,210,185);
    triangle(65,120,235,120,150,220);
    fill(255);
    textAlign(CENTER,CENTER);
    text(answers[r],150,135);
     
     
  }
}
void mousePressed()
{
  if(mouseButton==LEFT && click==true)
  {
    mode=false;
    click=false;
    z=0;
  }
  else if (mouseButton==LEFT && click==false)
  {
    mode=true;
    click=true;
  }
}

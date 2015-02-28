
void setup()
{
  size(500,500);
  background(255);
  smooth();
}
void draw()
{
  background(255);
  randomSeed(mouseX);
  rectMode(CENTER);
  for(int i=0; i<=(width); i=i+50) //bleibt stehen
  {
     for(int j=0;j<=(height);j=j+20)
     {
       
      //noStroke();
      //fill(255,0,0);
     // rect(i,25,15,15);
   
    noStroke();
    fill(0,i,j);
    rect(i,j,15,15);
   
  }
}
for(int i=25; i<=(width-25); i=i+50)
  {
     for(int j=0;j<=(height);j=j+20)
     {
       
      //noStroke();
      //fill(255,0,0);
     // rect(i,25,15,15);
   
    noStroke();
    fill(0,j,i);
    rect(i,j,random(0,20),random(0,20)); //bewegt sich
   
  }
}
}


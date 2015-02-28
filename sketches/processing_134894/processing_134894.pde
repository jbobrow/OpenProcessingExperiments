
void setup()
{
size(400,600);
noStroke();
fill(0);
}
void draw(){
background(0);
fill(255);//box
rectMode(CENTER);
rect(200,300,150,300);
stroke(0);
rect(200,300,100,200);
rect(200,300,50,10);
if(mouseY<200)//on
{
  rectMode(CORNERS);
  noStroke();
  fill(255,255,0);
  rect(0,0,400,600);
  fill(255);//box
  stroke(0);
rectMode(CENTER);
rect(200,300,150,300);
stroke(0);
rectMode(CENTER);
rect(200,300,100,200);
rect(200,300,50,10);
rectMode(CORNERS);
rect(180,300,220,180);
}
else
{
  fill(255);//box
rectMode(CENTER);
rect(200,300,150,300);
stroke(0);
rect(200,300,100,200);
rect(200,300,50,10);
  rectMode(CORNERS);//off
  rect(180,300,220,420);
}
}





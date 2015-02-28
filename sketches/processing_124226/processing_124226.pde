
//*sketch by Ian Ezinga/*

void setup()
{
  background(255,255,255,100);
  frameRate(15);
  size(460,710);
noStroke();
}
void draw()
{
fill(random(255),random(255),random(255));
 ellipse(mouseX,mouseY, 25,25);
fill(232,226,26);
  triangle(230,0,205,35,255,35);
  triangle(230,50,205,15,255,15);
fill(113,85,56);
 rect(190,650,82,500);
fill(34,67,29);
  triangle(30,650,430,650,230,50);
fill(255,255,255,50);
  rect(0,0,460,710);
fill(random(255),random(255),random(255));
 ellipse(mouseX,mouseY, 25,25);
fill(random(255),0,0);
textSize(36);
text("Happy",220,640);
textAlign(LEFT);
text("Holidays",240,640);
textAlign(RIGHT);
fill(random(255),0,0);
 
}
 

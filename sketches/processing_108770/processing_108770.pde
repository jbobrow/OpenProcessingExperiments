
//Homework3
//All right reserved to Chia-Fang Lue

float wd, ht, stroke;
color col;

void setup()
{
  size(400, 400);
  background(255);
  wd = width*.1;
  ht = height*.1;
  col = color(random(255), random(255), random(255), 20);
  
  noStroke();
  
  text("Press keyboard to draw circle.", 20, 365);
  text("Click mouse to change stroke weight.", 20, 385);
}

void draw()
{
  strokeWeight(stroke);
  stroke(0, 0, 0);
  line(pmouseX, pmouseY, mouseX, mouseY);
  
  textSize(12);
  fill(80);
  text("Press keyboard to draw circle.", 20, 365);
  text("Click mouse to change stroke weight.", 20, 385);
}


void keyPressed()
{
  fill(col);
  noStroke();
  ellipse(mouseX, mouseY, wd, ht);
 
}

void mousePressed()
{
  col = color(random(255), random(255), random(255), 10);
  wd = random(10, 180);
  ht = wd;
  stroke = random(1,4);
   
}





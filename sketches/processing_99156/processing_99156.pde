
void setup()
{
  size(400, 600);
  smooth();
  frameRate(5000);
  
}

void draw()
{

  fill(167,234,242,75);
  rect(0,0,width,height);
  fill(255,255,255);
  rect(mouseX+10,mouseY-10, 80,60);
  fill(255,255,255);
  ellipse(mouseX+50,mouseY-75, 125,175);
  fill(255,0,0);
  ellipse(mouseX+50,mouseY-50,50,50);
  fill(255,255,255);
  ellipse(mouseX+30,mouseY-85,30,30);
  fill(255,255,255);
  ellipse(mouseX+70,mouseY-85,30,30);
  fill(0,0,0);
  ellipse(mouseX+30,mouseY-80,15,15);
  fill(0,0,0);
  ellipse(mouseX+70,mouseY-80,15,15);
  line(mouseX-50,mouseY-135,mouseX+150,mouseY-135);
  fill(0,0,0);
  rect(mouseX-10,mouseY-245,125,110);
  fill(0,0,0);
  rect(mouseX-35,mouseY+50,175,175);
  fill(255,255,255);
  rect(mouseX+20,mouseY+50,60,175);
  
  
  fill(255);
  rect(mouseX-10,mouseY-150,125,-30); //tophatline
  
  fill(167,98,298); //flower
  ellipse(mouseX+110,mouseY-165,14,14);
  fill(167,98,298);
  ellipse(mouseX+110,mouseY-145,14,14);
  fill(167,98,298);
  ellipse(mouseX+120,mouseY-155,14,14);
  fill(167,98,298);
  ellipse(mouseX+100,mouseY-155,14,14);
  
  
  fill(123,234,123);
  ellipse(mouseX+110,mouseY-155,10,10); //flower
  
  
  line(mouseX+40,mouseY+70,mouseX+60,mouseY+70);//lineunderthebowtie
  
  
  
  
  line(mouseX+40,mouseY+50, mouseX+40,mouseY+225);
  line(mouseX+60,mouseY+50, mouseX+60,mouseY+225);
  
  
  fill(255);
  ellipse(mouseX-45,mouseY+180,30,30);
  fill(255);
  ellipse(mouseX+150,mouseY+180,30,30); //hands
  
  
  fill(0);
  ellipse(mouseX+50,mouseY+90,5,5);
  fill(0);
  ellipse(mouseX+50,mouseY+115,5,5);
  fill(0);
  ellipse(mouseX+50,mouseY+140,5,5);
  fill(0);
  ellipse(mouseX+50,mouseY+165,5,5);
  fill(0);
  ellipse(mouseX+50,mouseY+190,5,5);
  fill(0);
  ellipse(mouseX+50,mouseY+215,5,5); //dots
  
  
  fill(0);
  rect(mouseX-60,mouseY+50,60,125);
  rect(mouseX+100,mouseY+50,65,125); //shirtsleves
  
  
  line(mouseX+20,mouseY-25,mouseX+40,mouseY-5);
  line(mouseX+40,mouseY-5,mouseX+60,mouseY-5);
  line(mouseX+60,mouseY-5,mouseX+80,mouseY-25); //mouthlines
  
  
  fill(random(255), random(255), random(255));
  quad(mouseX,mouseY, mouseX+100,mouseY+100, mouseX+100,mouseY, mouseX,mouseY+100); //Bowtie
  fill(0,0,0);
  ellipse(mouseX+50, mouseY+50, 20,20); // middle of bowtie
  strokeWeight(3);
}

void keyPressed()
{
  save("snapshotp.png");
}

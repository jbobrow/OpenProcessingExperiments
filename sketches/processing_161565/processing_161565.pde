
 
 
float dice;
void mouseClicked()
{
  if (dice < 1.000001 && dice > 0.1)
  {
    fill (random(0, 200), random(100, 200), random(100, 255));
    ellipse (mouseX, mouseY, random(30, 75), random(30, 75));
  }
  else if (dice < 2.000001 && dice > 1.000001)
  {
    fill (random(100, 255), random(60, 100), random(10, 150));
    triangle (mouseX-random(0, 50), mouseY+random(40, 100), mouseX+random(50, 100), mouseY+random(15, 75), mouseX, mouseY+random(15, 75));
  }
 
  else if (dice < 0.1)
  {
    robotHead();
    robotBody();
    robotFace();
  }
  else
  {
    fill (random(0, 100), random(100, 255), random(0, 200));
    rect (mouseX-25, mouseY-25, random(15, 75), random(15, 75));
  }
}
 
 

 
 
 
void setup()
{
  size(640, 480);
  background (255);
  smooth();
  noStroke();
  fill(44,191,8);
  rect(0,300,640,200);
  fill(28,191,255);
  rect(0,0,640,320);
   fill(252,235,45);
  ellipse(600,50,40,40);
}
 
 
void draw()
{
 
  dice = random(0, 3);
}
 
 
 
 
 
 
 
 
void robotHead()
{
  fill(0, 197, 255);
  triangle (mouseX+50, mouseY-30, mouseX, mouseY-30, mouseX+7.5, mouseY+10);
  triangle (mouseX-50, mouseY-30, mouseX, mouseY-30, mouseX-7.5, mouseY+10);
  fill(183, 0, 131);
  ellipse (mouseX, mouseY-10, 50, 50);
}
 
void robotBody()
{
  fill(255, 0, 0);
  rect(mouseX-50, mouseY+25, 45, 20);
  rect(mouseX+8, mouseY+25, 45, 20);
  fill(30, 232, 16);
  rect(mouseX-20, mouseY+100, 15, 50);
  rect(mouseX+6, mouseY+100, 15, 50);
  fill(255, 255, 8);
  rect(mouseX-22, mouseY+15, 45, 100);
}
 
void robotFace()
{
  fill(0);
  ellipse(mouseX-10, mouseY-10, 10, 10);
  ellipse(mouseX+10, mouseY-10, 10, 10);
  arc(mouseX, mouseY, 20, 20, radians(0), radians(180));
}

 void keyPressed(){
   if(key=='s'){
      saveImage();
 }
}
     
 void saveImage() {
  String fileName = timeStamp()+".tiff";
  PImage imageSave = get(0,0,width,height);
  imageSave.save(fileName);
}
  
String timeStamp() {
 String timestamp = year()+"_"+month()+"_"+day()+"_"+minute()+"_"+second()+"_"+millis();
 return timestamp;
}


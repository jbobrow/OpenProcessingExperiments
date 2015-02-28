
void setup() {
size(313,310);
background(20);
}

void draw() {
fill(64,8);
 fill(8,8,8);
  ellipse((mouseY), (mouseX+20), 70, 70);
  fill(290,100,10);
  ellipse((mouseY), (mouseX+20), 60, 60);
  fill(290,100,10,random(255));
  ellipse((mouseY), (mouseX+20), 50,50);
  fill(290,100,10,random(255));
  ellipse((mouseY), (mouseX+20), 40, 40);
  fill(290,100,10, random(255));
  ellipse((mouseY), (mouseX+20), 30, 30);
  fill(290,100,10,random(255));
  ellipse((mouseY), (mouseX+20), 20, 20);
  fill(290,100,10);
  ellipse((mouseY), (mouseX+20), 10, 10);
  fill(290,100,10);
  ellipse((mouseY+mouseX), (mouseX), 70, 70);
  fill(16,16,16, random(255));
  ellipse((mouseY+mouseX), (mouseX), 60, 60);
  fill(32,32,32,random(255));
  ellipse((mouseY+mouseX), (mouseX), 50,50);
  fill(64,64,64,random(255));
  ellipse((mouseY+mouseX), (mouseX), 40, 40);
  fill(128,128,128, random(255));
  ellipse((mouseY+mouseX), (mouseX), 30, 30);
  fill(220,220,220,random(255));
  ellipse((mouseY+mouseX), (mouseX), 20, 20);
  fill(255);
  ellipse((mouseY+mouseX), (mouseX), 10, 10);
   
  fill(8,8,8,random(255));
  ellipse((mouseY-mouseX), (mouseX+mouseY), 70, 70);
  fill(16,16,16, random(255));
  ellipse((mouseY-mouseX), (mouseX+mouseY), 60, 60);
  fill(32,32,32,random(255));
  ellipse((mouseY-mouseX), (mouseX+mouseY), 50,50);
  fill(64,64,64,random(255));
  ellipse((mouseY-mouseX), (mouseX+mouseY), 40, 40);
  fill(128,128,128, random(255));
  ellipse((mouseY-mouseX), (mouseX+mouseY), 30, 30);
  fill(220,220,220,random(255));
  ellipse((mouseY-mouseX), (mouseX+mouseY), 20, 20);
  fill(255);
  ellipse((mouseY-mouseX), (mouseX+mouseY), 10, 10);
}
                
                

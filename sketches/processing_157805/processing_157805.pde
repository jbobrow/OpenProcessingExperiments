
float saucerWidth;
float saucerHeight = 50;
float ypos = 320;
int savedTime;
int totalTime = 250;
float temp; 


 
void setup() {
  size(500,500);
  smooth();
   
  saucerWidth = saucerHeight * 2;
  savedTime = millis();
  temp = -saucerWidth/2;
  
}
 
void draw() {
  int passedTime = millis() - savedTime;
  background(20,40,200);
  
  noStroke();
  fill(60,222,240);
  rect(0,0,500,280);
  fill(255);
  for (int i = 0; i < 9000; i += 80) {
    rect(-3*mouseX + i, 370, 50, 20);
  }
  
  
  fill(255, 255, 0);
  ellipse(500, 0, 200, 200);
  
  fill(200, 0, 255);
  rect (-(mouseX-170), 20, 150, 260);
  fill(10, 255, 0);
  rect (-(mouseX-370), 200, 100, 80);
  fill(255, 50, 10);
  rect (-(2*mouseX-510), 120, 100, 160);
  fill(200, 0, 255);
 
  noStroke();
  fill(0);
 
   
  
  ellipse(mouseX, mouseY-saucerHeight/2, saucerHeight, saucerHeight/2);
 
 
  arc(mouseX, mouseY, saucerWidth, saucerHeight, PI, TWO_PI);
  fill(180,0,255);
  rect (mouseX + 5, mouseY - 30, 10, 10);
  rect (mouseX - 15, mouseY - 30, 10, 10);
  fill(255, 0, 0);
  ellipse(mouseX + saucerWidth/2, mouseY - 5, 10, 10);
  ellipse(mouseX + saucerWidth/4, mouseY - 5, 10, 10);
  ellipse(mouseX, mouseY - 5, 10, 10);
  ellipse(mouseX - saucerWidth/4, mouseY - 5, 10, 10);
  ellipse(mouseX - saucerWidth/2, mouseY - 5, 10, 10);
  
  fill(255, 255, 0);
  ellipse(mouseX + temp, mouseY - 5, 10, 10);
  
  if (passedTime > totalTime) {
    if (temp >= saucerWidth/2) {
      temp = -saucerWidth/2;
    }
    else {
      temp += saucerWidth/4;
    }
    savedTime = millis();
  }
 
   
}




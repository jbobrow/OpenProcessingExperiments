
int redcWidth = 40;
int redcHeight = 110;
void setup() { 
size(200, 300);

color b2 = color(40, 250, -12);
color walk = color(204, 153, 9);
color redc = color(204, 34, 46);
color oval = color(0, 255, 0);


fill(redc);
rect(110, 40, 40, 100);
fill(walk);
rect(70, 0, 40, 300);
fill(b2);
rect(16, 60, 54, 60);
fill(oval);
ellipse(160, 200, 100, 100);

}

void draw() {
  fill(204, 34, 46);
  for (int y= 5; y<height; y += 30){ 
    for (int x= 5; x<width; x += 30){ 
      
  rect(110, 40, redcWidth, redcHeight);
  
    if (mousePressed)    { 
  float redc = random(0, 100);
      stroke(250);  
      fill(0); 
        rect(110, 40,redcWidth, redcHeight); 
      } 
      fill(204, 34, 46); 
    } 
  } 
  }


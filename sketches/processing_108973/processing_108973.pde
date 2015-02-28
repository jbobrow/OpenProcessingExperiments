
float r = 0;
float b = 0;
float g = 0;

void setup() {
  size(380,600);
}

void draw() {
  background(r - 120 ,g - 120 , b - 120);
  stroke(0);
  rect(280,0,10,600);
  fill(r - 80,g - 80,b - 80);
   rect(260,0,10,600);
  fill(r - 50,g - 50,b - 50);
  rect(240,0,10,600);
  fill(r - 30,g - 30,b - 30);
  rect(220,0,10,600);
  fill(r - 15 , g - 15, b - 15);
  rect(200,0,10,600);
  fill(r + 25,g + 25,b + 25);
  rect(180,0,10,600);
  fill(r + 5,g + 5,b + 5);
  rect(160,0,10,600);
  fill(r + 5,g + 5,b + 5);
  rect(140,0,10,600);
  fill(r - 15,g - 15,b - 15);
  rect(120,0,10,600);
  fill(r - 30,g - 30,b - 30);
  rect(100,0,10,600);
  fill(r - 50,g - 50,b - 50);
  rect(80,0,10,600);
  fill(r - 100,g - 100,b - 100);
  
if (mouseX < 200 && mouseY < 200) {
    r = r + 1; 
  } else {
    r = r - 1;
  }
  
  if (mouseX < 200 && mouseY > 200) {
    b = b + 1; 
  } else {
    b = b - 1; 
  }

if (mouseX > 200 && mouseY < 200) {
    g = g + 1; 
  } else {
    g = g - 1; 
  }
  
 r = constrain(r,0,255);
  g = constrain(g,0,255);
  b = constrain(b,0,255);
}



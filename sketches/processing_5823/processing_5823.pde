
//Screensaver door Barbara Kamphuis, ECP1a
float r;
float g;
float b;
float a;

int x = 0; 
int y = 0; 
int speed = 3; 
int state = 0; 

int VierkantX = 160;
int VierkantY = 110;
float VierkantXFill = 0;

void setup(){  
  size(400,400);    
}  
  
void draw() {  
  background (#A65800);  
  
//DezeVierkantjesVerkleurenTelkens
  noStroke(); 
  fill(g,b,r,a);
  rect(300,124,30,30);
  rect(300,164,30,30);
  rect(300,204,30,30);
  
  g = random(0,255);
  b = random(0,255);
  r = random(0,255);
  a = random(0,255);

//MetMuisBewegenOverVierkantjes
  if (mouseX < 200 && mouseY < 200) {
  fill(#F93E58);
  rect(120,84,30,30);
  rect(120,44,30,30);
  rect(120,4,30,30);
  rect(120,124,30,30);
  rect(120,164,30,30);
  rect(120,204,30,30);
  rect(120,244,30,30);
  rect(120,284,30,30);
  rect(120,324,30,30);
  rect(120,364,30,30);
  rect(120,404,30,30);
  }
  
//RijtjeRechtsVoorEenDeel
  if (mouseX < 200 && mouseY < 200) {
  fill(#FF9700);
  rect(300,244,30,30);
  rect(300,284,30,30);
  rect(300,324,30,30);
  rect(300,364,30,30);
  rect(300,404,30,30);

}else if (mouseX > 200 && mouseY < 200) {
 }
 
  fill(#FF9700);
  rect(300,84,30,30);
  fill(#FF9700);
  rect(300,44,30,30);
  fill(#FF9700);
  rect(300,4,30,30);
  
  noStroke();  
  fill(#BF7C30);  
  ellipse(x,y,90,90);  
  fill(#F23D70);
  ellipse(x,y,60,60);
  fill(#F26D93);
  ellipse(x,y,25,25);
  if(state == 0 ) { 
  x = x + speed; 
  if (x > width-50) { 
    x = width-50; 
    state = 1; 
    } 
} else if (state == 1) { 
  y = y + speed - 2; 
  x = x - speed + 1; 
  if (x < 0) { 
   y = 175; 
   x = 0; 
   state = 2; 
  }  
} else if (state == 2) { 
    x = x + speed; 
  if (x > width-50) { 
   y = 175; 
   x = 350; 
   state = 3; 
} 
} else if (state == 3) { 
  y = y + speed - 2; 
  x = x - speed + 1; 
  if (x < 0) { 
   y = 350; 
   x = 0; 
   state = 4; 
} 
} else if (state == 4) { 
    x = x + speed; 
  if (x > width-50) { 
   y = 350; 
   x = 350; 
   state = 5; 
} 
} else if (state == 5) { 
  x = 0; 
  y = 0; 
  state = 0; 
} 

}



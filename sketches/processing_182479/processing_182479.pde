
float a;
float b;
float c;
float d;
float cc;  
int x = 0; 
int toggle = 0; 
float mousePosX1 = 0;
float mousePosY1 = 0;
float mousePosX2 = 900;
float mousePosY2 = 900;
float re;
float bl;
float gr;
int counter = 0; 
float val = 0; 

void setup() 
{
  size(900,900);
  background(0,0,0);
  textAlign(CENTER,CENTER); 
  
};

void draw() {
  fill(255,255,255);   
  text("press h for help",300,100);  
  keyboard();
  drawline(); 
  // toggle = toggle + 1; 
  //if (toggle >= 10000) {noLoop();}
}; 

void savef() {
  x = x + 1;
  save("drawline" + x);
} 

void keyPressed()
{  
  if (key == 's') {
    savef();  
    text("saved as drawline" + x + ".tif", width/2, height/2);
  };
  if (key == 'w') {
    background(0,0,0);  
    text("wiped", width/2, height/2 - 100); 
    counter = 0; 
  };
  if (key == 'c') {
     text("you have made" + counter + "random lines so far!", width/2, height/2); 
  }; 
} 



void keyboard() {
  if (key == 't') {
    mousePosX1 = mouseX;
    mousePosY1 = mouseY;
  }; 
  if (key == 'b') {
    mousePosX2 = mouseX;
    mousePosY2 = mouseY;
  };
  if (key == 'h') {text("press w to wipe and s to save the image to the computer",300,120);
  text("press or hold t to move the top left corner and b to move the bottom right corner",300,140);
}
}

float randomf(float PosA, float PosB) { 

  float randV = 0;
  if (PosB >= PosA) {
    randV = random(PosA, PosB);
  };
  if (PosA > PosB) {
    randV = random(PosB, PosA);
  }; 
  return randV;
} 

float mousePosf (float PosA, float PosB) { 

  float V = 0;
  if (PosB >= PosA) {
    V = PosB - PosA; 
  };
  if (PosA > PosB) {
    V = PosA - PosB; 
  }; 
  return V;
} 

void drawline() { 
  counter = counter + 1; 
  a =  randomf(mousePosX1, mousePosX2); 
  b =  randomf(mousePosY1, mousePosY2);
  c =  randomf(mousePosX1, mousePosX2); 
  d =  randomf(mousePosY1, mousePosY2);
  cc = sqrt(sq(c-a)+sq(d-b)) * (256.0/ (mousePosf(mousePosX1,mousePosX2) + mousePosf(mousePosY1,mousePosY2)  ));
  val = (mousePosf(mousePosX1,mousePosX2) + mousePosf(mousePosY1,mousePosY2))/(cc*20);
  //strokeWeight(val); 
  re = cc + random(-5,5);
  bl = cc + random(-5,5);
  gr = cc + random(-5,5);
  fill(re,bl,gr);
  stroke(re,bl,gr,val*50); 
  ellipse(a,b,cc/100,cc/100); 
  ellipse(c,d,cc/100,cc/100); 
  line(a, b, c, d);
} 




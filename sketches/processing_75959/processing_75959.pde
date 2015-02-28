
PFont h=createFont("Arial",9);
float L,U,V=255;

void setup(){
  size(600,600);
  background(255);
}
 
float mx = 300;
float my = 300;
 
void draw(){
  smooth();
  
  float randomness = map(mouseX, 0,width, 0,1);
  randomness = constrain(randomness, 0,1);
   
  float A = 0.7;
  float B = 1.0-A;
  mx = A*mx + B*mouseX;
  my = A*my + B*mouseY;
   
  float r = round(random(0,mouseX));
  float g = round(random(0,mouseX));
  float b = round(random(0,mouseX));
   
  fill(10+r,50+g,100+b);
 // fill(100*randomness,*randomness,200*randomness);
  //ellipse(mx+randomness*random(-100,100),my+randomness*random(-100,100),20/randomness,20/randomness);
  //PImage img = loadImage("kitty2.png");
  //image(img, 0, 0);
  
  //int yyy=max(int(20/randomness), 500,20);
  //img.resize(xxx, yyy);//(ㄎㄨㄢ, ㄍㄠ )
 // image(img, mx+randomness*random(-100,100), my+randomness*random(-100,100));//(img, x, y)
 U=sin(L++*.1)*18;
if(mousePressed) background(V);
else 
fill(99);
textFont(h,79);
fill(r,g,b);
textSize(V+U*50);
text("♥",mx+randomness*random(-100,100),my+randomness*random(-100,100));
}



PImage a;
PImage b;
PFont f;
PFont t;


void setup(){
  size(500,500);
  a=loadImage("ima.jpg");
  b=loadImage("ima4.jpg");
  f=loadFont("AppleCasual-48.vlw");
  t=loadFont("BrushScriptMT-48.vlw");
  
  
}

void draw(){
   tint(mouseX,mouseY,20,80);
  image(a,0,0);
  tint(mouseX,mouseY,100,random(100));
  image(b,0,0);
 
  fill(255);
  textFont(f);
  textSize(15);
text("Buddha transformed me into a living tree",mouseX,mouseY);
text("Stand alongside a path you should seek",mouseX,mouseY+15);
text("Beneath the bright sunlight, I bloom cautiously",mouseX,mouseY+30);
text("Each blossom embodying a preexistent wish",mouseX,mouseY+45);
fill(0);
  textFont(t);
  textSize(10);
  text("by Amy Wen",380,450);  

//text("people will surprise you",mouseX,mouseY+21);
}


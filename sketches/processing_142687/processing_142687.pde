
float x=0;
float y=0;
PImage flash;
PImage flashsymbol;
PImage greensymbol;
PImage supermansymbol;
PImage batmansymbol;
PImage captainsymbol;
PImage spidermansymbol;
PImage wondersymbol;
float mouseSpeed=0;
float smoothedSpeed=0;
float sizeMultiplier=2;
float minimumSize=10;
float penX=0;
float penY=0;
float rectSize=0;

void setup() {

  flashsymbol=loadImage("flashsymbol.png");
  greensymbol=loadImage("greensymbol.jpg");
  supermansymbol=loadImage("supermansymbol.png");
  batmansymbol=loadImage("batmansymbol.jpg");
  captainsymbol=loadImage("captainsymbol.jpg");
  spidermansymbol=loadImage("spidermansymbol.jpg");
  wondersymbol=loadImage("wondersymbol.jpg");
  
  size(1200, 1200);

 
}

void draw() {
   if (key =='f') {
 if (mousePressed){
    color p=flashsymbol.get(mouseX, mouseY);
    mouseSpeed=dist(mouseX,mouseY,pmouseX,pmouseY);
  mouseSpeed=mouseSpeed*sizeMultiplier;
  smoothedSpeed=lerp(smoothedSpeed,mouseSpeed,0.05);
  penX=lerp(penX,mouseX,0.15);
  penY=lerp(penY,mouseY,0.15);
  rectSize=minimumSize+smoothedSpeed;
    stroke(p,150);
    fill (p,150);
    rect(mouseX, mouseY,rectSize,rectSize);}
   }
     if (key =='g') {
 if (mousePressed){
    color g=greensymbol.get(mouseX, mouseY);
     mouseSpeed=dist(mouseX,mouseY,pmouseX,pmouseY);
  mouseSpeed=mouseSpeed*sizeMultiplier;
  smoothedSpeed=lerp(smoothedSpeed,mouseSpeed,0.05);
  penX=lerp(penX,mouseX,0.15);
  penY=lerp(penY,mouseY,0.15);
  rectSize=minimumSize+smoothedSpeed;
    stroke(g,150);
    fill (g,150);
    rect(mouseX+250, mouseY+150,rectSize,rectSize);}
   }
    if (key =='s') {
 if (mousePressed){
    color s=supermansymbol.get(mouseX, mouseY);
    mouseSpeed=dist(mouseX,mouseY,pmouseX,pmouseY);
  mouseSpeed=mouseSpeed*sizeMultiplier;
  smoothedSpeed=lerp(smoothedSpeed,mouseSpeed,0.05);
  penX=lerp(penX,mouseX,0.15);
  penY=lerp(penY,mouseY,0.15);
  rectSize=minimumSize+smoothedSpeed;
    stroke(s,150);
    fill (s,150);
    rect(mouseX+800, mouseY+800,rectSize,rectSize);}
   }
   
    if (key =='b') {
 if (mousePressed){
    color b=batmansymbol.get(mouseX, mouseY);
    mouseSpeed=dist(mouseX,mouseY,pmouseX,pmouseY);
  mouseSpeed=mouseSpeed*sizeMultiplier;
  smoothedSpeed=lerp(smoothedSpeed,mouseSpeed,0.05);
  penX=lerp(penX,mouseX,0.15);
  penY=lerp(penY,mouseY,0.15);
  rectSize=minimumSize+smoothedSpeed;
    stroke(b,150);
    fill (b,150);
    rect(mouseX+300, mouseY+500,rectSize,rectSize);}
   }
    if (key =='c') {
 if (mousePressed){
    color c=captainsymbol.get(mouseX, mouseY);
    mouseSpeed=dist(mouseX,mouseY,pmouseX,pmouseY);
  mouseSpeed=mouseSpeed*sizeMultiplier;
  smoothedSpeed=lerp(smoothedSpeed,mouseSpeed,0.05);
  penX=lerp(penX,mouseX,0.15);
  penY=lerp(penY,mouseY,0.15);
  rectSize=minimumSize+smoothedSpeed;
    stroke(c,150);
    fill (c,150);
    rect(mouseX+700, mouseY,rectSize,rectSize);}
   }
    if (key =='p') {
 if (mousePressed){
    color p=spidermansymbol.get(mouseX, mouseY);
    mouseSpeed=dist(mouseX,mouseY,pmouseX,pmouseY);
  mouseSpeed=mouseSpeed*sizeMultiplier;
  smoothedSpeed=lerp(smoothedSpeed,mouseSpeed,0.05);
  penX=lerp(penX,mouseX,0.15);
  penY=lerp(penY,mouseY,0.15);
  rectSize=minimumSize+smoothedSpeed;
    stroke(p,150);
    fill (p,150);
    rect(mouseX-40, mouseY+400,rectSize,rectSize);}
   }
     if (keyPressed =='w') {
 if (mousePressed){
    color w=wondersymbol.get(mouseX, mouseY);
    mouseSpeed=dist(mouseX,mouseY,pmouseX,pmouseY);
  mouseSpeed=mouseSpeed*sizeMultiplier;
  smoothedSpeed=lerp(smoothedSpeed,mouseSpeed,0.05);
  penX=lerp(penX,mouseX,0.15);
  penY=lerp(penY,mouseY,0.15);
  rectSize=minimumSize+smoothedSpeed;
    stroke(w,150);
    fill (w,150);
    rect(mouseX+700, mouseY+250,rectSize,rectSize);}
   }
   if (keyPressed == 'q') {
     saveFrame();
   }
}



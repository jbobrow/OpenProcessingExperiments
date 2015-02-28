
PImage img;
int pointillize;
int Y;
float f;
int swt;
void setup() {
  size(300,200);
  img = loadImage("orange.jpg");
  background(0);
  smooth();
  colorMode(HSB);
  swt=0;
  Y=100;
  pointillize=Y/8;
}
void draw() {
  
  
  // Pick a random point
  int x = int(random(img.width));
  int y = int(random(img.height));
  int loc = x + y*img.width;
  
  if(260<mouseX && mouseX<300 && mouseY<height-50 && mousePressed){
    Y=mouseY;
    if(mouseY<20){Y=20;}if(mouseY>height-55){Y=height-55;}
    pointillize=Y/8;
  }else{pointillize=pointillize;}
   
  // Look up the RGB color in the source image
  loadPixels();
  float r = hue(img.pixels[loc]);
  float g = saturation(img.pixels[loc]);
  float b = brightness(img.pixels[loc]);
  noStroke();
   
  // Draw an ellipse at that location with that color
  
  if(swt==0){fill(r,g,b,150);}else{fill(0,190);}
  rectMode(CENTER);
  rect(x,y,pointillize,pointillize);
  
  rectMode(CORNER);
  fill(0);
  rect(200,0,width-200,height);
  
  
  stroke(150);strokeWeight(8);strokeCap(ROUND);
  line(280,20,280,height-55);
  
  noStroke();
  fill(250);
  ellipse(280,Y,20,20);
  
  rectMode(CENTER);
  fill(180);
  for(int a=0;a<5;a++){
    rect(255,a*29+22,(a+1)*2,(a+1)*2);
  }
  
  
  textSize(13);
  if(swt==0){fill(250);}else{fill(150);}
  text("DRAW",210,175);
  if(swt==1){fill(250);}else{fill(150);}
  text("ERASER",210,188);
  if(mousePressed){
    if(210<mouseX && mouseX<270 && 165<mouseY && mouseY<180){
      swt=0;
    }
    if(210<mouseX && mouseX<270 && 180<mouseY && mouseY<195){
      swt=1;
    }
  }
  
}




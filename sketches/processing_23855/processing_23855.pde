
PImage bg;
int on,diagonal,counter=0,x,y,s,ss=150;
color c,newc;
int [] tX = new int[500];
int [] tY = new int[500];
int [] tS = new int[500];
color [] tC = new color [500];

void setup() {
  size(723,480);
  bg=loadImage("5.jpg"); 
  background(bg);
  smooth();
}

void draw(){
  loadPixels();
  bg.loadPixels();
  
  diagonal = (int) sqrt(mouseX*mouseX + mouseY*mouseY);
  
  tint(mouseX/2.8,diagonal/3.3,mouseY/1.8);
  image(bg,0,0);
  
  //triangle that follows mouse.
  if(mouseX<width && 0<mouseX && mouseY<height && 1<mouseY){
    on = mouseX + mouseY*width;
    c = bg.pixels[on];
    fill(c,50);
    noStroke();
    triangle(mouseX,mouseY,mouseX+ss,mouseY,mouseX+ss/2,mouseY-ss);
  }
  
  for(int i=0;i<counter;i++){
    x=tX[i];
    y=tY[i];
    s = tS[i];
    newc = tC[i];
    fill(newc,50);
    triangle(x,y,x+s,y,x+s/2,y-s); 
  }
  
}

void mouseClicked(){
  tX[counter] = mouseX;
  tY[counter] = mouseY;
  tS[counter] = ss;
  tC[counter] = c;
  counter++;
}

void mouseDragged(){
  if(mouseX<width && 0<mouseX && mouseY<height && 1<mouseY){
    println(mouseY);
    tX[counter] = mouseX;
    tY[counter] = mouseY;
    tS[counter] = ss;
    tC[counter] = c;
    counter++;
  }
}


void keyPressed(){
  //Square size
  if(keyCode == RIGHT) ss+=10;;
  if(keyCode == LEFT && ss>10) ss-=10;;
  //Background display
  if(keyCode == ENTER) counter=0;
  //Saving png
  if (key == 's' || key == 'S') saveFrame("sharp"+"_##.png");
}








PImage bg;


PFont font;
int amount = 10,range=4;
int mx=5,my=5,sx,sy,px,py;
float up,down,th=0;
boolean hole1 = false,hole2 = false, hole3 = false;

int [] x = new int[100];
int [] y = new int[100];
int [] j = new int[100];
int [] k = new int[100];
int [] s = new int[100];



void setup() { 
  size(723,480);
  bg = loadImage("3.jpg");
  background(0);
  smooth();
  font = createFont("Georgia-Italic",11);
  frameRate(20);
}

void draw(){
  hole();
  
  if(hole1 || hole2 || hole3){
  //background
  image(bg,0,0);
  filter(THRESHOLD,th/100);
  //blend(bg,0,0,width,height,0,0,width,height,BURN);
  th+=amount/10;
    
  for(int i=0;i<amount;i++){
    x[i] = (int) random(px-range,py+range);
    y[i] = (int) random(px-range,py+range);
    j[i] = (int) random(px-range,py+range);
    k[i] = (int) random(px-range,py+range);
    s[i] = (int) random(height);
  }
  
  mx=mouseX;
  my=mouseY;
  sx=(mx-361)/2;
  sy=(my-240)/2;

  for(int i=0;i<amount-1;i++){
  stroke(#FFF82F,i*12);
  strokeWeight(1);
  fill(0,0);
  //HOLE ONE
  beginShape();
  curveVertex(mx,my);
  curveVertex(-30,s[i]+my/10);
  curveVertex(x[i]+sx,y[i]+sy);
  curveVertex(px,py);
  curveVertex(j[i]-sx,k[i]-sy);
  curveVertex(760,s[i]+my/10);
  curveVertex(mx,my);
  endShape();
  
  }

  }else{
   image(bg,0,0);
    //blend(bg,0,0,width,height,0,0,width,height,BURN);
  }
  
  if(th>100){th=0;}
}



void keyPressed(){
  //flowers grow
  if(keyCode == UP){
   range+=10; 
   //println("UP");
  }
  if(keyCode == DOWN){
   range-=10;
  }
  
  if(key == '1') amount = 10;
  if(key == '2') amount = 20;
  if(key == '3') amount = 30;
  if(key == '4') amount = 40;
  if(key == '5') amount = 50;
  if(key == '6') amount = 60;
  if(key == '7') amount = 70;
  if(key == '8') amount = 80;
  if(key == '9') amount = 90;
  
  if (key == 's' || key == 'S') saveFrame("output"+"_##.png");
  
}

void hole(){
  
  if(242<mouseX && mouseX<257 && 245<mouseY && mouseY<262){
    hole1 = true;
    px=255;
    py=255;
    return;
  }else{
    hole1 = false;
  }
  
  if(300<mouseX && mouseX<320 && 225<mouseY && mouseY<245){
    hole2 = true;
    px=310;
    py=235;
    return;
  }else{
    hole2 = false;
  }
  
  if(320<mouseX && mouseX<340 && 255<mouseY && mouseY<275){
    hole3 = true;
    px=330;
    py=265;
    return;
  }else{
    hole3 = false;
  }
}





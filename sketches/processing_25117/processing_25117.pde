
PImage[] imgs = new PImage[6];
int img_c = 0;
int load_I = 0;
int line_c = 0;
float x1 = 250;
float y1 = 500;
float x2 = 200;
float y2 = 500;
float x3 = 238;
float y3 = 120;
float x4 = 240;
float y4 = 500;
float x5 = 0;
float y5 = 410;
float x6 = 0;
float y6 = 355;
float x7 = 325;
float y7 = 241;
float prevent1 = 0;
float prevent2 = 0;
float e1 = 0;
boolean step1 = true;
boolean step2 = false;
boolean step3 = false;
boolean step4 = false;
boolean step5 = false;
boolean step6 = false;
boolean up1 = true;
boolean r1 = false;
boolean r2 = false;
boolean d1 = false;
boolean d2 = false;
boolean r3 = false;
boolean stop = false;

void setup(){
  size(400,500);
  smooth();
  imgs[0] = loadImage("Image1.png");
  imgs[1] = loadImage("Image2.png");
  imgs[2] = loadImage("Image3.png");
  imgs[3] = loadImage("Image4.png");
  imgs[4] = loadImage("Image5.png");
  imgs[5] = loadImage("Image6.png");
  fill(255,0,0);
  noStroke();

}

void draw(){
  image(imgs[img_c],0,0);
  if (img_c >= 5) img_c = 5;
  stroke(255,0,0);
  strokeWeight(3);
  line(250,500,x1,y1);
  fill(255,0,0);

  if(up1 == true) { y1--; x1++;}
  
  if(x1 == 400){
    step2 = true; 
    line_c=1; }
  
  if(step2 == true) {
    img_c=2; 
    image(imgs[img_c],0,0);}
  
  if(line_c >= 1){ 
    line(200,500,x2,y2);}
    
  if(step2 == true && line_c == 1){
    x2+=0.1; y2-=1;}
  
  if(y2 == 120 && step2 == true){
    line_c = 2; r1 = true;}
  
  if(line_c >= 2) {
    line(238,120,x3,y3);}
    
  if(line_c == 2 && r1 == true) {
    x3++; }
  
  if(x3 == 270) {
    step3 =true; 
    line_c=3; 
    step2 = false; }
    
  if(step3 == true) {
    img_c=3;   
    image(imgs[img_c],0,0);}
    
  if(line_c == 3) {
    line(240,500,x4,y4); 
    x4-=0.6; y4-=1; }
  
  if( 240 >= y4) {
    step4=true;  }
    
  if(step4 == true) {
    line_c=4;
    img_c=4; 
    image(imgs[img_c],0,0);}
    
  if(line_c == 4) {
    line(0,410,x5,y5); 
    x5+=1; y5+=0;
  }
  
  if(x5 >= 400) {
    step5=true; step4 = false; 
  }
    
  if(step5 == true) {
    img_c=5; 
    image(imgs[img_c],0,0);
    r2 = true;}
  
  if(r2 == true && prevent1 == 0)  line_c=5; 
  
  if(line_c >= 5) { 
    line(0,355,x6,y6); }
  if(line_c == 5) { 
    x6+=1; 
    y6-=0.35; }
    
  if( x6 >= 325 ){line_c = 6; 
    prevent1=1;}
    
  if(line_c == 6 && prevent2==0) y7--;
  if(line_c >= 6) line(325,241,x7,y7); line(0,355,x6,y6);
  if(y7 == 185) prevent2=1;
  
  if(prevent2 == 1) ellipse(325,185,30,30); 
  
}




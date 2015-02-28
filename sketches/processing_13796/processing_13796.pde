
PImage explosion;
PImage missle1;
PImage missle2;
PImage sub1;
PImage newspaper;
float x;
float i=0.3;
void setup(){
  size(600,600);
  smooth();
  explosion = loadImage("EXPLOSION.png");
  missle1 = loadImage("missle1.png");
  missle2= loadImage("missle2.png");
  sub1= loadImage("sub.png");
  newspaper= loadImage("newspaper.png");
  noLoop();
  
  
  pushMatrix();
  image(explosion,0,0);
popMatrix();
    
    
  /*   void mousePressed();
if (mousePressed== true){
  if (mouseButton==LEFT){
  filter(DILATE);
  }else{
    noFill();
 */
  
}

void draw(){
  
  pushMatrix();
    scale(.54);
    image(missle1, 0,0);
         tint(255,120);
  popMatrix();
  pushMatrix();
    scale(.50);
    image(missle2, 700,850);
         tint(255,120);
  popMatrix();
  pushMatrix();
    scale(.50);
    image(sub1, 550,0);
         tint(255,120);
  popMatrix();
  pushMatrix();
    scale(.50);
     tint(255,120);
    image(newspaper, 0,720);
 popMatrix();
 filter(GRAY);
 filter(POSTERIZE, 4);
     blend(explosion, 0, 0, 600, 600, 0, 0, 600, 600, ADD);
    
  

}

  




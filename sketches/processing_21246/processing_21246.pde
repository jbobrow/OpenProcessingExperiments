
//Nicky's psychadelic Doctor Who program
//Feb 16 2011
PImage doctor; 
PImage trustMe; 
int j=0;
//int bgFill = 0;
int k = 0;

void setup(){
  size(800,600);
  frameRate(100);
  smooth();
  colorMode(HSB,360,100,100);
  trustMe = loadImage("trust_me.png");
  doctor = loadImage("doc_baker.png");
  
}
void draw(){
  background(255);
  for(int i=0; i<=20; i++){
    j++;
    k++;
    image(trustMe,0,0);
    tint(j*20,100,100);
    image(doctor, 373, 149, 227 + j*20, 251 + j*20);
    fill(326,46,90,50);
    noStroke();
    rect(0,0,800,600);
    if (j==20){
      j=0;
    }
   
  }
}


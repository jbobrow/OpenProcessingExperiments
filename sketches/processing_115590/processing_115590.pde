
PImage [ ] img = new PImage[20]; 
int copy = 100;
float a;
float b=700;
float c=0;


void setup(){
  
size(700,500);
background(255);
imageMode(CENTER); 


 for(int i=0;  i <20;  i++){
   img[i] = loadImage( i + ".png" );
//   println(i);
 }

}



void draw(){
  
pushMatrix();
   tint(255,120);
 for(int i=0; i<8; i++){
   image(img[i], random(-100,width), random(-100,height),200,200);
 }
popMatrix();

   tint(255,225);
   image(img[16], 250, 50, 120,120);
   image(img[17], 600, 100, 100,100);
   image(img[18], 450, 450, 150,150);
   image(img[19], 100, 270, 200,200);

tint(255,255);
   image(img[13], 670, random(-100,height),150,150);
 for(int i=14; i<15; i++){
   image(img[i], 40, random(-100,height),150,150); }


pushMatrix();

translate(width/2, height/2);

pushMatrix();
rotate(a);
a+=0.5;
tint(255,200);
image(img[9],0,0,360,360);
image(img[10],0,0,360,360);
popMatrix();

float d=random(250,350);
image(img[12],0,0, d,d);

pushMatrix();
rotate(-a);
image(img[11],0,0, d/2,d/2);
popMatrix();

popMatrix();



 }


  




void keyPressed(){
  
  saveFrame("_######.png");
}





PImage[] img = new PImage[8];

float angle = 0;
float bottle = 0;


void setup(){
  size(800,800);
  background(255);
  for(int i = 0; i < 8; i++){
  img[i] = loadImage( i+".png");
  }
   pushMatrix();
   scale(5);
   image(img[4],0,0);
   popMatrix();
  

}

void draw(){
  image(img[1],mouseX,mouseY);
  
  pushMatrix();
  translate(width/2,height/2);
    rotate(angle); 
  scale(1.5);
  image(img[2],100,100);
 
  popMatrix();

  

  pushMatrix();
  translate(width/2, height/2);
  rotate(angle);
  image(img[7], 0, 0);
  angle += 0.01;
  popMatrix();
  
  
  pushMatrix();
  translate(width/2, height/2);
  rotate(bottle);
  image(img[6], 0, 0);
  bottle += 0.05;
  popMatrix();
 
  image(img[0],width/2 -50,height/2 -50);


}





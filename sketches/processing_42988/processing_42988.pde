
void setup(){
  
  size(300,300);
  smooth();
  noStroke();

}

   float posX;
  float posY;
  float dimensionX=0;
  float distance;
  float dimensionY=0;
  float dimensionscale;
  float mousX;
  float mousY;
  float j;
void draw(){
      

  background(0);
  rectMode(CENTER);
  translate(150,0);
  for(int wx = 0-100; wx<=width+100; wx=wx+20){
    for(int wy=0-100;wy<=height+100; wy=wy+20){
      posX=wx;
      posY=wy;

distance=sqrt((mouseX-150-wx)*(mouseX-150-wx)+(mouseY-wy)*(mouseY-wy));

dimensionscale=distance/5;
pushMatrix();
      
  rotate(PI/4);
      whitesq(posX,posY,dimensionscale);
popMatrix();
    }
  }

}



void whitesq(float posX, float posY, float dimensionscale){
  

float dimension;
dimension=dimensionscale;
  
    fill(255);
  rect(posX,posY,dimension,dimension);
  
}
  
  


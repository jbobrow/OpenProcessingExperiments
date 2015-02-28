
//Spirals
//by Neema Sadeghi
//2008

float angulo;
int posX,posY;

void setup(){

  size(500,500);
  background (0);

  smooth();

  angulo = 0;
  posX=250;
  posY=250;

  frameRate(30);

}

void draw(){
  background(255,142,3);

  for(int i=0; i<50; i++){

    rotaRect(10*i,10*i,angulo*i);
    angulo+=.01;

  }
}

void rotaRect(int posX,int posY,float anguloIn){
  pushMatrix();
  translate(posX,posY);
  rotate(radians(anguloIn));
  colorMode(RGB);
  fill(.55,200,100,200);
  rect(-25,-25,60,60);
  fill(255,100);
  rect(-55,-55,60,60);
  posX+=.01;
  posY+=.05;
  popMatrix();
}




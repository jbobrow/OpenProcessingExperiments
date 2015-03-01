
int total = 40;
float mida=30;
float [] bolaX = new float [total];
float [] bolaY = new float [total];
float [] velX = new float [total];
float [] velY = new float [total];


void setup () {
  size (500, 400);
  for (int i=0; i<total; i++){
    bolaX[i]= random (width);
    bolaY[i] = random (height);
    velX[i]= random (-5,10);
    velY[i]=random (-5,10);
  }
}

void draw () {
 background (0,0, 255);
  for (int i=0;i<width; i= i+10){
    stroke (random (255),0,0);
      line (i,0,mouseX,mouseY);
  line (0,i,mouseX,mouseY);
  line (width,i, mouseX,mouseY);
  line (i,height,mouseX,mouseY);
  }
  for (int i=0; i<total; i++){
    bolaX[i] = bolaX[i]+velX[i];
    bolaY[i]=bolaY[i]+velY[i];
    ellipse (bolaX[i], bolaY[i], mida, mida);
    if (bolaX[i] + mida >= width || bolaX[i] - mida <= 0)  {
      velX [i]=-velX[i];
    }
      if (bolaY[i] + mida >=height || bolaY[i] - mida <=0) {
        velY [i] = -velY [i];
    }
  }
 
}
void mousePressed (){
  mida = random (10,30);
  fill (0, random (255), 0);
  background (0,0,random (255));
for (int i=0; i<total; i++){
  bolaX[i] = mouseX;
  bolaY[i]= mouseY;
}
}





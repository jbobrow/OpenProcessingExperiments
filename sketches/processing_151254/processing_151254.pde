
void setup() {
  size (800,600);
  background (200);
  rectMode(CORNER);
  noStroke();
  frameRate(1);
}

void draw() {

background (0);
int sizeW=(int) random(200,800);
int sizeH=(int) random(100,600);
//size (sizeW, sizeH);

int num=5; //random number of square
int gap=(int) random(2,40); //random number of gap between square

float csizeH = (sizeH - (num+1) * gap) / (float)num;
float csizeW = (sizeW - (num+1) * gap) / (float)num;

for (int i=0; i<num; i++) {
  
  for (int j=0; j<num; j++) {
    int col=(int) random(10,50);
    int alpha=(int) random(1,100);
      fill(247+col, 57-col, 57+col);
      rect( (400-sizeW/2) + gap * (i+1) + csizeW*i, (300-sizeH/2) + gap*(j+1) + csizeH*j, csizeW, csizeH, alpha)  ;
   
    
  }
}

}


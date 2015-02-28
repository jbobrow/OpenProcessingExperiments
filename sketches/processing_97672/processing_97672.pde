
int totalElements=20;

float[] pX=new float [totalElements];
float[] pY=new float [totalElements];
float[] vX=new float [totalElements];
float[] vY=new float [totalElements];

void setup() {
size(255, 255);
stroke(255, 0,0);
strokeWeight(1);

for(int i=0; i<totalElements ; i++){
  pX[i]=width/2;
  pY[i]=height/2;
  vX[i]=random(-4,4);
  vY[i]=random(-4,4);
}
}

void draw(){
  background(254,255,33);
for (int i=0; i<=255; i = i +5) {
stroke(random(85),random(129),random(69));
line(width/2,height/2, width, i);
line(width/2,height/2, 0,i);
line(width/2,height/2,i,0);
line(width/2,height/2,i,height);
noStroke();
}

for(int i=0; i<totalElements ; i++){  
  pX[i] += vX[i];
  pY[i] +=vY[i];

  if(pX[i]-7< 0  || pX[i] >width-7){
    vX[i]=-vX[i];
  }
  if(pY[i]-7 < 0 || pY[i] >height-7){
    vY[i]= -vY[i];
  }
  fill(0);
  ellipse(pX[i],pY[i],15,15);
  noFill();
  fill(255,33,182);
  ellipse(pX[i],pY[i],10,10);
 

   
 }

}

void mousePressed() {
for(int i=0; i<totalElements ; i++){ 
  pX[i] += vX[i];
  pY[i] +=vY[i];
  if (true){
    vX[i]=-vX[i];
  fill(random(255),random(255),random(255));
  ellipse(pX[i]+3,pY[i]+3,30,30);
  
  }
}
}




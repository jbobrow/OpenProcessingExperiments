
float [] fiveX = new float[5];
float [] fiveY= new float[5];

void setup(){
  size(400,400);
  for(int i=0; i<5; i++){
    fiveX[i]= random(50,250);
    fiveY[i]= random(50,250);
}
}

void draw(){
    for (int i = 0; i<400;i++){
    float percent= (float)i/400;
    stroke(255*percent,0,0);
    line(0,i,400,i);
    }
    for (int i = 0; i<400;i+=40){
    stroke(0,255,0);
    line(i,0,i,400);
    }
    for (int i = 0; i<400;i+=40){
    stroke(0,255,0);
    line(0,i,400,i);
    }

shape();

pushMatrix();
translate(25,100);
rotate(radians(-30));
shape();
popMatrix();

pushMatrix();
translate(50,150);
rotate(radians(-60));
shape();
popMatrix();

pushMatrix();
translate(100,200);
rotate(radians(-90));
shape();
popMatrix();

pushMatrix();
translate(150,250);
rotate(radians(-120));
shape();
popMatrix();

}


void shape(){
  fill(255);
  stroke(0);
  
for(int j=0;j<5;j++){
    beginShape();
 for(int i=0; i<5; i++){
    vertex(fiveX[i],fiveY[i]);
 }
endShape();
}
}




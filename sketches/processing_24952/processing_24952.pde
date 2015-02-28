



size(500,1000);{
background(255);
stroke(0,50);
strokeWeight(0.8);
fill(0,25);
smooth();


for(int j=0; j<3; j++) {
  int x=100;
  int y=j*392+100;
  int radius=8;
  float expon=2;
  //expon is the exponent variable
  
  for(int i=0; i<10; i++){
    float currentRadius=pow(i+2,expon)*radius;
    ellipse(x,y,currentRadius,currentRadius);

  

  }
}

for(int j=0; j<3; j++) {
  int x=400;
  int y=j*392+100;
  int radius=8;
  float expon=2;
  //expon is the exponent variable
  
  for(int i=0; i<10; i++){
    float currentRadius=pow(i+2,expon)*radius;
    ellipse(x,y,currentRadius,currentRadius);

 
  }}
  stroke(255);
  strokeWeight(3);
for(int k=0; k<10; k++);{
  ellipse(100,100,40,40);
  ellipse(100,100,80,80);
  ellipse(100,100,120,120);
  ellipse(100,100,190,190);
  ellipse(100,100,280,280);
  ellipse(100,100,385,385);
  ellipse(100,100,505,505);
  ellipse(100,100,640,640);
  ellipse(100,100,790,790);
  ellipse(100,100,960,960);
}


}


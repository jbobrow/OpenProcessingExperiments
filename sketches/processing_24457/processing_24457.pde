
//import processing.pdf.*;




size(500,1000); //,PDF,"wallpaper3.pdf");{
background(255);
stroke(0,95);
strokeWeight(1);
fill(0,20);
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
  strokeWeight(5);
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
 //println("Finished.");
 // exit();




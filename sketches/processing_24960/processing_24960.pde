



size(500,1000);{
background(0);
stroke(255);
strokeWeight(3);
fill(255,20);
smooth();


for(int j=0; j<3; j++) {
  int x=250;
  int y=j*392+100;
  int radius=15;
  float expon=1.8;
  //expon is the exponent variable
  
  for(int i=0; i<4; i++){
    float currentRadius=pow(i+0.8,expon)*radius;
    ellipse(x,y,currentRadius,currentRadius);

  }
{
  
for(int i=0; i<4; i++){
    float currentRadius=pow(i+5,expon)*radius;
    ellipse(x,y,currentRadius,currentRadius);  
    
    //end of fat circles
   
}}}}


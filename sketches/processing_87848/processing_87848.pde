
size (500, 500);
background(255,39,39);

noStroke();
float d=2;

for (float i=(d/2); i<=width; i+=50){

  for (float j=(d/2); j<=height; j+=50){
    
    fill(i/2, 255,39,60);
    stroke (255,100);
    ellipse(i, j, 20, 20);
    
  }
  for (float k=(d/2); k<=width; k+=500){
  for (float l=(d/2); l<=height; l+=10){
   
    fill(k/2, 255,39,20);
    stroke (255,100);
    ellipse(k, l, 20, 10);
    
  }
  }
}





  size(500,500);
background(0);
noStroke();
smooth();

float dis = 100;

  background(0);
  
for(float i=1; i<=4; i++){
for(float j=1; j<=4; j++){
  
for(float k=5; k>=0; k--){
  fill(255, 0, 0);
ellipse(dis*j, dis*i, 16*k, 16*k);
fill(255);
ellipse(dis*j, dis*i, 16*(k-.5), 16*(k-.5));
}}}

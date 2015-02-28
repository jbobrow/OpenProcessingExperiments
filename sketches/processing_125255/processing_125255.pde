
size (400,400);
background(255);

rectMode(CENTER);
fill(0);

float x = 30;
float y = 30;
float w = 30;
float z = 30;

for(int i=0; i<30; i++){
  for(int j=0; j<31; j++){
  y= j*40+20;
  w = sin((40 -y)/100)*10+20;
 z = sin((40 -x)/100)*10+20;
  rect(x,y,w,z);
  }
x = x +50;


}

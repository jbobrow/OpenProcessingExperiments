
void setup(){size(410,400);}
void draw(){

//fill(0);
colorMode(HSB);
for (int i=0; i<400; i++){
  float s = map(i,0,400,0,255);
  fill(s, 255,255);
//  stroke(s, 255,255);
//  line(b,0,b,400);
//loop though with i going from 0 to height of window by 20 each time

for (int b = 0; b < width; b += 20){

  // set y location of rectangle equal to i
noStroke(); // turn off outline
//column
  rect(b, i, 10,10);
  
}}
colorMode(HSB);
for (int h=0; h<410; h++){
  float t = map(h,0,400,0,255);
  fill(t, 255,255);

  for (int a = 10; a < height; a += 20){
  for (int b = 0; b < width; b += 20){
//row
rect(h,b, 10,10);

  }}
}
}


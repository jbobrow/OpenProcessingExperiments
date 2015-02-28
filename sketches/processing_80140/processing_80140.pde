
void setup(){
  size(1000,600);
  smooth();
  background(95,8,11);
  stroke(93,2,73);
  strokeWeight(30);
  
  
}

void draw(){

for(int a=0; a<height; a+=100){
 for (int b=0; b<width; b+=100){
  fill(134,4,106,50);
  ellipse(a,b,width,300);
 }
}

for(int a=1000; a<0; a+=100){
 for (int b=600; b<0; b+=100){
  fill (85,8,95,10);
  ellipse(a,b,width,200);
 }
}
for(int a=0; a<height; a+=300){
 for (int b=0; b<width; b+=300){
   stroke(255,150);
  fill(0,29,142,10);
  ellipse(b+50,a,width-500,900);
}
}
for(int a=1000; a>0; a-=300){
 for (int b=600; b>0; b-=300){
   stroke(0,150);
  fill(0,29,142,10);
  ellipse(b,a,1000,height-450);
  stroke(93,2,73);
 }
}
 }


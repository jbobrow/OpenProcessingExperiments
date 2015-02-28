
void setup () {
size(400,400);
colorMode(RGB,400);
background(255);
rectMode(CENTER);
frameRate(10);
}
void draw () {
for(int x=0; x<width; x+=7){
if(x%2==0){
 noStroke();
fill(x);
ellipse(random(1,400), x,random(10,20),random(10,50));
}else{
fill(0,0,x);
 noStroke();
rect(random(100,300),x,random(10,20),random(10,50));
  
}
   
}
}



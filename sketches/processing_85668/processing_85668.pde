
//variables pour faire des trucs aléatoires
void setup(){
 
  size(640,480);
  background(255);
   
  rectMode(CENTER);
 
}
 
int a = 10;
int b = 50;
int c = 70;
int d = 96;
 
int i=0;
 
void draw(){
   
  a = mouseX * 2 -300;
  b = mouseY /3 +20;
  c = mouseX *2;
  d = mouseY;
fill(255);
translate (width/2, height/2);

for (int i=50; i<720; i+=10){
  rotate(radians(random(10,360)));
  
  beginShape();
  vertex(random(10,60),20);
  bezierVertex(a,b,c,d,75,75);
  endShape();
}

println(mouseX);

  i++;
   
}




PImage b;
float posX;
float posY;
float posX2;
float posY2;
 
void setup(){
 size(800,600);
 background(255);
 smooth();
   
   
}
 
void draw(){
 translate(random(width/2), random(1));
 stroke(random(127),random(127),random(127));
 strokeWeight(random(12));
 line(random(width), random(height), width/2,height/2);
 
b = loadImage("face.png");

for (int i =0; i<300; i++){
  posX= i*noise(posX);
   posY= i*noise(posY);
  
image(b, posX+i,posY+i);
 
}
for (int i =600; i<=50; i--){
  posX2= i*noise(posX2);
   posY2= i*noise(posY2);
  
image(b, posX2+i,posY2+i);
 
}


rotate(degrees (90));

 
 
 
}



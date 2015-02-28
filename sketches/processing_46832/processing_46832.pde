
PImage b;

void setup(){
 size(800,600);
 background(255);
 smooth(); 
  
  
}

void draw(){


b = loadImage("hh.jpg");
image(b, 0, 0, width, height);
for (int i =0; i<300; i++){
  tint(255,127);  
 
image(b, random(width)+i,random(height)+i);

}
rotate(PI/2);



}


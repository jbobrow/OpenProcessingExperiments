
void setup(){
 size (200, 200);
 frameRate(1);
}
void draw(){

background(255);
float w = 190; 

  stroke(0);
while(w>9){
 stroke(5);
 fill(w);
  ellipse(100,100,w,w);
  w  = w-20;
}
}


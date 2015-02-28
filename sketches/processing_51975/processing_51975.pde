
int mode = 1;

void setup(){
 size(800,600); 
}

void draw(){
 if(mode == 1){
  background(255,0,0);
 } else if(mode == 2){
  background(0,0,255); 
 } else if(mode == 3){
   background(0,255,0);
 } //else if(..){}
}

void keyPressed(){
 if(key == '1'){
  mode = 1;
 } else if (key == '2'){
   mode = 2;
 } else if (key == '3'){
   mode = 3;
 } //else if(..){}
}


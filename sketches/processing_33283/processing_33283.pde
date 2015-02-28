
void setup(){
size(600,600); 
float value = 600;
float m = map(value, 0, 600, 0, width);
rect(0, 600, 0, 600);

frameRate(30); 
smooth(); 
}



void draw(){
// background(255,255,255);
 colorMode(RGB,255);
 stroke(225);
 for(int k=0; k<600; k++){
   for(int j=0; j<600; j++){
     
 stroke(0,j,k);
 point(k,j);
 
 
 
   }
 
 }
 }

   



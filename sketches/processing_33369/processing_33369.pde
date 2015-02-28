
void setup(){
size(600,600);
float value = 800;
float m = map(value, 50, 600, 50, width);
rect(0, 400, 0, 700);
 
frameRate(10);
smooth();
}

void draw(){
// background(255,255,255);
 colorMode(RGB,120);
 stroke(200);
 for(int k=0; k<600; k++){
   for(int j=0; j<800; j++){
      
 stroke(0,j,k);
 point(k,j);

    }
  
   }
  }
 


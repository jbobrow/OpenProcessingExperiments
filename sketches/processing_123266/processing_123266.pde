
//Exercise 3_3
//Carmen Zhou
//10-18-12

int w=100;
int h=100;

void setup(){
  background(255);
  size(500,500);
  frameRate(4);
  smooth();
}
 
void draw(){
 //grid
   strokeWeight(10);
   stroke(255,240,255,100);
   fill(255,180,255,255);
   for (int i=0;i<5;i++){
   for (int j=0;j<5;j++){
   rect(100*i,100*j,w,h);
    }
   }
//middle center square
   strokeWeight(15);
   stroke(255,130,255,200);
   fill(255,60,255,200);
   for (int k=0;k<5;k++){
   for (int l=0;l<5;l++){
   rect(100*k+20,100*l+20,60,60);
   
    }
   }
// top center square
   strokeWeight(12);
   stroke(255,40,255,200);
   fill(255,10,100,150);
   for (int k=0;k<5;k++){
   for (int l=0;l<5;l++){
   rect(100*k+40,100*l+40,20,20);
   
    }
   }
}



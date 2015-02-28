
//Exercise 3_2
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
   stroke(100,40,100,50);
   fill(90,0,255,200);
   for (int i=0;i<5;i++){
   for (int j=0;j<5;j++){
   rect(100*i,100*j,w,h);
    }
   }
//middle center square
   strokeWeight(15);
   stroke(130,0,255,200);
   fill(170,0,255,200);
   for (int k=0;k<5;k++){
   for (int l=0;l<5;l++){
   rect(100*k+20,100*l+20,60,60);
   
    }
   }
// top center square
   strokeWeight(12);
   stroke(210,0,255,100);
   fill(255,255,255,75);
   for (int k=0;k<5;k++){
   for (int l=0;l<5;l++){
   rect(100*k+40,100*l+40,20,20);
   
    }
   }
}



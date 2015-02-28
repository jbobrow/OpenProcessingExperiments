



//define variable outside setup and draw funtions:

int ex = 10;
int ey = 10;
int lengthEllipse = 1; 
int widthEllipse = 1; 
int xE = 0;
int yE= 0;
 

void setup() {

  size(400, 400);
  smooth();
  stroke(0, 102);
  fill(200);
  frameRate(80);
  
}

void draw() {
 
 for(int i=0; i<400; i=i+10){
   for(int m=0; m<200; m=m+20){
       fill(200,0,m);
       ellipse(i,m,30,30);
   }
   fill(100,100,i);
   ellipse(i,i,50,50);
   }

}




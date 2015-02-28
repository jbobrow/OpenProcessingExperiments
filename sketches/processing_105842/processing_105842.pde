
int arraySize = 80;
int [] x = new int[arraySize];
int [] y = new int[arraySize];
int [] xSpeed = new int[arraySize];
int [] ySpeed = new int[arraySize];
boolean feed = false;

 
void setup (){
  size(600,600);
  for (int i=0; i<arraySize; i++) {
    x[i]= int(random(600));
    y[i]= int(random(600));   
    xSpeed[i] = int(random(5));
    ySpeed[i] = int(random(5));
  }
}

void draw(){
   background(255);
   fill(0,191,255);
   noStroke();
   

   for (int i=0; i<arraySize; i++) {
     x[i]= x[i]+ xSpeed[i];
     y[i]= y[i]+ ySpeed[i];
     
     //fill(0,191,255) pacman can keep the blue outfit ;
     arc(x[i],y[i],30,30,0,radians(300));
     
     if (x[i] >= width) {
       xSpeed[i] = -xSpeed[i];
     }
     if (x[i] <= 0) {
       xSpeed[i] = -xSpeed[i];
     }
     if (y[i] >= width) {
       ySpeed[i] = -ySpeed[i];
     }
     if (y[i] <= 0) {
       ySpeed[i] = -ySpeed[i];
     }
     if(feed){
       fill(#FFC408);
       ellipse(random (width),random(height),15,15);
       }   
     } 
   }
  void mouseClicked() {
   feed = !feed;
   }


int state= 0;
int numStars = 500;
float[] dotX = new float[numStars];
float[] dotY= new float[numStars];
float[] velocity= new float[numStars];

float blackHoleX;
float blackHoleY;
float blackHoleVelocity;


void setup () {
    size(500,500);
    background(0,0,100);
    for (int i=0; i<numStars;i++){
    dotX[i] = random(width);
    dotY[i] = random(height);
    velocity[i] = random(5.0);
    }
    
    blackHoleX= width/2;
    blackHoleY= height/2;
    blackHoleVelocity = 0.0;
      for (int i=0; i<numStars;i++){
       if(dist(dotX[i],dotY[i],blackHoleX,blackHoleY) < 75) {
        dotX[i] = 0.5*dotX[i]+0.5*blackHoleX;
        dotY[i] = 0.5*dotY[i]+ 0.5*blackHoleY;
      }
}
}

void draw () {
   background(0,0,100);
    if(state==0)  {
       background(0,0,100);
       textSize(32);
       fill(255,255,0);
       text("Press Spacebar to begin", 75,250);
    }
        else if (state==1) {
       background(0,0,100);
       stroke(255,255,0);
       strokeWeight(10);
       for (int i=0; i<numStars; i++) {
       point(dotX[i], dotY[i]);
       
       dotX[i] += velocity[i];
       if (dotX[i]>width) {
       dotX[i]=0; 
       }
       }
       stroke(0);
       strokeWeight(25);
       point(blackHoleX, blackHoleY);
       

       }
       }


    
void keyPressed() {
    if (state==0) {
    if (key == ' ') {
    state = 1;
    }
    } else if (state==1){
    }else {
    }
}

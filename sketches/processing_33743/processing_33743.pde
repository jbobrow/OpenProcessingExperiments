
//float circlex 
float yPos = 0; 

int numCircles = 100;

//b/c we are drawing many circles we want to create an array of differnt circles
float [] circleX = new float [numCircles]; 
float [] circleY = new float [numCircles];
float[] vel = new float [numCircles]; 
float[]vely = new float [numCircles];
int rad = 10; 




void setup(){
  size(600,600); 
  smooth(); 
  stroke(0,0,0); 
  frameRate(10);
 
 fill(255,255,255); 
 for(int i = 0; i<numCircles; i++){
   circleX[i] = random(yPos, 600); 
   circleY[i] = random(yPos+rad, 600); 
   vel[i] = random(10,60);
   vely[i]=random(20,70);
 }
 
 
}


void draw(){
  background(0,0,0,50);
   bounce(); 
   make(); 
 
   
  for(int i= 0; i< numCircles; i++){
  ellipse(circleX[i],yPos+circleY[i],rad,rad); 
  }
}

void make(){
 for(int i= 0; i< numCircles; i++){
  ellipse(circleX[i],yPos+circleY[i],rad,rad); 
  }

}


void bounce(){
    for(int i =0; i<numCircles; i++){
    circleX[i] += vel[i];
    if( circleX[i]< 0 || circleX[i] > width){
    vel[i]*= -1;
     }
    }
    
     for(int i =0; i<numCircles; i++){
    circleY[i] += vely[i];
    if( circleY[i]< 0 || circleY[i] > height){
    vely[i]*= -1;
     }
    }
}

// Nidhi Malhotra helped me with this concept...we went threw the logic of bouncing items and what 
//conditions would need to be accounted for


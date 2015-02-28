
float yPos = 0; 

int numCircles = 100;

//b/c we are drawing many circles we want to create an array of differnt circles
float [] circleX = new float [numCircles]; 
float [] circleY = new float [numCircles];
float[] vel = new float [numCircles]; 

int rad = 10; 




void setup(){
  size(600,600); 
  smooth(); 
  stroke(0,0,0); 
  frameRate(8);
 
 fill(255,255,255); 
 for(int i = 0; i<numCircles; i++){
   circleX[i] = random(yPos, 600); 
   circleY[i] = random(yPos+rad, 600); 
   vel[i] = random(10,60);
   
 }
 
 
}


void draw(){
  background(180,72,247);
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
    
    
}

// Nidhi Malhotra helped me with this concept...we went threw the logic of bouncing items and what 
//conditions would need to be accounted for


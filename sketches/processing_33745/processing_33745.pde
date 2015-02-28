
//float circlex 
float yPos = 0; 
float vel = 10; 
int numCircles = 1000;
//b/c we are drawing many circles we want to create an array of differnt circles
float [] circleX = new float [numCircles]; 
float [] circleY = new float [numCircles]; 
int rad = 4; 




void setup(){
  size(600,600); 
  smooth(); 
  noStroke(); 
  frameRate(30);
 
 fill(255,255,255); 
 for(int i = 0; i<numCircles; i++){
   circleX[i] = random(yPos, 600); 
   circleY[i] = random(yPos+rad, 600); 
 }
  
}


void draw(){
  background(180,252,87);
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
  
     yPos += vel;
    if(yPos< 0 || yPos > height){
    vel*= -1; 
    }
    
}



int numCircles = 1000;
float  circleX[]= new float[numCircles];
float  circleY[] = new float[numCircles];
float  velX [] = new float[numCircles];
float  velY [] = new float[numCircles];

int rad[] = new int[numCircles];

void setup(){
  size(500,500);
  smooth();
  noStroke();

  
  
  //dif values.
  //range
  for(int i=0; i< numCircles; i++){
    rad[i]= round(random(4,26));
    //circleX[i] = round(random(rad[i], width-rad[i])); 
    //circleY[i] = round(random(rad[i], height-rad[i]));
   circleX[i] = random(0, width-rad[i]);
   circleY[i] = random(0, height-rad[i]); 
   
    velX [i]= random(10);
    velY [i]= random(10); 
    
    
 
  }
}


void draw(){
 background(0);
 
 for(int j=0; j< numCircles ; j++){
 //ellipse(circleX[i] ,circleY[i],rad,rad); 
 fill(180,0,120);
 ellipse(circleX[j] , circleY[j], rad[j], rad[j]); 
 
 circleX [j] = circleX [j] + random( velX [j]);
 circleY [j] = circleY [j] + random (velY [j]);
  
  if (circleX [j] >= 500){
    velX [j]= velX[j] *-1;
  }

   if (circleX [j] <= 0){
    velX [j]= velX[j] *-1;
  }
  
   if (circleY [j] >= 500){
    velY [j]= velY[j] *-1;
  }
 
    if (circleY [j] <= 0){
    velY [j]= velY[j] *-1;
  }
   
 
 
 
 
 
 
 
 
  }

}                               

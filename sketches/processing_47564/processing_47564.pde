
int numCircles = 1000;
float  circleX[]= new float[numCircles];
float  circleY[] = new float[numCircles];
float  velX [] = new float[numCircles];
float  velY [] = new float[numCircles];
 
float r[]= new float[numCircles];
float g[]= new float[numCircles];
float b[]= new float[numCircles];
 
 
 
 
int rad[] = new int[numCircles];
 
void setup(){
  size(1500,1500);
  smooth();
  noStroke();
 
   
   
  //dif values.
  //range
  for(int i=0; i< numCircles; i++){
    rad[i]= round(random(4,50));
 
   circleX[i] = random(0, 300);
   circleY[i] = random(30, 300);
    
    velX [i]= (15);
    velY [i]= (15);
     
     
  
  }
}
 
 
void draw(){
 background(0);
  
 for(int j=0; j< numCircles ; j++){
 //ellipse(circleX[i] ,circleY[i],rad,rad);
 stroke(255);
 strokeWeight(3);
 fill(r[j],g[j],b[j]);
 ellipse(circleX[j] , circleY[j], rad[j], rad[j]);
  
 circleX [j] = circleX [j] + random( velX [j]);
 circleY [j] = circleY [j] + random (velY [j]);
   
  if (circleX [j] >= 500){
    velX [j]= velX[j] *-1;
    r[j]=random(255);
    g[j]=random(255);
    b[j]=random(255);
  }
 
   if (circleX [j] <= 0){
    velX [j]= velX[j] *-1;
    r[j]=random(255);
    g[j]=random(255);
    b[j]=random(255);
     
  }
   
   if (circleY [j] >= 500){
    velY [j]= velY[j] *-1;
    r[j]=random(255);
    g[j]=random(255);
    b[j]=random(255);
  }
  
    if (circleY [j] <= 0){
    velY [j]= velY[j] *-1;
    r[j]=random(255);
    g[j]=random(255);
    b[j]=random(255);
  }
    
  
  
  
  
  
  
  
  
  }
 
}
 
                


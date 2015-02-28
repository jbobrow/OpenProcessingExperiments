
int time_off=500;
int time_on=400;
int last_saved_time;
int pressCount=0;
boolean light_is_on= false;
boolean bounceBall=true;

int numCircles =350;
float  circleX[]= new float[numCircles];
float  circleY[] = new float[numCircles];
float  velX [] = new float[numCircles];
float  velY [] = new float[numCircles];
float  bg []= new float[numCircles];

float r[]= new float[numCircles];
float g[]= new float[numCircles];
float b[]= new float[numCircles];

int rad[] = new int[numCircles];

void setup(){
  size(400,800);
  smooth();
  noStroke();
  

  for(int i=0; i< numCircles; i++){
    rad[i]= round(random(4,50));

   circleX[i] = random(0, 300);
   circleY[i] = random(30, 750); 
   
    velX [i]= (3);
    velY [i]= (10); 
    
    last_saved_time= millis();
    
 
  }
}


void draw(){
 background(255,200,10);
 
 for(int j=0; j< numCircles ; j++){
 //ellipse(circleX[i] ,circleY[i],rad,rad);
 stroke(200);
 strokeWeight(3); 
 fill(r[j],g[j],b[j]);
 ellipse(circleX[j] , circleY[j], rad[j], rad[j]); 
 
 circleX [j] = circleX [j] + random( velX [j]);
 circleY [j] = circleY [j] + random (velY [j]);
 
   //time_on- light
   if(light_is_on == true){
     fill(255);
     stroke(100);
     ellipse(circleX[j] , circleY[j], rad[j], rad[j]); 
     if(millis()- last_saved_time> time_on){
       light_is_on = false;
       last_saved_time= millis();
     }
     }else{
        fill(r[j],g[j],b[j]);
         ellipse(circleX[j] , circleY[j], rad[j], rad[j]); 
         
         if (time_off <millis()-last_saved_time){
           light_is_on= true;
           last_saved_time= millis();
         }
     
     }
  
  if (circleX [j] >= 400){
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
  
   if (circleY [j] >= 700){
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
  
void mousePressed(){
  bounceBall=!bounceBall;
  pressCount++;
  
  if(pressCount == 3){
  for(int i=0; i< numCircles; i++){
  velX[i]=30;
      rad[i]= (20);
  
  
  }
  
  }

  }


void keyPressed(){
   if(key == 's' || key == 'S'){
     for(int i=0; i< numCircles; i++){
     velX[i]=10;
      rad[i]= (50);
  
   }

   }
   }                            

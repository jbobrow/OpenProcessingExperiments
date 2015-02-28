
float seconds;
int i;


void setup(){
  size (1000,720);
  background (255);

  
}

void draw(){
  
noFill();
smooth();
strokeWeight (0.05);
  
seconds = int (millis () / 1000);
  
  //ellipse
  for (i = 0; i < 500; i = i + 1){
     //stroke (random(360), random(100), random(100));
     ellipse (random(width), random(height), 1500,1500);
     //rect (random(width), random(height), random(1500), random(1500));
     }
   
   //rect
   if (seconds > 30){  
   for (i = 0; i < 500; i++){
     stroke (0);
     //ellipse (random(width), random(height), 1500,1500);
     rect (random(width), random(height), random(1500), random(1500));
     }
   }
  
  //ellipse2 
  if (seconds > 40){
    for (i = 0; i < 500; i = i+1){
      //stroke (random(178), random (67), random (83));
      stroke (255);
      ellipse (random(width), random(height), 1500, 1500);
    }
  }
  
  //line    
  if (seconds > 60){
    for (i=0; i < 500; i++){
      stroke (255);
      strokeWeight(0.5);
      line (0, 0, random(width), random(height));
      line (1000, 720, random(width), random(height));
      
    }
  }
  
  //rect
  if (seconds > 70){
    for (i=0; i < 500; i = i + 1){
      stroke (0);
      strokeWeight (0.5);
      rect (random(width), random(height), random(100), random(100));
    }
  }
  
  //rect2
  if (seconds > 80){
    for (i = 0; i < 500; i = i + 1){
      stroke (255);
      strokeWeight (5);
      rect (random(width), random(height), random(100), random(100));
    }
  }
  
  //rect3
  if (seconds > 85){
    for (i = 0; i < 500; i = i + 1){
      stroke (255);
      strokeWeight (10);
      rect (random(width), random(height), random(100), random(100));
    }
  }
  
  //rect4
  if (seconds > 90){
    for (i = 0; i < 500; i = i + 1){
      stroke (255);
      strokeWeight (20);
      rect (random(width), random(height), random(100), random(100));
    }
  }
      
  //rect5
  if (seconds > 100){
    for (i = 0; i < 500; i = i + 1){
      stroke (255);
      strokeWeight (30);
      rect (random(width), random(height), random(100), random(100));
    }
  }
 
  if (seconds > 104){
  background (255);
  fill(0);
  text ("The End", width/2, height/2);
  }
 
 
      
  
}


  
    

   




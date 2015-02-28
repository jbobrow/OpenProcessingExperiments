
int myState = 1;
int counter;

void setup(){
  size(500,500);
  frameRate(3);
  counter = 2*3;
  stroke(255);
}



void draw(){
  
  switch(myState){
    
   case 1:
   println("case1");
   fill(random(255),random(255),random(255));
   rect(0, 0, 250, 250);
   counter--;
   if(counter < 0){
    myState++;
   counter = 5*3; 
     
   }
   break;
  
  
  case 2:
  println("case2");
   fill(random(255),random(255),random(255));
   rect(250, 250, 250, 250);
   counter--;
   if(counter < 0){
    myState++;
   counter = 5*3; 
     
   }
  break;
  
  
  case 3:
    println("case3");
   fill(random(255),random(255),random(255));
   rect(0, 250, 250, 250);
   counter--;
   if(counter < 0){
    myState++;
   counter = 5*3; 
     
   }
  break;
  
  
  case 4:
     println("case4");
   fill(random(255),random(255),random(255));
   rect(250, 0, 250, 250);
   counter--;
   if(counter < 0){
    myState++;
   counter = 5*3; 
   }
  break;
  
  
  case 5:
      println("case5");
   fill(random(255),random(255),random(255));
   rect(125, 125, 250, 250);
   counter--;
   if(counter < 0){
    myState = 1;
   counter = 5*3; 
   }
  break;
   
    
  }
  
  
}


void mousePressed(){
  println("stop");
  myState++;
  
  if (myState > 5){
   myState = 0; 
  }
  
}




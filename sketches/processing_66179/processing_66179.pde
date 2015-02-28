

int goingUp;
boolean myBoolean;

void setup(){
   size(500, 500);
   myBoolean = true;
   goingUp = 250;
}

void draw(){
  background(255);
  
  fill(150);
  ellipse(250, goingUp, 100, 100);
  
    if(myBoolean){                   
    goingUp = goingUp - 5;
    }
 
      else if (!myBoolean){    
      goingUp = goingUp + 5;
      }
       
    if(goingUp == 50){                   
    myBoolean = false;
    }
 
     else if(goingUp == 450){                   
     myBoolean = true;
     }
 
}



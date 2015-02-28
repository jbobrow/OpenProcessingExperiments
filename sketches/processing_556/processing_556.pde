
float posX= 0; 
float posY= 0; 
boolean dig= true; 
boolean down=true ;

 void setup(){
    size(500,500);
     ellipseMode(CENTER);
    	}
    
void draw () {
 background(255);
 noStroke();
 smooth();
  int s = second();  // Values from 0 - 59
  int m = minute();  // Values from 0 - 59
  int h = hour();    // Values from 0 - 23
   noStroke();
   //horas
  if ((down==true)&& (posY<=450)) { 
if ((posY>= 0) && ( posY<=450)) { 
  posY=posY+.2; 
}
  }
  fill(82,101,107);
 ellipse(h*2,posY, 250, 250);
 //min
 if ((down==true)&& (posY<=450)) { 
if ((posY>= 0) && ( posY<=450)) { 
  posY=posY+.3; 
}
  }
 fill(255,59,119);
 ellipse(m*2, posY, 200, 200);
 //seg
 if ((down==true)&& (posY<=450)) { 
if ((posY>= 0) && ( posY<=450)) { 
  posY=posY+.4; 
}
  }
 fill(205,255,50);
 ellipse(s*2, posY, 150, 150);  
}


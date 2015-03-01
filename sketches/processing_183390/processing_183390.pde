
int flagX = 1100;
int flagX2 = flagX - 30;
int groundY = 500;
int firstX = 220;
int units = 40;
int units2 = 20;
int gap = 20;
int secondX = firstX + units;
int secondY = groundY - units;
int thirdX = secondX + units;
int thirdY = secondY - units;
int fourthX = thirdX + units;
int fourthY = thirdY - units;
int fifthX = fourthX + units;
int fifthY = fourthY - units;
int sixthX = fifthX + units;
int sixthY = fifthY - units;
int seventhX = sixthX + units;
int seventhY = sixthY - units;
int eighthX = seventhX + units;
int eighthY = seventhY - units;
int pipeW = 60;
int pipeW2 = 70;
int floorY = 560;
boolean auto = true;
int cracks = 0;
int x1 = 0;
int y1 = 0;
int x2 = 0;
int y2 = 0;
int Salpha = 60;
int castleX = 1250;
int CY1 = groundY + 10;
int CW = 20;
int CH = 10;
int castleX2 = 1290;
int CY2 = 410;
int BW = 26;
int BH = 25;
int BY1 = 395;
int Bgap = 17;
int BY2 = 315;
int Bgap2 = 20;


void setup(){
      size(1600,600);
      background(#0779E8);
 
 //clouds
       imageMode(CENTER);
       PImage img;
       img = loadImage("2d-pixel-art-cloud-tutorial.png");
       image(img,300,100,100,100);
       image(img,800,70,100,100);
       image(img,1130,160,100,100);

 
 //Castle   
    
    fill(165,80,38);
    stroke(0);
    for(int i=0; i<6; i=i+1){
       for(int j=0; j<8; j=j+1){
          rect(castleX2+i * (CW),CY2-j * (CH),CW,CH);
       }
    }

    fill(0);
    rect(castleX2+20,CY2-60,20,60);
    rect(castleX2+80,CY2-60,20,60);
    
    fill(165,80,38);
    
       stroke(255);
    for(int i=0; i<5; i=i+1){
      rect(castleX+i * (BW+Bgap),BY1,BW,BH);
      
    }
      stroke(0);    
    for(int i=0; i<3; i=i+1){
      rect(castleX2+i * (BW+Bgap2),BY2,BW,BH);
    }
   
      
       stroke(0);
   for(int i=0; i<10; i=i+1){
       for(int j=0; j<10; j=j+1){
          rect(castleX+i * (CW),CY1-j * (CH),CW,CH);       
       }
   }   
  fill(0);
  beginShape();
  curveVertex(castleX+70,groundY+units/2);
  curveVertex(castleX+70,groundY+units/2);
  curveVertex(castleX+75,CY2+units);
  curveVertex(castleX+100,CY2+units/2);
  curveVertex(castleX+125,CY2+units);
  curveVertex(castleX+130,groundY+units/2);
  curveVertex(castleX+130,groundY+units/2);
  endShape();
  
  
      
 //flag pole     
      stroke(97,222,78);
      strokeWeight(3);
      line(flagX,500,flagX,100);
 //top of pole     
      stroke(0);
      strokeWeight(1);
      fill(80,180,66);
      ellipse(flagX,100,15,15);
 //flag     
      fill(255);
      noStroke();
      triangle(flagX,110,flagX2,110,flagX,140);
 //flag base     
      rectMode(CENTER);
      fill(175,96,42);
      stroke(0);
      strokeWeight(1);
      rect(flagX,groundY,units,units);
      
      noStroke();
      fill(115,65,30);
      rect(flagX,groundY,units2,units2);
 //bottom row     
      fill(175,96,42);
      stroke(0);
      strokeWeight(1);
      
  for(int i=0; i<9; i=i+1){
      rect(firstX+i * (units),groundY,units,units);
  }
      noStroke();
      fill(115,65,30);
  
  for(int i=0; i<9; i=i+1){
      rect(firstX+i * (units2+gap),groundY,units2,units2);
  }
  //seventh row
      fill(175,96,42);
      stroke(0);
      
      strokeWeight(1);
  for(int i=0; i<8; i=i+1){
      rect(secondX+i * (units),secondY,units,units);
  }
  
      noStroke();
      fill(115,65,30);
   
  for(int i=0; i<8; i=i+1){
      rect(secondX+i * (units2+gap),secondY,units2,units2);
  }
  //sixth row
      fill(175,96,42);
      stroke(0);
      
      strokeWeight(1);
  for(int i=0; i<7; i=i+1){
      rect(thirdX+i * (units),thirdY,units,units);
  }
  
      noStroke();
      fill(115,65,30);
   
  for(int i=0; i<7; i=i+1){
      rect(thirdX+i * (units2+gap),thirdY,units2,units2);
  }
  //fifth row
      fill(175,96,42);
      stroke(0);
      
      strokeWeight(1);
  for(int i=0; i<6; i=i+1){
      rect(fourthX+i * (units),fourthY,units,units);
  }
  
      noStroke();
      fill(115,65,30);
   
  for(int i=0; i<6; i=i+1){
      rect(fourthX+i * (units2+gap),fourthY,units2,units2);
  }
  //fourth row
      fill(175,96,42);
      stroke(0);
      
      strokeWeight(1);
  for(int i=0; i<5; i=i+1){
      rect(fifthX+i * (units),fifthY,units,units);
  }
  
      noStroke();
      fill(115,65,30);
   
  for(int i=0; i<5; i=i+1){
      rect(fifthX+i * (units2+gap),fifthY,units2,units2);
  }
  //third row
      fill(175,96,42);
      stroke(0);
      
      strokeWeight(1);
  for(int i=0; i<4; i=i+1){
      rect(sixthX+i * (units),sixthY,units,units);
  }
  
      noStroke();
      fill(115,65,30);
   
  for(int i=0; i<4; i=i+1){
      rect(sixthX+i * (units2+gap),sixthY,units2,units2);
  }
  //second row
      fill(175,96,42);
      stroke(0);
      
      strokeWeight(1);
  for(int i=0; i<3; i=i+1){
      rect(seventhX+i * (units),seventhY,units,units);
  }
  
      noStroke();
      fill(115,65,30);
   
  for(int i=0; i<3; i=i+1){
      rect(seventhX+i * (units2+gap),seventhY,units2,units2);
  }
  //top row
      fill(175,96,42);
      stroke(0);
      
      strokeWeight(1);
  for(int i=0; i<2; i=i+1){
      rect(eighthX+i * (units),eighthY,units,units);
  }
  
      noStroke();
      fill(115,65,30);
   
  for(int i=0; i<2; i=i+1){
      rect(eighthX+i * (units2+gap),eighthY,units2,units2);
  }
//Shading
  strokeCap(SQUARE);  

    line(firstX+(units/3),groundY-units/2,
           firstX+(units/3),groundY + units/2);

    //bottom row
        stroke(0,Salpha);
        strokeWeight(9);
    line(firstX-units/2,groundY+units/3,
          eighthX+(units+units/2),groundY+units/3);
    
    line(secondX+(units/3),secondY-units/2,
           secondX+(units/3),groundY + units/2);
     
    //seventh row
        stroke(0,Salpha);
        strokeWeight(9);
    line(secondX-units/2,secondY+units/3,
          eighthX+(units+units/2),secondY+units/3);
    
    line(thirdX+(units/3),thirdY-units/2,
           thirdX+(units/3),groundY + units/2);      
         
   //sixth row       
        stroke(0,Salpha);
        strokeWeight(10);
    line(thirdX-units/2,thirdY+units/3,
          eighthX+(units+units/2),thirdY+units/3);  
    
    line(fourthX+(units/3),fourthY-units/2,
           fourthX+(units/3),groundY + units/2);
          
    //fifth row        
         stroke(0,Salpha);
        strokeWeight(10);
    line(fourthX-units/2,fourthY+units/3,
          eighthX+(units+units/2),fourthY+units/3);
        
    line(fifthX+(units/3),fifthY-units/2,
           fifthX+(units/3),groundY + units/2);      
         
    //fourth row     
         stroke(0,Salpha);
        strokeWeight(10);
    line(fifthX-units/2,fifthY+units/3,
          eighthX+(units+units/2),fifthY+units/3);
          
    line(sixthX+(units/3),sixthY-units/2,
           sixthX+(units/3),groundY + units/2);
          
     //third row     
          stroke(0,Salpha);
        strokeWeight(10);
    line(sixthX-units/2,sixthY+units/3,
          eighthX+(units+units/2),sixthY+units/3);
          
     line(seventhX+(units/3),seventhY-units/2,
           seventhX+(units/3),groundY + units/2);
          
     //second row     
          stroke(0,Salpha);
        strokeWeight(10);
    line(seventhX-units/2,seventhY+units/3,
          eighthX+(units+units/2),seventhY+units/3);
          
    line(eighthX+(units/3),eighthY-units/2,
           eighthX+(units/3),groundY + units/2);      
          
     //top row    
          stroke(0,Salpha);
        strokeWeight(10);
    line(eighthX-units/2,eighthY+units/3,
          eighthX+(units+units/2),eighthY+units/3);
          
     line(eighthX+(units+units/3),eighthY-units/2,
           eighthX+(units+units/3),groundY + units/2); 
                   
 //mountains
   stroke(0);
   strokeWeight(1);
   fill(17,168,35);
   beginShape();
   curveVertex(600,600);
   curveVertex(600,600);
   curveVertex(770,430);
   curveVertex(830,430);
   curveVertex(1000,600);
   curveVertex(1000,600);
   endShape();
 
 //trees
   noStroke();
   fill(7,60,14);
   ellipse(840,490,5,15);
   ellipse(820,500,5,15);
   ellipse(770,471,5,15);
   ellipse(805,450,5,15);
   ellipse(790,440,5,15);
  
//floor      
      fill(175,96,42);
      stroke(0);
      strokeWeight(1);
      
  for(int i=0; i<25; i=i+1){
     rect(0-units+i * units * 2,floorY,units * 2,units * 2); 
  }
  //cracks
  stroke(0);
  strokeWeight(0.35);
  if(auto == true){
      cracks = int(random(6,10));
      for(int i=0; i<cracks; i=i+1){
       x1 = int(random(0,units * 2));
       y1 = int(random(520,530));
       x2 = int(random(0,units * 2));
       y2 = int(random(590,600));
       
       line(x1,y1,x2,y2);
      } 
      
      cracks = int(random(4,6));
      for(int i=0; i<cracks; i=i+1){
       x1 = int(random(units * 2,units * 4));
       y1 = int(random(520,530));
       x2 = int(random(units * 2,units * 4));
       y2 = int(random(590,600));
       
       line(x1,y1,x2,y2);
      } 
      
      cracks = int(random(4,6));
      for(int i=0; i<cracks; i=i+1){
       x1 = int(random(units * 4,units * 6));
       y1 = int(random(520,530));
       x2 = int(random(units * 4,units * 6));
       y2 = int(random(590,600));
       
       line(x1,y1,x2,y2);
      } 
      
      cracks = int(random(4,6));
      for(int i=0; i<cracks; i=i+1){
       x1 = int(random(units * 6,units * 8));
       y1 = int(random(520,530));
       x2 = int(random(units * 6,units * 8));
       y2 = int(random(590,600));
       
       line(x1,y1,x2,y2);
      } 
      
      cracks = int(random(4,6));
      for(int i=0; i<cracks; i=i+1){
       x1 = int(random(units * 8,units * 10));
       y1 = int(random(520,530));
       x2 = int(random(units * 8,units * 10));
       y2 = int(random(590,600));
       
       line(x1,y1,x2,y2);
      }
     
     cracks = int(random(4,6));
      for(int i=0; i<cracks; i=i+1){
       x1 = int(random(units * 10,units * 12));
       y1 = int(random(520,530));
       x2 = int(random(units * 10,units * 12));
       y2 = int(random(590,600));
       
       line(x1,y1,x2,y2);
      }
    
    cracks = int(random(4,6));
      for(int i=0; i<cracks; i=i+1){
       x1 = int(random(units * 12,units * 14));
       y1 = int(random(520,530));
       x2 = int(random(units * 12,units * 14));
       y2 = int(random(590,600));
       
       line(x1,y1,x2,y2);
      }
   
   cracks = int(random(4,6));
      for(int i=0; i<cracks; i=i+1){
       x1 = int(random(units * 14,units * 16));
       y1 = int(random(520,530));
       x2 = int(random(units * 14,units * 16));
       y2 = int(random(590,600));
       
       line(x1,y1,x2,y2);
      }
  
      cracks = int(random(4,6));
      for(int i=0; i<cracks; i=i+1){
       x1 = int(random(units * 16,units * 18));
       y1 = int(random(520,530));
       x2 = int(random(units * 16,units * 18));
       y2 = int(random(590,600));
       
       line(x1,y1,x2,y2);
      }
 
       cracks = int(random(4,6));
      for(int i=0; i<cracks; i=i+1){
       x1 = int(random(units * 18,units * 20));
       y1 = int(random(520,530));
       x2 = int(random(units * 18,units * 20));
       y2 = int(random(590,600));
       
       line(x1,y1,x2,y2);
      }   
   
       cracks = int(random(4,6));
      for(int i=0; i<cracks; i=i+1){
       x1 = int(random(units * 20,units * 22));
       y1 = int(random(520,530));
       x2 = int(random(units * 20,units * 22));
       y2 = int(random(590,600));
       
       line(x1,y1,x2,y2);
      }  
    
        cracks = int(random(4,6));
      for(int i=0; i<cracks; i=i+1){
       x1 = int(random(units * 22,units * 24));
       y1 = int(random(520,530));
       x2 = int(random(units * 22,units * 24));
       y2 = int(random(590,600));
       
       line(x1,y1,x2,y2);
      } 
    
        cracks = int(random(4,6));
      for(int i=0; i<cracks; i=i+1){
       x1 = int(random(units * 24,units * 26));
       y1 = int(random(520,530));
       x2 = int(random(units * 24,units * 26));
       y2 = int(random(590,600));
       
       line(x1,y1,x2,y2);
      }  
     
         cracks = int(random(4,6));
      for(int i=0; i<cracks; i=i+1){
       x1 = int(random(units * 26,units * 28));
       y1 = int(random(520,530));
       x2 = int(random(units * 26,units * 28));
       y2 = int(random(590,600));
       
       line(x1,y1,x2,y2);
      }  
      
        cracks = int(random(4,6));
      for(int i=0; i<cracks; i=i+1){
       x1 = int(random(units * 28,units * 30));
       y1 = int(random(520,530));
       x2 = int(random(units * 28,units * 30));
       y2 = int(random(590,600));
       
       line(x1,y1,x2,y2);
      }
     
       cracks = int(random(4,6));
      for(int i=0; i<cracks; i=i+1){
       x1 = int(random(units * 30,units * 32));
       y1 = int(random(520,530));
       x2 = int(random(units * 30,units * 32));
       y2 = int(random(590,600));
       
       line(x1,y1,x2,y2);
      }  
      
      cracks = int(random(4,6));
      for(int i=0; i<cracks; i=i+1){
       x1 = int(random(units * 32,units * 34));
       y1 = int(random(520,530));
       x2 = int(random(units * 32,units * 34));
       y2 = int(random(590,600));
       
       line(x1,y1,x2,y2);
      } 
      
        cracks = int(random(4,6));
      for(int i=0; i<cracks; i=i+1){
       x1 = int(random(units * 34,units * 36));
       y1 = int(random(520,530));
       x2 = int(random(units * 34,units * 36));
       y2 = int(random(590,600));
       
       line(x1,y1,x2,y2);
      } 
      
        cracks = int(random(4,6));
      for(int i=0; i<cracks; i=i+1){
       x1 = int(random(units * 36,units * 38));
       y1 = int(random(520,530));
       x2 = int(random(units * 36,units * 38));
       y2 = int(random(590,600));
       
       line(x1,y1,x2,y2);
      } 
      
      cracks = int(random(4,6));
      for(int i=0; i<cracks; i=i+1){
       x1 = int(random(units * 38,units * 40));
       y1 = int(random(520,530));
       x2 = int(random(units * 38,units * 40));
       y2 = int(random(590,600));
       
       line(x1,y1,x2,y2);
      } 

  }
    
  //pipe with shading
  stroke(0);
  strokeWeight(1);
  fill(48,193,41);
  rect(firstX -(units +gap), groundY, pipeW ,units);
  rect(firstX -(units +gap), secondY, pipeW2 ,units);
  noStroke();
  fill(39,157,33);
  rect(firstX -(gap+pipeW/2),groundY,pipeW/2,units);
  rect(firstX -(gap+pipeW/2),secondY,pipeW/2,pipeW2/2);
  stroke(0);
  strokeWeight(2);
  line(firstX -(units +gap+pipeW/2),groundY-units/2,
        firstX -(units +gap+pipeW/2),groundY+units/2);
  line(firstX -(units +gap+pipeW/2),groundY-units/2,firstX -pipeW/2,groundY-units/2);
  


}

void draw(){
}



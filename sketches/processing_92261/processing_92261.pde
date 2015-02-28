
int myState = 0 ;


void setup() {
  size(500,500);
  
  
}

 

void draw() {
  
  background(#F7F7E6) ;
  noStroke();
  
  println("mouseY = " + mouseY) ;
  println("mouseX = " + mouseX) ;

  switch(myState) {
    
  case 0 :
  
  fill(0);
  text("(press a key)", 210, 100); 
  
  fill(#FAFF00); 
  rect(150, 250, 100, 100);

  fill(255,0,0); 
  rect(150, 150, 100, 100);
 
  fill(0,0,255); 
  rect(250, 150, 100, 100);

  fill(0,255,0);  
  rect(width/2, height/2, 100, 100);
   
  break;
   


  case 1 :
  
  fill(0);
  text("try again :)", 210, 100); 
  
  fill(0,255,0);
  rect(150, 250, 100, 100);
  
  fill(#FAFF00); 
  rect(150, 150, 100, 100);
  
  fill(255,0,0); 
  rect(250, 150, 100, 100);
  
  fill(0,0,255);
  rect(width/2, height/2, 100, 100);

  break;
  
  
  case 2 :
  
  
  fill(0,0,255);
  rect(150, 250, 100, 100);
  
  fill(0,255,0); 
  rect(150, 150, 100, 100);
  
  fill(#FAFF00); 
  rect(250, 150, 100, 100);
  
  fill(255,0,0);
  rect(width/2, height/2, 100, 100);

  break;
  
  
  case 3 :
  
  
  fill(255,0,0);
  rect(150, 250, 100, 100);
  
  fill(0,0,255); 
  rect(150, 150, 100, 100);
  
  fill(0,255,0); 
  rect(250, 150, 100, 100);
  
  fill(#FAFF00);
  rect(width/2, height/2, 100, 100);

  break;
  
  case 4 :
  
  
  fill(#FAFF00); 
  rect(150, 250, 100, 100);

  fill(255,0,0); 
  rect(150, 150, 100, 100);
 
  fill(0,0,255); 
  rect(250, 150, 100, 100);

  fill(0,255,0);  
  rect(width/2, height/2, 100, 100);
  
  fill(0,0,255); 
  rect(150, 50, 100, 100);

  break;
  
  case 5 :
  
  
  fill(0,255,0);
  rect(150, 250, 100, 100);
  
  fill(#FAFF00); 
  rect(150, 150, 100, 100);
  
  fill(255,0,0); 
  rect(250, 150, 100, 100);
  
  fill(0,0,255);
  rect(width/2, height/2, 100, 100);
  
  fill(0,0,255); 
  rect(250, 50, 100, 100);
  
  fill(255,0,0); 
  rect(150, 50, 100, 100);

  break;
  
  case 6 :
  
  
  fill(0,0,255);
  rect(150, 250, 100, 100);
  
  fill(0,255,0); 
  rect(150, 150, 100, 100);
  
  fill(#FAFF00); 
  rect(250, 150, 100, 100);
  
  fill(255,0,0);
  rect(width/2, height/2, 100, 100);
  
  fill(0,0,255); 
  rect(350, 50, 100, 100);
  
  fill(255,0,0); 
  rect(250, 50, 100, 100);
  
  fill(#FAFF00); 
  rect(150, 50, 100, 100);

  break;
  
  case 7 :
  
  
  fill(255,0,0);
  rect(150, 250, 100, 100);
  
  fill(0,0,255); 
  rect(150, 150, 100, 100);
  
  fill(0,255,0); 
  rect(250, 150, 100, 100);
  
  fill(#FAFF00);
  rect(width/2, height/2, 100, 100);
  
  fill(0,0,255); 
  rect(350, 150, 100, 100);
  
  fill(255,0,0); 
  rect(350, 50, 100, 100);
  
  fill(#FAFF00); 
  rect(250, 50, 100, 100);
  
  fill(0,255,0); 
  rect(150, 50, 100, 100);

  break;
  
  case 8 :
  
  
  fill(#FAFF00); 
  rect(150, 250, 100, 100);

  fill(255,0,0); 
  rect(150, 150, 100, 100);
 
  fill(0,0,255); 
  rect(250, 150, 100, 100);

  fill(0,255,0);  
  rect(width/2, height/2, 100, 100);
  
  fill(0,0,255); 
  rect(150, 50, 100, 100);
  
  fill(0,0,255); 
  rect(350, 250, 100, 100);
  
  fill(255,0,0); 
  rect(350, 150, 100, 100);
  
  fill(#FAFF00); 
  rect(350, 50, 100, 100);
  
  fill(0,255,0); 
  rect(250, 50, 100, 100);
  
  fill(0,0,255); 
  rect(150, 50, 100, 100);

  break;
  
  case 9 :
  
  
  fill(0,255,0);
  rect(150, 250, 100, 100);
  
  fill(#FAFF00); 
  rect(150, 150, 100, 100);
  
  fill(255,0,0); 
  rect(250, 150, 100, 100);
  
  fill(0,0,255);
  rect(width/2, height/2, 100, 100);
 
  
  fill(0,0,255); 
  rect(350, 350, 100, 100);
  
  fill(255,0,0); 
  rect(350, 250, 100, 100);
  
  fill(#FAFF00); 
  rect(350, 150, 100, 100);
  
  fill(0,255,0); 
  rect(350, 50, 100, 100);
  
  fill(0,0,255); 
  rect(250, 50, 100, 100);
  
  fill(255,0,0); 
  rect(150, 50, 100, 100);

  break;
  
  case 10 :
  
  
  fill(0,255,0);
  rect(150, 150, 100, 100);
  
  fill(#FAFF00); 
  rect(250, 150, 100, 100);
  
  fill(255,0,0); 
  rect(250, 250, 100, 100);
  
  fill(0,0,255);
  rect(150, 250, 100, 100);
 
  
  fill(0,0,255); 
  rect(250, 350, 100, 100);
  
  fill(255,0,0); 
  rect(350, 350, 100, 100);
  
  fill(#FAFF00); 
  rect(350, 250, 100, 100);
  
  fill(0,255,0); 
  rect(350, 150, 100, 100);
  
  fill(0,0,255); 
  rect(350, 50, 100, 100);
  
  fill(255,0,0); 
  rect(250, 50, 100, 100);
  
  fill(#FAFF00); 
  rect(150, 50, 100, 100);

  break;
  
  case 11 :
  
  
  fill(0,255,0);
  rect(250, 150, 100, 100);
  
  fill(#FAFF00); 
  rect(250, 250, 100, 100);
  
  fill(255,0,0); 
  rect(150, 250, 100, 100);
  
  fill(0,0,255);
  rect(150, 150, 100, 100);
 
  
  fill(0,0,255); 
  rect(150, 350, 100, 100);
  
  fill(255,0,0); 
  rect(250, 350, 100, 100);
  
  fill(#FAFF00); 
  rect(350, 350, 100, 100);
  
  fill(0,255,0); 
  rect(350, 250, 100, 100);
  
  fill(0,0,255); 
  rect(350, 150, 100, 100);
  
  fill(255,0,0); 
  rect(350, 50, 100, 100);
  
  fill(#FAFF00); 
  rect(250, 50, 100, 100); 
  
  fill(0,255,0); 
  rect(150, 50, 100, 100);

  break;
  
  
  case 12 :
  
  
  fill(0,255,0);
  rect(250, 250, 100, 100);
  
  fill(#FAFF00); 
  rect(150, 250, 100, 100);
  
  fill(255,0,0); 
  rect(150, 150, 100, 100);
  
  fill(0,0,255);
  rect(250, 150, 100, 100);
 
  
  fill(0,0,255); 
  rect(50, 350, 100, 100);
  
  fill(255,0,0); 
  rect(150, 350, 100, 100);
  
  fill(#FAFF00); 
  rect(250, 350, 100, 100);
  
  fill(0,255,0); 
  rect(350, 350, 100, 100);
  
  fill(0,0,255); 
  rect(350, 250, 100, 100);
  
  fill(255,0,0); 
  rect(350, 150, 100, 100);
  
  fill(#FAFF00); 
  rect(350, 50, 100, 100);
  
  fill(0,255,0); 
  rect(250, 50, 100, 100);
  
  fill(0,0,255); 
  rect(150, 50, 100, 100);

  break;
  
  
  case 13 :
  
  
  fill(0,255,0);
  rect(150, 250, 100, 100);
  
  fill(#FAFF00); 
  rect(150, 150, 100, 100);
  
  fill(255,0,0); 
  rect(250, 150, 100, 100);
  
  fill(0,0,255);
  rect(250, 250, 100, 100);
 
  
  fill(0,0,255); 
  rect(50, 250, 100, 100);
  
  fill(255,0,0); 
  rect(50, 350, 100, 100);
  
  fill(#FAFF00); 
  rect(150, 350, 100, 100);
  
  fill(0,255,0); 
  rect(250, 350, 100, 100);
  
  fill(0,0,255); 
  rect(350, 350, 100, 100);
  
  fill(255,0,0); 
  rect(350, 250, 100, 100);
  
  fill(#FAFF00); 
  rect(350, 150, 100, 100);
  
  fill(0,255,0); 
  rect(350, 50, 100, 100);
  
  fill(0,0,255); 
  rect(250, 50, 100, 100);
  
  fill(255,0,0); 
  rect(150, 50, 100, 100);

  break;
  
  case 14 :
  
  
  fill(0,255,0);
  rect(150, 150, 100, 100);
  
  fill(#FAFF00); 
  rect(250, 150, 100, 100);
  
  fill(255,0,0); 
  rect(250, 250, 100, 100);
  
  fill(0,0,255);
  rect(150, 250, 100, 100);
 
  
  fill(0,0,255); 
  rect(50, 150, 100, 100);
  
  fill(255,0,0); 
  rect(50, 250, 100, 100);
  
  fill(#FAFF00); 
  rect(50, 350, 100, 100);
  
  fill(0,255,0); 
  rect(150, 350, 100, 100);
  
  fill(0,0,255); 
  rect(250, 350, 100, 100);
  
  fill(255,0,0); 
  rect(350, 350, 100, 100);
  
  fill(#FAFF00); 
  rect(350, 250, 100, 100);
  
  fill(0,255,0); 
  rect(350, 150, 100, 100);
  
  fill(0,0,255); 
  rect(350, 50, 100, 100);
  
  fill(255,0,0); 
  rect(250, 50, 100, 100);
  
  fill(#FAFF00); 
  rect(150, 50, 100, 100);

  break;
  
  case 15 :
  
  
  fill(0,255,0);
  rect(250, 150, 100, 100);
  
  fill(#FAFF00); 
  rect(250, 250, 100, 100);
  
  fill(255,0,0); 
  rect(150, 250, 100, 100);
  
  fill(0,0,255);
  rect(150, 150, 100, 100);
 
  
  fill(0,0,255); 
  rect(50, 50, 100, 100);
  
  fill(255,0,0); 
  rect(50, 150, 100, 100);
  
  fill(#FAFF00); 
  rect(50, 250, 100, 100);
  
  fill(0,255,0); 
  rect(50, 350, 100, 100);
  
  fill(0,0,255); 
  rect(150, 350, 100, 100);
  
  fill(255,0,0); 
  rect(250, 350, 100, 100);
  
  fill(#FAFF00); 
  rect(350, 350, 100, 100);
  
  fill(0,255,0); 
  rect(350, 250, 100, 100);
  
  fill(0,0,255); 
  rect(350, 150, 100, 100);
  
  fill(255,0,0); 
  rect(350, 50, 100, 100);
  
  fill(#FAFF00); 
  rect(250, 50, 100, 100);
  
  fill(0,255,0); 
  rect(150, 50, 100, 100);

  break;
  
  case 16 :
  
  
  fill((random(255)),(random(255)),(random(255)));
  rect(250, 150, 100, 100);
  
  fill((random(255)),(random(255)),(random(255))); 
  rect(250, 250, 100, 100);
  
  fill((random(255)),(random(255)),(random(255))); 
  rect(150, 250, 100, 100);
  
  fill((random(255)),(random(255)),(random(255)));
  rect(150, 150, 100, 100);
 
  
  fill((random(255)),(random(255)),(random(255))); 
  rect(50, 50, 100, 100);
  
  fill((random(255)),(random(255)),(random(255))); 
  rect(50, 150, 100, 100);
  
  fill((random(255)),(random(255)),(random(255))); 
  rect(50, 250, 100, 100);
  
  fill((random(255)),(random(255)),(random(255))); 
  rect(50, 350, 100, 100);
  
  fill((random(255)),(random(255)),(random(255)));
  rect(150, 350, 100, 100);
  
  fill((random(255)),(random(255)),(random(255))); 
  rect(250, 350, 100, 100);
  
  fill((random(255)),(random(255)),(random(255))); 
  rect(350, 350, 100, 100);
  
  fill((random(255)),(random(255)),(random(255))); 
  rect(350, 250, 100, 100);
  
  fill((random(255)),(random(255)),(random(255))); 
  rect(350, 150, 100, 100);
  
  fill((random(255)),(random(255)),(random(255))); 
  rect(350, 50, 100, 100);
  
  fill((random(255)),(random(255)),(random(255))); 
  rect(250, 50, 100, 100);
  
  fill((random(255)),(random(255)),(random(255))); 
  rect(150, 50, 100, 100);

  break;
  
  
}
}

void keyPressed() {
  
  myState = myState + 1  ;
   
  if (myState > 16) {
    myState = 16 ;
  }
}





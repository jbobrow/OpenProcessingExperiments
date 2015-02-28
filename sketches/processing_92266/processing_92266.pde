
/* @pjs font="Nosifer-Regular.ttf" ; */

int myState = 63 ;

int myCtr ; 

int x = 0 ;

PFont myFont ;

void setup() {
  size(800,800);
  frameRate(24) ;
  myCtr = 0 ;
  
  myFont = createFont("Nosifer-Regular.ttf", 60);
textFont(myFont, 60);

  
  
}

 

void draw() {
  
  background(#F7F7E6) ;
  noStroke();
 
 
  switch(myState) {
 
  case 0: 
 

    
  fill(255);
  ellipse(width/2, height/2, 1100, 1100);  
  
  fill(0);
  ellipse(width/2, height/2, 1/2, 1/2);
  
  fill(255);
  ellipse(width/2, height/2, 1, 1);
  
  fill(0);
  ellipse(width/2, height/2, 2, 2);
  
  fill(255);
  ellipse(width/2, height/2, 3, 3);
  
  fill(0);
  ellipse(width/2, height/2, 4, 4);
  
  fill(255);
  ellipse(width/2, height/2, 5, 5);
  
  fill(0);
  ellipse(width/2, height/2, 6, 6);
    
  fill(255);
  ellipse(width/2, height/2, 8, 8);
    
  fill(0);
  ellipse(width/2, height/2, 10, 10);
    
  fill(255);
  ellipse(width/2, height/2, 20, 20);
  
  fill(0);
  ellipse(width/2, height/2, 40, 40);
    
    fill(255);
  ellipse(width/2, height/2, 60, 60);
    
    fill(0);
  ellipse(width/2, height/2, 80, 80);
  
    fill(255);
  ellipse(width/2, height/2, 100, 100);
    
  fill(0);
  ellipse(width/2, height/2, 120, 120);
  
    fill(255);
  ellipse(width/2, height/2, 140, 140);
    
    fill(0);
  ellipse(width/2, height/2, 160, 160);
  
    fill(255);
  ellipse(width/2, height/2, 180, 180);  
    
    fill(0);
  ellipse(width/2, height/2, 200, 200);
    
    fill(255);
  ellipse(width/2, height/2, 220, 220);
    
    fill(0);
  ellipse(width/2, height/2, 240, 240);
    
    fill(255);
  ellipse(width/2, height/2, 260, 260);
    
    fill(0);
  ellipse(width/2, height/2, 280, 280);
    
    fill(255);
  ellipse(width/2, height/2, 300, 300);
    
    fill(0);
  ellipse(width/2, height/2, 320, 320);
    
    fill(255);
  ellipse(width/2, height/2, 340, 340);
  
    fill(0);
  ellipse(width/2, height/2, 360, 360);
    
    fill(255);
  ellipse(width/2, height/2, 380, 380);
    
    fill(0);
  ellipse(width/2, height/2, 400, 400);
    
    fill(255);
  ellipse(width/2, height/2, 420, 420);
    
    fill(0);
  ellipse(width/2, height/2, 440, 440);
    
    fill(255);
  ellipse(width/2, height/2, 460, 460);
      
    fill(0);
  ellipse(width/2, height/2, 480, 480);
    
    fill(255);
  ellipse(width/2, height/2, 500, 500);  
    
    fill(0);
  ellipse(width/2, height/2, 520, 520);
    
    fill(255);
  ellipse(width/2, height/2, 540, 540);
    
    fill(0);
  ellipse(width/2, height/2, 560, 560);
    
    fill(255);
  ellipse(width/2, height/2, 580, 580);
    
    fill(0);
  ellipse(width/2, height/2, 600, 600);
    
    fill(255);
  ellipse(width/2, height/2, 620, 620);
    
    fill(0);
  ellipse(width/2, height/2, 640, 640);
    
    fill(255);
  ellipse(width/2, height/2, 660, 660);
    
    fill(0);
  ellipse(width/2, height/2, 680, 680);
    
    fill(255);
  ellipse(width/2, height/2, 700, 700);
    
    fill(0);
  ellipse(width/2, height/2, 720, 720);
    
    fill(255);
  ellipse(width/2, height/2, 740, 740);
     
    fill(0);
  ellipse(width/2, height/2, 760, 760);
    
    fill(255);
  ellipse(width/2, height/2, 780, 780);
    
    fill(0);
  ellipse(width/2, height/2, 800, 800);
    
    fill(255);
  ellipse(width/2, height/2, 820, 820);
    
    fill(0);
  ellipse(width/2, height/2, 840, 840);
    
    fill(255);
  ellipse(width/2, height/2, 860, 860);
    
    fill(0);
  ellipse(width/2, height/2, 880, 880);
    
    fill(255);
  ellipse(width/2, height/2, 900, 900); 
    
    fill(0);
  ellipse(width/2, height/2, 920, 920);  
    
    fill(255);
  ellipse(width/2, height/2, 940, 940);
  
    fill(0);
  ellipse(width/2, height/2, 960, 960);
    
    fill(255);
  ellipse(width/2, height/2, 980, 980);
    
    fill(0);
  ellipse(width/2, height/2, 1000, 1000);
    
    fill(255);
  ellipse(width/2, height/2, 1020, 1020);
    
    fill(0);
  ellipse(width/2, height/2, 1040, 1040);  
    
    fill(255);
  ellipse(width/2, height/2, 1060, 1060);
 
   fill(#FF0303);
 rect(0, x-820, 900 , 900) ;
 
 x = x + 3 ;
 
 if (x > 800) {
   x = 800 ; }
   
    
 fill(255);
 println("hello") ;
 textAlign(CENTER) ;
  text("You've been eaten!!!!!", width/2, height/2, 300, 300) ;
   
   
  
  break;
  
  case 1:
  
  
  fill(0);
  ellipse(width/2, height/2, 1080, 1080);
  
  fill(0);
  ellipse(width/2, height/2, 1/2, 1/2);
  
  fill(255);
  ellipse(width/2, height/2, 1, 1);
  
  fill(0);
  ellipse(width/2, height/2, 2, 2);
  
  fill(255);
  ellipse(width/2, height/2, 3, 3);
  
  fill(0);
  ellipse(width/2, height/2, 4, 4);
  
  fill(255);
  ellipse(width/2, height/2, 5, 5);
  
  fill(0);
  ellipse(width/2, height/2, 6, 6);
    
  fill(255);
  ellipse(width/2, height/2, 8, 8);
    
  fill(0);
  ellipse(width/2, height/2, 10, 10);
    
  fill(255);
  ellipse(width/2, height/2, 20, 20);
  
  fill(0);
  ellipse(width/2, height/2, 40, 40);
    
    fill(255);
  ellipse(width/2, height/2, 60, 60);
    
    fill(0);
  ellipse(width/2, height/2, 80, 80);
  
    fill(255);
  ellipse(width/2, height/2, 100, 100);
    
  fill(0);
  ellipse(width/2, height/2, 120, 120);
  
    fill(255);
  ellipse(width/2, height/2, 140, 140);
    
    fill(0);
  ellipse(width/2, height/2, 160, 160);
  
    fill(255);
  ellipse(width/2, height/2, 180, 180);  
    
    fill(0);
  ellipse(width/2, height/2, 200, 200);
    
    fill(255);
  ellipse(width/2, height/2, 220, 220);
    
    fill(0);
  ellipse(width/2, height/2, 240, 240);
    
    fill(255);
  ellipse(width/2, height/2, 260, 260);
    
    fill(0);
  ellipse(width/2, height/2, 280, 280);
    
    fill(255);
  ellipse(width/2, height/2, 300, 300);
    
    fill(0);
  ellipse(width/2, height/2, 320, 320);
    
    fill(255);
  ellipse(width/2, height/2, 340, 340);
  
    fill(0);
  ellipse(width/2, height/2, 360, 360);
    
    fill(255);
  ellipse(width/2, height/2, 380, 380);
    
    fill(0);
  ellipse(width/2, height/2, 400, 400);
    
    fill(255);
  ellipse(width/2, height/2, 420, 420);
    
    fill(0);
  ellipse(width/2, height/2, 440, 440);
    
    fill(255);
  ellipse(width/2, height/2, 460, 460);
      
    fill(0);
  ellipse(width/2, height/2, 480, 480);
    
    fill(255);
  ellipse(width/2, height/2, 500, 500);  
    
    fill(0);
  ellipse(width/2, height/2, 520, 520);
    
    fill(255);
  ellipse(width/2, height/2, 540, 540);
    
    fill(0);
  ellipse(width/2, height/2, 560, 560);
    
    fill(255);
  ellipse(width/2, height/2, 580, 580);
    
    fill(0);
  ellipse(width/2, height/2, 600, 600);
    
    fill(255);
  ellipse(width/2, height/2, 620, 620);
    
    fill(0);
  ellipse(width/2, height/2, 640, 640);
    
    fill(255);
  ellipse(width/2, height/2, 660, 660);
    
    fill(0);
  ellipse(width/2, height/2, 680, 680);
    
    fill(255);
  ellipse(width/2, height/2, 700, 700);
    
    fill(0);
  ellipse(width/2, height/2, 720, 720);
    
    fill(255);
  ellipse(width/2, height/2, 740, 740);
     
    fill(0);
  ellipse(width/2, height/2, 760, 760);
    
    fill(255);
  ellipse(width/2, height/2, 780, 780);
    
    fill(0);
  ellipse(width/2, height/2, 800, 800);
    
    fill(255);
  ellipse(width/2, height/2, 820, 820);
    
    fill(0);
  ellipse(width/2, height/2, 840, 840);
    
    fill(255);
  ellipse(width/2, height/2, 860, 860);
    
    fill(0);
  ellipse(width/2, height/2, 880, 880);
    
    fill(255);
  ellipse(width/2, height/2, 900, 900); 
    
    fill(0);
  ellipse(width/2, height/2, 920, 920);  
    
    fill(255);
  ellipse(width/2, height/2, 940, 940);
  
    fill(0);
  ellipse(width/2, height/2, 960, 960);
    
    fill(255);
  ellipse(width/2, height/2, 980, 980);
    
    fill(0);
  ellipse(width/2, height/2, 1000, 1000);
    
    fill(255);
  ellipse(width/2, height/2, 1020, 1020);
    
    fill(0);
  ellipse(width/2, height/2, 1040, 1040);  
    
    fill(255);
  ellipse(width/2, height/2, 1060, 1060);
    
    fill(0);
  ellipse(width/2, height/2, 1080, 1080);
  
  myCtr-- ;
    if (myCtr < 0) {
      myState = 0 ;
      myCtr = 3 ; 
    }
  
  break;
  
  case 2:
  
  fill(255);
  ellipse(width/2, height/2, 1060, 1060);
  
  fill(0);
  ellipse(width/2, height/2, 1/2, 1/2);
  
  fill(255);
  ellipse(width/2, height/2, 1, 1);
  
  fill(0);
  ellipse(width/2, height/2, 2, 2);
  
  fill(255);
  ellipse(width/2, height/2, 3, 3);
  
  fill(0);
  ellipse(width/2, height/2, 4, 4);
  
  fill(255);
  ellipse(width/2, height/2, 5, 5);
  
  fill(0);
  ellipse(width/2, height/2, 6, 6);
    
  fill(255);
  ellipse(width/2, height/2, 8, 8);
    
  fill(0);
  ellipse(width/2, height/2, 10, 10);
    
  fill(255);
  ellipse(width/2, height/2, 20, 20);
  
  fill(0);
  ellipse(width/2, height/2, 40, 40);
    
    fill(255);
  ellipse(width/2, height/2, 60, 60);
    
    fill(0);
  ellipse(width/2, height/2, 80, 80);
  
    fill(255);
  ellipse(width/2, height/2, 100, 100);
    
  fill(0);
  ellipse(width/2, height/2, 120, 120);
  
    fill(255);
  ellipse(width/2, height/2, 140, 140);
    
    fill(0);
  ellipse(width/2, height/2, 160, 160);
  
    fill(255);
  ellipse(width/2, height/2, 180, 180);  
    
    fill(0);
  ellipse(width/2, height/2, 200, 200);
    
    fill(255);
  ellipse(width/2, height/2, 220, 220);
    
    fill(0);
  ellipse(width/2, height/2, 240, 240);
    
    fill(255);
  ellipse(width/2, height/2, 260, 260);
    
    fill(0);
  ellipse(width/2, height/2, 280, 280);
    
    fill(255);
  ellipse(width/2, height/2, 300, 300);
    
    fill(0);
  ellipse(width/2, height/2, 320, 320);
    
    fill(255);
  ellipse(width/2, height/2, 340, 340);
  
    fill(0);
  ellipse(width/2, height/2, 360, 360);
    
    fill(255);
  ellipse(width/2, height/2, 380, 380);
    
    fill(0);
  ellipse(width/2, height/2, 400, 400);
    
    fill(255);
  ellipse(width/2, height/2, 420, 420);
    
    fill(0);
  ellipse(width/2, height/2, 440, 440);
    
    fill(255);
  ellipse(width/2, height/2, 460, 460);
      
    fill(0);
  ellipse(width/2, height/2, 480, 480);
    
    fill(255);
  ellipse(width/2, height/2, 500, 500);  
    
    fill(0);
  ellipse(width/2, height/2, 520, 520);
    
    fill(255);
  ellipse(width/2, height/2, 540, 540);
    
    fill(0);
  ellipse(width/2, height/2, 560, 560);
    
    fill(255);
  ellipse(width/2, height/2, 580, 580);
    
    fill(0);
  ellipse(width/2, height/2, 600, 600);
    
    fill(255);
  ellipse(width/2, height/2, 620, 620);
    
    fill(0);
  ellipse(width/2, height/2, 640, 640);
    
    fill(255);
  ellipse(width/2, height/2, 660, 660);
    
    fill(0);
  ellipse(width/2, height/2, 680, 680);
    
    fill(255);
  ellipse(width/2, height/2, 700, 700);
    
    fill(0);
  ellipse(width/2, height/2, 720, 720);
    
    fill(255);
  ellipse(width/2, height/2, 740, 740);
     
    fill(0);
  ellipse(width/2, height/2, 760, 760);
    
    fill(255);
  ellipse(width/2, height/2, 780, 780);
    
    fill(0);
  ellipse(width/2, height/2, 800, 800);
    
    fill(255);
  ellipse(width/2, height/2, 820, 820);
    
    fill(0);
  ellipse(width/2, height/2, 840, 840);
    
    fill(255);
  ellipse(width/2, height/2, 860, 860);
    
    fill(0);
  ellipse(width/2, height/2, 880, 880);
    
    fill(255);
  ellipse(width/2, height/2, 900, 900); 
    
    fill(0);
  ellipse(width/2, height/2, 920, 920);  
    
    fill(255);
  ellipse(width/2, height/2, 940, 940);
  
    fill(0);
  ellipse(width/2, height/2, 960, 960);
    
    fill(255);
  ellipse(width/2, height/2, 980, 980);
    
    fill(0);
  ellipse(width/2, height/2, 1000, 1000);
    
    fill(255);
  ellipse(width/2, height/2, 1020, 1020);
    
    fill(0);
  ellipse(width/2, height/2, 1040, 1040);
  
  myCtr-- ;
    if (myCtr < 0) {
      myState = 1 ; 
      myCtr = 3 ; 
    }
  
  break;
  
  case 3:
  
  fill(0);
  ellipse(width/2, height/2, 1040, 1040);
  
  fill(0);
  ellipse(width/2, height/2, 1/2, 1/2);
  
  fill(255);
  ellipse(width/2, height/2, 1, 1);
  
  fill(0);
  ellipse(width/2, height/2, 2, 2);
  
  fill(255);
  ellipse(width/2, height/2, 3, 3);
  
  fill(0);
  ellipse(width/2, height/2, 4, 4);
  
  fill(255);
  ellipse(width/2, height/2, 5, 5);
  
  fill(0);
  ellipse(width/2, height/2, 6, 6);
    
  fill(255);
  ellipse(width/2, height/2, 8, 8);
    
  fill(0);
  ellipse(width/2, height/2, 10, 10);
    
  fill(255);
  ellipse(width/2, height/2, 20, 20);
  
  fill(0);
  ellipse(width/2, height/2, 40, 40);
    
    fill(255);
  ellipse(width/2, height/2, 60, 60);
    
    fill(0);
  ellipse(width/2, height/2, 80, 80);
  
    fill(255);
  ellipse(width/2, height/2, 100, 100);
    
  fill(0);
  ellipse(width/2, height/2, 120, 120);
  
    fill(255);
  ellipse(width/2, height/2, 140, 140);
    
    fill(0);
  ellipse(width/2, height/2, 160, 160);
  
    fill(255);
  ellipse(width/2, height/2, 180, 180);  
    
    fill(0);
  ellipse(width/2, height/2, 200, 200);
    
    fill(255);
  ellipse(width/2, height/2, 220, 220);
    
    fill(0);
  ellipse(width/2, height/2, 240, 240);
    
    fill(255);
  ellipse(width/2, height/2, 260, 260);
    
    fill(0);
  ellipse(width/2, height/2, 280, 280);
    
    fill(255);
  ellipse(width/2, height/2, 300, 300);
    
    fill(0);
  ellipse(width/2, height/2, 320, 320);
    
    fill(255);
  ellipse(width/2, height/2, 340, 340);
  
    fill(0);
  ellipse(width/2, height/2, 360, 360);
    
    fill(255);
  ellipse(width/2, height/2, 380, 380);
    
    fill(0);
  ellipse(width/2, height/2, 400, 400);
    
    fill(255);
  ellipse(width/2, height/2, 420, 420);
    
    fill(0);
  ellipse(width/2, height/2, 440, 440);
    
    fill(255);
  ellipse(width/2, height/2, 460, 460);
      
    fill(0);
  ellipse(width/2, height/2, 480, 480);
    
    fill(255);
  ellipse(width/2, height/2, 500, 500);  
    
    fill(0);
  ellipse(width/2, height/2, 520, 520);
    
    fill(255);
  ellipse(width/2, height/2, 540, 540);
    
    fill(0);
  ellipse(width/2, height/2, 560, 560);
    
    fill(255);
  ellipse(width/2, height/2, 580, 580);
    
    fill(0);
  ellipse(width/2, height/2, 600, 600);
    
    fill(255);
  ellipse(width/2, height/2, 620, 620);
    
    fill(0);
  ellipse(width/2, height/2, 640, 640);
    
    fill(255);
  ellipse(width/2, height/2, 660, 660);
    
    fill(0);
  ellipse(width/2, height/2, 680, 680);
    
    fill(255);
  ellipse(width/2, height/2, 700, 700);
    
    fill(0);
  ellipse(width/2, height/2, 720, 720);
    
    fill(255);
  ellipse(width/2, height/2, 740, 740);
     
    fill(0);
  ellipse(width/2, height/2, 760, 760);
    
    fill(255);
  ellipse(width/2, height/2, 780, 780);
    
    fill(0);
  ellipse(width/2, height/2, 800, 800);
    
    fill(255);
  ellipse(width/2, height/2, 820, 820);
    
    fill(0);
  ellipse(width/2, height/2, 840, 840);
    
    fill(255);
  ellipse(width/2, height/2, 860, 860);
    
    fill(0);
  ellipse(width/2, height/2, 880, 880);
    
    fill(255);
  ellipse(width/2, height/2, 900, 900); 
    
    fill(0);
  ellipse(width/2, height/2, 920, 920);  
    
    fill(255);
  ellipse(width/2, height/2, 940, 940);
  
    fill(0);
  ellipse(width/2, height/2, 960, 960);
    
    fill(255);
  ellipse(width/2, height/2, 980, 980);
    
    fill(0);
  ellipse(width/2, height/2, 1000, 1000);
    
    fill(255);
  ellipse(width/2, height/2, 1020, 1020);
  
  myCtr-- ;
    if (myCtr < 0) {
      myState = 2 ;
      myCtr = 3 ; 
    }
  
  break;
  
  case 4:
  
  fill(255);
  ellipse(width/2, height/2, 1020, 1020);
  
  fill(0);
  ellipse(width/2, height/2, 1/2, 1/2);
  
  fill(255);
  ellipse(width/2, height/2, 1, 1);
  
  fill(0);
  ellipse(width/2, height/2, 2, 2);
  
  fill(255);
  ellipse(width/2, height/2, 3, 3);
  
  fill(0);
  ellipse(width/2, height/2, 4, 4);
  
  fill(255);
  ellipse(width/2, height/2, 5, 5);
  
  fill(0);
  ellipse(width/2, height/2, 6, 6);
    
  fill(255);
  ellipse(width/2, height/2, 8, 8);
    
  fill(0);
  ellipse(width/2, height/2, 10, 10);
    
  fill(255);
  ellipse(width/2, height/2, 20, 20);
  
  fill(0);
  ellipse(width/2, height/2, 40, 40);
    
    fill(255);
  ellipse(width/2, height/2, 60, 60);
    
    fill(0);
  ellipse(width/2, height/2, 80, 80);
  
    fill(255);
  ellipse(width/2, height/2, 100, 100);
    
  fill(0);
  ellipse(width/2, height/2, 120, 120);
  
    fill(255);
  ellipse(width/2, height/2, 140, 140);
    
    fill(0);
  ellipse(width/2, height/2, 160, 160);
  
    fill(255);
  ellipse(width/2, height/2, 180, 180);  
    
    fill(0);
  ellipse(width/2, height/2, 200, 200);
    
    fill(255);
  ellipse(width/2, height/2, 220, 220);
    
    fill(0);
  ellipse(width/2, height/2, 240, 240);
    
    fill(255);
  ellipse(width/2, height/2, 260, 260);
    
    fill(0);
  ellipse(width/2, height/2, 280, 280);
    
    fill(255);
  ellipse(width/2, height/2, 300, 300);
    
    fill(0);
  ellipse(width/2, height/2, 320, 320);
    
    fill(255);
  ellipse(width/2, height/2, 340, 340);
  
    fill(0);
  ellipse(width/2, height/2, 360, 360);
    
    fill(255);
  ellipse(width/2, height/2, 380, 380);
    
    fill(0);
  ellipse(width/2, height/2, 400, 400);
    
    fill(255);
  ellipse(width/2, height/2, 420, 420);
    
    fill(0);
  ellipse(width/2, height/2, 440, 440);
    
    fill(255);
  ellipse(width/2, height/2, 460, 460);
      
    fill(0);
  ellipse(width/2, height/2, 480, 480);
    
    fill(255);
  ellipse(width/2, height/2, 500, 500);  
    
    fill(0);
  ellipse(width/2, height/2, 520, 520);
    
    fill(255);
  ellipse(width/2, height/2, 540, 540);
    
    fill(0);
  ellipse(width/2, height/2, 560, 560);
    
    fill(255);
  ellipse(width/2, height/2, 580, 580);
    
    fill(0);
  ellipse(width/2, height/2, 600, 600);
    
    fill(255);
  ellipse(width/2, height/2, 620, 620);
    
    fill(0);
  ellipse(width/2, height/2, 640, 640);
    
    fill(255);
  ellipse(width/2, height/2, 660, 660);
    
    fill(0);
  ellipse(width/2, height/2, 680, 680);
    
    fill(255);
  ellipse(width/2, height/2, 700, 700);
    
    fill(0);
  ellipse(width/2, height/2, 720, 720);
    
    fill(255);
  ellipse(width/2, height/2, 740, 740);
     
    fill(0);
  ellipse(width/2, height/2, 760, 760);
    
    fill(255);
  ellipse(width/2, height/2, 780, 780);
    
    fill(0);
  ellipse(width/2, height/2, 800, 800);
    
    fill(255);
  ellipse(width/2, height/2, 820, 820);
    
    fill(0);
  ellipse(width/2, height/2, 840, 840);
    
    fill(255);
  ellipse(width/2, height/2, 860, 860);
    
    fill(0);
  ellipse(width/2, height/2, 880, 880);
    
    fill(255);
  ellipse(width/2, height/2, 900, 900); 
    
    fill(0);
  ellipse(width/2, height/2, 920, 920);  
    
    fill(255);
  ellipse(width/2, height/2, 940, 940);
  
    fill(0);
  ellipse(width/2, height/2, 960, 960);
    
    fill(255);
  ellipse(width/2, height/2, 980, 980);
    
    fill(0);
  ellipse(width/2, height/2, 1000, 1000);
  
  myCtr-- ;
    if (myCtr < 0) {
      myState = 3 ; 
      myCtr = 3 ; 
    }
  
  break;
  
  case 5:
  
  fill(0);
  ellipse(width/2, height/2, 1000, 1000);
  
  fill(0);
  ellipse(width/2, height/2, 1/2, 1/2);
  
  fill(255);
  ellipse(width/2, height/2, 1, 1);
  
  fill(0);
  ellipse(width/2, height/2, 2, 2);
  
  fill(255);
  ellipse(width/2, height/2, 3, 3);
  
  fill(0);
  ellipse(width/2, height/2, 4, 4);
  
  fill(255);
  ellipse(width/2, height/2, 5, 5);
  
  fill(0);
  ellipse(width/2, height/2, 6, 6);
    
  fill(255);
  ellipse(width/2, height/2, 8, 8);
    
  fill(0);
  ellipse(width/2, height/2, 10, 10);
    
  fill(255);
  ellipse(width/2, height/2, 20, 20);
  
  fill(0);
  ellipse(width/2, height/2, 40, 40);
    
    fill(255);
  ellipse(width/2, height/2, 60, 60);
    
    fill(0);
  ellipse(width/2, height/2, 80, 80);
  
    fill(255);
  ellipse(width/2, height/2, 100, 100);
    
  fill(0);
  ellipse(width/2, height/2, 120, 120);
  
    fill(255);
  ellipse(width/2, height/2, 140, 140);
    
    fill(0);
  ellipse(width/2, height/2, 160, 160);
  
    fill(255);
  ellipse(width/2, height/2, 180, 180);  
    
    fill(0);
  ellipse(width/2, height/2, 200, 200);
    
    fill(255);
  ellipse(width/2, height/2, 220, 220);
    
    fill(0);
  ellipse(width/2, height/2, 240, 240);
    
    fill(255);
  ellipse(width/2, height/2, 260, 260);
    
    fill(0);
  ellipse(width/2, height/2, 280, 280);
    
    fill(255);
  ellipse(width/2, height/2, 300, 300);
    
    fill(0);
  ellipse(width/2, height/2, 320, 320);
    
    fill(255);
  ellipse(width/2, height/2, 340, 340);
  
    fill(0);
  ellipse(width/2, height/2, 360, 360);
    
    fill(255);
  ellipse(width/2, height/2, 380, 380);
    
    fill(0);
  ellipse(width/2, height/2, 400, 400);
    
    fill(255);
  ellipse(width/2, height/2, 420, 420);
    
    fill(0);
  ellipse(width/2, height/2, 440, 440);
    
    fill(255);
  ellipse(width/2, height/2, 460, 460);
      
    fill(0);
  ellipse(width/2, height/2, 480, 480);
    
    fill(255);
  ellipse(width/2, height/2, 500, 500);  
    
    fill(0);
  ellipse(width/2, height/2, 520, 520);
    
    fill(255);
  ellipse(width/2, height/2, 540, 540);
    
    fill(0);
  ellipse(width/2, height/2, 560, 560);
    
    fill(255);
  ellipse(width/2, height/2, 580, 580);
    
    fill(0);
  ellipse(width/2, height/2, 600, 600);
    
    fill(255);
  ellipse(width/2, height/2, 620, 620);
    
    fill(0);
  ellipse(width/2, height/2, 640, 640);
    
    fill(255);
  ellipse(width/2, height/2, 660, 660);
    
    fill(0);
  ellipse(width/2, height/2, 680, 680);
    
    fill(255);
  ellipse(width/2, height/2, 700, 700);
    
    fill(0);
  ellipse(width/2, height/2, 720, 720);
    
    fill(255);
  ellipse(width/2, height/2, 740, 740);
     
    fill(0);
  ellipse(width/2, height/2, 760, 760);
    
    fill(255);
  ellipse(width/2, height/2, 780, 780);
    
    fill(0);
  ellipse(width/2, height/2, 800, 800);
    
    fill(255);
  ellipse(width/2, height/2, 820, 820);
    
    fill(0);
  ellipse(width/2, height/2, 840, 840);
    
    fill(255);
  ellipse(width/2, height/2, 860, 860);
    
    fill(0);
  ellipse(width/2, height/2, 880, 880);
    
    fill(255);
  ellipse(width/2, height/2, 900, 900); 
    
    fill(0);
  ellipse(width/2, height/2, 920, 920);  
    
    fill(255);
  ellipse(width/2, height/2, 940, 940);
  
    fill(0);
  ellipse(width/2, height/2, 960, 960);
    
    fill(255);
  ellipse(width/2, height/2, 980, 980);
  
  myCtr-- ;
    if (myCtr < 0) {
      myState = 4 ; 
      myCtr = 3 ; 
    }
 
  
  break;
  
  case 6:
  
  fill(255);
  ellipse(width/2, height/2, 980, 980);
  
  fill(0);
  ellipse(width/2, height/2, 1/2, 1/2);
  
  fill(255);
  ellipse(width/2, height/2, 1, 1);
  
  fill(0);
  ellipse(width/2, height/2, 2, 2);
  
  fill(255);
  ellipse(width/2, height/2, 3, 3);
  
  fill(0);
  ellipse(width/2, height/2, 4, 4);
  
  fill(255);
  ellipse(width/2, height/2, 5, 5);
  
  fill(0);
  ellipse(width/2, height/2, 6, 6);
    
  fill(255);
  ellipse(width/2, height/2, 8, 8);
    
  fill(0);
  ellipse(width/2, height/2, 10, 10);
    
  fill(255);
  ellipse(width/2, height/2, 20, 20);
  
  fill(0);
  ellipse(width/2, height/2, 40, 40);
    
    fill(255);
  ellipse(width/2, height/2, 60, 60);
    
    fill(0);
  ellipse(width/2, height/2, 80, 80);
  
    fill(255);
  ellipse(width/2, height/2, 100, 100);
    
  fill(0);
  ellipse(width/2, height/2, 120, 120);
  
    fill(255);
  ellipse(width/2, height/2, 140, 140);
    
    fill(0);
  ellipse(width/2, height/2, 160, 160);
  
    fill(255);
  ellipse(width/2, height/2, 180, 180);  
    
    fill(0);
  ellipse(width/2, height/2, 200, 200);
    
    fill(255);
  ellipse(width/2, height/2, 220, 220);
    
    fill(0);
  ellipse(width/2, height/2, 240, 240);
    
    fill(255);
  ellipse(width/2, height/2, 260, 260);
    
    fill(0);
  ellipse(width/2, height/2, 280, 280);
    
    fill(255);
  ellipse(width/2, height/2, 300, 300);
    
    fill(0);
  ellipse(width/2, height/2, 320, 320);
    
    fill(255);
  ellipse(width/2, height/2, 340, 340);
  
    fill(0);
  ellipse(width/2, height/2, 360, 360);
    
    fill(255);
  ellipse(width/2, height/2, 380, 380);
    
    fill(0);
  ellipse(width/2, height/2, 400, 400);
    
    fill(255);
  ellipse(width/2, height/2, 420, 420);
    
    fill(0);
  ellipse(width/2, height/2, 440, 440);
    
    fill(255);
  ellipse(width/2, height/2, 460, 460);
      
    fill(0);
  ellipse(width/2, height/2, 480, 480);
    
    fill(255);
  ellipse(width/2, height/2, 500, 500);  
    
    fill(0);
  ellipse(width/2, height/2, 520, 520);
    
    fill(255);
  ellipse(width/2, height/2, 540, 540);
    
    fill(0);
  ellipse(width/2, height/2, 560, 560);
    
    fill(255);
  ellipse(width/2, height/2, 580, 580);
    
    fill(0);
  ellipse(width/2, height/2, 600, 600);
    
    fill(255);
  ellipse(width/2, height/2, 620, 620);
    
    fill(0);
  ellipse(width/2, height/2, 640, 640);
    
    fill(255);
  ellipse(width/2, height/2, 660, 660);
    
    fill(0);
  ellipse(width/2, height/2, 680, 680);
    
    fill(255);
  ellipse(width/2, height/2, 700, 700);
    
    fill(0);
  ellipse(width/2, height/2, 720, 720);
    
    fill(255);
  ellipse(width/2, height/2, 740, 740);
     
    fill(0);
  ellipse(width/2, height/2, 760, 760);
    
    fill(255);
  ellipse(width/2, height/2, 780, 780);
    
    fill(0);
  ellipse(width/2, height/2, 800, 800);
    
    fill(255);
  ellipse(width/2, height/2, 820, 820);
    
    fill(0);
  ellipse(width/2, height/2, 840, 840);
    
    fill(255);
  ellipse(width/2, height/2, 860, 860);
    
    fill(0);
  ellipse(width/2, height/2, 880, 880);
    
    fill(255);
  ellipse(width/2, height/2, 900, 900); 
    
    fill(0);
  ellipse(width/2, height/2, 920, 920);  
    
    fill(255);
  ellipse(width/2, height/2, 940, 940);
  
    fill(0);
  ellipse(width/2, height/2, 960, 960);
  
  myCtr-- ;
    if (myCtr < 0) {
      myState = 5 ;
      myCtr = 3 ; 
    }
  
  
  break;
  
  case 7:
  
  fill(0);
  ellipse(width/2, height/2, 960, 960);
  
  fill(0);
  ellipse(width/2, height/2, 1/2, 1/2);
  
  fill(255);
  ellipse(width/2, height/2, 1, 1);
  
  fill(0);
  ellipse(width/2, height/2, 2, 2);
  
  fill(255);
  ellipse(width/2, height/2, 3, 3);
  
  fill(0);
  ellipse(width/2, height/2, 4, 4);
  
  fill(255);
  ellipse(width/2, height/2, 5, 5);
  
  fill(0);
  ellipse(width/2, height/2, 6, 6);
    
  fill(255);
  ellipse(width/2, height/2, 8, 8);
    
  fill(0);
  ellipse(width/2, height/2, 10, 10);
    
  fill(255);
  ellipse(width/2, height/2, 20, 20);
  
  fill(0);
  ellipse(width/2, height/2, 40, 40);
    
    fill(255);
  ellipse(width/2, height/2, 60, 60);
    
    fill(0);
  ellipse(width/2, height/2, 80, 80);
  
    fill(255);
  ellipse(width/2, height/2, 100, 100);
    
  fill(0);
  ellipse(width/2, height/2, 120, 120);
  
    fill(255);
  ellipse(width/2, height/2, 140, 140);
    
    fill(0);
  ellipse(width/2, height/2, 160, 160);
  
    fill(255);
  ellipse(width/2, height/2, 180, 180);  
    
    fill(0);
  ellipse(width/2, height/2, 200, 200);
    
    fill(255);
  ellipse(width/2, height/2, 220, 220);
    
    fill(0);
  ellipse(width/2, height/2, 240, 240);
    
    fill(255);
  ellipse(width/2, height/2, 260, 260);
    
    fill(0);
  ellipse(width/2, height/2, 280, 280);
    
    fill(255);
  ellipse(width/2, height/2, 300, 300);
    
    fill(0);
  ellipse(width/2, height/2, 320, 320);
    
    fill(255);
  ellipse(width/2, height/2, 340, 340);
  
    fill(0);
  ellipse(width/2, height/2, 360, 360);
    
    fill(255);
  ellipse(width/2, height/2, 380, 380);
    
    fill(0);
  ellipse(width/2, height/2, 400, 400);
    
    fill(255);
  ellipse(width/2, height/2, 420, 420);
    
    fill(0);
  ellipse(width/2, height/2, 440, 440);
    
    fill(255);
  ellipse(width/2, height/2, 460, 460);
      
    fill(0);
  ellipse(width/2, height/2, 480, 480);
    
    fill(255);
  ellipse(width/2, height/2, 500, 500);  
    
    fill(0);
  ellipse(width/2, height/2, 520, 520);
    
    fill(255);
  ellipse(width/2, height/2, 540, 540);
    
    fill(0);
  ellipse(width/2, height/2, 560, 560);
    
    fill(255);
  ellipse(width/2, height/2, 580, 580);
    
    fill(0);
  ellipse(width/2, height/2, 600, 600);
    
    fill(255);
  ellipse(width/2, height/2, 620, 620);
    
    fill(0);
  ellipse(width/2, height/2, 640, 640);
    
    fill(255);
  ellipse(width/2, height/2, 660, 660);
    
    fill(0);
  ellipse(width/2, height/2, 680, 680);
    
    fill(255);
  ellipse(width/2, height/2, 700, 700);
    
    fill(0);
  ellipse(width/2, height/2, 720, 720);
    
    fill(255);
  ellipse(width/2, height/2, 740, 740);
     
    fill(0);
  ellipse(width/2, height/2, 760, 760);
    
    fill(255);
  ellipse(width/2, height/2, 780, 780);
    
    fill(0);
  ellipse(width/2, height/2, 800, 800);
    
    fill(255);
  ellipse(width/2, height/2, 820, 820);
    
    fill(0);
  ellipse(width/2, height/2, 840, 840);
    
    fill(255);
  ellipse(width/2, height/2, 860, 860);
    
    fill(0);
  ellipse(width/2, height/2, 880, 880);
    
    fill(255);
  ellipse(width/2, height/2, 900, 900); 
    
    fill(0);
  ellipse(width/2, height/2, 920, 920);  
    
    fill(255);
  ellipse(width/2, height/2, 940, 940);

  
  myCtr-- ;
    if (myCtr < 0) {
      myState = 6 ;
      myCtr = 3 ; 
    }
  
  break;
  
  case 8:
  
  fill(255);
  ellipse(width/2, height/2, 940, 940);
  
  fill(0);
  ellipse(width/2, height/2, 1/2, 1/2);
  
  fill(255);
  ellipse(width/2, height/2, 1, 1);
  
  fill(0);
  ellipse(width/2, height/2, 2, 2);
  
  fill(255);
  ellipse(width/2, height/2, 3, 3);
  
  fill(0);
  ellipse(width/2, height/2, 4, 4);
  
  fill(255);
  ellipse(width/2, height/2, 5, 5);
  
  fill(0);
  ellipse(width/2, height/2, 6, 6);
    
  fill(255);
  ellipse(width/2, height/2, 8, 8);
    
  fill(0);
  ellipse(width/2, height/2, 10, 10);
    
  fill(255);
  ellipse(width/2, height/2, 20, 20);
  
  fill(0);
  ellipse(width/2, height/2, 40, 40);
    
    fill(255);
  ellipse(width/2, height/2, 60, 60);
    
    fill(0);
  ellipse(width/2, height/2, 80, 80);
  
    fill(255);
  ellipse(width/2, height/2, 100, 100);
    
  fill(0);
  ellipse(width/2, height/2, 120, 120);
  
    fill(255);
  ellipse(width/2, height/2, 140, 140);
    
    fill(0);
  ellipse(width/2, height/2, 160, 160);
  
    fill(255);
  ellipse(width/2, height/2, 180, 180);  
    
    fill(0);
  ellipse(width/2, height/2, 200, 200);
    
    fill(255);
  ellipse(width/2, height/2, 220, 220);
    
    fill(0);
  ellipse(width/2, height/2, 240, 240);
    
    fill(255);
  ellipse(width/2, height/2, 260, 260);
    
    fill(0);
  ellipse(width/2, height/2, 280, 280);
    
    fill(255);
  ellipse(width/2, height/2, 300, 300);
    
    fill(0);
  ellipse(width/2, height/2, 320, 320);
    
    fill(255);
  ellipse(width/2, height/2, 340, 340);
  
    fill(0);
  ellipse(width/2, height/2, 360, 360);
    
    fill(255);
  ellipse(width/2, height/2, 380, 380);
    
    fill(0);
  ellipse(width/2, height/2, 400, 400);
    
    fill(255);
  ellipse(width/2, height/2, 420, 420);
    
    fill(0);
  ellipse(width/2, height/2, 440, 440);
    
    fill(255);
  ellipse(width/2, height/2, 460, 460);
      
    fill(0);
  ellipse(width/2, height/2, 480, 480);
    
    fill(255);
  ellipse(width/2, height/2, 500, 500);  
    
    fill(0);
  ellipse(width/2, height/2, 520, 520);
    
    fill(255);
  ellipse(width/2, height/2, 540, 540);
    
    fill(0);
  ellipse(width/2, height/2, 560, 560);
    
    fill(255);
  ellipse(width/2, height/2, 580, 580);
    
    fill(0);
  ellipse(width/2, height/2, 600, 600);
    
    fill(255);
  ellipse(width/2, height/2, 620, 620);
    
    fill(0);
  ellipse(width/2, height/2, 640, 640);
    
    fill(255);
  ellipse(width/2, height/2, 660, 660);
    
    fill(0);
  ellipse(width/2, height/2, 680, 680);
    
    fill(255);
  ellipse(width/2, height/2, 700, 700);
    
    fill(0);
  ellipse(width/2, height/2, 720, 720);
    
    fill(255);
  ellipse(width/2, height/2, 740, 740);
     
    fill(0);
  ellipse(width/2, height/2, 760, 760);
    
    fill(255);
  ellipse(width/2, height/2, 780, 780);
    
    fill(0);
  ellipse(width/2, height/2, 800, 800);
    
    fill(255);
  ellipse(width/2, height/2, 820, 820);
    
    fill(0);
  ellipse(width/2, height/2, 840, 840);
    
    fill(255);
  ellipse(width/2, height/2, 860, 860);
    
    fill(0);
  ellipse(width/2, height/2, 880, 880);
    
    fill(255);
  ellipse(width/2, height/2, 900, 900); 
    
    fill(0);
  ellipse(width/2, height/2, 920, 920);
  
  myCtr-- ;
    if (myCtr < 0) {
      myState = 7 ; 
      myCtr = 3 ; 
    }
  
  break;
  
  case 9:
  
  fill(0);
  ellipse(width/2, height/2, 920, 920);
  
  fill(0);
  ellipse(width/2, height/2, 1/2, 1/2);
  
  fill(255);
  ellipse(width/2, height/2, 1, 1);
  
  fill(0);
  ellipse(width/2, height/2, 2, 2);
  
  fill(255);
  ellipse(width/2, height/2, 3, 3);
  
  fill(0);
  ellipse(width/2, height/2, 4, 4);
  
  fill(255);
  ellipse(width/2, height/2, 5, 5);
  
  fill(0);
  ellipse(width/2, height/2, 6, 6);
    
  fill(255);
  ellipse(width/2, height/2, 8, 8);
    
  fill(0);
  ellipse(width/2, height/2, 10, 10);
    
  fill(255);
  ellipse(width/2, height/2, 20, 20);
  
  fill(0);
  ellipse(width/2, height/2, 40, 40);
    
    fill(255);
  ellipse(width/2, height/2, 60, 60);
    
    fill(0);
  ellipse(width/2, height/2, 80, 80);
  
    fill(255);
  ellipse(width/2, height/2, 100, 100);
    
  fill(0);
  ellipse(width/2, height/2, 120, 120);
  
    fill(255);
  ellipse(width/2, height/2, 140, 140);
    
    fill(0);
  ellipse(width/2, height/2, 160, 160);
  
    fill(255);
  ellipse(width/2, height/2, 180, 180);  
    
    fill(0);
  ellipse(width/2, height/2, 200, 200);
    
    fill(255);
  ellipse(width/2, height/2, 220, 220);
    
    fill(0);
  ellipse(width/2, height/2, 240, 240);
    
    fill(255);
  ellipse(width/2, height/2, 260, 260);
    
    fill(0);
  ellipse(width/2, height/2, 280, 280);
    
    fill(255);
  ellipse(width/2, height/2, 300, 300);
    
    fill(0);
  ellipse(width/2, height/2, 320, 320);
    
    fill(255);
  ellipse(width/2, height/2, 340, 340);
  
    fill(0);
  ellipse(width/2, height/2, 360, 360);
    
    fill(255);
  ellipse(width/2, height/2, 380, 380);
    
    fill(0);
  ellipse(width/2, height/2, 400, 400);
    
    fill(255);
  ellipse(width/2, height/2, 420, 420);
    
    fill(0);
  ellipse(width/2, height/2, 440, 440);
    
    fill(255);
  ellipse(width/2, height/2, 460, 460);
      
    fill(0);
  ellipse(width/2, height/2, 480, 480);
    
    fill(255);
  ellipse(width/2, height/2, 500, 500);  
    
    fill(0);
  ellipse(width/2, height/2, 520, 520);
    
    fill(255);
  ellipse(width/2, height/2, 540, 540);
    
    fill(0);
  ellipse(width/2, height/2, 560, 560);
    
    fill(255);
  ellipse(width/2, height/2, 580, 580);
    
    fill(0);
  ellipse(width/2, height/2, 600, 600);
    
    fill(255);
  ellipse(width/2, height/2, 620, 620);
    
    fill(0);
  ellipse(width/2, height/2, 640, 640);
    
    fill(255);
  ellipse(width/2, height/2, 660, 660);
    
    fill(0);
  ellipse(width/2, height/2, 680, 680);
    
    fill(255);
  ellipse(width/2, height/2, 700, 700);
    
    fill(0);
  ellipse(width/2, height/2, 720, 720);
    
    fill(255);
  ellipse(width/2, height/2, 740, 740);
     
    fill(0);
  ellipse(width/2, height/2, 760, 760);
    
    fill(255);
  ellipse(width/2, height/2, 780, 780);
    
    fill(0);
  ellipse(width/2, height/2, 800, 800);
    
    fill(255);
  ellipse(width/2, height/2, 820, 820);
    
    fill(0);
  ellipse(width/2, height/2, 840, 840);
    
    fill(255);
  ellipse(width/2, height/2, 860, 860);
    
    fill(0);
  ellipse(width/2, height/2, 880, 880);
    
    fill(255);
  ellipse(width/2, height/2, 900, 900);
  
  myCtr-- ;
    if (myCtr < 0) {
      myState = 8 ; 
      myCtr = 3 ; 
    }
  
  break;
  
  case 10:
  
  fill(255);
  ellipse(width/2, height/2, 900, 900);
  
  fill(0);
  ellipse(width/2, height/2, 1/2, 1/2);
  
  fill(255);
  ellipse(width/2, height/2, 1, 1);
  
  fill(0);
  ellipse(width/2, height/2, 2, 2);
  
  fill(255);
  ellipse(width/2, height/2, 3, 3);
  
  fill(0);
  ellipse(width/2, height/2, 4, 4);
  
  fill(255);
  ellipse(width/2, height/2, 5, 5);
  
  fill(0);
  ellipse(width/2, height/2, 6, 6);
    
  fill(255);
  ellipse(width/2, height/2, 8, 8);
    
  fill(0);
  ellipse(width/2, height/2, 10, 10);
    
  fill(255);
  ellipse(width/2, height/2, 20, 20);
  
  fill(0);
  ellipse(width/2, height/2, 40, 40);
    
    fill(255);
  ellipse(width/2, height/2, 60, 60);
    
    fill(0);
  ellipse(width/2, height/2, 80, 80);
  
    fill(255);
  ellipse(width/2, height/2, 100, 100);
    
  fill(0);
  ellipse(width/2, height/2, 120, 120);
  
    fill(255);
  ellipse(width/2, height/2, 140, 140);
    
    fill(0);
  ellipse(width/2, height/2, 160, 160);
  
    fill(255);
  ellipse(width/2, height/2, 180, 180);  
    
    fill(0);
  ellipse(width/2, height/2, 200, 200);
    
    fill(255);
  ellipse(width/2, height/2, 220, 220);
    
    fill(0);
  ellipse(width/2, height/2, 240, 240);
    
    fill(255);
  ellipse(width/2, height/2, 260, 260);
    
    fill(0);
  ellipse(width/2, height/2, 280, 280);
    
    fill(255);
  ellipse(width/2, height/2, 300, 300);
    
    fill(0);
  ellipse(width/2, height/2, 320, 320);
    
    fill(255);
  ellipse(width/2, height/2, 340, 340);
  
    fill(0);
  ellipse(width/2, height/2, 360, 360);
    
    fill(255);
  ellipse(width/2, height/2, 380, 380);
    
    fill(0);
  ellipse(width/2, height/2, 400, 400);
    
    fill(255);
  ellipse(width/2, height/2, 420, 420);
    
    fill(0);
  ellipse(width/2, height/2, 440, 440);
    
    fill(255);
  ellipse(width/2, height/2, 460, 460);
      
    fill(0);
  ellipse(width/2, height/2, 480, 480);
    
    fill(255);
  ellipse(width/2, height/2, 500, 500);  
    
    fill(0);
  ellipse(width/2, height/2, 520, 520);
    
    fill(255);
  ellipse(width/2, height/2, 540, 540);
    
    fill(0);
  ellipse(width/2, height/2, 560, 560);
    
    fill(255);
  ellipse(width/2, height/2, 580, 580);
    
    fill(0);
  ellipse(width/2, height/2, 600, 600);
    
    fill(255);
  ellipse(width/2, height/2, 620, 620);
    
    fill(0);
  ellipse(width/2, height/2, 640, 640);
    
    fill(255);
  ellipse(width/2, height/2, 660, 660);
    
    fill(0);
  ellipse(width/2, height/2, 680, 680);
    
    fill(255);
  ellipse(width/2, height/2, 700, 700);
    
    fill(0);
  ellipse(width/2, height/2, 720, 720);
    
    fill(255);
  ellipse(width/2, height/2, 740, 740);
     
    fill(0);
  ellipse(width/2, height/2, 760, 760);
    
    fill(255);
  ellipse(width/2, height/2, 780, 780);
    
    fill(0);
  ellipse(width/2, height/2, 800, 800);
    
    fill(255);
  ellipse(width/2, height/2, 820, 820);
    
    fill(0);
  ellipse(width/2, height/2, 840, 840);
    
    fill(255);
  ellipse(width/2, height/2, 860, 860);
    
    fill(0);
  ellipse(width/2, height/2, 880, 880);
  
  myCtr-- ;
    if (myCtr < 0) {
      myState = 9 ; 
      myCtr = 3 ; 
    }
  
  break;
  
  case 11:
  
  fill(0);
  ellipse(width/2, height/2, 880, 880);
  
  fill(0);
  ellipse(width/2, height/2, 1/2, 1/2);
  
  fill(255);
  ellipse(width/2, height/2, 1, 1);
  
  fill(0);
  ellipse(width/2, height/2, 2, 2);
  
  fill(255);
  ellipse(width/2, height/2, 3, 3);
  
  fill(0);
  ellipse(width/2, height/2, 4, 4);
  
  fill(255);
  ellipse(width/2, height/2, 5, 5);
  
  fill(0);
  ellipse(width/2, height/2, 6, 6);
    
  fill(255);
  ellipse(width/2, height/2, 8, 8);
    
  fill(0);
  ellipse(width/2, height/2, 10, 10);
    
  fill(255);
  ellipse(width/2, height/2, 20, 20);
  
  fill(0);
  ellipse(width/2, height/2, 40, 40);
    
    fill(255);
  ellipse(width/2, height/2, 60, 60);
    
    fill(0);
  ellipse(width/2, height/2, 80, 80);
  
    fill(255);
  ellipse(width/2, height/2, 100, 100);
    
  fill(0);
  ellipse(width/2, height/2, 120, 120);
  
    fill(255);
  ellipse(width/2, height/2, 140, 140);
    
    fill(0);
  ellipse(width/2, height/2, 160, 160);
  
    fill(255);
  ellipse(width/2, height/2, 180, 180);  
    
    fill(0);
  ellipse(width/2, height/2, 200, 200);
    
    fill(255);
  ellipse(width/2, height/2, 220, 220);
    
    fill(0);
  ellipse(width/2, height/2, 240, 240);
    
    fill(255);
  ellipse(width/2, height/2, 260, 260);
    
    fill(0);
  ellipse(width/2, height/2, 280, 280);
    
    fill(255);
  ellipse(width/2, height/2, 300, 300);
    
    fill(0);
  ellipse(width/2, height/2, 320, 320);
    
    fill(255);
  ellipse(width/2, height/2, 340, 340);
  
    fill(0);
  ellipse(width/2, height/2, 360, 360);
    
    fill(255);
  ellipse(width/2, height/2, 380, 380);
    
    fill(0);
  ellipse(width/2, height/2, 400, 400);
    
    fill(255);
  ellipse(width/2, height/2, 420, 420);
    
    fill(0);
  ellipse(width/2, height/2, 440, 440);
    
    fill(255);
  ellipse(width/2, height/2, 460, 460);
      
    fill(0);
  ellipse(width/2, height/2, 480, 480);
    
    fill(255);
  ellipse(width/2, height/2, 500, 500);  
    
    fill(0);
  ellipse(width/2, height/2, 520, 520);
    
    fill(255);
  ellipse(width/2, height/2, 540, 540);
    
    fill(0);
  ellipse(width/2, height/2, 560, 560);
    
    fill(255);
  ellipse(width/2, height/2, 580, 580);
    
    fill(0);
  ellipse(width/2, height/2, 600, 600);
    
    fill(255);
  ellipse(width/2, height/2, 620, 620);
    
    fill(0);
  ellipse(width/2, height/2, 640, 640);
    
    fill(255);
  ellipse(width/2, height/2, 660, 660);
    
    fill(0);
  ellipse(width/2, height/2, 680, 680);
    
    fill(255);
  ellipse(width/2, height/2, 700, 700);
    
    fill(0);
  ellipse(width/2, height/2, 720, 720);
    
    fill(255);
  ellipse(width/2, height/2, 740, 740);
     
    fill(0);
  ellipse(width/2, height/2, 760, 760);
    
    fill(255);
  ellipse(width/2, height/2, 780, 780);
    
    fill(0);
  ellipse(width/2, height/2, 800, 800);
    
    fill(255);
  ellipse(width/2, height/2, 820, 820);
    
    fill(0);
  ellipse(width/2, height/2, 840, 840);
    
    fill(255);
  ellipse(width/2, height/2, 860, 860);
  
  myCtr-- ;
    if (myCtr < 0) {
      myState = 10 ;
      myCtr = 3 ; 
    }
  
  break;
  
  case 12:
  
  fill(255);
  ellipse(width/2, height/2, 860, 860);
  
  fill(0);
  ellipse(width/2, height/2, 1/2, 1/2);
  
  fill(255);
  ellipse(width/2, height/2, 1, 1);
  
  fill(0);
  ellipse(width/2, height/2, 2, 2);
  
  fill(255);
  ellipse(width/2, height/2, 3, 3);
  
  fill(0);
  ellipse(width/2, height/2, 4, 4);
  
  fill(255);
  ellipse(width/2, height/2, 5, 5);
  
  fill(0);
  ellipse(width/2, height/2, 6, 6);
    
  fill(255);
  ellipse(width/2, height/2, 8, 8);
    
  fill(0);
  ellipse(width/2, height/2, 10, 10);
    
  fill(255);
  ellipse(width/2, height/2, 20, 20);
  
  fill(0);
  ellipse(width/2, height/2, 40, 40);
    
    fill(255);
  ellipse(width/2, height/2, 60, 60);
    
    fill(0);
  ellipse(width/2, height/2, 80, 80);
  
    fill(255);
  ellipse(width/2, height/2, 100, 100);
    
  fill(0);
  ellipse(width/2, height/2, 120, 120);
  
    fill(255);
  ellipse(width/2, height/2, 140, 140);
    
    fill(0);
  ellipse(width/2, height/2, 160, 160);
  
    fill(255);
  ellipse(width/2, height/2, 180, 180);  
    
    fill(0);
  ellipse(width/2, height/2, 200, 200);
    
    fill(255);
  ellipse(width/2, height/2, 220, 220);
    
    fill(0);
  ellipse(width/2, height/2, 240, 240);
    
    fill(255);
  ellipse(width/2, height/2, 260, 260);
    
    fill(0);
  ellipse(width/2, height/2, 280, 280);
    
    fill(255);
  ellipse(width/2, height/2, 300, 300);
    
    fill(0);
  ellipse(width/2, height/2, 320, 320);
    
    fill(255);
  ellipse(width/2, height/2, 340, 340);
  
    fill(0);
  ellipse(width/2, height/2, 360, 360);
    
    fill(255);
  ellipse(width/2, height/2, 380, 380);
    
    fill(0);
  ellipse(width/2, height/2, 400, 400);
    
    fill(255);
  ellipse(width/2, height/2, 420, 420);
    
    fill(0);
  ellipse(width/2, height/2, 440, 440);
    
    fill(255);
  ellipse(width/2, height/2, 460, 460);
      
    fill(0);
  ellipse(width/2, height/2, 480, 480);
    
    fill(255);
  ellipse(width/2, height/2, 500, 500);  
    
    fill(0);
  ellipse(width/2, height/2, 520, 520);
    
    fill(255);
  ellipse(width/2, height/2, 540, 540);
    
    fill(0);
  ellipse(width/2, height/2, 560, 560);
    
    fill(255);
  ellipse(width/2, height/2, 580, 580);
    
    fill(0);
  ellipse(width/2, height/2, 600, 600);
    
    fill(255);
  ellipse(width/2, height/2, 620, 620);
    
    fill(0);
  ellipse(width/2, height/2, 640, 640);
    
    fill(255);
  ellipse(width/2, height/2, 660, 660);
    
    fill(0);
  ellipse(width/2, height/2, 680, 680);
    
    fill(255);
  ellipse(width/2, height/2, 700, 700);
    
    fill(0);
  ellipse(width/2, height/2, 720, 720);
    
    fill(255);
  ellipse(width/2, height/2, 740, 740);
     
    fill(0);
  ellipse(width/2, height/2, 760, 760);
    
    fill(255);
  ellipse(width/2, height/2, 780, 780);
    
    fill(0);
  ellipse(width/2, height/2, 800, 800);
    
    fill(255);
  ellipse(width/2, height/2, 820, 820);
    
    fill(0);
  ellipse(width/2, height/2, 840, 840);
  
  myCtr-- ;
    if (myCtr < 0) {
      myState = 11 ; 
      myCtr = 3 ; 
    }
  
  break;
  
  case 13:
  
  fill(0);
  ellipse(width/2, height/2, 840, 840);
  
  fill(0);
  ellipse(width/2, height/2, 1/2, 1/2);
  
  fill(255);
  ellipse(width/2, height/2, 1, 1);
  
  fill(0);
  ellipse(width/2, height/2, 2, 2);
  
  fill(255);
  ellipse(width/2, height/2, 3, 3);
  
  fill(0);
  ellipse(width/2, height/2, 4, 4);
  
  fill(255);
  ellipse(width/2, height/2, 5, 5);
  
  fill(0);
  ellipse(width/2, height/2, 6, 6);
    
  fill(255);
  ellipse(width/2, height/2, 8, 8);
    
  fill(0);
  ellipse(width/2, height/2, 10, 10);
    
  fill(255);
  ellipse(width/2, height/2, 20, 20);
  
  fill(0);
  ellipse(width/2, height/2, 40, 40);
    
    fill(255);
  ellipse(width/2, height/2, 60, 60);
    
    fill(0);
  ellipse(width/2, height/2, 80, 80);
  
    fill(255);
  ellipse(width/2, height/2, 100, 100);
    
  fill(0);
  ellipse(width/2, height/2, 120, 120);
  
    fill(255);
  ellipse(width/2, height/2, 140, 140);
    
    fill(0);
  ellipse(width/2, height/2, 160, 160);
  
    fill(255);
  ellipse(width/2, height/2, 180, 180);  
    
    fill(0);
  ellipse(width/2, height/2, 200, 200);
    
    fill(255);
  ellipse(width/2, height/2, 220, 220);
    
    fill(0);
  ellipse(width/2, height/2, 240, 240);
    
    fill(255);
  ellipse(width/2, height/2, 260, 260);
    
    fill(0);
  ellipse(width/2, height/2, 280, 280);
    
    fill(255);
  ellipse(width/2, height/2, 300, 300);
    
    fill(0);
  ellipse(width/2, height/2, 320, 320);
    
    fill(255);
  ellipse(width/2, height/2, 340, 340);
  
    fill(0);
  ellipse(width/2, height/2, 360, 360);
    
    fill(255);
  ellipse(width/2, height/2, 380, 380);
    
    fill(0);
  ellipse(width/2, height/2, 400, 400);
    
    fill(255);
  ellipse(width/2, height/2, 420, 420);
    
    fill(0);
  ellipse(width/2, height/2, 440, 440);
    
    fill(255);
  ellipse(width/2, height/2, 460, 460);
      
    fill(0);
  ellipse(width/2, height/2, 480, 480);
    
    fill(255);
  ellipse(width/2, height/2, 500, 500);  
    
    fill(0);
  ellipse(width/2, height/2, 520, 520);
    
    fill(255);
  ellipse(width/2, height/2, 540, 540);
    
    fill(0);
  ellipse(width/2, height/2, 560, 560);
    
    fill(255);
  ellipse(width/2, height/2, 580, 580);
    
    fill(0);
  ellipse(width/2, height/2, 600, 600);
    
    fill(255);
  ellipse(width/2, height/2, 620, 620);
    
    fill(0);
  ellipse(width/2, height/2, 640, 640);
    
    fill(255);
  ellipse(width/2, height/2, 660, 660);
    
    fill(0);
  ellipse(width/2, height/2, 680, 680);
    
    fill(255);
  ellipse(width/2, height/2, 700, 700);
    
    fill(0);
  ellipse(width/2, height/2, 720, 720);
    
    fill(255);
  ellipse(width/2, height/2, 740, 740);
     
    fill(0);
  ellipse(width/2, height/2, 760, 760);
    
    fill(255);
  ellipse(width/2, height/2, 780, 780);
    
    fill(0);
  ellipse(width/2, height/2, 800, 800);
    
    fill(255);
  ellipse(width/2, height/2, 820, 820);
  
  myCtr-- ;
    if (myCtr < 0) {
      myState = 12 ; 
      myCtr = 3 ; 
    }
  
  break;
  
  case 14:
  
  fill(255);
  ellipse(width/2, height/2, 820, 820);
  
  fill(0);
  ellipse(width/2, height/2, 1/2, 1/2);
  
  fill(255);
  ellipse(width/2, height/2, 1, 1);
  
  fill(0);
  ellipse(width/2, height/2, 2, 2);
  
  fill(255);
  ellipse(width/2, height/2, 3, 3);
  
  fill(0);
  ellipse(width/2, height/2, 4, 4);
  
  fill(255);
  ellipse(width/2, height/2, 5, 5);
  
  fill(0);
  ellipse(width/2, height/2, 6, 6);
    
  fill(255);
  ellipse(width/2, height/2, 8, 8);
    
  fill(0);
  ellipse(width/2, height/2, 10, 10);
    
  fill(255);
  ellipse(width/2, height/2, 20, 20);
  
  fill(0);
  ellipse(width/2, height/2, 40, 40);
    
    fill(255);
  ellipse(width/2, height/2, 60, 60);
    
    fill(0);
  ellipse(width/2, height/2, 80, 80);
  
    fill(255);
  ellipse(width/2, height/2, 100, 100);
    
  fill(0);
  ellipse(width/2, height/2, 120, 120);
  
    fill(255);
  ellipse(width/2, height/2, 140, 140);
    
    fill(0);
  ellipse(width/2, height/2, 160, 160);
  
    fill(255);
  ellipse(width/2, height/2, 180, 180);  
    
    fill(0);
  ellipse(width/2, height/2, 200, 200);
    
    fill(255);
  ellipse(width/2, height/2, 220, 220);
    
    fill(0);
  ellipse(width/2, height/2, 240, 240);
    
    fill(255);
  ellipse(width/2, height/2, 260, 260);
    
    fill(0);
  ellipse(width/2, height/2, 280, 280);
    
    fill(255);
  ellipse(width/2, height/2, 300, 300);
    
    fill(0);
  ellipse(width/2, height/2, 320, 320);
    
    fill(255);
  ellipse(width/2, height/2, 340, 340);
  
    fill(0);
  ellipse(width/2, height/2, 360, 360);
    
    fill(255);
  ellipse(width/2, height/2, 380, 380);
    
    fill(0);
  ellipse(width/2, height/2, 400, 400);
    
    fill(255);
  ellipse(width/2, height/2, 420, 420);
    
    fill(0);
  ellipse(width/2, height/2, 440, 440);
    
    fill(255);
  ellipse(width/2, height/2, 460, 460);
      
    fill(0);
  ellipse(width/2, height/2, 480, 480);
    
    fill(255);
  ellipse(width/2, height/2, 500, 500);  
    
    fill(0);
  ellipse(width/2, height/2, 520, 520);
    
    fill(255);
  ellipse(width/2, height/2, 540, 540);
    
    fill(0);
  ellipse(width/2, height/2, 560, 560);
    
    fill(255);
  ellipse(width/2, height/2, 580, 580);
    
    fill(0);
  ellipse(width/2, height/2, 600, 600);
    
    fill(255);
  ellipse(width/2, height/2, 620, 620);
    
    fill(0);
  ellipse(width/2, height/2, 640, 640);
    
    fill(255);
  ellipse(width/2, height/2, 660, 660);
    
    fill(0);
  ellipse(width/2, height/2, 680, 680);
    
    fill(255);
  ellipse(width/2, height/2, 700, 700);
    
    fill(0);
  ellipse(width/2, height/2, 720, 720);
    
    fill(255);
  ellipse(width/2, height/2, 740, 740);
     
    fill(0);
  ellipse(width/2, height/2, 760, 760);
    
    fill(255);
  ellipse(width/2, height/2, 780, 780);
    
    fill(0);
  ellipse(width/2, height/2, 800, 800);
  
  myCtr-- ;
    if (myCtr < 0) {
      myState = 13 ; 
      myCtr = 3 ; 
    }
  
  break;
  
  case 15:
  
  fill(0);
  ellipse(width/2, height/2, 800, 800);
  
  fill(0);
  ellipse(width/2, height/2, 1/2, 1/2);
  
  fill(255);
  ellipse(width/2, height/2, 1, 1);
  
  fill(0);
  ellipse(width/2, height/2, 2, 2);
  
  fill(255);
  ellipse(width/2, height/2, 3, 3);
  
  fill(0);
  ellipse(width/2, height/2, 4, 4);
  
  fill(255);
  ellipse(width/2, height/2, 5, 5);
  
  fill(0);
  ellipse(width/2, height/2, 6, 6);
    
  fill(255);
  ellipse(width/2, height/2, 8, 8);
    
  fill(0);
  ellipse(width/2, height/2, 10, 10);
    
  fill(255);
  ellipse(width/2, height/2, 20, 20);
  
  fill(0);
  ellipse(width/2, height/2, 40, 40);
    
    fill(255);
  ellipse(width/2, height/2, 60, 60);
    
    fill(0);
  ellipse(width/2, height/2, 80, 80);
  
    fill(255);
  ellipse(width/2, height/2, 100, 100);
    
  fill(0);
  ellipse(width/2, height/2, 120, 120);
  
    fill(255);
  ellipse(width/2, height/2, 140, 140);
    
    fill(0);
  ellipse(width/2, height/2, 160, 160);
  
    fill(255);
  ellipse(width/2, height/2, 180, 180);  
    
    fill(0);
  ellipse(width/2, height/2, 200, 200);
    
    fill(255);
  ellipse(width/2, height/2, 220, 220);
    
    fill(0);
  ellipse(width/2, height/2, 240, 240);
    
    fill(255);
  ellipse(width/2, height/2, 260, 260);
    
    fill(0);
  ellipse(width/2, height/2, 280, 280);
    
    fill(255);
  ellipse(width/2, height/2, 300, 300);
    
    fill(0);
  ellipse(width/2, height/2, 320, 320);
    
    fill(255);
  ellipse(width/2, height/2, 340, 340);
  
    fill(0);
  ellipse(width/2, height/2, 360, 360);
    
    fill(255);
  ellipse(width/2, height/2, 380, 380);
    
    fill(0);
  ellipse(width/2, height/2, 400, 400);
    
    fill(255);
  ellipse(width/2, height/2, 420, 420);
    
    fill(0);
  ellipse(width/2, height/2, 440, 440);
    
    fill(255);
  ellipse(width/2, height/2, 460, 460);
      
    fill(0);
  ellipse(width/2, height/2, 480, 480);
    
    fill(255);
  ellipse(width/2, height/2, 500, 500);  
    
    fill(0);
  ellipse(width/2, height/2, 520, 520);
    
    fill(255);
  ellipse(width/2, height/2, 540, 540);
    
    fill(0);
  ellipse(width/2, height/2, 560, 560);
    
    fill(255);
  ellipse(width/2, height/2, 580, 580);
    
    fill(0);
  ellipse(width/2, height/2, 600, 600);
    
    fill(255);
  ellipse(width/2, height/2, 620, 620);
    
    fill(0);
  ellipse(width/2, height/2, 640, 640);
    
    fill(255);
  ellipse(width/2, height/2, 660, 660);
    
    fill(0);
  ellipse(width/2, height/2, 680, 680);
    
    fill(255);
  ellipse(width/2, height/2, 700, 700);
    
    fill(0);
  ellipse(width/2, height/2, 720, 720);
    
    fill(255);
  ellipse(width/2, height/2, 740, 740);
     
    fill(0);
  ellipse(width/2, height/2, 760, 760);
    
    fill(255);
  ellipse(width/2, height/2, 780, 780);
  
  myCtr-- ;
    if (myCtr < 0) {
      myState = 14 ; 
      myCtr = 3 ; 
    }
  
  break;
  
  case 16:
  
  fill(255);
  ellipse(width/2, height/2, 780, 780);
  
  fill(0);
  ellipse(width/2, height/2, 1/2, 1/2);
  
  fill(255);
  ellipse(width/2, height/2, 1, 1);
  
  fill(0);
  ellipse(width/2, height/2, 2, 2);
  
  fill(255);
  ellipse(width/2, height/2, 3, 3);
  
  fill(0);
  ellipse(width/2, height/2, 4, 4);
  
  fill(255);
  ellipse(width/2, height/2, 5, 5);
  
  fill(0);
  ellipse(width/2, height/2, 6, 6);
    
  fill(255);
  ellipse(width/2, height/2, 8, 8);
    
  fill(0);
  ellipse(width/2, height/2, 10, 10);
    
  fill(255);
  ellipse(width/2, height/2, 20, 20);
  
  fill(0);
  ellipse(width/2, height/2, 40, 40);
    
    fill(255);
  ellipse(width/2, height/2, 60, 60);
    
    fill(0);
  ellipse(width/2, height/2, 80, 80);
  
    fill(255);
  ellipse(width/2, height/2, 100, 100);
    
  fill(0);
  ellipse(width/2, height/2, 120, 120);
  
    fill(255);
  ellipse(width/2, height/2, 140, 140);
    
    fill(0);
  ellipse(width/2, height/2, 160, 160);
  
    fill(255);
  ellipse(width/2, height/2, 180, 180);  
    
    fill(0);
  ellipse(width/2, height/2, 200, 200);
    
    fill(255);
  ellipse(width/2, height/2, 220, 220);
    
    fill(0);
  ellipse(width/2, height/2, 240, 240);
    
    fill(255);
  ellipse(width/2, height/2, 260, 260);
    
    fill(0);
  ellipse(width/2, height/2, 280, 280);
    
    fill(255);
  ellipse(width/2, height/2, 300, 300);
    
    fill(0);
  ellipse(width/2, height/2, 320, 320);
    
    fill(255);
  ellipse(width/2, height/2, 340, 340);
  
    fill(0);
  ellipse(width/2, height/2, 360, 360);
    
    fill(255);
  ellipse(width/2, height/2, 380, 380);
    
    fill(0);
  ellipse(width/2, height/2, 400, 400);
    
    fill(255);
  ellipse(width/2, height/2, 420, 420);
    
    fill(0);
  ellipse(width/2, height/2, 440, 440);
    
    fill(255);
  ellipse(width/2, height/2, 460, 460);
      
    fill(0);
  ellipse(width/2, height/2, 480, 480);
    
    fill(255);
  ellipse(width/2, height/2, 500, 500);  
    
    fill(0);
  ellipse(width/2, height/2, 520, 520);
    
    fill(255);
  ellipse(width/2, height/2, 540, 540);
    
    fill(0);
  ellipse(width/2, height/2, 560, 560);
    
    fill(255);
  ellipse(width/2, height/2, 580, 580);
    
    fill(0);
  ellipse(width/2, height/2, 600, 600);
    
    fill(255);
  ellipse(width/2, height/2, 620, 620);
    
    fill(0);
  ellipse(width/2, height/2, 640, 640);
    
    fill(255);
  ellipse(width/2, height/2, 660, 660);
    
    fill(0);
  ellipse(width/2, height/2, 680, 680);
    
    fill(255);
  ellipse(width/2, height/2, 700, 700);
    
    fill(0);
  ellipse(width/2, height/2, 720, 720);
    
    fill(255);
  ellipse(width/2, height/2, 740, 740);
     
    fill(0);
  ellipse(width/2, height/2, 760, 760);
  
  myCtr-- ;
    if (myCtr < 0) {
      myState = 15 ; 
      myCtr = 3 ; 
    }
  
  break;
  
  case 17:
  
  fill(0);
  ellipse(width/2, height/2, 760, 760);
  
  fill(0);
  ellipse(width/2, height/2, 1/2, 1/2);
  
  fill(255);
  ellipse(width/2, height/2, 1, 1);
  
  fill(0);
  ellipse(width/2, height/2, 2, 2);
  
  fill(255);
  ellipse(width/2, height/2, 3, 3);
  
  fill(0);
  ellipse(width/2, height/2, 4, 4);
  
  fill(255);
  ellipse(width/2, height/2, 5, 5);
  
  fill(0);
  ellipse(width/2, height/2, 6, 6);
    
  fill(255);
  ellipse(width/2, height/2, 8, 8);
    
  fill(0);
  ellipse(width/2, height/2, 10, 10);
    
  fill(255);
  ellipse(width/2, height/2, 20, 20);
  
  fill(0);
  ellipse(width/2, height/2, 40, 40);
    
    fill(255);
  ellipse(width/2, height/2, 60, 60);
    
    fill(0);
  ellipse(width/2, height/2, 80, 80);
  
    fill(255);
  ellipse(width/2, height/2, 100, 100);
    
  fill(0);
  ellipse(width/2, height/2, 120, 120);
  
    fill(255);
  ellipse(width/2, height/2, 140, 140);
    
    fill(0);
  ellipse(width/2, height/2, 160, 160);
  
    fill(255);
  ellipse(width/2, height/2, 180, 180);  
    
    fill(0);
  ellipse(width/2, height/2, 200, 200);
    
    fill(255);
  ellipse(width/2, height/2, 220, 220);
    
    fill(0);
  ellipse(width/2, height/2, 240, 240);
    
    fill(255);
  ellipse(width/2, height/2, 260, 260);
    
    fill(0);
  ellipse(width/2, height/2, 280, 280);
    
    fill(255);
  ellipse(width/2, height/2, 300, 300);
    
    fill(0);
  ellipse(width/2, height/2, 320, 320);
    
    fill(255);
  ellipse(width/2, height/2, 340, 340);
  
    fill(0);
  ellipse(width/2, height/2, 360, 360);
    
    fill(255);
  ellipse(width/2, height/2, 380, 380);
    
    fill(0);
  ellipse(width/2, height/2, 400, 400);
    
    fill(255);
  ellipse(width/2, height/2, 420, 420);
    
    fill(0);
  ellipse(width/2, height/2, 440, 440);
    
    fill(255);
  ellipse(width/2, height/2, 460, 460);
      
    fill(0);
  ellipse(width/2, height/2, 480, 480);
    
    fill(255);
  ellipse(width/2, height/2, 500, 500);  
    
    fill(0);
  ellipse(width/2, height/2, 520, 520);
    
    fill(255);
  ellipse(width/2, height/2, 540, 540);
    
    fill(0);
  ellipse(width/2, height/2, 560, 560);
    
    fill(255);
  ellipse(width/2, height/2, 580, 580);
    
    fill(0);
  ellipse(width/2, height/2, 600, 600);
    
    fill(255);
  ellipse(width/2, height/2, 620, 620);
    
    fill(0);
  ellipse(width/2, height/2, 640, 640);
    
    fill(255);
  ellipse(width/2, height/2, 660, 660);
    
    fill(0);
  ellipse(width/2, height/2, 680, 680);
    
    fill(255);
  ellipse(width/2, height/2, 700, 700);
    
    fill(0);
  ellipse(width/2, height/2, 720, 720);
    
    fill(255);
  ellipse(width/2, height/2, 740, 740);
  
  myCtr-- ;
    if (myCtr < 0) {
      myState = 16 ; 
      myCtr = 3 ; 
    }
  
  break;
  
  case 18:
  
  fill(255);
  ellipse(width/2, height/2, 740, 740);
  
  fill(0);
  ellipse(width/2, height/2, 1/2, 1/2);
  
  fill(255);
  ellipse(width/2, height/2, 1, 1);
  
  fill(0);
  ellipse(width/2, height/2, 2, 2);
  
  fill(255);
  ellipse(width/2, height/2, 3, 3);
  
  fill(0);
  ellipse(width/2, height/2, 4, 4);
  
  fill(255);
  ellipse(width/2, height/2, 5, 5);
  
  fill(0);
  ellipse(width/2, height/2, 6, 6);
    
  fill(255);
  ellipse(width/2, height/2, 8, 8);
    
  fill(0);
  ellipse(width/2, height/2, 10, 10);
    
  fill(255);
  ellipse(width/2, height/2, 20, 20);
  
  fill(0);
  ellipse(width/2, height/2, 40, 40);
    
    fill(255);
  ellipse(width/2, height/2, 60, 60);
    
    fill(0);
  ellipse(width/2, height/2, 80, 80);
  
    fill(255);
  ellipse(width/2, height/2, 100, 100);
    
  fill(0);
  ellipse(width/2, height/2, 120, 120);
  
    fill(255);
  ellipse(width/2, height/2, 140, 140);
    
    fill(0);
  ellipse(width/2, height/2, 160, 160);
  
    fill(255);
  ellipse(width/2, height/2, 180, 180);  
    
    fill(0);
  ellipse(width/2, height/2, 200, 200);
    
    fill(255);
  ellipse(width/2, height/2, 220, 220);
    
    fill(0);
  ellipse(width/2, height/2, 240, 240);
    
    fill(255);
  ellipse(width/2, height/2, 260, 260);
    
    fill(0);
  ellipse(width/2, height/2, 280, 280);
    
    fill(255);
  ellipse(width/2, height/2, 300, 300);
    
    fill(0);
  ellipse(width/2, height/2, 320, 320);
    
    fill(255);
  ellipse(width/2, height/2, 340, 340);
  
    fill(0);
  ellipse(width/2, height/2, 360, 360);
    
    fill(255);
  ellipse(width/2, height/2, 380, 380);
    
    fill(0);
  ellipse(width/2, height/2, 400, 400);
    
    fill(255);
  ellipse(width/2, height/2, 420, 420);
    
    fill(0);
  ellipse(width/2, height/2, 440, 440);
    
    fill(255);
  ellipse(width/2, height/2, 460, 460);
      
    fill(0);
  ellipse(width/2, height/2, 480, 480);
    
    fill(255);
  ellipse(width/2, height/2, 500, 500);  
    
    fill(0);
  ellipse(width/2, height/2, 520, 520);
    
    fill(255);
  ellipse(width/2, height/2, 540, 540);
    
    fill(0);
  ellipse(width/2, height/2, 560, 560);
    
    fill(255);
  ellipse(width/2, height/2, 580, 580);
    
    fill(0);
  ellipse(width/2, height/2, 600, 600);
    
    fill(255);
  ellipse(width/2, height/2, 620, 620);
    
    fill(0);
  ellipse(width/2, height/2, 640, 640);
    
    fill(255);
  ellipse(width/2, height/2, 660, 660);
    
    fill(0);
  ellipse(width/2, height/2, 680, 680);
    
    fill(255);
  ellipse(width/2, height/2, 700, 700);
    
    fill(0);
  ellipse(width/2, height/2, 720, 720);
  
  myCtr-- ;
    if (myCtr < 0) {
      myState = 17 ; 
      myCtr = 3 ; 
    }
  
  break;
  
  case 19:
  
  fill(0);
  ellipse(width/2, height/2, 720, 720);
  
  fill(0);
  ellipse(width/2, height/2, 1/2, 1/2);
  
  fill(255);
  ellipse(width/2, height/2, 1, 1);
  
  fill(0);
  ellipse(width/2, height/2, 2, 2);
  
  fill(255);
  ellipse(width/2, height/2, 3, 3);
  
  fill(0);
  ellipse(width/2, height/2, 4, 4);
  
  fill(255);
  ellipse(width/2, height/2, 5, 5);
  
  fill(0);
  ellipse(width/2, height/2, 6, 6);
    
  fill(255);
  ellipse(width/2, height/2, 8, 8);
    
  fill(0);
  ellipse(width/2, height/2, 10, 10);
    
  fill(255);
  ellipse(width/2, height/2, 20, 20);
  
  fill(0);
  ellipse(width/2, height/2, 40, 40);
    
    fill(255);
  ellipse(width/2, height/2, 60, 60);
    
    fill(0);
  ellipse(width/2, height/2, 80, 80);
  
    fill(255);
  ellipse(width/2, height/2, 100, 100);
    
  fill(0);
  ellipse(width/2, height/2, 120, 120);
  
    fill(255);
  ellipse(width/2, height/2, 140, 140);
    
    fill(0);
  ellipse(width/2, height/2, 160, 160);
  
    fill(255);
  ellipse(width/2, height/2, 180, 180);  
    
    fill(0);
  ellipse(width/2, height/2, 200, 200);
    
    fill(255);
  ellipse(width/2, height/2, 220, 220);
    
    fill(0);
  ellipse(width/2, height/2, 240, 240);
    
    fill(255);
  ellipse(width/2, height/2, 260, 260);
    
    fill(0);
  ellipse(width/2, height/2, 280, 280);
    
    fill(255);
  ellipse(width/2, height/2, 300, 300);
    
    fill(0);
  ellipse(width/2, height/2, 320, 320);
    
    fill(255);
  ellipse(width/2, height/2, 340, 340);
  
    fill(0);
  ellipse(width/2, height/2, 360, 360);
    
    fill(255);
  ellipse(width/2, height/2, 380, 380);
    
    fill(0);
  ellipse(width/2, height/2, 400, 400);
    
    fill(255);
  ellipse(width/2, height/2, 420, 420);
    
    fill(0);
  ellipse(width/2, height/2, 440, 440);
    
    fill(255);
  ellipse(width/2, height/2, 460, 460);
      
    fill(0);
  ellipse(width/2, height/2, 480, 480);
    
    fill(255);
  ellipse(width/2, height/2, 500, 500);  
    
    fill(0);
  ellipse(width/2, height/2, 520, 520);
    
    fill(255);
  ellipse(width/2, height/2, 540, 540);
    
    fill(0);
  ellipse(width/2, height/2, 560, 560);
    
    fill(255);
  ellipse(width/2, height/2, 580, 580);
    
    fill(0);
  ellipse(width/2, height/2, 600, 600);
    
    fill(255);
  ellipse(width/2, height/2, 620, 620);
    
    fill(0);
  ellipse(width/2, height/2, 640, 640);
    
    fill(255);
  ellipse(width/2, height/2, 660, 660);
    
    fill(0);
  ellipse(width/2, height/2, 680, 680);
    
    fill(255);
  ellipse(width/2, height/2, 700, 700);
  
  myCtr-- ;
    if (myCtr < 0) {
      myState = 18 ; 
      myCtr = 3 ; 
    }
  
  break;
  
  case 20:
  
  fill(255);
  ellipse(width/2, height/2, 700, 700);
  
  fill(0);
  ellipse(width/2, height/2, 1/2, 1/2);
  
  fill(255);
  ellipse(width/2, height/2, 1, 1);
  
  fill(0);
  ellipse(width/2, height/2, 2, 2);
  
  fill(255);
  ellipse(width/2, height/2, 3, 3);
  
  fill(0);
  ellipse(width/2, height/2, 4, 4);
  
  fill(255);
  ellipse(width/2, height/2, 5, 5);
  
  fill(0);
  ellipse(width/2, height/2, 6, 6);
    
  fill(255);
  ellipse(width/2, height/2, 8, 8);
    
  fill(0);
  ellipse(width/2, height/2, 10, 10);
    
  fill(255);
  ellipse(width/2, height/2, 20, 20);
  
  fill(0);
  ellipse(width/2, height/2, 40, 40);
    
    fill(255);
  ellipse(width/2, height/2, 60, 60);
    
    fill(0);
  ellipse(width/2, height/2, 80, 80);
  
    fill(255);
  ellipse(width/2, height/2, 100, 100);
    
  fill(0);
  ellipse(width/2, height/2, 120, 120);
  
    fill(255);
  ellipse(width/2, height/2, 140, 140);
    
    fill(0);
  ellipse(width/2, height/2, 160, 160);
  
    fill(255);
  ellipse(width/2, height/2, 180, 180);  
    
    fill(0);
  ellipse(width/2, height/2, 200, 200);
    
    fill(255);
  ellipse(width/2, height/2, 220, 220);
    
    fill(0);
  ellipse(width/2, height/2, 240, 240);
    
    fill(255);
  ellipse(width/2, height/2, 260, 260);
    
    fill(0);
  ellipse(width/2, height/2, 280, 280);
    
    fill(255);
  ellipse(width/2, height/2, 300, 300);
    
    fill(0);
  ellipse(width/2, height/2, 320, 320);
    
    fill(255);
  ellipse(width/2, height/2, 340, 340);
  
    fill(0);
  ellipse(width/2, height/2, 360, 360);
    
    fill(255);
  ellipse(width/2, height/2, 380, 380);
    
    fill(0);
  ellipse(width/2, height/2, 400, 400);
    
    fill(255);
  ellipse(width/2, height/2, 420, 420);
    
    fill(0);
  ellipse(width/2, height/2, 440, 440);
    
    fill(255);
  ellipse(width/2, height/2, 460, 460);
      
    fill(0);
  ellipse(width/2, height/2, 480, 480);
    
    fill(255);
  ellipse(width/2, height/2, 500, 500);  
    
    fill(0);
  ellipse(width/2, height/2, 520, 520);
    
    fill(255);
  ellipse(width/2, height/2, 540, 540);
    
    fill(0);
  ellipse(width/2, height/2, 560, 560);
    
    fill(255);
  ellipse(width/2, height/2, 580, 580);
    
    fill(0);
  ellipse(width/2, height/2, 600, 600);
    
    fill(255);
  ellipse(width/2, height/2, 620, 620);
    
    fill(0);
  ellipse(width/2, height/2, 640, 640);
    
    fill(255);
  ellipse(width/2, height/2, 660, 660);
    
    fill(0);
  ellipse(width/2, height/2, 680, 680);
  
  myCtr-- ;
    if (myCtr < 0) {
      myState = 19 ; 
      myCtr = 3 ; 
    }
  
  break;
  
  case 21:
  
  fill(0);
  ellipse(width/2, height/2, 680, 680);
  
  fill(0);
  ellipse(width/2, height/2, 1/2, 1/2);
  
  fill(255);
  ellipse(width/2, height/2, 1, 1);
  
  fill(0);
  ellipse(width/2, height/2, 2, 2);
  
  fill(255);
  ellipse(width/2, height/2, 3, 3);
  
  fill(0);
  ellipse(width/2, height/2, 4, 4);
  
  fill(255);
  ellipse(width/2, height/2, 5, 5);
  
  fill(0);
  ellipse(width/2, height/2, 6, 6);
    
  fill(255);
  ellipse(width/2, height/2, 8, 8);
    
  fill(0);
  ellipse(width/2, height/2, 10, 10);
    
  fill(255);
  ellipse(width/2, height/2, 20, 20);
  
  fill(0);
  ellipse(width/2, height/2, 40, 40);
    
    fill(255);
  ellipse(width/2, height/2, 60, 60);
    
    fill(0);
  ellipse(width/2, height/2, 80, 80);
  
    fill(255);
  ellipse(width/2, height/2, 100, 100);
    
  fill(0);
  ellipse(width/2, height/2, 120, 120);
  
    fill(255);
  ellipse(width/2, height/2, 140, 140);
    
    fill(0);
  ellipse(width/2, height/2, 160, 160);
  
    fill(255);
  ellipse(width/2, height/2, 180, 180);  
    
    fill(0);
  ellipse(width/2, height/2, 200, 200);
    
    fill(255);
  ellipse(width/2, height/2, 220, 220);
    
    fill(0);
  ellipse(width/2, height/2, 240, 240);
    
    fill(255);
  ellipse(width/2, height/2, 260, 260);
    
    fill(0);
  ellipse(width/2, height/2, 280, 280);
    
    fill(255);
  ellipse(width/2, height/2, 300, 300);
    
    fill(0);
  ellipse(width/2, height/2, 320, 320);
    
    fill(255);
  ellipse(width/2, height/2, 340, 340);
  
    fill(0);
  ellipse(width/2, height/2, 360, 360);
    
    fill(255);
  ellipse(width/2, height/2, 380, 380);
    
    fill(0);
  ellipse(width/2, height/2, 400, 400);
    
    fill(255);
  ellipse(width/2, height/2, 420, 420);
    
    fill(0);
  ellipse(width/2, height/2, 440, 440);
    
    fill(255);
  ellipse(width/2, height/2, 460, 460);
      
    fill(0);
  ellipse(width/2, height/2, 480, 480);
    
    fill(255);
  ellipse(width/2, height/2, 500, 500);  
    
    fill(0);
  ellipse(width/2, height/2, 520, 520);
    
    fill(255);
  ellipse(width/2, height/2, 540, 540);
    
    fill(0);
  ellipse(width/2, height/2, 560, 560);
    
    fill(255);
  ellipse(width/2, height/2, 580, 580);
    
    fill(0);
  ellipse(width/2, height/2, 600, 600);
    
    fill(255);
  ellipse(width/2, height/2, 620, 620);
    
    fill(0);
  ellipse(width/2, height/2, 640, 640);
    
    fill(255);
  ellipse(width/2, height/2, 660, 660);
  
  myCtr-- ;
    if (myCtr < 0) {
      myState = 20 ; 
      myCtr = 3 ; 
    }
  
  break;
  
  case 22:
  
  fill(255);
  ellipse(width/2, height/2, 660, 660);
  
  fill(0);
  ellipse(width/2, height/2, 1/2, 1/2);
  
  fill(255);
  ellipse(width/2, height/2, 1, 1);
  
  fill(0);
  ellipse(width/2, height/2, 2, 2);
  
  fill(255);
  ellipse(width/2, height/2, 3, 3);
  
  fill(0);
  ellipse(width/2, height/2, 4, 4);
  
  fill(255);
  ellipse(width/2, height/2, 5, 5);
  
  fill(0);
  ellipse(width/2, height/2, 6, 6);
    
  fill(255);
  ellipse(width/2, height/2, 8, 8);
    
  fill(0);
  ellipse(width/2, height/2, 10, 10);
    
  fill(255);
  ellipse(width/2, height/2, 20, 20);
  
  fill(0);
  ellipse(width/2, height/2, 40, 40);
    
    fill(255);
  ellipse(width/2, height/2, 60, 60);
    
    fill(0);
  ellipse(width/2, height/2, 80, 80);
  
    fill(255);
  ellipse(width/2, height/2, 100, 100);
    
  fill(0);
  ellipse(width/2, height/2, 120, 120);
  
    fill(255);
  ellipse(width/2, height/2, 140, 140);
    
    fill(0);
  ellipse(width/2, height/2, 160, 160);
  
    fill(255);
  ellipse(width/2, height/2, 180, 180);  
    
    fill(0);
  ellipse(width/2, height/2, 200, 200);
    
    fill(255);
  ellipse(width/2, height/2, 220, 220);
    
    fill(0);
  ellipse(width/2, height/2, 240, 240);
    
    fill(255);
  ellipse(width/2, height/2, 260, 260);
    
    fill(0);
  ellipse(width/2, height/2, 280, 280);
    
    fill(255);
  ellipse(width/2, height/2, 300, 300);
    
    fill(0);
  ellipse(width/2, height/2, 320, 320);
    
    fill(255);
  ellipse(width/2, height/2, 340, 340);
  
    fill(0);
  ellipse(width/2, height/2, 360, 360);
    
    fill(255);
  ellipse(width/2, height/2, 380, 380);
    
    fill(0);
  ellipse(width/2, height/2, 400, 400);
    
    fill(255);
  ellipse(width/2, height/2, 420, 420);
    
    fill(0);
  ellipse(width/2, height/2, 440, 440);
    
    fill(255);
  ellipse(width/2, height/2, 460, 460);
      
    fill(0);
  ellipse(width/2, height/2, 480, 480);
    
    fill(255);
  ellipse(width/2, height/2, 500, 500);  
    
    fill(0);
  ellipse(width/2, height/2, 520, 520);
    
    fill(255);
  ellipse(width/2, height/2, 540, 540);
    
    fill(0);
  ellipse(width/2, height/2, 560, 560);
    
    fill(255);
  ellipse(width/2, height/2, 580, 580);
    
    fill(0);
  ellipse(width/2, height/2, 600, 600);
    
    fill(255);
  ellipse(width/2, height/2, 620, 620);
    
    fill(0);
  ellipse(width/2, height/2, 640, 640);
  
  myCtr-- ;
    if (myCtr < 0) {
      myState = 21 ; 
      myCtr = 3 ; 
    }
  
  break;
  
  case 23:
  
  fill(0);
  ellipse(width/2, height/2, 640, 640);
  
  fill(0);
  ellipse(width/2, height/2, 1/2, 1/2);
  
  fill(255);
  ellipse(width/2, height/2, 1, 1);
  
  fill(0);
  ellipse(width/2, height/2, 2, 2);
  
  fill(255);
  ellipse(width/2, height/2, 3, 3);
  
  fill(0);
  ellipse(width/2, height/2, 4, 4);
  
  fill(255);
  ellipse(width/2, height/2, 5, 5);
  
  fill(0);
  ellipse(width/2, height/2, 6, 6);
    
  fill(255);
  ellipse(width/2, height/2, 8, 8);
    
  fill(0);
  ellipse(width/2, height/2, 10, 10);
    
  fill(255);
  ellipse(width/2, height/2, 20, 20);
  
  fill(0);
  ellipse(width/2, height/2, 40, 40);
    
    fill(255);
  ellipse(width/2, height/2, 60, 60);
    
    fill(0);
  ellipse(width/2, height/2, 80, 80);
  
    fill(255);
  ellipse(width/2, height/2, 100, 100);
    
  fill(0);
  ellipse(width/2, height/2, 120, 120);
  
    fill(255);
  ellipse(width/2, height/2, 140, 140);
    
    fill(0);
  ellipse(width/2, height/2, 160, 160);
  
    fill(255);
  ellipse(width/2, height/2, 180, 180);  
    
    fill(0);
  ellipse(width/2, height/2, 200, 200);
    
    fill(255);
  ellipse(width/2, height/2, 220, 220);
    
    fill(0);
  ellipse(width/2, height/2, 240, 240);
    
    fill(255);
  ellipse(width/2, height/2, 260, 260);
    
    fill(0);
  ellipse(width/2, height/2, 280, 280);
    
    fill(255);
  ellipse(width/2, height/2, 300, 300);
    
    fill(0);
  ellipse(width/2, height/2, 320, 320);
    
    fill(255);
  ellipse(width/2, height/2, 340, 340);
  
    fill(0);
  ellipse(width/2, height/2, 360, 360);
    
    fill(255);
  ellipse(width/2, height/2, 380, 380);
    
    fill(0);
  ellipse(width/2, height/2, 400, 400);
    
    fill(255);
  ellipse(width/2, height/2, 420, 420);
    
    fill(0);
  ellipse(width/2, height/2, 440, 440);
    
    fill(255);
  ellipse(width/2, height/2, 460, 460);
      
    fill(0);
  ellipse(width/2, height/2, 480, 480);
    
    fill(255);
  ellipse(width/2, height/2, 500, 500);  
    
    fill(0);
  ellipse(width/2, height/2, 520, 520);
    
    fill(255);
  ellipse(width/2, height/2, 540, 540);
    
    fill(0);
  ellipse(width/2, height/2, 560, 560);
    
    fill(255);
  ellipse(width/2, height/2, 580, 580);
    
    fill(0);
  ellipse(width/2, height/2, 600, 600);
    
    fill(255);
  ellipse(width/2, height/2, 620, 620);
  
  myCtr-- ;
    if (myCtr < 0) {
      myState = 22 ; 
      myCtr = 3 ; 
    }
  
  break;
  
  case 24:
  
  fill(255);
  ellipse(width/2, height/2, 620, 620);
  
  fill(0);
  ellipse(width/2, height/2, 1/2, 1/2);
  
  fill(255);
  ellipse(width/2, height/2, 1, 1);
  
  fill(0);
  ellipse(width/2, height/2, 2, 2);
  
  fill(255);
  ellipse(width/2, height/2, 3, 3);
  
  fill(0);
  ellipse(width/2, height/2, 4, 4);
  
  fill(255);
  ellipse(width/2, height/2, 5, 5);
  
  fill(0);
  ellipse(width/2, height/2, 6, 6);
    
  fill(255);
  ellipse(width/2, height/2, 8, 8);
    
  fill(0);
  ellipse(width/2, height/2, 10, 10);
    
  fill(255);
  ellipse(width/2, height/2, 20, 20);
  
  fill(0);
  ellipse(width/2, height/2, 40, 40);
    
    fill(255);
  ellipse(width/2, height/2, 60, 60);
    
    fill(0);
  ellipse(width/2, height/2, 80, 80);
  
    fill(255);
  ellipse(width/2, height/2, 100, 100);
    
  fill(0);
  ellipse(width/2, height/2, 120, 120);
  
    fill(255);
  ellipse(width/2, height/2, 140, 140);
    
    fill(0);
  ellipse(width/2, height/2, 160, 160);
  
    fill(255);
  ellipse(width/2, height/2, 180, 180);  
    
    fill(0);
  ellipse(width/2, height/2, 200, 200);
    
    fill(255);
  ellipse(width/2, height/2, 220, 220);
    
    fill(0);
  ellipse(width/2, height/2, 240, 240);
    
    fill(255);
  ellipse(width/2, height/2, 260, 260);
    
    fill(0);
  ellipse(width/2, height/2, 280, 280);
    
    fill(255);
  ellipse(width/2, height/2, 300, 300);
    
    fill(0);
  ellipse(width/2, height/2, 320, 320);
    
    fill(255);
  ellipse(width/2, height/2, 340, 340);
  
    fill(0);
  ellipse(width/2, height/2, 360, 360);
    
    fill(255);
  ellipse(width/2, height/2, 380, 380);
    
    fill(0);
  ellipse(width/2, height/2, 400, 400);
    
    fill(255);
  ellipse(width/2, height/2, 420, 420);
    
    fill(0);
  ellipse(width/2, height/2, 440, 440);
    
    fill(255);
  ellipse(width/2, height/2, 460, 460);
      
    fill(0);
  ellipse(width/2, height/2, 480, 480);
    
    fill(255);
  ellipse(width/2, height/2, 500, 500);  
    
    fill(0);
  ellipse(width/2, height/2, 520, 520);
    
    fill(255);
  ellipse(width/2, height/2, 540, 540);
    
    fill(0);
  ellipse(width/2, height/2, 560, 560);
    
    fill(255);
  ellipse(width/2, height/2, 580, 580);
    
    fill(0);
  ellipse(width/2, height/2, 600, 600);
  
  myCtr-- ;
    if (myCtr < 0) {
      myState = 23 ; 
      myCtr = 3 ; 
    }
  
  break;
  
  case 25:
  
  fill(0);
  ellipse(width/2, height/2, 600, 600);
  
  fill(0);
  ellipse(width/2, height/2, 1/2, 1/2);
  
  fill(255);
  ellipse(width/2, height/2, 1, 1);
  
  fill(0);
  ellipse(width/2, height/2, 2, 2);
  
  fill(255);
  ellipse(width/2, height/2, 3, 3);
  
  fill(0);
  ellipse(width/2, height/2, 4, 4);
  
  fill(255);
  ellipse(width/2, height/2, 5, 5);
  
  fill(0);
  ellipse(width/2, height/2, 6, 6);
    
  fill(255);
  ellipse(width/2, height/2, 8, 8);
    
  fill(0);
  ellipse(width/2, height/2, 10, 10);
    
  fill(255);
  ellipse(width/2, height/2, 20, 20);
  
  fill(0);
  ellipse(width/2, height/2, 40, 40);
    
    fill(255);
  ellipse(width/2, height/2, 60, 60);
    
    fill(0);
  ellipse(width/2, height/2, 80, 80);
  
    fill(255);
  ellipse(width/2, height/2, 100, 100);
    
  fill(0);
  ellipse(width/2, height/2, 120, 120);
  
    fill(255);
  ellipse(width/2, height/2, 140, 140);
    
    fill(0);
  ellipse(width/2, height/2, 160, 160);
  
    fill(255);
  ellipse(width/2, height/2, 180, 180);  
    
    fill(0);
  ellipse(width/2, height/2, 200, 200);
    
    fill(255);
  ellipse(width/2, height/2, 220, 220);
    
    fill(0);
  ellipse(width/2, height/2, 240, 240);
    
    fill(255);
  ellipse(width/2, height/2, 260, 260);
    
    fill(0);
  ellipse(width/2, height/2, 280, 280);
    
    fill(255);
  ellipse(width/2, height/2, 300, 300);
    
    fill(0);
  ellipse(width/2, height/2, 320, 320);
    
    fill(255);
  ellipse(width/2, height/2, 340, 340);
  
    fill(0);
  ellipse(width/2, height/2, 360, 360);
    
    fill(255);
  ellipse(width/2, height/2, 380, 380);
    
    fill(0);
  ellipse(width/2, height/2, 400, 400);
    
    fill(255);
  ellipse(width/2, height/2, 420, 420);
    
    fill(0);
  ellipse(width/2, height/2, 440, 440);
    
    fill(255);
  ellipse(width/2, height/2, 460, 460);
      
    fill(0);
  ellipse(width/2, height/2, 480, 480);
    
    fill(255);
  ellipse(width/2, height/2, 500, 500);  
    
    fill(0);
  ellipse(width/2, height/2, 520, 520);
    
    fill(255);
  ellipse(width/2, height/2, 540, 540);
    
    fill(0);
  ellipse(width/2, height/2, 560, 560);
    
    fill(255);
  ellipse(width/2, height/2, 580, 580);
  
  myCtr-- ;
    if (myCtr < 0) {
      myState = 24 ; 
      myCtr = 3 ; 
    }
  
  break;
  
  case 26:
  
  fill(255);
  ellipse(width/2, height/2, 580, 580);
  
  fill(0);
  ellipse(width/2, height/2, 1/2, 1/2);
  
  fill(255);
  ellipse(width/2, height/2, 1, 1);
  
  fill(0);
  ellipse(width/2, height/2, 2, 2);
  
  fill(255);
  ellipse(width/2, height/2, 3, 3);
  
  fill(0);
  ellipse(width/2, height/2, 4, 4);
  
  fill(255);
  ellipse(width/2, height/2, 5, 5);
  
  fill(0);
  ellipse(width/2, height/2, 6, 6);
    
  fill(255);
  ellipse(width/2, height/2, 8, 8);
    
  fill(0);
  ellipse(width/2, height/2, 10, 10);
    
  fill(255);
  ellipse(width/2, height/2, 20, 20);
  
  fill(0);
  ellipse(width/2, height/2, 40, 40);
    
    fill(255);
  ellipse(width/2, height/2, 60, 60);
    
    fill(0);
  ellipse(width/2, height/2, 80, 80);
  
    fill(255);
  ellipse(width/2, height/2, 100, 100);
    
  fill(0);
  ellipse(width/2, height/2, 120, 120);
  
    fill(255);
  ellipse(width/2, height/2, 140, 140);
    
    fill(0);
  ellipse(width/2, height/2, 160, 160);
  
    fill(255);
  ellipse(width/2, height/2, 180, 180);  
    
    fill(0);
  ellipse(width/2, height/2, 200, 200);
    
    fill(255);
  ellipse(width/2, height/2, 220, 220);
    
    fill(0);
  ellipse(width/2, height/2, 240, 240);
    
    fill(255);
  ellipse(width/2, height/2, 260, 260);
    
    fill(0);
  ellipse(width/2, height/2, 280, 280);
    
    fill(255);
  ellipse(width/2, height/2, 300, 300);
    
    fill(0);
  ellipse(width/2, height/2, 320, 320);
    
    fill(255);
  ellipse(width/2, height/2, 340, 340);
  
    fill(0);
  ellipse(width/2, height/2, 360, 360);
    
    fill(255);
  ellipse(width/2, height/2, 380, 380);
    
    fill(0);
  ellipse(width/2, height/2, 400, 400);
    
    fill(255);
  ellipse(width/2, height/2, 420, 420);
    
    fill(0);
  ellipse(width/2, height/2, 440, 440);
    
    fill(255);
  ellipse(width/2, height/2, 460, 460);
      
    fill(0);
  ellipse(width/2, height/2, 480, 480);
    
    fill(255);
  ellipse(width/2, height/2, 500, 500);  
    
    fill(0);
  ellipse(width/2, height/2, 520, 520);
    
    fill(255);
  ellipse(width/2, height/2, 540, 540);
    
    fill(0);
  ellipse(width/2, height/2, 560, 560);
  
  myCtr-- ;
    if (myCtr < 0) {
      myState = 25 ; 
      myCtr = 3 ; 
    }
  
  break;
  
  case 27:
  
  fill(0);
  ellipse(width/2, height/2, 560, 560);
  
  fill(0);
  ellipse(width/2, height/2, 1/2, 1/2);
  
  fill(255);
  ellipse(width/2, height/2, 1, 1);
  
  fill(0);
  ellipse(width/2, height/2, 2, 2);
  
  fill(255);
  ellipse(width/2, height/2, 3, 3);
  
  fill(0);
  ellipse(width/2, height/2, 4, 4);
  
  fill(255);
  ellipse(width/2, height/2, 5, 5);
  
  fill(0);
  ellipse(width/2, height/2, 6, 6);
    
  fill(255);
  ellipse(width/2, height/2, 8, 8);
    
  fill(0);
  ellipse(width/2, height/2, 10, 10);
    
  fill(255);
  ellipse(width/2, height/2, 20, 20);
  
  fill(0);
  ellipse(width/2, height/2, 40, 40);
    
    fill(255);
  ellipse(width/2, height/2, 60, 60);
    
    fill(0);
  ellipse(width/2, height/2, 80, 80);
  
    fill(255);
  ellipse(width/2, height/2, 100, 100);
    
  fill(0);
  ellipse(width/2, height/2, 120, 120);
  
    fill(255);
  ellipse(width/2, height/2, 140, 140);
    
    fill(0);
  ellipse(width/2, height/2, 160, 160);
  
    fill(255);
  ellipse(width/2, height/2, 180, 180);  
    
    fill(0);
  ellipse(width/2, height/2, 200, 200);
    
    fill(255);
  ellipse(width/2, height/2, 220, 220);
    
    fill(0);
  ellipse(width/2, height/2, 240, 240);
    
    fill(255);
  ellipse(width/2, height/2, 260, 260);
    
    fill(0);
  ellipse(width/2, height/2, 280, 280);
    
    fill(255);
  ellipse(width/2, height/2, 300, 300);
    
    fill(0);
  ellipse(width/2, height/2, 320, 320);
    
    fill(255);
  ellipse(width/2, height/2, 340, 340);
  
    fill(0);
  ellipse(width/2, height/2, 360, 360);
    
    fill(255);
  ellipse(width/2, height/2, 380, 380);
    
    fill(0);
  ellipse(width/2, height/2, 400, 400);
    
    fill(255);
  ellipse(width/2, height/2, 420, 420);
    
    fill(0);
  ellipse(width/2, height/2, 440, 440);
    
    fill(255);
  ellipse(width/2, height/2, 460, 460);
      
    fill(0);
  ellipse(width/2, height/2, 480, 480);
    
    fill(255);
  ellipse(width/2, height/2, 500, 500);  
    
    fill(0);
  ellipse(width/2, height/2, 520, 520);
    
    fill(255);
  ellipse(width/2, height/2, 540, 540);
  
  myCtr-- ;
    if (myCtr < 0) {
      myState = 26 ; 
      myCtr = 3 ; 
    }
  
  break;
  
  case 28:
  
  fill(255);
  ellipse(width/2, height/2, 540, 540);
  
  fill(0);
  ellipse(width/2, height/2, 1/2, 1/2);
  
  fill(255);
  ellipse(width/2, height/2, 1, 1);
  
  fill(0);
  ellipse(width/2, height/2, 2, 2);
  
  fill(255);
  ellipse(width/2, height/2, 3, 3);
  
  fill(0);
  ellipse(width/2, height/2, 4, 4);
  
  fill(255);
  ellipse(width/2, height/2, 5, 5);
  
  fill(0);
  ellipse(width/2, height/2, 6, 6);
    
  fill(255);
  ellipse(width/2, height/2, 8, 8);
    
  fill(0);
  ellipse(width/2, height/2, 10, 10);
    
  fill(255);
  ellipse(width/2, height/2, 20, 20);
  
  fill(0);
  ellipse(width/2, height/2, 40, 40);
    
    fill(255);
  ellipse(width/2, height/2, 60, 60);
    
    fill(0);
  ellipse(width/2, height/2, 80, 80);
  
    fill(255);
  ellipse(width/2, height/2, 100, 100);
    
  fill(0);
  ellipse(width/2, height/2, 120, 120);
  
    fill(255);
  ellipse(width/2, height/2, 140, 140);
    
    fill(0);
  ellipse(width/2, height/2, 160, 160);
  
    fill(255);
  ellipse(width/2, height/2, 180, 180);  
    
    fill(0);
  ellipse(width/2, height/2, 200, 200);
    
    fill(255);
  ellipse(width/2, height/2, 220, 220);
    
    fill(0);
  ellipse(width/2, height/2, 240, 240);
    
    fill(255);
  ellipse(width/2, height/2, 260, 260);
    
    fill(0);
  ellipse(width/2, height/2, 280, 280);
    
    fill(255);
  ellipse(width/2, height/2, 300, 300);
    
    fill(0);
  ellipse(width/2, height/2, 320, 320);
    
    fill(255);
  ellipse(width/2, height/2, 340, 340);
  
    fill(0);
  ellipse(width/2, height/2, 360, 360);
    
    fill(255);
  ellipse(width/2, height/2, 380, 380);
    
    fill(0);
  ellipse(width/2, height/2, 400, 400);
    
    fill(255);
  ellipse(width/2, height/2, 420, 420);
    
    fill(0);
  ellipse(width/2, height/2, 440, 440);
    
    fill(255);
  ellipse(width/2, height/2, 460, 460);
      
    fill(0);
  ellipse(width/2, height/2, 480, 480);
    
    fill(255);
  ellipse(width/2, height/2, 500, 500);  
    
    fill(0);
  ellipse(width/2, height/2, 520, 520);
  
  myCtr-- ;
    if (myCtr < 0) {
      myState = 27 ; // at countdown, adv. to state 1
      myCtr = 3 ; 
    }
  
  break;
  
  case 29:
  
  fill(0);
  ellipse(width/2, height/2, 520, 520);
  
  fill(0);
  ellipse(width/2, height/2, 1/2, 1/2);
  
  fill(255);
  ellipse(width/2, height/2, 1, 1);
  
  fill(0);
  ellipse(width/2, height/2, 2, 2);
  
  fill(255);
  ellipse(width/2, height/2, 3, 3);
  
  fill(0);
  ellipse(width/2, height/2, 4, 4);
  
  fill(255);
  ellipse(width/2, height/2, 5, 5);
  
  fill(0);
  ellipse(width/2, height/2, 6, 6);
    
  fill(255);
  ellipse(width/2, height/2, 8, 8);
    
  fill(0);
  ellipse(width/2, height/2, 10, 10);
    
  fill(255);
  ellipse(width/2, height/2, 20, 20);
  
  fill(0);
  ellipse(width/2, height/2, 40, 40);
    
    fill(255);
  ellipse(width/2, height/2, 60, 60);
    
    fill(0);
  ellipse(width/2, height/2, 80, 80);
  
    fill(255);
  ellipse(width/2, height/2, 100, 100);
    
  fill(0);
  ellipse(width/2, height/2, 120, 120);
  
    fill(255);
  ellipse(width/2, height/2, 140, 140);
    
    fill(0);
  ellipse(width/2, height/2, 160, 160);
  
    fill(255);
  ellipse(width/2, height/2, 180, 180);  
    
    fill(0);
  ellipse(width/2, height/2, 200, 200);
    
    fill(255);
  ellipse(width/2, height/2, 220, 220);
    
    fill(0);
  ellipse(width/2, height/2, 240, 240);
    
    fill(255);
  ellipse(width/2, height/2, 260, 260);
    
    fill(0);
  ellipse(width/2, height/2, 280, 280);
    
    fill(255);
  ellipse(width/2, height/2, 300, 300);
    
    fill(0);
  ellipse(width/2, height/2, 320, 320);
    
    fill(255);
  ellipse(width/2, height/2, 340, 340);
  
    fill(0);
  ellipse(width/2, height/2, 360, 360);
    
    fill(255);
  ellipse(width/2, height/2, 380, 380);
    
    fill(0);
  ellipse(width/2, height/2, 400, 400);
    
    fill(255);
  ellipse(width/2, height/2, 420, 420);
    
    fill(0);
  ellipse(width/2, height/2, 440, 440);
    
    fill(255);
  ellipse(width/2, height/2, 460, 460);
      
    fill(0);
  ellipse(width/2, height/2, 480, 480);
    
    fill(255);
  ellipse(width/2, height/2, 500, 500);
  
  myCtr-- ;
    if (myCtr < 0) {
      myState = 28 ; 
      myCtr = 3 ; 
    }
  
  break;
  
  case 30:
  
  fill(255);
  ellipse(width/2, height/2, 500, 500);
  
  fill(0);
  ellipse(width/2, height/2, 1/2, 1/2);
  
  fill(255);
  ellipse(width/2, height/2, 1, 1);
  
  fill(0);
  ellipse(width/2, height/2, 2, 2);
  
  fill(255);
  ellipse(width/2, height/2, 3, 3);
  
  fill(0);
  ellipse(width/2, height/2, 4, 4);
  
  fill(255);
  ellipse(width/2, height/2, 5, 5);
  
  fill(0);
  ellipse(width/2, height/2, 6, 6);
    
  fill(255);
  ellipse(width/2, height/2, 8, 8);
    
  fill(0);
  ellipse(width/2, height/2, 10, 10);
    
  fill(255);
  ellipse(width/2, height/2, 20, 20);
  
  fill(0);
  ellipse(width/2, height/2, 40, 40);
    
    fill(255);
  ellipse(width/2, height/2, 60, 60);
    
    fill(0);
  ellipse(width/2, height/2, 80, 80);
  
    fill(255);
  ellipse(width/2, height/2, 100, 100);
    
  fill(0);
  ellipse(width/2, height/2, 120, 120);
  
    fill(255);
  ellipse(width/2, height/2, 140, 140);
    
    fill(0);
  ellipse(width/2, height/2, 160, 160);
  
    fill(255);
  ellipse(width/2, height/2, 180, 180);  
    
    fill(0);
  ellipse(width/2, height/2, 200, 200);
    
    fill(255);
  ellipse(width/2, height/2, 220, 220);
    
    fill(0);
  ellipse(width/2, height/2, 240, 240);
    
    fill(255);
  ellipse(width/2, height/2, 260, 260);
    
    fill(0);
  ellipse(width/2, height/2, 280, 280);
    
    fill(255);
  ellipse(width/2, height/2, 300, 300);
    
    fill(0);
  ellipse(width/2, height/2, 320, 320);
    
    fill(255);
  ellipse(width/2, height/2, 340, 340);
  
    fill(0);
  ellipse(width/2, height/2, 360, 360);
    
    fill(255);
  ellipse(width/2, height/2, 380, 380);
    
    fill(0);
  ellipse(width/2, height/2, 400, 400);
    
    fill(255);
  ellipse(width/2, height/2, 420, 420);
    
    fill(0);
  ellipse(width/2, height/2, 440, 440);
    
    fill(255);
  ellipse(width/2, height/2, 460, 460);
      
    fill(0);
  ellipse(width/2, height/2, 480, 480);
  
  myCtr-- ;
    if (myCtr < 0) {
      myState = 29 ; // at countdown, adv. to state 1
      myCtr = 3 ; 
    }
  
  break;
  
  case 31:
  
  fill(0);
  ellipse(width/2, height/2, 480, 480);
  
  fill(0);
  ellipse(width/2, height/2, 1/2, 1/2);
  
  fill(255);
  ellipse(width/2, height/2, 1, 1);
  
  fill(0);
  ellipse(width/2, height/2, 2, 2);
  
  fill(255);
  ellipse(width/2, height/2, 3, 3);
  
  fill(0);
  ellipse(width/2, height/2, 4, 4);
  
  fill(255);
  ellipse(width/2, height/2, 5, 5);
  
  fill(0);
  ellipse(width/2, height/2, 6, 6);
    
  fill(255);
  ellipse(width/2, height/2, 8, 8);
    
  fill(0);
  ellipse(width/2, height/2, 10, 10);
    
  fill(255);
  ellipse(width/2, height/2, 20, 20);
  
  fill(0);
  ellipse(width/2, height/2, 40, 40);
    
    fill(255);
  ellipse(width/2, height/2, 60, 60);
    
    fill(0);
  ellipse(width/2, height/2, 80, 80);
  
    fill(255);
  ellipse(width/2, height/2, 100, 100);
    
  fill(0);
  ellipse(width/2, height/2, 120, 120);
  
    fill(255);
  ellipse(width/2, height/2, 140, 140);
    
    fill(0);
  ellipse(width/2, height/2, 160, 160);
  
    fill(255);
  ellipse(width/2, height/2, 180, 180);  
    
    fill(0);
  ellipse(width/2, height/2, 200, 200);
    
    fill(255);
  ellipse(width/2, height/2, 220, 220);
    
    fill(0);
  ellipse(width/2, height/2, 240, 240);
    
    fill(255);
  ellipse(width/2, height/2, 260, 260);
    
    fill(0);
  ellipse(width/2, height/2, 280, 280);
    
    fill(255);
  ellipse(width/2, height/2, 300, 300);
    
    fill(0);
  ellipse(width/2, height/2, 320, 320);
    
    fill(255);
  ellipse(width/2, height/2, 340, 340);
  
    fill(0);
  ellipse(width/2, height/2, 360, 360);
    
    fill(255);
  ellipse(width/2, height/2, 380, 380);
    
    fill(0);
  ellipse(width/2, height/2, 400, 400);
    
    fill(255);
  ellipse(width/2, height/2, 420, 420);
    
    fill(0);
  ellipse(width/2, height/2, 440, 440);
    
    fill(255);
  ellipse(width/2, height/2, 460, 460);
  
  myCtr-- ;
    if (myCtr < 0) {
      myState = 30 ; // at countdown, adv. to state 1
      myCtr = 3 ; 
    }
  
  break;
  
  case 32:
  
  fill(255);
  ellipse(width/2, height/2, 460, 460);
  
  fill(0);
  ellipse(width/2, height/2, 1/2, 1/2);
  
  fill(255);
  ellipse(width/2, height/2, 1, 1);
  
  fill(0);
  ellipse(width/2, height/2, 2, 2);
  
  fill(255);
  ellipse(width/2, height/2, 3, 3);
  
  fill(0);
  ellipse(width/2, height/2, 4, 4);
  
  fill(255);
  ellipse(width/2, height/2, 5, 5);
  
  fill(0);
  ellipse(width/2, height/2, 6, 6);
    
  fill(255);
  ellipse(width/2, height/2, 8, 8);
    
  fill(0);
  ellipse(width/2, height/2, 10, 10);
    
  fill(255);
  ellipse(width/2, height/2, 20, 20);
  
  fill(0);
  ellipse(width/2, height/2, 40, 40);
    
    fill(255);
  ellipse(width/2, height/2, 60, 60);
    
    fill(0);
  ellipse(width/2, height/2, 80, 80);
  
    fill(255);
  ellipse(width/2, height/2, 100, 100);
    
  fill(0);
  ellipse(width/2, height/2, 120, 120);
  
    fill(255);
  ellipse(width/2, height/2, 140, 140);
    
    fill(0);
  ellipse(width/2, height/2, 160, 160);
  
    fill(255);
  ellipse(width/2, height/2, 180, 180);  
    
    fill(0);
  ellipse(width/2, height/2, 200, 200);
    
    fill(255);
  ellipse(width/2, height/2, 220, 220);
    
    fill(0);
  ellipse(width/2, height/2, 240, 240);
    
    fill(255);
  ellipse(width/2, height/2, 260, 260);
    
    fill(0);
  ellipse(width/2, height/2, 280, 280);
    
    fill(255);
  ellipse(width/2, height/2, 300, 300);
    
    fill(0);
  ellipse(width/2, height/2, 320, 320);
    
    fill(255);
  ellipse(width/2, height/2, 340, 340);
  
    fill(0);
  ellipse(width/2, height/2, 360, 360);
    
    fill(255);
  ellipse(width/2, height/2, 380, 380);
    
    fill(0);
  ellipse(width/2, height/2, 400, 400);
    
    fill(255);
  ellipse(width/2, height/2, 420, 420);
    
    fill(0);
  ellipse(width/2, height/2, 440, 440);
  
  myCtr-- ;
    if (myCtr < 0) {
      myState = 31 ; 
      myCtr = 3 ; 
    }
  
  break;
  
  case 33:
  
  fill(0);
  ellipse(width/2, height/2, 440, 440);
  
  fill(0);
  ellipse(width/2, height/2, 1/2, 1/2);
  
  fill(255);
  ellipse(width/2, height/2, 1, 1);
  
  fill(0);
  ellipse(width/2, height/2, 2, 2);
  
  fill(255);
  ellipse(width/2, height/2, 3, 3);
  
  fill(0);
  ellipse(width/2, height/2, 4, 4);
  
  fill(255);
  ellipse(width/2, height/2, 5, 5);
  
  fill(0);
  ellipse(width/2, height/2, 6, 6);
    
  fill(255);
  ellipse(width/2, height/2, 8, 8);
    
  fill(0);
  ellipse(width/2, height/2, 10, 10);
    
  fill(255);
  ellipse(width/2, height/2, 20, 20);
  
  fill(0);
  ellipse(width/2, height/2, 40, 40);
    
    fill(255);
  ellipse(width/2, height/2, 60, 60);
    
    fill(0);
  ellipse(width/2, height/2, 80, 80);
  
    fill(255);
  ellipse(width/2, height/2, 100, 100);
    
  fill(0);
  ellipse(width/2, height/2, 120, 120);
  
    fill(255);
  ellipse(width/2, height/2, 140, 140);
    
    fill(0);
  ellipse(width/2, height/2, 160, 160);
  
    fill(255);
  ellipse(width/2, height/2, 180, 180);  
    
    fill(0);
  ellipse(width/2, height/2, 200, 200);
    
    fill(255);
  ellipse(width/2, height/2, 220, 220);
    
    fill(0);
  ellipse(width/2, height/2, 240, 240);
    
    fill(255);
  ellipse(width/2, height/2, 260, 260);
    
    fill(0);
  ellipse(width/2, height/2, 280, 280);
    
    fill(255);
  ellipse(width/2, height/2, 300, 300);
    
    fill(0);
  ellipse(width/2, height/2, 320, 320);
    
    fill(255);
  ellipse(width/2, height/2, 340, 340);
  
    fill(0);
  ellipse(width/2, height/2, 360, 360);
    
    fill(255);
  ellipse(width/2, height/2, 380, 380);
    
    fill(0);
  ellipse(width/2, height/2, 400, 400);
    
    fill(255);
  ellipse(width/2, height/2, 420, 420);
  
  myCtr-- ;
    if (myCtr < 0) {
      myState = 32 ; // at countdown, adv. to state 1
      myCtr = 3 ; 
    }
  
  break;
  
  case 34:
  
  fill(255);
  ellipse(width/2, height/2, 420, 420);
  
  fill(0);
  ellipse(width/2, height/2, 1/2, 1/2);
  
  fill(255);
  ellipse(width/2, height/2, 1, 1);
  
  fill(0);
  ellipse(width/2, height/2, 2, 2);
  
  fill(255);
  ellipse(width/2, height/2, 3, 3);
  
  fill(0);
  ellipse(width/2, height/2, 4, 4);
  
  fill(255);
  ellipse(width/2, height/2, 5, 5);
  
  fill(0);
  ellipse(width/2, height/2, 6, 6);
    
  fill(255);
  ellipse(width/2, height/2, 8, 8);
    
  fill(0);
  ellipse(width/2, height/2, 10, 10);
    
  fill(255);
  ellipse(width/2, height/2, 20, 20);
  
  fill(0);
  ellipse(width/2, height/2, 40, 40);
    
    fill(255);
  ellipse(width/2, height/2, 60, 60);
    
    fill(0);
  ellipse(width/2, height/2, 80, 80);
  
    fill(255);
  ellipse(width/2, height/2, 100, 100);
    
  fill(0);
  ellipse(width/2, height/2, 120, 120);
  
    fill(255);
  ellipse(width/2, height/2, 140, 140);
    
    fill(0);
  ellipse(width/2, height/2, 160, 160);
  
    fill(255);
  ellipse(width/2, height/2, 180, 180);  
    
    fill(0);
  ellipse(width/2, height/2, 200, 200);
    
    fill(255);
  ellipse(width/2, height/2, 220, 220);
    
    fill(0);
  ellipse(width/2, height/2, 240, 240);
    
    fill(255);
  ellipse(width/2, height/2, 260, 260);
    
    fill(0);
  ellipse(width/2, height/2, 280, 280);
    
    fill(255);
  ellipse(width/2, height/2, 300, 300);
    
    fill(0);
  ellipse(width/2, height/2, 320, 320);
    
    fill(255);
  ellipse(width/2, height/2, 340, 340);
  
    fill(0);
  ellipse(width/2, height/2, 360, 360);
    
    fill(255);
  ellipse(width/2, height/2, 380, 380);
    
    fill(0);
  ellipse(width/2, height/2, 400, 400);
  
  myCtr-- ;
    if (myCtr < 0) {
      myState = 33 ; // at countdown, adv. to state 1
      myCtr = 3 ; 
    }
  
  break;
  
  case 35:
  
  fill(0);
  ellipse(width/2, height/2, 400, 400);
  
  fill(0);
  ellipse(width/2, height/2, 1/2, 1/2);
  
  fill(255);
  ellipse(width/2, height/2, 1, 1);
  
  fill(0);
  ellipse(width/2, height/2, 2, 2);
  
  fill(255);
  ellipse(width/2, height/2, 3, 3);
  
  fill(0);
  ellipse(width/2, height/2, 4, 4);
  
  fill(255);
  ellipse(width/2, height/2, 5, 5);
  
  fill(0);
  ellipse(width/2, height/2, 6, 6);
    
  fill(255);
  ellipse(width/2, height/2, 8, 8);
    
  fill(0);
  ellipse(width/2, height/2, 10, 10);
    
  fill(255);
  ellipse(width/2, height/2, 20, 20);
  
  fill(0);
  ellipse(width/2, height/2, 40, 40);
    
    fill(255);
  ellipse(width/2, height/2, 60, 60);
    
    fill(0);
  ellipse(width/2, height/2, 80, 80);
  
    fill(255);
  ellipse(width/2, height/2, 100, 100);
    
  fill(0);
  ellipse(width/2, height/2, 120, 120);
  
    fill(255);
  ellipse(width/2, height/2, 140, 140);
    
    fill(0);
  ellipse(width/2, height/2, 160, 160);
  
    fill(255);
  ellipse(width/2, height/2, 180, 180);  
    
    fill(0);
  ellipse(width/2, height/2, 200, 200);
    
    fill(255);
  ellipse(width/2, height/2, 220, 220);
    
    fill(0);
  ellipse(width/2, height/2, 240, 240);
    
    fill(255);
  ellipse(width/2, height/2, 260, 260);
    
    fill(0);
  ellipse(width/2, height/2, 280, 280);
    
    fill(255);
  ellipse(width/2, height/2, 300, 300);
    
    fill(0);
  ellipse(width/2, height/2, 320, 320);
    
    fill(255);
  ellipse(width/2, height/2, 340, 340);
  
    fill(0);
  ellipse(width/2, height/2, 360, 360);
    
    fill(255);
  ellipse(width/2, height/2, 380, 380);
  
  myCtr-- ;
    if (myCtr < 0) {
      myState = 34 ; 
      myCtr = 3 ; 
    }
  
  break;
  
  case 36:
  
  fill(255);
  ellipse(width/2, height/2, 380, 380);
  
  fill(0);
  ellipse(width/2, height/2, 1/2, 1/2);
  
  fill(255);
  ellipse(width/2, height/2, 1, 1);
  
  fill(0);
  ellipse(width/2, height/2, 2, 2);
  
  fill(255);
  ellipse(width/2, height/2, 3, 3);
  
  fill(0);
  ellipse(width/2, height/2, 4, 4);
  
  fill(255);
  ellipse(width/2, height/2, 5, 5);
  
  fill(0);
  ellipse(width/2, height/2, 6, 6);
    
  fill(255);
  ellipse(width/2, height/2, 8, 8);
    
  fill(0);
  ellipse(width/2, height/2, 10, 10);
    
  fill(255);
  ellipse(width/2, height/2, 20, 20);
  
  fill(0);
  ellipse(width/2, height/2, 40, 40);
    
    fill(255);
  ellipse(width/2, height/2, 60, 60);
    
    fill(0);
  ellipse(width/2, height/2, 80, 80);
  
    fill(255);
  ellipse(width/2, height/2, 100, 100);
    
  fill(0);
  ellipse(width/2, height/2, 120, 120);
  
    fill(255);
  ellipse(width/2, height/2, 140, 140);
    
    fill(0);
  ellipse(width/2, height/2, 160, 160);
  
    fill(255);
  ellipse(width/2, height/2, 180, 180);  
    
    fill(0);
  ellipse(width/2, height/2, 200, 200);
    
    fill(255);
  ellipse(width/2, height/2, 220, 220);
    
    fill(0);
  ellipse(width/2, height/2, 240, 240);
    
    fill(255);
  ellipse(width/2, height/2, 260, 260);
    
    fill(0);
  ellipse(width/2, height/2, 280, 280);
    
    fill(255);
  ellipse(width/2, height/2, 300, 300);
    
    fill(0);
  ellipse(width/2, height/2, 320, 320);
    
    fill(255);
  ellipse(width/2, height/2, 340, 340);
  
    fill(0);
  ellipse(width/2, height/2, 360, 360);
  
  myCtr-- ;
    if (myCtr < 0) {
      myState = 35 ; 
      myCtr = 3 ; 
    }
  
  break;
  
  case 37:
  
  fill(0);
  ellipse(width/2, height/2, 360, 360);
  
  fill(0);
  ellipse(width/2, height/2, 1/2, 1/2);
  
  fill(255);
  ellipse(width/2, height/2, 1, 1);
  
  fill(0);
  ellipse(width/2, height/2, 2, 2);
  
  fill(255);
  ellipse(width/2, height/2, 3, 3);
  
  fill(0);
  ellipse(width/2, height/2, 4, 4);
  
  fill(255);
  ellipse(width/2, height/2, 5, 5);
  
  fill(0);
  ellipse(width/2, height/2, 6, 6);
    
  fill(255);
  ellipse(width/2, height/2, 8, 8);
    
  fill(0);
  ellipse(width/2, height/2, 10, 10);
    
  fill(255);
  ellipse(width/2, height/2, 20, 20);
  
  fill(0);
  ellipse(width/2, height/2, 40, 40);
    
    fill(255);
  ellipse(width/2, height/2, 60, 60);
    
    fill(0);
  ellipse(width/2, height/2, 80, 80);
  
    fill(255);
  ellipse(width/2, height/2, 100, 100);
    
  fill(0);
  ellipse(width/2, height/2, 120, 120);
  
    fill(255);
  ellipse(width/2, height/2, 140, 140);
    
    fill(0);
  ellipse(width/2, height/2, 160, 160);
  
    fill(255);
  ellipse(width/2, height/2, 180, 180);  
    
    fill(0);
  ellipse(width/2, height/2, 200, 200);
    
    fill(255);
  ellipse(width/2, height/2, 220, 220);
    
    fill(0);
  ellipse(width/2, height/2, 240, 240);
    
    fill(255);
  ellipse(width/2, height/2, 260, 260);
    
    fill(0);
  ellipse(width/2, height/2, 280, 280);
    
    fill(255);
  ellipse(width/2, height/2, 300, 300);
    
    fill(0);
  ellipse(width/2, height/2, 320, 320);
    
    fill(255);
  ellipse(width/2, height/2, 340, 340);
  
  myCtr-- ;
    if (myCtr < 0) {
      myState = 36 ; 
      myCtr = 3 ; 
    }
  
  break;
  
  case 38:
  
  fill(255);
  ellipse(width/2, height/2, 340, 340);
  
  fill(0);
  ellipse(width/2, height/2, 1/2, 1/2);
  
  fill(255);
  ellipse(width/2, height/2, 1, 1);
  
  fill(0);
  ellipse(width/2, height/2, 2, 2);
  
  fill(255);
  ellipse(width/2, height/2, 3, 3);
  
  fill(0);
  ellipse(width/2, height/2, 4, 4);
  
  fill(255);
  ellipse(width/2, height/2, 5, 5);
  
  fill(0);
  ellipse(width/2, height/2, 6, 6);
    
  fill(255);
  ellipse(width/2, height/2, 8, 8);
    
  fill(0);
  ellipse(width/2, height/2, 10, 10);
    
  fill(255);
  ellipse(width/2, height/2, 20, 20);
  
  fill(0);
  ellipse(width/2, height/2, 40, 40);
    
    fill(255);
  ellipse(width/2, height/2, 60, 60);
    
    fill(0);
  ellipse(width/2, height/2, 80, 80);
  
    fill(255);
  ellipse(width/2, height/2, 100, 100);
    
  fill(0);
  ellipse(width/2, height/2, 120, 120);
  
    fill(255);
  ellipse(width/2, height/2, 140, 140);
    
    fill(0);
  ellipse(width/2, height/2, 160, 160);
  
    fill(255);
  ellipse(width/2, height/2, 180, 180);  
    
    fill(0);
  ellipse(width/2, height/2, 200, 200);
    
    fill(255);
  ellipse(width/2, height/2, 220, 220);
    
    fill(0);
  ellipse(width/2, height/2, 240, 240);
    
    fill(255);
  ellipse(width/2, height/2, 260, 260);
    
    fill(0);
  ellipse(width/2, height/2, 280, 280);
    
    fill(255);
  ellipse(width/2, height/2, 300, 300);
    
    fill(0);
  ellipse(width/2, height/2, 320, 320);
  
  myCtr-- ;
    if (myCtr < 0) {
      myState = 37 ; 
      myCtr = 3 ; 
    }
  
  break;
  
  case 39:
  
  fill(0);
  ellipse(width/2, height/2, 320, 320);
  
  fill(0);
  ellipse(width/2, height/2, 1/2, 1/2);
  
  fill(255);
  ellipse(width/2, height/2, 1, 1);
  
  fill(0);
  ellipse(width/2, height/2, 2, 2);
  
  fill(255);
  ellipse(width/2, height/2, 3, 3);
  
  fill(0);
  ellipse(width/2, height/2, 4, 4);
  
  fill(255);
  ellipse(width/2, height/2, 5, 5);
  
  fill(0);
  ellipse(width/2, height/2, 6, 6);
    
  fill(255);
  ellipse(width/2, height/2, 8, 8);
    
  fill(0);
  ellipse(width/2, height/2, 10, 10);
    
  fill(255);
  ellipse(width/2, height/2, 20, 20);
  
  fill(0);
  ellipse(width/2, height/2, 40, 40);
    
    fill(255);
  ellipse(width/2, height/2, 60, 60);
    
    fill(0);
  ellipse(width/2, height/2, 80, 80);
  
    fill(255);
  ellipse(width/2, height/2, 100, 100);
    
  fill(0);
  ellipse(width/2, height/2, 120, 120);
  
    fill(255);
  ellipse(width/2, height/2, 140, 140);
    
    fill(0);
  ellipse(width/2, height/2, 160, 160);
  
    fill(255);
  ellipse(width/2, height/2, 180, 180);  
    
    fill(0);
  ellipse(width/2, height/2, 200, 200);
    
    fill(255);
  ellipse(width/2, height/2, 220, 220);
    
    fill(0);
  ellipse(width/2, height/2, 240, 240);
    
    fill(255);
  ellipse(width/2, height/2, 260, 260);
    
    fill(0);
  ellipse(width/2, height/2, 280, 280);
    
    fill(255);
  ellipse(width/2, height/2, 300, 300);
  
  myCtr-- ;
    if (myCtr < 0) {
      myState = 38 ; 
      myCtr = 3 ; 
    }
  
  break;
  
  case 40:
  
  fill(255);
  ellipse(width/2, height/2, 300, 300);
  
  fill(0);
  ellipse(width/2, height/2, 1/2, 1/2);
  
  fill(255);
  ellipse(width/2, height/2, 1, 1);
  
  fill(0);
  ellipse(width/2, height/2, 2, 2);
  
  fill(255);
  ellipse(width/2, height/2, 3, 3);
  
  fill(0);
  ellipse(width/2, height/2, 4, 4);
  
  fill(255);
  ellipse(width/2, height/2, 5, 5);
  
  fill(0);
  ellipse(width/2, height/2, 6, 6);
    
  fill(255);
  ellipse(width/2, height/2, 8, 8);
    
  fill(0);
  ellipse(width/2, height/2, 10, 10);
    
  fill(255);
  ellipse(width/2, height/2, 20, 20);
  
  fill(0);
  ellipse(width/2, height/2, 40, 40);
    
    fill(255);
  ellipse(width/2, height/2, 60, 60);
    
    fill(0);
  ellipse(width/2, height/2, 80, 80);
  
    fill(255);
  ellipse(width/2, height/2, 100, 100);
    
  fill(0);
  ellipse(width/2, height/2, 120, 120);
  
    fill(255);
  ellipse(width/2, height/2, 140, 140);
    
    fill(0);
  ellipse(width/2, height/2, 160, 160);
  
    fill(255);
  ellipse(width/2, height/2, 180, 180);  
    
    fill(0);
  ellipse(width/2, height/2, 200, 200);
    
    fill(255);
  ellipse(width/2, height/2, 220, 220);
    
    fill(0);
  ellipse(width/2, height/2, 240, 240);
    
    fill(255);
  ellipse(width/2, height/2, 260, 260);
    
    fill(0);
  ellipse(width/2, height/2, 280, 280);
  
  myCtr-- ;
    if (myCtr < 0) {
      myState = 39 ; 
      myCtr = 3 ; 
    }
  
  break;
  
  case 41:
  
  fill(0);
  ellipse(width/2, height/2, 280, 280);
  
  fill(0);
  ellipse(width/2, height/2, 1/2, 1/2);
  
  fill(255);
  ellipse(width/2, height/2, 1, 1);
  
  fill(0);
  ellipse(width/2, height/2, 2, 2);
  
  fill(255);
  ellipse(width/2, height/2, 3, 3);
  
  fill(0);
  ellipse(width/2, height/2, 4, 4);
  
  fill(255);
  ellipse(width/2, height/2, 5, 5);
  
  fill(0);
  ellipse(width/2, height/2, 6, 6);
    
  fill(255);
  ellipse(width/2, height/2, 8, 8);
    
  fill(0);
  ellipse(width/2, height/2, 10, 10);
    
  fill(255);
  ellipse(width/2, height/2, 20, 20);
  
  fill(0);
  ellipse(width/2, height/2, 40, 40);
    
    fill(255);
  ellipse(width/2, height/2, 60, 60);
    
    fill(0);
  ellipse(width/2, height/2, 80, 80);
  
    fill(255);
  ellipse(width/2, height/2, 100, 100);
    
  fill(0);
  ellipse(width/2, height/2, 120, 120);
  
    fill(255);
  ellipse(width/2, height/2, 140, 140);
    
    fill(0);
  ellipse(width/2, height/2, 160, 160);
  
    fill(255);
  ellipse(width/2, height/2, 180, 180);  
    
    fill(0);
  ellipse(width/2, height/2, 200, 200);
    
    fill(255);
  ellipse(width/2, height/2, 220, 220);
    
    fill(0);
  ellipse(width/2, height/2, 240, 240);
    
    fill(255);
  ellipse(width/2, height/2, 260, 260);
  
  myCtr-- ;
    if (myCtr < 0) {
      myState = 40 ; 
      myCtr = 3 ; 
    }
  
  break;
  
  case 42:
  
  fill(255);
  ellipse(width/2, height/2, 260, 260);
  
  fill(0);
  ellipse(width/2, height/2, 1/2, 1/2);
  
  fill(255);
  ellipse(width/2, height/2, 1, 1);
  
  fill(0);
  ellipse(width/2, height/2, 2, 2);
  
  fill(255);
  ellipse(width/2, height/2, 3, 3);
  
  fill(0);
  ellipse(width/2, height/2, 4, 4);
  
  fill(255);
  ellipse(width/2, height/2, 5, 5);
  
  fill(0);
  ellipse(width/2, height/2, 6, 6);
    
  fill(255);
  ellipse(width/2, height/2, 8, 8);
    
  fill(0);
  ellipse(width/2, height/2, 10, 10);
    
  fill(255);
  ellipse(width/2, height/2, 20, 20);
  
  fill(0);
  ellipse(width/2, height/2, 40, 40);
    
    fill(255);
  ellipse(width/2, height/2, 60, 60);
    
    fill(0);
  ellipse(width/2, height/2, 80, 80);
  
    fill(255);
  ellipse(width/2, height/2, 100, 100);
    
  fill(0);
  ellipse(width/2, height/2, 120, 120);
  
    fill(255);
  ellipse(width/2, height/2, 140, 140);
    
    fill(0);
  ellipse(width/2, height/2, 160, 160);
  
    fill(255);
  ellipse(width/2, height/2, 180, 180);  
    
    fill(0);
  ellipse(width/2, height/2, 200, 200);
    
    fill(255);
  ellipse(width/2, height/2, 220, 220);
    
    fill(0);
  ellipse(width/2, height/2, 240, 240);
  
  myCtr-- ;
    if (myCtr < 0) {
      myState = 41 ; 
      myCtr = 3 ; 
    }
  
  break;
  
  case 43:
  
  fill(0);
  ellipse(width/2, height/2, 240, 240);
  
  fill(0);
  ellipse(width/2, height/2, 1/2, 1/2);
  
  fill(255);
  ellipse(width/2, height/2, 1, 1);
  
  fill(0);
  ellipse(width/2, height/2, 2, 2);
  
  fill(255);
  ellipse(width/2, height/2, 3, 3);
  
  fill(0);
  ellipse(width/2, height/2, 4, 4);
  
  fill(255);
  ellipse(width/2, height/2, 5, 5);
  
  fill(0);
  ellipse(width/2, height/2, 6, 6);
    
  fill(255);
  ellipse(width/2, height/2, 8, 8);
    
  fill(0);
  ellipse(width/2, height/2, 10, 10);
    
  fill(255);
  ellipse(width/2, height/2, 20, 20);
  
  fill(0);
  ellipse(width/2, height/2, 40, 40);
    
    fill(255);
  ellipse(width/2, height/2, 60, 60);
    
    fill(0);
  ellipse(width/2, height/2, 80, 80);
  
    fill(255);
  ellipse(width/2, height/2, 100, 100);
    
  fill(0);
  ellipse(width/2, height/2, 120, 120);
  
    fill(255);
  ellipse(width/2, height/2, 140, 140);
    
    fill(0);
  ellipse(width/2, height/2, 160, 160);
  
    fill(255);
  ellipse(width/2, height/2, 180, 180);  
    
    fill(0);
  ellipse(width/2, height/2, 200, 200);
    
    fill(255);
  ellipse(width/2, height/2, 220, 220);
  
  myCtr-- ;
    if (myCtr < 0) {
      myState = 42 ; 
      myCtr = 3 ; 
    }
  
  break;
  
  case 44:
  
  fill(255);
  ellipse(width/2, height/2, 220, 220);
  
  fill(0);
  ellipse(width/2, height/2, 1/2, 1/2);
  
  fill(255);
  ellipse(width/2, height/2, 1, 1);
  
  fill(0);
  ellipse(width/2, height/2, 2, 2);
  
  fill(255);
  ellipse(width/2, height/2, 3, 3);
  
  fill(0);
  ellipse(width/2, height/2, 4, 4);
  
  fill(255);
  ellipse(width/2, height/2, 5, 5);
  
  fill(0);
  ellipse(width/2, height/2, 6, 6);
    
  fill(255);
  ellipse(width/2, height/2, 8, 8);
    
  fill(0);
  ellipse(width/2, height/2, 10, 10);
    
  fill(255);
  ellipse(width/2, height/2, 20, 20);
  
  fill(0);
  ellipse(width/2, height/2, 40, 40);
    
    fill(255);
  ellipse(width/2, height/2, 60, 60);
    
    fill(0);
  ellipse(width/2, height/2, 80, 80);
  
    fill(255);
  ellipse(width/2, height/2, 100, 100);
    
  fill(0);
  ellipse(width/2, height/2, 120, 120);
  
    fill(255);
  ellipse(width/2, height/2, 140, 140);
    
    fill(0);
  ellipse(width/2, height/2, 160, 160);
  
    fill(255);
  ellipse(width/2, height/2, 180, 180);  
    
    fill(0);
  ellipse(width/2, height/2, 200, 200);
  
  myCtr-- ;
    if (myCtr < 0) {
      myState = 43 ; 
      myCtr = 3 ; 
    }
  
  break;
  
  case 45:
  
  fill(0);
  ellipse(width/2, height/2, 200, 200);
  
  fill(0);
  ellipse(width/2, height/2, 1/2, 1/2);
  
  fill(255);
  ellipse(width/2, height/2, 1, 1);
  
  fill(0);
  ellipse(width/2, height/2, 2, 2);
  
  fill(255);
  ellipse(width/2, height/2, 3, 3);
  
  fill(0);
  ellipse(width/2, height/2, 4, 4);
  
  fill(255);
  ellipse(width/2, height/2, 5, 5);
  
  fill(0);
  ellipse(width/2, height/2, 6, 6);
    
  fill(255);
  ellipse(width/2, height/2, 8, 8);
    
  fill(0);
  ellipse(width/2, height/2, 10, 10);
    
  fill(255);
  ellipse(width/2, height/2, 20, 20);
  
  fill(0);
  ellipse(width/2, height/2, 40, 40);
    
    fill(255);
  ellipse(width/2, height/2, 60, 60);
    
    fill(0);
  ellipse(width/2, height/2, 80, 80);
  
    fill(255);
  ellipse(width/2, height/2, 100, 100);
    
  fill(0);
  ellipse(width/2, height/2, 120, 120);
  
    fill(255);
  ellipse(width/2, height/2, 140, 140);
    
    fill(0);
  ellipse(width/2, height/2, 160, 160);
  
    fill(255);
  ellipse(width/2, height/2, 180, 180);
  
  myCtr-- ;
    if (myCtr < 0) {
      myState = 44 ; 
      myCtr = 3 ; 
    }
  
  break;
  
  case 46:
  
  fill(255);
  ellipse(width/2, height/2, 180, 180);
  
  fill(0);
  ellipse(width/2, height/2, 1/2, 1/2);
  
  fill(255);
  ellipse(width/2, height/2, 1, 1);
  
  fill(0);
  ellipse(width/2, height/2, 2, 2);
  
  fill(255);
  ellipse(width/2, height/2, 3, 3);
  
  fill(0);
  ellipse(width/2, height/2, 4, 4);
  
  fill(255);
  ellipse(width/2, height/2, 5, 5);
  
  fill(0);
  ellipse(width/2, height/2, 6, 6);
    
  fill(255);
  ellipse(width/2, height/2, 8, 8);
    
  fill(0);
  ellipse(width/2, height/2, 10, 10);
    
  fill(255);
  ellipse(width/2, height/2, 20, 20);
  
  fill(0);
  ellipse(width/2, height/2, 40, 40);
    
    fill(255);
  ellipse(width/2, height/2, 60, 60);
    
    fill(0);
  ellipse(width/2, height/2, 80, 80);
  
    fill(255);
  ellipse(width/2, height/2, 100, 100);
    
  fill(0);
  ellipse(width/2, height/2, 120, 120);
  
    fill(255);
  ellipse(width/2, height/2, 140, 140);
    
    fill(0);
  ellipse(width/2, height/2, 160, 160);
  
  myCtr-- ;
    if (myCtr < 0) {
      myState = 45 ; 
      myCtr = 3 ; 
    }
  
  break;
  
  case 47:
  
  fill(0);
  ellipse(width/2, height/2, 160, 160);
  
  fill(0);
  ellipse(width/2, height/2, 1/2, 1/2);
  
  fill(255);
  ellipse(width/2, height/2, 1, 1);
  
  fill(0);
  ellipse(width/2, height/2, 2, 2);
  
  fill(255);
  ellipse(width/2, height/2, 3, 3);
  
  fill(0);
  ellipse(width/2, height/2, 4, 4);
  
  fill(255);
  ellipse(width/2, height/2, 5, 5);
  
  fill(0);
  ellipse(width/2, height/2, 6, 6);
    
  fill(255);
  ellipse(width/2, height/2, 8, 8);
    
  fill(0);
  ellipse(width/2, height/2, 10, 10);
    
  fill(255);
  ellipse(width/2, height/2, 20, 20);
  
  fill(0);
  ellipse(width/2, height/2, 40, 40);
    
    fill(255);
  ellipse(width/2, height/2, 60, 60);
    
    fill(0);
  ellipse(width/2, height/2, 80, 80);
  
    fill(255);
  ellipse(width/2, height/2, 100, 100);
    
  fill(0);
  ellipse(width/2, height/2, 120, 120);
  
    fill(255);
  ellipse(width/2, height/2, 140, 140);
  
  myCtr-- ;
    if (myCtr < 0) {
      myState = 46 ; 
      myCtr = 3 ; 
    }
  
  break;
  
  case 48:
  
  fill(255);
  ellipse(width/2, height/2, 140, 140);
  
  fill(0);
  ellipse(width/2, height/2, 1/2, 1/2);
  
  fill(255);
  ellipse(width/2, height/2, 1, 1);
  
  fill(0);
  ellipse(width/2, height/2, 2, 2);
  
  fill(255);
  ellipse(width/2, height/2, 3, 3);
  
  fill(0);
  ellipse(width/2, height/2, 4, 4);
  
  fill(255);
  ellipse(width/2, height/2, 5, 5);
  
  fill(0);
  ellipse(width/2, height/2, 6, 6);
    
  fill(255);
  ellipse(width/2, height/2, 8, 8);
    
  fill(0);
  ellipse(width/2, height/2, 10, 10);
    
  fill(255);
  ellipse(width/2, height/2, 20, 20);
  
  fill(0);
  ellipse(width/2, height/2, 40, 40);
    
    fill(255);
  ellipse(width/2, height/2, 60, 60);
    
    fill(0);
  ellipse(width/2, height/2, 80, 80);
  
    fill(255);
  ellipse(width/2, height/2, 100, 100);
    
  fill(0);
  ellipse(width/2, height/2, 120, 120);
  
  myCtr-- ;
    if (myCtr < 0) {
      myState = 47 ; 
      myCtr = 3 ; 
    }
  
  break;
  
  case 49:
  
  fill(0);
  ellipse(width/2, height/2, 120, 120);
  
  fill(0);
  ellipse(width/2, height/2, 1/2, 1/2);
  
  fill(255);
  ellipse(width/2, height/2, 1, 1);
  
  fill(0);
  ellipse(width/2, height/2, 2, 2);
  
  fill(255);
  ellipse(width/2, height/2, 3, 3);
  
  fill(0);
  ellipse(width/2, height/2, 4, 4);
  
  fill(255);
  ellipse(width/2, height/2, 5, 5);
  
  fill(0);
  ellipse(width/2, height/2, 6, 6);
    
  fill(255);
  ellipse(width/2, height/2, 8, 8);
    
  fill(0);
  ellipse(width/2, height/2, 10, 10);
    
  fill(255);
  ellipse(width/2, height/2, 20, 20);
  
  fill(0);
  ellipse(width/2, height/2, 40, 40);
    
    fill(255);
  ellipse(width/2, height/2, 60, 60);
    
    fill(0);
  ellipse(width/2, height/2, 80, 80);
  
    fill(255);
  ellipse(width/2, height/2, 100, 100);
  
  myCtr-- ;
    if (myCtr < 0) {
      myState = 48 ; 
      myCtr = 3 ; 
    }
  
  break;
  
  case 50:
  
  fill(255);
  ellipse(width/2, height/2, 100, 100);
  
  fill(0);
  ellipse(width/2, height/2, 1/2, 1/2);
  
  fill(255);
  ellipse(width/2, height/2, 1, 1);
  
  fill(0);
  ellipse(width/2, height/2, 2, 2);
  
  fill(255);
  ellipse(width/2, height/2, 3, 3);
  
  fill(0);
  ellipse(width/2, height/2, 4, 4);
  
  fill(255);
  ellipse(width/2, height/2, 5, 5);
  
  fill(0);
  ellipse(width/2, height/2, 6, 6);
    
  fill(255);
  ellipse(width/2, height/2, 8, 8);
    
  fill(0);
  ellipse(width/2, height/2, 10, 10);
    
  fill(255);
  ellipse(width/2, height/2, 20, 20);
  
  fill(0);
  ellipse(width/2, height/2, 40, 40);
    
    fill(255);
  ellipse(width/2, height/2, 60, 60);
    
    fill(0);
  ellipse(width/2, height/2, 80, 80);
  
  myCtr-- ;
    if (myCtr < 0) {
      myState = 49 ; 
      myCtr = 3 ; 
    }
  
  break;
  
  case 51:
  
  fill(0);
  ellipse(width/2, height/2, 80, 80);
  
  fill(0);
  ellipse(width/2, height/2, 1/2, 1/2);
  
  fill(255);
  ellipse(width/2, height/2, 1, 1);
  
  fill(0);
  ellipse(width/2, height/2, 2, 2);
  
  fill(255);
  ellipse(width/2, height/2, 3, 3);
  
  fill(0);
  ellipse(width/2, height/2, 4, 4);
  
  fill(255);
  ellipse(width/2, height/2, 5, 5);
  
  fill(0);
  ellipse(width/2, height/2, 6, 6);
    
  fill(255);
  ellipse(width/2, height/2, 8, 8);
    
  fill(0);
  ellipse(width/2, height/2, 10, 10);
    
  fill(255);
  ellipse(width/2, height/2, 20, 20);
  
  fill(0);
  ellipse(width/2, height/2, 40, 40);
    
    fill(255);
  ellipse(width/2, height/2, 60, 60);
  
  myCtr-- ;
    if (myCtr < 0) {
      myState = 50 ; 
      myCtr = 3 ; 
    }
  
  break;
  
  case 52:
  
  fill(255);
  ellipse(width/2, height/2, 60, 60);
  
  fill(0);
  ellipse(width/2, height/2, 1/2, 1/2);
  
  fill(255);
  ellipse(width/2, height/2, 1, 1);
  
  fill(0);
  ellipse(width/2, height/2, 2, 2);
  
  fill(255);
  ellipse(width/2, height/2, 3, 3);
  
  fill(0);
  ellipse(width/2, height/2, 4, 4);
  
  fill(255);
  ellipse(width/2, height/2, 5, 5);
  
  fill(0);
  ellipse(width/2, height/2, 6, 6);
    
  fill(255);
  ellipse(width/2, height/2, 8, 8);
    
  fill(0);
  ellipse(width/2, height/2, 10, 10);
    
  fill(255);
  ellipse(width/2, height/2, 20, 20);
  
  fill(0);
  ellipse(width/2, height/2, 40, 40);
  
  myCtr-- ;
    if (myCtr < 0) {
      myState = 51 ; 
      myCtr = 3 ; 
    }
  
  break;
  
  case 53:
  
  fill(0);
  ellipse(width/2, height/2, 40, 40);
  
    fill(0);
  ellipse(width/2, height/2, 1/2, 1/2);
  
  fill(255);
  ellipse(width/2, height/2, 1, 1);
  
  fill(0);
  ellipse(width/2, height/2, 2, 2);
  
  fill(255);
  ellipse(width/2, height/2, 3, 3);
  
  fill(0);
  ellipse(width/2, height/2, 4, 4);
  
  fill(255);
  ellipse(width/2, height/2, 5, 5);
  
  fill(0);
  ellipse(width/2, height/2, 6, 6);
    
    fill(255);
  ellipse(width/2, height/2, 8, 8);
    
    fill(0);
  ellipse(width/2, height/2, 10, 10);
    
    fill(255);
  ellipse(width/2, height/2, 20, 20);
  
  myCtr-- ;
    if (myCtr < 0) {
      myState = 52 ; 
      myCtr = 3 ; 
    }
  
  break;
  
  case 54:
  
  fill(255);
  ellipse(width/2, height/2, 20, 20);
  
    fill(0);
  ellipse(width/2, height/2, 1/2, 1/2);
  
  fill(255);
  ellipse(width/2, height/2, 1, 1);
  
  fill(0);
  ellipse(width/2, height/2, 2, 2);
  
  fill(255);
  ellipse(width/2, height/2, 3, 3);
  
  fill(0);
  ellipse(width/2, height/2, 4, 4);
  
  fill(255);
  ellipse(width/2, height/2, 5, 5);
  
  fill(0);
  ellipse(width/2, height/2, 6, 6);
    
    fill(255);
  ellipse(width/2, height/2, 8, 8);
    
    fill(0);
  ellipse(width/2, height/2, 10, 10);
  
  myCtr-- ;
    if (myCtr < 0) {
      myState = 53 ; 
      myCtr = 3 ; 
    }
  
  break;
  
  case 55:
  
  fill(0);
  ellipse(width/2, height/2, 10, 10);
  
    fill(0);
  ellipse(width/2, height/2, 1/2, 1/2);
  
  fill(255);
  ellipse(width/2, height/2, 1, 1);
  
  fill(0);
  ellipse(width/2, height/2, 2, 2);
  
  fill(255);
  ellipse(width/2, height/2, 3, 3);
  
  fill(0);
  ellipse(width/2, height/2, 4, 4);
  
  fill(255);
  ellipse(width/2, height/2, 5, 5);
  
  fill(0);
  ellipse(width/2, height/2, 6, 6);
    
    fill(255);
  ellipse(width/2, height/2, 8, 8);
  
  myCtr-- ;
    if (myCtr < 0) {
      myState = 54 ; 
      myCtr = 3 ; 
    }
  
  break;
  
  case 56:
  
  fill(255);
  ellipse(width/2, height/2, 8, 8);
  
    fill(0);
  ellipse(width/2, height/2, 1/2, 1/2);
  
  fill(255);
  ellipse(width/2, height/2, 1, 1);
  
  fill(0);
  ellipse(width/2, height/2, 2, 2);
  
  fill(255);
  ellipse(width/2, height/2, 3, 3);
  
  fill(0);
  ellipse(width/2, height/2, 4, 4);
  
  fill(255);
  ellipse(width/2, height/2, 5, 5);
  
  fill(0);
  ellipse(width/2, height/2, 6, 6);
  
  myCtr-- ;
    if (myCtr < 0) {
      myState = 55 ;
      myCtr = 3 ; 
    }
  
  break;
  
  case 57:
  
  fill(0);
  ellipse(width/2, height/2, 6, 6);
    
  fill(0);
  ellipse(width/2, height/2, 1/2, 1/2);
  
  fill(255);
  ellipse(width/2, height/2, 1, 1);
  
  fill(0);
  ellipse(width/2, height/2, 2, 2);
  
  fill(255);
  ellipse(width/2, height/2, 3, 3);
  
  fill(0);
  ellipse(width/2, height/2, 4, 4);
  
  fill(255);
  ellipse(width/2, height/2, 5, 5);
  
  myCtr-- ;
    if (myCtr < 0) {
      myState = 56 ; 
      myCtr = 3 ; 
    }
  
  break;
  
  case 58:

  fill(255);
  ellipse(width/2, height/2, 5, 5);
  
  fill(0);
  ellipse(width/2, height/2, 1/2, 1/2);
  
  fill(255);
  ellipse(width/2, height/2, 1, 1);
  
  fill(0);
  ellipse(width/2, height/2, 2, 2);
  
  fill(255);
  ellipse(width/2, height/2, 3, 3);
  
  fill(0);
  ellipse(width/2, height/2, 4, 4);
  
  myCtr-- ;
    if (myCtr < 0) {
      myState = 57 ;
      myCtr = 3 ; 
    }
  
  break;
  
  case 59:
  
  fill(0);
  ellipse(width/2, height/2, 4, 4);
    
  fill(0);
  ellipse(width/2, height/2, 1/2, 1/2);
  
  fill(255);
  ellipse(width/2, height/2, 1, 1);
  
  fill(0);
  ellipse(width/2, height/2, 2, 2);
  
  fill(255);
  ellipse(width/2, height/2, 3, 3);

  
  myCtr-- ;
    if (myCtr < 0) {
      myState = 58 ; 
      myCtr = 3 ; 
    }
  
  break;
  
  case 60:
  
  fill(255);
  ellipse(width/2, height/2, 3, 3);
  
  fill(0);
  ellipse(width/2, height/2, 1/2, 1/2);
  
  fill(255);
  ellipse(width/2, height/2, 1, 1);
  
  fill(0);
  ellipse(width/2, height/2, 2, 2);

  
  myCtr-- ;
    if (myCtr < 0) {
      myState = 59 ; 
      myCtr = 3 ; 
    }
  
  break;
  
  case 61:
  
  fill(0);
  ellipse(width/2, height/2, 2, 2);
  
  fill(0);
  ellipse(width/2, height/2, 1/2, 1/2);
  
  fill(255);
  ellipse(width/2, height/2, 1, 1);

  
  myCtr-- ;
    if (myCtr < 0) {
      myState = 60 ; 
      myCtr = 3 ; 
    }
  
  break;
  
  case 62:
  
  fill(255);
  ellipse(width/2, height/2, 1, 1);
  
  fill(0);
  ellipse(width/2, height/2, 1/2, 1/2);

  
  myCtr-- ;
    if (myCtr < 0) {
      myState = 61 ; 
      myCtr = 3 ; 
    }
  
  break;
  
  case 63:
  
  fill(0);
  ellipse(width/2, height/2, 1/2, 1/2);
  
  
  
  
  myCtr-- ;
    if (myCtr < 0) {
      myState = 62 ; 
      myCtr = 3 ; 
    }
  
  break;
  
  }  
  
}


/*

void mousePressed() {
  
  myState = myState - 1 ;
  
}

*/



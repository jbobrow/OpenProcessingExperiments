
int  x1 = 25; 
int y1=  0;
int x2= 50;
int y2 = 50;
int x3 = 0;
int y3 = 50;
int jellyBean = 0;






void setup() {
  size (800,600);
  background(255,80,50);
  smooth(); 

}


void draw () {
noStroke(); 
fill(17,183,37);
triangle ( 170, 350, 270,350, 220, 250);
fill(17,90,183);
rect(290, 250, 100, 100);
fill(255,230,33);
ellipse( 460, 300, 100, 100);
stroke( 255,33,215);
strokeWeight(5);
line ( 530,250,630,350);
line  (530,350, 630, 250);
noStroke();

if ( mousePressed) {
  
  
   if ( mouseX > 170 && mouseX < 270 && mouseY > 250 && mouseY < 350) {
    
     rect( random ( 0, 800), random ( 0,600), random (100), random (100));
     for ( int i = 0 ; jellyBean < 30  ; i ++) {
       
       triangle ((x1 + i) * 50  ,y1 + (jellyBean * 50) ,(x2 + i) * 50  ,y2 + (jellyBean  * 50)  ,(x3 + i) * 50  ,y3 + (jellyBean * 50));       
       
       if ( i == 40) {
         jellyBean ++; 
         i = 0 ; 
       }
     }
   }
  
   if ( mouseX > 290 && mouseX< 390 && mouseY > 250 && mouseY< 350) {
     fill (88,33,255);
     rect( random ( 0, 800), random ( 0,600), random (100), random (100));
     
   }
  
   if ( mouseX > 410 && mouseX < 510 && mouseY > 250 && mouseY < 350) {
     fill(255);
     ellipse( random ( 0, 800), random ( 0,600), random (100), random (100));
     
     
   }
   
   if ( mouseX > 530 && mouseX< 630 && mouseY > 250 && mouseY< 350) {
     ellipse( random ( 0, 800), random ( 0,600), random (100), random (100));
     
     for ( int i = 0 ; jellyBean < 30  ; i ++) {
       fill(255,0,100);
       
       ellipse ((x1 + i) * 50  ,y1 + (jellyBean * 50) ,(x2 + i) * 50  ,y2 + (jellyBean  * 50));       
       
       if ( i == 40) {
         jellyBean ++; 
         i = 0 ; 
       }
     }
     
   }

}
}



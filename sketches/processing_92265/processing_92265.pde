
/* @pjs font="Sintony-Bold.ttf" ; */


PFont myFont ;

int myState = 0 ;

int x = 0;

int y = 0;


void setup() {
  size(500,500);
  
 myFont = createFont("Sintony-Bold.ttf", 80) ;
 
 textFont(myFont, 80) ;
  
}


void draw () {
  background(150);
  noStroke();
  
  switch(hour()) {
    
  case 0 :

  background(#0C0D1C);
  fill(#FFFFFF);
  ellipse(250, 70, 100, 100);
  
  break;
  
  case 1 :
  case 2 :
  case 3 :
  case 4 :
  case 5 :
  case 6 :
  background(#111331);
  fill(#F5F3D7);
  ellipse(300, 70, 100, 100);
  
  break;
  
  case 7 :
  case 8 :
  case 9 :
  
  background(#6092FA);
  fill(#EDEA9C);
  ellipse(350, 70, 100, 100);
  
  break;
 
  case 10 :
  case 11 :
  case 12 :
  
  background(#52C2F7);
  fill(#F5EC39);
  ellipse(400, 70, 100, 100);
  
  break;
  
  case 13 :
  case 14 :
  case 15 :
  
  background(#90DBFF);
  fill(#FFF300);
  ellipse(420, 70, 100, 100);
  
  break;

  case 16 :
  case 17 :
  
  background(#33A4DB);
  fill(#FFC400);
  ellipse(470, 110, 100, 100);
  
  break;
  
  case 18 :
  case 19 :
  
  background(#4281A0);
  fill(#FFE58E);
  ellipse(10, 110, 100, 100);
  
  break;
  
  case 20 :
  case 21 :
  
  background(#252F6F);
  fill(#FCF8C9);
  ellipse(110, 70, 100, 100);
  
  break;
  
  case 22 :
  case 23 :
  
  background(#0B123B);
  fill(#FCF9D4);
  ellipse(200, 70, 100, 100);
  
  break;
  
 
  }
 
  fill(255); 
  textAlign(CENTER); 
  text((hour() + ":" + minute() +":" + second()), width/2, height/2)  ;
  

  
 
  
  fill(255) ;
  rect(0,400,500,370);

  ellipse(1, x-200 , 3, 3);
  ellipse(188, y-10 , 3, 3);
  ellipse(267, x , 4, 4);
  ellipse(398, y , 3, 3);
  ellipse(65, x-6 , 3, 3);
  ellipse(199, y-68 , 3, 3);
  ellipse(276, x , 4, 4);
  ellipse(254, y-580 , 3, 3);
  ellipse(100, x-4784 , 3, 3);
  ellipse(143, y , 3, 3);
  ellipse(106, x-3 , 5, 5);
  ellipse(20, y-55 , 4, 4);
  ellipse(155, x-97 , 3, 3);
  ellipse(300, y-111 , 3, 3);
  ellipse(10, x+1 , 3, 3);
  ellipse(12, y-44 , 3, 3);
  ellipse(467, x-657 , 3, 3);
  ellipse(172, y-321 , 3, 3);
  ellipse(234, x-214 , 4, 4);
  ellipse(156, y-11 , 3, 3);
  ellipse(10, x-10 , 3, 3);
  ellipse(13, y-10 , 3, 3);
  ellipse(434, x , 4, 4);
  ellipse(101, y-67 , 3, 3);
  ellipse(498, x , 3, 3);
  ellipse(110, y , 3, 3);
  ellipse(222, x , 3, 3);
  ellipse(377, y-80 , 3, 3);
  ellipse(420, x-870 , 4, 4);
  ellipse(10, y-546 , 3, 3);
  
 x = x + 3 ;
 
 if (x > 500) {
   x = 0 ; }
   
 y = y + 5 ;
 
 if (y > 500) {
   y = 0 ; }


}






PFont my_font; 
int state = 0 ;

void setup () {
  
  size(1000, 500);
  background(0);
  my_font = loadFont("Chalkduster-48.vlw");
  textFont(my_font, 54); 
  
}

void draw() {
  
  background(30, 144, 255) ;

  println(state) ;

  switch(state) {

  case 0:
  
  fill(255, 255, 0) ;
  textSize(200);
  text("CARPE", 120, 200) ;
  text("DIEM" , 210, 425) ; 
  break; 
  
  case 1:
  
  background(0, 0, 0);
  textSize(125);
  fill(238, 233, 233);
  text("a" , 30, 100) ;
   textSize(200);
  fill(255, 30, 0);
  text("BATTLE" , 100, 300) ;
  textSize(125); 
  fill(238, 233, 233);
  text("cry" , 750, 430) ; 
  break; 
  
  case 2:
  
  background(34, 139, 34);
  textSize(200);
  fill(238, 233, 233);
  text("are we" , 100, 150) ;
   textSize(200);
   
  fill(238, 233, 233);
  text("ALL too" , 100, 430) ; 
  break; 
   
   case 3:
  background(135, 206, 250);
   fill(255, 30, 147) ;
  textSize(100);
  text("young", 340, 260) ;
  break; 
  
  case 4: 
  
     background(135, 206, 250);
   fill(255, 30, 147) ;
  textSize(285);
  text("to", 350, 350) ;
  break; 
  
  case 5:
  
  float x = mouseX; // mouse x position determines x position
float y = mouseY; // mouse y position determines y position
  
  background(0, 0, 0);
  textSize(300);
  fill(255, 30, 0);
  text("DIE" , 200, 350) ;
  
  textSize(450);
  text("? ?", x, y);
fill(random(200),random(10),random(200));

  
text("? ?", x, y);
  break;
  
  
  }
}


void mousePressed() {
 //state++ ;

 state = ++state % 6 ;
 
}



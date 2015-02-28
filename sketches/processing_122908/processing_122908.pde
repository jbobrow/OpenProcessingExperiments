
/* @pjs font="LuckiestGuy.ttf"; */

float y ;
PFont black ; 
PImage cloud ;

void setup() {
  
  size(450,600) ; 

  background(#55CBF7); 
  
  smooth();
  noStroke();
  
  cloud = loadImage("cloud.JPG") ; 
     
  black = createFont("LuckiestGuy.ttf") ;
  
  textFont(black,72) ;
  
}


void draw() {
   background(#55CBF7); 

   image(cloud, 0,0, 450, 600);

   fill(#08FF16) ;
   ellipse(100, y, 60, 80) ;
   fill(#ED0E0E) ; 
   ellipse(170, y, 60, 80) ;
   fill(#FF08FC) ;
   ellipse(240, y, 60, 80) ; 
   fill(#FF9408) ;
   ellipse(310, y, 60, 80) ;
   
   fill(#FAFF08) ;
   ellipse(140, y+60, 60, 80) ; 
   fill(#080DFF) ;
   ellipse(207, y+60, 60, 80) ;
   fill(#ED0E0E) ;
   ellipse(275, y+60, 60, 80) ;
   
   fill(#FF9408) ;
   ellipse(175, y+125, 60, 80) ;
   fill(#08FF16) ;
   ellipse(240, y+125, 60, 80) ;
   fill(#FF08FC) ;
   ellipse(210, y+190, 60, 80) ;
   
   fill(#FAFAFA) ;
   rect(208, y+230, 03, 53);

  fill(#26272E) ;
  textFont(black, 72) ;
  text("UP!", 160, y+310);
   
  
   
 y = y - 2;
 

if (y < 0) {
   y=width ;

}  

  
}





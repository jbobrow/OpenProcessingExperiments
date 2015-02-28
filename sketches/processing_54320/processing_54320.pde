
//city_origami_logo

float x = 80;

float y = 77;


float angle = 0.0;



void setup(){
 
  size (500,500);
  smooth();
  
}

void draw(){
  
  
  
  
  background(255);
  
  fill (200);//medium grey quads
  quad(179, 243, 208, 258, 208, 290, 153, 260); //quad 1
  quad(180+x, 244+y, 208+x, 260+y, 208+x, 292+y, 153+x, 260+y); //quad 2
  
  
   if (pmouseX <= 250 && pmouseY<= 200) {
     quad(179, 243, 208, 258, 208, 290, 153, 260); //quad 1
    } 
    
    if (pmouseX >=250 && pmouseY>= 200) {
     quad( 153, 260+20, 208, 290+20,208, 290,153, 260); //quad 1
    
    }   
    
    
     if (pmouseX <= 350 && pmouseY<= 300) {
     quad(180+x, 244+y, 208+x, 260+y, 208+x, 292+y, 153+x, 260+y); //quad 2
    } 
    
    if (pmouseX >=350 && pmouseY>= 300) {
     quad( 153+x, 260+y+20, 208+x, 292+y+20, 208+x, 292+y,153+x, 260+y); //quad 2
    
    } 
    
    
    
    
    
    
    
  
  
  
 
  
  fill(220); //light grey quads
  noStroke();
  quad(206, 133, 261, 165, 208, 196, 152, 165); //quad 1
  
  quad(206+ x, 133 + y, 261 + x, 165 + y, 208 + x, 196 + y, 153 + x, 165 + y); //quad 2
  
  
   if (pmouseX <= 150 && pmouseY<= 250) {
     quad(206, 133, 261, 165, 208, 196, 152, 165); //quad 1
    } 
    
    fill(150);
    if (pmouseX >=150 && pmouseY<= 250) {
      quad(206, 133-30, 206, 133, 152, 165, 152, 165-30); //quad 1
    
    }   
  
  
  
  
  fill(150);//dark grey quads
  quad(152, 165, 180, 180, 180, 244, 152, 260); //quad 1
  
   //quad(208, 196, 261, 165, 261, 196, 208, 227); //quad 2
   
   
   
    if (pmouseX <= 375 && pmouseY<= 300) {
     quad(152, 165, 180, 180, 180, 244, 152, 260); //quad 1
    } 
    
    
    fill(200);
    if (pmouseX >=375 && pmouseY>= 300) {
     quad(152-20, 165, 152, 165, 152, 260, 152-20, 260); //quad 1
    
    }   
  
  
    fill(150);
  
  if (pmouseX <= 300 && pmouseY<= 100) {
    quad(208, 196, 261, 165, 261, 196, 208, 227); //quad 1
    } 
    
    if (pmouseX >=300 && pmouseY>= 100) {
    quad(208, 196, 261, 165, 261, 196-100, 208, 227-100); //quad 2
    
    }   
    
    
      if (pmouseX >= 300 && pmouseY<= 300) {
    quad(208+x, 196+y, 261+x, 165+y, 261+x, 197, 208+x, 227); //quad4
    } 
    
    if (pmouseX >=300 && pmouseY>= 300) {
    quad(208+x, 196+y, 261+x, 165+y, 261+x, 197+y+62, 208+x, 227+y+62); //quad5
    
    }   
    
    
    
    
    
    // quad(208, 196, 261, 165, 261, 196-100, 208, 227-100); //quad 2
  
  
  quad(208, 257, 233, 242, 235, 275, 208, 291); //quad 3
  quad(153 +x, 165 +y, 180 +x, 180 +y, 180 +x, 244 +y, 152+x, 260 +y); //quad 4
  quad(208+x, 196+y, 261+x, 165+y, 261+x, 197+y+62, 208+x, 227+y+62); //quad 5
  
  
   if (pmouseX <= 350 && pmouseY<= 200) {
    quad(208+x, 196+y, 261+x, 165+y, 261+x, 197+y+62, 208+x, 227+y+62); //quad5
    } 
    
    fill(200);
    if (pmouseX >=350 && pmouseY>= 200) {
    quad(261+x, 165+y, 261+x+30, 165+y+15, 261+x+30, 197+y+62+15, 261+x, 197+y+62); //quad5
    
    }   
  
  
  
  
  
  
  
  

  }


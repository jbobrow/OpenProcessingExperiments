

PFont my_font;
int state = 0 ;

void setup() {
  size(900, 500);
  my_font = loadFont("MesquiteStd-100.vlw");
  textFont(my_font, 50); 
  

}

void draw() {

  background(0) ;

  println(state) ;

  switch(state) {

    case 0:
fill(255, 165, 0) ;
ellipse(225, 75, 150, 100) ;
ellipse(275, 75, 150, 100) ;
fill(139, 69, 19) ;
rect(240, -20, 20, 50) ;
fill(255, 0, 0);
rect(175, 410, 150, 100) ;
fill(0, 0, 0) ;
  text("TNT", 200, 500, 100) ;
break ;



  case 1 :

fill(255, 165, 0) ;
ellipse(225, 200, 150, 100) ;
ellipse(275, 200, 150, 100) ;
fill(139, 69, 19) ;
rect(240, 103, 20, 50) ;
fill(255, 0, 0) ;
rect(175, 410, 150, 100) ;
fill(0, 0, 0) ;
  text("TNT", 200, 500, 100) ;
break ;


  case 2:
fill(255, 165, 0) ;
ellipse(225, 270, 150, 100) ;
ellipse(275, 270, 150, 100) ;
fill(255, 0, 0) ;
rect(175, 410, 150, 100) ;
fill(139, 69, 19) ;
rect(240, 173, 20, 100) ;

fill(0, 0, 0) ;
  text("TNT", 200, 500, 100) ;
break ;
 
  
  case 3:
  fill(255, 165, 0) ;
ellipse(225, 370, 150, 100) ;
ellipse(275, 370, 150, 100) ;
fill(139, 69, 19) ;
rect(240, 273, 20, 50) ;
fill(255, 0, 0) ;
rect(175, 410, 150, 100) ;
fill(0, 0, 0) ;
  text("TNT", 200, 500, 100) ;
  break ;
  
  case 4:
fill(255, 165, 0) ;
ellipse(225, 450, 150, 100) ;
ellipse(275, 450, 150, 100) ;
fill(139, 69, 19) ;
rect(240, 353, 20, 50) ;
fill(255, 0, 0) ;
rect(83, 490, 100, 10) ;
rect(317, 490, 100, 10) ;
break ;

case 5:

text("KA-BOOOOOM!", random(400), random(400));
text("KA-BOOOOOM!", random(200), random(200));
break;

case 6:

float x = mouseX; // mouse x position determines x position
float y = mouseY; // mouse y position determines y position
     
text("Happy Halloween", x, y);
fill(random(200),random(10),random(100));


 
  
text("Happy Halloween!!!", x, y);

fill(255, 165, 0) ;
ellipse(225, 450, 150, 100) ;
ellipse(275, 450, 150, 100) ;
fill(139, 69, 19) ;
rect(240, 353, 20, 50) ;
break;
   
}
}




void mousePressed() {
 //state++ ;

 state = ++state % 7 ;







}




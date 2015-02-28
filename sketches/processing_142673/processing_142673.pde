
PFont my_font;
int state = 0 ;

void setup() {
  size(500, 500);
  my_font = loadFont("CooperBlackStd-Italic-48.vlw");
  textFont(my_font, 54); 
  

}

void draw() {

  background(0) ;

  println(state) ;

  switch(state) {

    case 0:

background(255, 255, 255);
 
smooth();
 
noStroke();
fill(255, 242, 0);
ellipse(250, 250, 300, 300);
fill(0, 0, 0);
ellipse(220, 200, 20, 40);
ellipse(280, 200, 20, 40);
 
stroke(0, 0, 0);
strokeWeight(10);
noFill();
arc(250, 250, 200, 200, 0, PI);
textSize(80);

text("click me", 70, 75) ;
text("to begin", 90, 470) ;
break ;




  case 1 :


background(255, 255, 255);
 
smooth();
 
noStroke();
fill(255, 242, 0);
ellipse(250, 250, 300, 300);
fill(0, 0, 0);
ellipse(220, 200, 20, 40);
ellipse(280, 200, 20, 40);
 
stroke(0, 0, 0);
strokeWeight(10);

ellipse(210, 300, 50, 40);
textSize(48);
 text("oooh yeah", 110, 43) ;
 textSize(40);
  text("that was a good one." , 30, 90) ;
  textSize(78);
   text("click again!", 20, 470) ;
  
break ;




  case 2:
background(255, 255, 255);
 
smooth();
 
noStroke();
fill(255, 242, 0);
ellipse(250, 250, 300, 300);
fill(0, 0, 0);
ellipse(220, 200, 20, 40);
ellipse(280, 200, 20, 40);
 
stroke(0, 0, 0);
strokeWeight(10);
noFill();
line(180, 310, 310, 325);
textSize(65);
text("meh.", 160, 70) ;
textSize(40);
text("you can do better.", 55, 470) ;
break ;
 
  
  case 3:
  background(255, 255, 255);
 
smooth();
 
noStroke();
fill(255, 242, 0);
ellipse(250, 250, 300, 300);
fill(0, 0, 0);

 
stroke(0, 0, 0);
strokeWeight(10);

arc(250, 250, 260, 260, 0, PI);
line(370, 265, 130, 270);

ellipse(220, 200, 20, 40);
ellipse(280, 200, 20, 40);

break ;



 case 4:
 
background(255, 255, 255);
 
smooth();
 
noStroke();
fill(255, 242, 0);
ellipse(250, 250, 300, 300);
fill(0, 0, 0);
ellipse(220, 200, 20, 40);
ellipse(280, 200, 20, 40);
 
stroke(0, 0, 0);
strokeWeight(10);
noFill();
arc(251, 330, 200, 90, PI, TWO_PI-PI/2);
arc(250, 330, 200, 90, TWO_PI-PI/2, TWO_PI);

textSize(48);
 text("GAME OVER", 100, 70) ;
 textSize(40);
 text("click", 45, 470) ;
 
 text("to restart", 285, 470) ;
 fill(255, 10, 0) ;
 text("HERE", 155, 470) ;

break ;



   
}
}




void mousePressed() {
 //state++ ;

 state = ++state % 5 ;







}




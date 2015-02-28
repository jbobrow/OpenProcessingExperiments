
void setup() {

  size(600, 600) ;
}


void draw() {

  println(mouseX + ", " + mouseY) ; 
  background(#FFFFFF) ;
  
 //body 
  noStroke();
  fill(#3CFA3A) ;
  ellipse(300, 600, 550, (300)) ;
  fill(#3CFA3A) ;
  ellipse(300, 600, 350, (300)) ;
  
    
//head  
  noStroke();
  fill(#2D694F) ;
  ellipse(300, 280, 500, (550)) ;
  fill(#2D764F) ;
  ellipse(300, 280, 350, (550)) ; 
  
  
//eye  
    noStroke() ;
    fill(#B9E3B3) ;
    ellipse(250, 190, 80, 60) ; 
    noStroke() ;
    fill(#B9E3B3, 100) ;
    ellipse(250, 180, 80, 60) ; 
    noStroke() ;
    fill(#B9E3B3) ;
    ellipse(350, 190, 80, 60) ; 
     noStroke() ;
    fill(#B9E3B3, 100) ;
    ellipse(350, 180, 80, 60) ; 
//pupil    
    noStroke() ;
    fill(#C28BFA) ;
    ellipse(250, 175, 20, 20) ; 
    fill(#CFA0FF) ;
    ellipse(250, 175, 10, 10) ;
    noStroke() ;
    fill(#C28BFA) ;
    ellipse(350, 175, 20, 20) ; 
    fill(#CFA0FF) ;
    ellipse(350, 175, 10, 10) ;
//eyebrows    
    fill(#3CFA3A) ;
    rect(200, 140, 80, 10) ;
    fill(#3CFA3A) ;
    rect(320, 140, 80, 10) ; 
 //nose thing    
    noStroke() ;
    fill(#B9E3B3, 100) ;
    ellipse(300, 280, 30, 550) ;
    noStroke() ;
    fill(#B9E3B3, 200) ;
    ellipse(300, 280, 20, 550) ; 

//tooth
    fill(#C28BFA) ; 
    triangle(230, 435, 244, 600, 265, 434) ;
    fill(#CFA0FF) ;
    triangle(230, 435, 244, 463, 260, 434) ;
//tooth
    fill(#C28BFA) ; 
    triangle(370, 435, 356, 600, 335, 434) ;
    fill(#CFA0FF) ;
    triangle(370, 435, 356, 463, 335, 434) ;
// mouth   
    fill(#B9E3B3, 100) ; 
    arc(300, 425, 350, 50, 0, PI - 0);
    fill(#B9E3B3, 200) ;
    arc(300, 425, 300, 40, 0, PI - 0);

}



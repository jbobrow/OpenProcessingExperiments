
PFont Perpetua ;
int myState = 0 ;
int myCounter = 200 ;

void setup () {
  size (600, 600) ;
  smooth () ;

// data folder resources

Perpetua = loadFont ("Perpetua-Bold-48.vlw") ;

}


void draw () {
  
  myCounter = myCounter - 1 ;
  
  background (150) ;
  
  switch (myState) {
    case 0:
    // wheel
    fill (0);
    ellipse (137, 268, 40, 40);
    
    // center
    fill (#dcdcdc);
    ellipse (137, 268, 8, 8);
    
    fill (#FCFCFA) ;
    textFont (Perpetua, 50) ;
    text ("Hello,", 10, 50) ;
    text ("I am a wheel", 10, 110) ;
    textFont (Perpetua, 30) ;
    text ("please click mouse", 300, 540) ;
    text ("for manual scroll" , 325, 570) ;
    if (myCounter < 0) {
      myCounter = 400;
      myState = 1 ;
    }
    break ;
    
    case 1:    
    // wheels - front & back
    fill (0);
    ellipse (137, 268, 40, 40);
    fill (0);
    ellipse (480, 260, 56, 56); 
    fill (#FCFCFA) ;
    
    // centers - front & back
    fill(#dcdcdc);
    ellipse(137, 268, 8, 8);
    fill (#dcdcdc);
    ellipse (480, 260, 9, 9);
    
    fill (#FCFCFA) ;
    textFont (Perpetua, 50) ;
    text ("Here is one of my friends", 20, 380) ;
    if (myCounter < 0) {
      myCounter = 500;
      myState = 2 ;
    }
    break ;
    
    case 2:    
    // wheels - front & back
    fill (0);
    ellipse (137, 268, 40, 40);
    fill (0);
    ellipse (480, 260, 56, 56); 
    fill (#FCFCFA) ;
    
    // centers - front & back
    fill(#dcdcdc);
    ellipse(137, 268, 8, 8);
    fill (#dcdcdc);
    ellipse (480, 260, 9, 9);
    
    fill (#FCFCFA) ;
    textFont (Perpetua, 50) ;
    text("We need something...", 10, 50) ;     
    if (myCounter < 0) {
      myCounter = 350;
      myState = 3 ;
    }
    break ;
    
    case 3:    
    // body
    fill(#E0DEDE);
    triangle(52, 268, 572, 261, 433, 167);
    
    // window outline    
    //vertical
    stroke(0); 
    line(433, 168, 425, 210) ;
    noStroke();

    //horizontal
    stroke(0); 
    line(425, 211, 268, 211) ;
    noStroke();

    // window
    fill(#d0f6f2);
    triangle(268, 211, 425, 210, 433, 168) ;
    
    // wheels - front & back
    fill (0);
    ellipse (137, 268, 40, 40);
    fill (0);
    ellipse (480, 260, 56, 56); 
    fill (#FCFCFA) ;
    
    // centers - front & back
    fill(#dcdcdc);
    ellipse(137, 268, 8, 8);
    fill (#dcdcdc);
    ellipse (480, 260, 9, 9);    
      
    fill (#FCFCFA) ;
    textFont (Perpetua, 50) ;
    text("...like a car!", 10, 50) ;
    if (myCounter < 0) {
      myCounter = 150;
      myState = 4 ;
    }
    break ;
   
    case 4:
    
    background(#1aac25);
    
    // clouds

    fill(255);
    ellipse(137, 67, 100, 22);

    fill(255);
    ellipse(187, 78, 95, 25);

    fill(255);
    ellipse(327, 47, 180, 35);

    fill(255);
    ellipse(437, 57, 165, 20);

    fill(250);
    ellipse(612, 97, 65, 20);

    fill(250);
    ellipse(622, 88, 65, 20);

    fill(250);
    ellipse(12, 18, 65, 20);
    
    // body
    fill(#309bee);
    triangle(52, 268, 572, 261, 433, 167);
   
   
    // window outline    
    // vertical
    stroke(0); 
    line(433, 168, 425, 210) ;
    noStroke();

    // horizontal
    stroke(0); 
    line(425, 211, 268, 211) ;
    noStroke();

    // window
    fill(#d0f6f2);
    triangle(268, 211, 425, 210, 433, 168) ;
    
    // road
    stroke(0); 
    line(45, 288, 600, 288) ;
    noStroke();
          
    // wheels - front & back
    fill (0);
    ellipse (137, 268, 40, 40);
    fill (0);
    ellipse (480, 260, 56, 56); 
    fill (#FCFCFA) ;
    
    // centers - front & back
    fill(#dcdcdc);
    ellipse(137, 268, 8, 8);
    fill (#dcdcdc);
    ellipse (480, 260, 9, 9);
    
    fill (#FCFCFA) ;
    textFont (Perpetua, 50) ;
    text("Time for a drive!", 220, 360) ;
    if (myCounter < 0) {
      myCounter = 200;
      myState = 0 ;
    }
    break ;
 
 
 }

}

    void mousePressed() {
    // println("mouse click") ;
    myState = myState + 1 ; 
    if (myState > 4) {
    myState = 0 ;
  }
 
}





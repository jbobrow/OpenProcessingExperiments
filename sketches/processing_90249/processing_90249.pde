
/* @pjs font="Raleway-Regular.ttf"; font="Raleway-Bold.ttf"; font="Raleway-Light.ttf"; */

PFont ralereg ;
PFont ralelight ;
PFont ralebold ;
PImage bgimage ;
int titlex = 800 ;
float state = 0 ;
float op1 = 0 ;
float op2 = 0 ;
float op3 = 0 ;
float op4 = 0 ;
float op5 = 0 ;
float op6 = 0 ;
float op7 = 0 ;
float op8 = 0 ;
float op9 = 0 ;
float op10 = 0 ;
float op11 = 0 ;
float op12 = 30 ;
float op13 = 255 ;
float op14 = 0 ;
float op15 = 0 ;



void setup() {
  frameRate(24) ;
  size(1920, 1080) ;
  ralereg = createFont("Raleway-Regular.ttf", 256) ;
  ralebold = createFont("Raleway-Bold.ttf", 512) ;
  ralelight = createFont("Raleway-Light.ttf", 256) ;
  bgimage = loadImage("riverL.jpg") ;
  smooth() ;
}

void draw() {
  background(#333333) ;
  image(bgimage) ;

  switch(state) {

    /*case -1:
     
     textFont(ralereg, 128) ;
     fill (255, 70) ;
     text("Nippersink", titlex, 150) ;
     titlex = titlex-3;
     if (titlex < 0) {
     titlex = 0 ;
     }
     
     break ; */

  case 0:
    //73%

    textFont(ralebold, 512) ;
    fill (255, op1) ;
    op1 = op1 + .5 ;
    if (op1 > 40) {
      op1 = 40;
      state++ ;
    }
    text("73%", 30, 400) ;

    textFont(ralelight, 128) ;
    fill (255, 30) ;
    text("Nippersink Watershed", 575, 1060) ;

    break ;

  case 1:
    //73%, box, line 1

      textFont(ralebold, 512) ;
    fill (255, 40) ;
    text("73%", 30, 400) ;

    textFont(ralelight, 128) ;
    fill (255, 30) ;
    text("Nippersink Watershed", 575, 1060) ;

    noStroke () ;
    fill (0, op2) ;
    op2 = op2 + 2 ;
    if (op2 > 50) {
      op2= 50;
    } 
    rect (0, 490, 1920, 375) ; 

    textFont(ralereg, 58) ;
    fill (255, op3) ;
    op3 = op3 + 3 ;
    if (op3 > 255) {
      op3 = 255;
      state++ ;
    } 
    text("73% of your neighbors", 1230, 555) ;

    break;

  case 2:
    // 73%, box, line 1, line 2

      textFont(ralebold, 512) ;
    fill (255, 40) ;
    text("73%", 30, 400) ;

    textFont(ralelight, 128) ;
    fill (255, 30) ;
    text("Nippersink Watershed", 575, 1060) ;

    noStroke () ;
    fill(0, 50) ;
    rect (0, 490, 1920, 375) ; 

    textFont(ralereg, 58) ;
    fill (255) ;
    text("73% of your neighbors", 1230, 555) ;

    textFont(ralereg, 58) ;
    fill (255, op4) ;
    op4 = op4 + 3 ;
    if (op4 > 255) {
      op4 = 255;
      state++ ;
    } 
    text("are willing to change", 1230, 625) ;

    break ;

  case 3:
    //73%, box, line 1, line 2, line 3, willing, to, change

    textFont(ralebold, 512) ;
    fill (255, 40) ;
    text("73%", 30, 400) ;

    textFont(ralelight, 128) ;
    fill (255, 30) ;
    text("Nippersink Watershed", 575, 1060) ;

    noStroke () ;
    fill(0, 50) ;
    rect (0, 490, 1920, 375) ; 

    textFont(ralereg, 58) ;
    fill (255) ;
    text("73% of your neighbors", 1230, 555) ;
    text("are willing to change", 1230, 625) ;

    textFont(ralereg, 58) ;
    fill (255, op5) ;
    op5 = op5 + 3 ;
    if (op5 > 255) {
      op5 = 255;
      state++ ;
    } 
    text("the way they care for", 1230, 695) ;

    textFont(ralelight, 80) ;
    fill (255, op14) ;
    op14 = op14 + .5 ;
    if (op14 > 50) {
      op14 = 50;
    }
    text("are", 225, 610) ;
    
    textFont(ralelight, 150) ;
    fill (255, op6) ;
    op6 = op6 +.5 ;
    if (op6 > 50) {
      op6 = 50;
    }
    text("willing", 342, 610) ;

    textFont(ralelight, 100) ;
    fill (255, op7) ;
    op7 = op7 + .5 ;
    if (op7 > 50) {
      op7 = 50;
    }
    text("to", 345, 700) ;

    textFont(ralereg, 172) ;
    fill (255, op8) ;
    op8++ ;
    if (op8 > 100) {
      op8 = 100;
    }
    text("change", 342, 822) ;

    break ;

  case 4:
    //73%, box, line 1, line 2, line 3, willing, to, change, line 4

      textFont(ralebold, 512) ;
    fill (255, 40) ;
    text("73%", 30, 400) ;

    textFont(ralelight, 128) ;
    fill (255, 30) ;
    text("Nippersink Watershed", 575, 1060) ;

     noStroke () ;
    fill(0, 50) ;
    rect (0, 490, 1920, 375) ; 
    
    textFont(ralelight, 80) ;
    fill (255, 50) ;
    text("are", 225, 610) ;
    
    textFont(ralelight, 150) ;
    fill (255, 50) ;
    text("willing", 342, 610) ;
    
    textFont(ralelight, 100) ;
    fill (255, 50) ;
    text("to", 345, 700) ;

    textFont(ralereg, 172) ;
    fill (255, 100) ;
    text("change", 342, 822) ;

    textFont(ralereg, 58) ;
    fill (255) ;
    text("73% of your neighbors", 1230, 555) ;
    text("are willing to change", 1230, 625) ;
    text("the way they care for", 1230, 695) ;

    textFont(ralereg, 58) ;
    fill (255, op9) ;
    op9 = op9 + 3 ;
    if (op9 > 255) {
      op9 = 255;
      state++ ;
    } 
    text("their lawn and yard", 1230, 765) ;

    break ;

  case 5:
    //73%, box, line 1, line 2, line 3, willing, to, change, line 4, line 5

      textFont(ralebold, 512) ;
    fill (255, 40) ;
    op11++ ;
    if (op11 > 150) {
      op11 = 150;
    } 
    text("73%", 30, 400) ;

    textFont(ralelight, 128) ;
    fill (255, 30) ;
    text("Nippersink Watershed", 575, 1060) ;

     noStroke () ;
    fill(0, 50) ;
    rect (0, 490, 1920, 375) ; 

     textFont(ralelight, 80) ;
    fill (255, 50) ;
    text("are", 225, 610) ;
    
    textFont(ralelight, 150) ;
    fill (255, 50) ;
    text("willing", 342, 610) ;
    
    textFont(ralelight, 100) ;
    fill (255, 50) ;
    text("to", 345, 700) ;

    textFont(ralereg, 172) ;
    fill (255, 100) ;
    text("change", 342, 822) ;

    textFont(ralereg, 58) ;
    fill (255) ;
    text("73% of your neighbors", 1230, 555) ;
    text("are willing to change", 1230, 625) ;
    text("the way they care for", 1230, 695) ;
    text("their lawn and yard", 1230, 765) ;

    textFont(ralereg, 58) ;
    fill (255, op10) ;
    op10 = op10 + 3 ;
    if (op10 > 255) {
      op10 = 255;
      op1 = 40 ;
      op6 = 50 ;
      op7 = 50 ;
      op8 = 100 ;
      op11 = 0 ;
      op14 = 50 ;
      state++ ;
    } 
    text("to improve water quality.", 1230, 835) ;

    break ;

  case 6:
    //full, lose are, 73%, willing, to

    textFont(ralebold, 512) ;
    fill (255, op1) ;
    op1 = op1 - .5 ;
    if (op1 < 0) {
      op1 = 0;
    } 
    text("73%", 30, 400) ;

    textFont(ralelight, 128) ;
    fill (255, op12) ;
    op12 = op12 + .5 ;
    if (op12 > 70) {
      op12 = 70;
    } 
    text("Nippersink Watershed", 575, 1060) ;

   noStroke () ;
    fill(0, 50) ;
    rect (0, 490, 1920, 375) ; 
    
    textFont(ralelight, 80) ;
    fill (255, op14) ;
    op14 = op14 - .5 ;
    if (op14 < 0) {
      op14 = 0;
    } 
    text("are", 225, 610) ;
    
    textFont(ralelight, 150) ;
    fill (255, op6) ;
    op6 = op6 - .5 ;
    if (op6 < 0) {
      op6 = 0;
    } 
    text("willing", 342, 610) ;

    textFont(ralelight, 100) ;
    fill (255, op7) ;
    op7 = op7 - .5 ;
    if (op7 < 0) {
      op7 = 0;
    } 
    text("to", 345, 700) ;

    textFont(ralereg, 172) ;
    fill (255, 100) ;
    text("change", 342, 822) ;

    textFont(ralereg, 58) ;
    fill (255) ;
    text("73% of your neighbors", 1230, 555) ;
    text("are willing to change", 1230, 625) ;
    text("the way they care for", 1230, 695) ;
    text("their lawn and yard", 1230, 765) ;
    text("to improve water quality.", 1230, 835) ;


    textFont(ralebold, 138) ;
    fill (255, op11) ;
    op11++ ;
    if (op11 > 150) {
      op11 = 150;
      op13 = 255 ;
      op15 = 50 ;
      // state++ ;
    } 
    text("improve", 47, 940) ;
    break ;
    
     case 7:
    //change, improve, Nippersink

    textFont(ralelight, 128) ;
    fill (255, 70) ;
    text("Nippersink Watershed", 575, 1060) ;

   noStroke () ;
    fill(0, op15) ;
    op15-- ;
    if (op15 < 0) {
      op15 = 0 ;
    }
    rect (0, 490, 1920, 375) ; 
    
    textFont(ralereg, 172) ;
    fill (255, 100) ;
    text("change", 342, 822) ;

    textFont(ralereg, 58) ;
    fill (255, op13) ;
    op13 = op13 - 3 ;
    if (op13<0) {
      op13 = 0; 
    }
    text("73% of your neighbors", 1230, 555) ;
    text("are willing to change", 1230, 625) ;
    text("the way they care for", 1230, 695) ;
    text("their lawn and yard", 1230, 765) ;
    text("to improve water quality.", 1230, 835) ;


    textFont(ralebold, 138) ;
    fill (255, 150) ;
    text("improve", 47, 940) ;
    break ;
    
  }
}

void mousePressed() {

  state++ ;
  if (state > 7) { 
    state = 0 ;
  }
}




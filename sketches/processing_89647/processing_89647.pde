
/* @pjs font="Raleway-Regular.ttf"; */
PFont ralereg ;
PImage bgimage ;
int titlex = 800 ;
float state = 0 ;
float op1 = -30 ;
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



void setup() {
  frameRate(24) ;
  size(641, 800) ;
  ralereg = createFont("Raleway-Regular.ttf", 256) ;
  bgimage = loadImage("river3.jpg") ;
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

    textFont(ralereg, 256) ;
    fill (255, op1) ;
    op1++ ;
    if (op1 > 40) {
      op1 = 40;
      state++ ;
    }
    text("73%", 30, 205) ;

    break ;

  case 1:
  //73%, box, line 1

    textFont(ralereg, 256) ;
    fill (255, 40) ;
    text("73%", 30, 205) ;

    noStroke () ;
    fill (0, op2) ;
    op2 = op2 + 2 ;
    if (op2 > 80) {
      op2= 80;
    } 
    rect (0, 470, 641, 250) ;

    textFont(ralereg, 36) ;
    fill (255, op3) ;
    op3 = op3 + 2.5 ;
    if (op3 > 255) {
      op3 = 255;
      state++ ;
    } 
    text("73% of your neighbors", 220, 505) ;

    break;

  case 2:
  // 73%, box, line 1, line 2

    textFont(ralereg, 256) ;
    fill (255, 40) ;
    text("73%", 30, 205) ;
    
    noStroke () ;
    fill(0, 80) ;
    rect (0, 470, 641, 250) ;

    textFont(ralereg, 36) ;
    fill (255) ;
    text("73% of your neighbors", 220, 505) ;
    
     textFont(ralereg, 36) ;
    fill (255, op4) ;
    op4 = op4 + 2.5 ;
    if (op4 > 255) {
      op4 = 255;
      state++ ;
    } 
    text("are willing to change", 220, 555) ;
   
    break ;
    
    case 3:
    //73%, box, line 1, line 2, line 3, willing, to, change
    
     textFont(ralereg, 256) ;
    fill (255, 40) ;
    text("73%", 30, 205) ;
    
    noStroke () ;
    fill(0, 80) ;
    rect (0, 470, 641, 250) ;

    textFont(ralereg, 36) ;
    fill (255) ;
    text("73% of your neighbors", 220, 505) ;
    text("are willing to change", 220, 555) ;
    
    textFont(ralereg, 36) ;
    fill (255, op5) ;
    op5 = op5 + 2.5 ;
    if (op5 > 255) {
      op5 = 255;
      state++ ;
    } 
    text("the way they care for", 220, 605) ;
    
     textFont(ralereg, 140) ;
    fill (255, op6) ;
    op6++ ;
    if (op6 > 40) {
      op6 = 40;
    }
    text("willing", 235, 311) ;

    textFont(ralereg, 128) ;
    fill (255, op7) ;
    op7++ ;
    if (op7 > 40) {
      op7 = 40;
    }
    text("to", 0, 340) ;

    textFont(ralereg, 172) ;
    fill (255, op8) ;
    op8++ ;
    if (op8 > 60) {
      op8 = 60;
    }
    text("change", 40, 425) ;
    
    break ;
    
    case 4:
    //73%, box, line 1, line 2, line 3, willing, to, change, line 4
    
    textFont(ralereg, 256) ;
    fill (255, 40) ;
    text("73%", 30, 205) ;

    textFont(ralereg, 140) ;
    fill (255, 40) ;
    text("willing", 235, 311) ;

    textFont(ralereg, 128) ;
    fill (255, 40) ;
    text("to", 0, 340) ;

    textFont(ralereg, 172) ;
    fill (255, 60) ;
    text("change", 40, 425) ;
    
    noStroke () ;
    fill(0, 80) ;
    rect (0, 470, 641, 250) ;

    textFont(ralereg, 36) ;
    fill (255) ;
    text("73% of your neighbors", 220, 505) ;
    text("are willing to change", 220, 555) ;
    text("the way they care for", 220, 605) ;
    
    textFont(ralereg, 36) ;
    fill (255, op9) ;
    op9 = op9 + 2.5 ;
    if (op9 > 255) {
      op9 = 255;
      state++ ;
    } 
    text("their lawn and yard", 220, 655) ;
    
    break ;
    
    case 5:
    //73%, box, line 1, line 2, line 3, willing, to, change, line 4, line 5
    
    textFont(ralereg, 256) ;
    fill (255, 40) ;
    text("73%", 30, 205) ;

    textFont(ralereg, 140) ;
    fill (255, 40) ;
    text("willing", 235, 311) ;

    textFont(ralereg, 128) ;
    fill (255, 40) ;
    text("to", 0, 340) ;

    textFont(ralereg, 172) ;
    fill (255, 60) ;
    text("change", 40, 425) ;
    
    noStroke () ;
    fill(0, 80) ;
    rect (0, 470, 641, 250) ;

    textFont(ralereg, 36) ;
    fill (255) ;
    text("73% of your neighbors", 220, 505) ;
    text("are willing to change", 220, 555) ;
    text("the way they care for", 220, 605) ;
    text("their lawn and yard", 220, 655) ;
    
    textFont(ralereg, 36) ;
    fill (255, op10) ;
    op10 = op10 + 2.5 ;
    if (op10 > 255) {
      op10 = 255;
      state++ ;
    } 
    text("to improve water quality.", 220, 705) ;
    
    break ;
    
    case 6:
    //full
    
    textFont(ralereg, 256) ;
    fill (255, 40) ;
    text("73%", 30, 205) ;

    textFont(ralereg, 140) ;
    fill (255, 40) ;
    text("willing", 235, 311) ;

    textFont(ralereg, 128) ;
    fill (255, 40) ;
    text("to", 0, 340) ;

    textFont(ralereg, 172) ;
    fill (255, 60) ;
    text("change", 40, 425) ;
    
    noStroke () ;
    fill(0, 80) ;
    rect (0, 470, 641, 250) ;

    textFont(ralereg, 36) ;
    fill (255) ;
    text("73% of your neighbors", 220, 505) ;
    text("are willing to change", 220, 555) ;
    text("the way they care for", 220, 605) ;
    text("their lawn and yard", 220, 655) ;
    text("to improve water quality.", 220, 705) ;


    textFont(ralereg, 140) ;
    fill (255, op11) ;
    op11++ ;
    if (op11 > 100) {
      op11 = 100;
    } 
    text("improve", 55, 800) ;
    break ;
  }
}

void mousePressed() {

  state++ ;
  if (state > 6) { 
    state = 0 ;
  }
}




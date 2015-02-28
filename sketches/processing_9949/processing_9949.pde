
int page = 1;   
PFont font;

int b1x = 260;
int b1y = 370;
int b1w = 130;
int b1h = 40; 

int b2x = 220; 
int b2y = 400;
int b2w = 140;
int b2h = 50;

int b3x= 420;
int b3y= 400;
int b3w= 140;
int b3h= 50;

////////////////////////////////////////////////////////



PImage Page1;
PImage Page2;
PImage Page3;
PImage Page4;
PImage Page5;
PImage Page6;
PImage Page7;
PImage Page8;
PImage Page9;
PImage Page10;
PImage Page11;
PImage Page12;
PImage Page13;
PImage Page14;

void setup() {
  size(640, 480);
  cursor(CROSS);
  smooth();
  font = loadFont("font.vlw");
  textFont(font);
  fill(0, 0, 0);
  
    Page1 = loadImage("page1.png");
    Page2 = loadImage("page2.png");
    Page3 = loadImage("page3.png");
    Page4 = loadImage("page4.png");
    Page5 = loadImage("page5.png");
    Page6 = loadImage("page6.png");
    Page7 = loadImage("page7.png");
    Page8 = loadImage("page8.png");
    Page9 = loadImage("page9.png");
    Page10 = loadImage("page10.png");
    Page11 = loadImage("page11.png");
    Page12 = loadImage("page12.png");
    Page13 = loadImage("page13.png");
    Page14 = loadImage("page14.png");
 
}



  void draw() {
  if (page == 1) {
    pageOne();
  } else if (page == 2) {
    pageTwo(); 
  } else if (page == 3) {
    pageThree(); 
  } else if (page == 4) {
    pageFour();
  } else if (page == 5) {
    pageFive();
  } else if (page == 6) {
    pageSix();
  } else if (page == 7) {
    pageSeven();
  } else if (page == 8) {
    pageEight();
  } else if (page == 9) {
    pageNine();
  } else if (page == 10) {
    pageTen();
  } else if (page == 11) {
    pageEleven();
  } else if (page == 12) {
    pageTwelve();
  }else if (page == 13) {
    pageThirteen();
  }else if (page == 14) {
    pageFourteen();
  }
}
    
    
    
    
/////////////////////////////////////////////////////////////////////////
    

void mousePressed() {
  if (page == 1) {
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      page = 2; 
    } 

  } else if (page == 2) {
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      page = 3; 
    } 

  } else if (page == 3) {
    if (overButton(b1x-200, b1y-200, b1w+400, b1h) == true) {
      page = 11; 
    } 
    else if (overButton(b1x-160, b1y-160, b1w+400, b1h) == true) {
      page = 4;
    }   
    else if (overButton(b1x-120, b1y-120, b1w+400, b1h) == true) {
      page = 12;
    }
      else if (overButton(b1x-80, b1y-80, b1w+400, b1h) == true) {
      page = 13;
    }
    
    
    

  }else if (page == 4) {
    if (overButton(b1x-200, b1y-200, b1w+400, b1h) == true) {
      page = 5; 
    } 
    else if (overButton(b1x-160, b1y-160, b1w+400, b1h) == true) {
      page = 12;
    }   
    else if (overButton(b1x-120, b1y-120, b1w+400, b1h) == true) {
      page = 14;
    }
      else if (overButton(b1x-80, b1y-80, b1w+400, b1h) == true) {
      page = 11;
    }



 }else if (page == 5) {
 
  if (overButton(b1x-200, b1y-200, b1w+400, b1h) == true) {
      page = 6; 
    } 
    else if (overButton(b1x-160, b1y-160, b1w+400, b1h) == true) {
      page = 11;
    }   
    else if (overButton(b1x-120, b1y-120, b1w+400, b1h) == true) {
      page = 11;
    }
    
    
     }else if (page == 6) {
 
  if (overButton(b1x-200, b1y-200, b1w+400, b1h) == true) {
      page = 7; 
    } 
    else if (overButton(b1x-160, b1y-160, b1w+400, b1h) == true) {
      page = 9;
    } 
    


    
    
    
    
    
  }else if (page == 7) {
    if (overButton(b1x-200, b1y-200, b1w+400, b1h) == true) {
      page = 8; 
    } 
    else if (overButton(b1x-160, b1y-160, b1w+400, b1h) == true) {
      page = 8;
    }   
    else if (overButton(b1x-120, b1y-120, b1w+400, b1h) == true) {
      page = 8;
    }
    
    
      }else if (page == 9) {
     if (overButton(b1x-200, b1y-200, b1w+400, b1h) == true) {
      page = 11; 
    } 
    else if (overButton(b1x-160, b1y-160, b1w+400, b1h) == true) {
      page = 10;
    }   
    else if (overButton(b1x-120, b1y-120, b1w+400, b1h) == true) {
      page = 7;
    }
    
    
    
    
    

  } else if (page == 9) {
    if (overButton(b1x+20, b1y-100, b1w, b1h) == true) {
      page = 4; 

}else if (page == 9) {
    if (overButton(b3x-340, b3y-5, b3w, b3h) == true) {
      page = 8; 

}else if (page == 9) {
    if (overButton(b2x-90, b2y-55, b2w, b2h) == true) {
      page = 10; 
    }
}

  }else if (page == 4) {
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      page = 1; 

}
}
  }else if (page == 10) {
    if (overButton(b1x+372, b1y-50, b1w, b1h) == true) {
      page = 11; 

}else if (page == 10) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 14; 

}
}
  }else if (page == 11) {
    if (overButton(b1x-25, b1y+8, b1w, b1h) == true) {
      page = 1; 

}else if (page == 11) {
    if (overButton(b3x-220, b3y+8, b3w, b3h) == true) {
      page = 1; 

}
}
  }else if (page == 12) {
    if (overButton(b1x+37, b1y, b1w, b1h) == true) {
      page = 1; 

}

  }else if (page == 13) {
    if (overButton(b1x-8, b1y, b1w, b1h) == true) {
      page = 1; 

}
  }else if (page == 14) {
    if (overButton(b1x+10, b1y, b1w, b1h) == true) {
      page = 11; 

}
  }
}


boolean overButton(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    return true; 
  } 
  else {
    return false; 
  }
}


///////////////////////////////////////////
/////PAGE ONE//////////////////////////////
///////////////////////////////////////////

void pageOne() {
  image (Page1,0,0);
 
  
  if (overButton(b1x, b1y, b1w, b1h) == true) {
    fill(60, 60, 230, 80); 
  } 
  else {
    fill(60, 60, 230, 155); 
  }
  textAlign(CENTER);
  text("Continue", 320, 400);
  
}
  
///////////////////////////////////////////
/////PAGE TWO//////////////////////////////
///////////////////////////////////////////

void pageTwo() {
  background(195, 147, 224);
  fill(255);
   image(Page2,0,0);
  
  // Button
  if (overButton(b1x, b1y, b1w, b1h) == true) {
    fill(60, 60, 230, 80);  
  } 
  else {
    fill(60, 60, 230, 155);  
  }
  textAlign(CENTER);
  text("Continue", b1x + b1w/2, b1y + 32);
  textAlign(LEFT);
}


///////////////////////////////////////////
/////PAGE THREE//////////////////////////////
///////////////////////////////////////////

void pageThree() {
 image(Page3,0,0);


 // 1st option
 
    if (overButton(b1x-200, b1y-200, b1w+400, b1h) == true) {
    fill(60, 60, 230, 80); 
  } 
  else {
    fill(60, 60, 230, 155); 
  }
  
  textAlign(CENTER);
  text("take your life and join her in death", b1x-200, b1y-200, b1w+400, b1h);
  
// 2nd option

    if (overButton(b1x-160, b1y-160, b1w+400, b1h) == true) {
    fill(60, 60, 230, 80); 
  } 
  else {
    fill(60, 60, 230, 155); 
  }
  textAlign(CENTER);
  text("find a woman more virtous", b1x-160, b1y-160, b1w+400, b1h);

  
  // 3rd option

   if (overButton(b1x-120, b1y-120, b1w+400, b1h) == true) {
    fill(60, 60, 230, 80); 
  } 
  else {
    fill(60, 60, 230, 155); 
  }
  textAlign(CENTER);
  text("do not search for another love", b1x-120, b1y-120, b1w+400, b1h);

  
    // 4th option

    if (overButton(b1x-80, b1y-80, b1w+400, b1h) == true) {
    fill(60, 60, 230, 80); 
  } 
  else {
    fill(60, 60, 230, 155); 
  }
  textAlign(CENTER);
  text("find a woman less virtous", b1x-80, b1y-80, b1w+400, b1h);
}

   

    // PAGE FOUR

void pageFour() {
  fill(255);
  background(0);
  image (Page4,0,0);

 // 1st option
 
    if (overButton(b1x-200, b1y-200, b1w+400, b1h) == true) {
    fill(60, 60, 230, 80); 
  } 
  else {
    fill(60, 60, 230, 155); 
  }
  
  textAlign(CENTER);
  text("Ask her to marry you", b1x-200, b1y-200, b1w+400, b1h);
  
// 2nd option

    if (overButton(b1x-160, b1y-160, b1w+400, b1h) == true) {
    fill(60, 60, 230, 80); 
  } 
  else {
    fill(60, 60, 230, 155); 
  }
  textAlign(CENTER);
  text("Forget it, live alone", b1x-160, b1y-160, b1w+400, b1h);

  
  // 3rd option

   if (overButton(b1x-120, b1y-120, b1w+400, b1h) == true) {
    fill(60, 60, 230, 80); 
  } 
  else {
    fill(60, 60, 230, 155); 
  }
  textAlign(CENTER);
  text("Plan a suprise wedding", b1x-120, b1y-120, b1w+400, b1h);

  
    // 4th option

    if (overButton(b1x-80, b1y-80, b1w+400, b1h) == true) {
    fill(60, 60, 230, 80); 
  } 
  else {
    fill(60, 60, 230, 155); 
  }
  textAlign(CENTER);
  text("The anguish...take your life", b1x-80, b1y-80, b1w+400, b1h);
}

   

  
  

  // PAGE FIVE

void pageFive() {
  background(255, 100, 147);
  
image (Page5,0,0);

 // 1st option
 
    if (overButton(b1x-200, b1y-200, b1w+400, b1h) == true) {
    fill(60, 60, 230, 80); 
  } 
  else {
    fill(60, 60, 230, 155); 
  }
  
  textAlign(CENTER);
  text("Follow her!", b1x-200, b1y-200, b1w+400, b1h);
  
// 2nd option

    if (overButton(b1x-160, b1y-160, b1w+400, b1h) == true) {
    fill(60, 60, 230, 80); 
  } 
  else {
    fill(60, 60, 230, 155); 
  }
  textAlign(CENTER);
  text("Just take your life", b1x-160, b1y-160, b1w+400, b1h);

  
  // 3rd option

   if (overButton(b1x-120, b1y-120, b1w+400, b1h) == true) {
    fill(60, 60, 230, 80); 
  } 
  else {
    fill(60, 60, 230, 155); 
  }
  textAlign(CENTER);
  text("Ask someone to take your life", b1x-120, b1y-120, b1w+400, b1h);

}
  
  
  // PAGE SIX

void pageSix() {
  fill(255);
  background(0);
  image(Page6,0,0);
  


  // 1st option
 
    if (overButton(b1x-200, b1y-200, b1w+400, b1h) == true) {
    fill(60, 60, 230, 80); 
  } 
  else {
    fill(60, 60, 230, 155); 
  }
  
  textAlign(CENTER);
  text("LEFT", b1x-200, b1y-200, b1w+400, b1h);
  
// 2nd option

    if (overButton(b1x-160, b1y-160, b1w+400, b1h) == true) {
    fill(60, 60, 230, 80); 
  } 
  else {
    fill(60, 60, 230, 155); 
  }
  textAlign(CENTER);
  text("RIGHT", b1x-160, b1y-160, b1w+400, b1h);
}
  
  
    // PAGE SEVEN

void pageSeven() {
  fill(255);
  background(0);
  image (Page7,0,0);
  

   // 1st option
 
    if (overButton(b1x-200, b1y-200, b1w+400, b1h) == true) {
    fill(60, 60, 230, 80); 
  } 
  else {
    fill(60, 60, 230, 155); 
  }
  
  textAlign(CENTER);
  text("Hey there!", b1x-200, b1y-200, b1w+400, b1h);
  
// 2nd option

    if (overButton(b1x-160, b1y-160, b1w+400, b1h) == true) {
    fill(60, 60, 230, 80); 
  } 
  else {
    fill(60, 60, 230, 155); 
  }
  textAlign(CENTER);
  text("Ummm....hi", b1x-160, b1y-160, b1w+400, b1h);
  
  
  
  // 3rd option

    if (overButton(b1x-120, b1y-120, b1w+400, b1h) == true) {
    fill(60, 60, 230, 80); 
  } 
  else {
    fill(60, 60, 230, 155); 
  }
  textAlign(CENTER);
  text("How's it going?", b1x-120, b1y-120, b1w+400, b1h);
  
 }
  
    // PAGE EIGHT

void pageEight() {
  fill(255);
  background(0);
  image (Page8,0,0);
    
  }  
  
      // PAGE NINE

void pageNine() {
  background(125, 246, 180);
 image (Page9,0,0);

// 1st option
 
    if (overButton(b1x-200, b1y-200, b1w+400, b1h) == true) {
    fill(60, 60, 230, 80); 
  } 
  else {
    fill(60, 60, 230, 155); 
  }
  
  textAlign(CENTER);
  text("Give up and take your life", b1x-200, b1y-200, b1w+400, b1h);
  
// 2nd option

    if (overButton(b1x-0, b1y-160, b1w+400, b1h) == true) {
    fill(60, 60, 230, 80); 
  } 
  else {
    fill(60, 60, 230, 155); 
  }
  textAlign(CENTER);
  text("Build a cabin", b1x-160, b1y-160, b1w+400, b1h);
  
   // 3rd option

    if (overButton(b1x-120, b1y-120, b1w+400, b1h) == true) {
    fill(60, 60, 230, 80); 
  } 
  else {
    fill(60, 60, 230, 155); 
  }
  textAlign(CENTER);
  text("Use your mating call", b1x-120, b1y-120, b1w+400, b1h);
  
}

    // PAGE TEN

void pageTen() {
image (Page10,0,0);

}

    // PAGE ELEVEN
void pageEleven() {
background(100, 145, 185);
image (Page11,0,0);



  if (overButton(b1x, b1y, b1w, b1h) == true) {
   fill(60, 60, 230, 80);  
  } 
  else {
    fill(60, 60, 230, 155); 
  }
  textAlign(CENTER);
  text("try again?", b1x, b1y, b1w, b1h);
}
  

    // PAGE TWELVE
 void pageTwelve() {
  fill (255);
  background(0);
  image (Page12,0,0);
  
 if (overButton(b1x, b1y, b1w, b1h) == true) {
   fill(60, 60, 230, 80);  
  } 
  else {
    fill(60, 60, 230, 155); 
  }
  textAlign(CENTER);
  text("try again?", b1x, b1y, b1w, b1h);
}
  
      // PAGE THIRTEEN
void pageThirteen() {
  fill (255);
  background(0);
  
  image (Page13,0,0);

 if (overButton(b1x, b1y, b1w, b1h) == true) {
   fill(60, 60, 230, 80);  
  } 
  else {
    fill(60, 60, 230, 155); 
  }
  textAlign(CENTER);
  text("try again?", b1x, b1y, b1w, b1h);
}

      // PAGE FOURTEEN
void pageFourteen() {
  fill (0);
  background(255);
  image (Page14,0,0);
 
   if (overButton(b1x, b1y, b1w, b1h) == true) {
   fill(60, 60, 230, 80);  
  } 
  else {
    fill(60, 60, 230, 155); 
  }
  textAlign(CENTER);
  text("take your life", b1x, b1y, b1w+60, b1h);
}



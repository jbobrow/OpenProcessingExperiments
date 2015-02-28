

//Ben Blalock's Flashlight Guy.  
//He has two simple tasks:
//Trying to light up the darkness, and trying to get you to help him.
//He can get mean and frustrated, but he's just a lonely flashlight man.  Please help him out.

//Don't take too long, or go off of the color zone though.
//Right clicking brings a new color that he wants to reveal.

//Enjoy.
//       -Ben

//Random color variables that will be used in place of the image.
int col1 = 255;
int col2 = 255;
int col3 = 255;

//Make my darkCount variable.
int darkCount = 0;

//Create my font variable.
PFont font;

//Int goodClicks.  Will go into my right click function and will be fed into my writeTextThankful function.
int goodClicks = 0;

//Int helpClics.  Will go into writeTextHelp function.  Will tell which help text should be accessed.
int helpClicks = 0;

//boolean lazy will tell us if the user is being lazy or not.
boolean lazy = false;

//Int sec.  Will be used to count how many seconds the mouse has paused.
int sec = 0;

//Int confusedClicks will be used to write confused things when the mouse goes into the flashlight guys sector.
int confusedClicks = 0;

//My class for my booleans that are going to decide which text is written.
//Will be fed into all text functions, and will be manipulated through textMeaning function.
class Three {
  
  boolean a;
  boolean b;
  boolean c;
  
  Three(boolean _a, boolean _b, boolean _c) {
    a = _a;
    b = _b;
    c = _c;
  }
}

//Make my initial class list for the textBooleans
Three textBool = new Three(false,false,false);

//My class for my booleans that are going to be returned from my mouseSector
//function, and fed into my drawMan function.
//They will show where the mouse is.
class Four {
  
  boolean a;
  boolean b;
  boolean c;
  boolean d;
  
  Four(boolean _a, boolean _b, boolean _c, boolean _d) {
    a = _a;
    b = _b;
    c = _c;
    d = _d;
  }
}


//Make my intial class list
Four t = new Four(true,false,false,false);
  
  
void setup() {
  
  size(900,600);
  background(0);
  frameRate(20);
  font = loadFont("Arial-BoldMT-48.vlw");
  textFont(font);
  text("Please help me light this up!", 605, 25, 290, 270);
  
}

void draw() {
  
  //find the flashlight's position.
  t = mouseSector(t);
  
  //call drawMan
  drawMan(t);
  
  //make the mouse like the light of the flashlight
  flashLight();
  
  //make the darkness grow
  darkCount = darkness(darkCount);
  
  //find out if the user is being lazy
  lazy = lazyCounter(lazy);
  
  //find the text meaning
  textBool = textMeaning(textBool, lazy);
  
  //Cycle through the different text functions.
  writeTextThankful(goodClicks, textBool);
  
  writeTextHelp(helpClicks, textBool);
  
  writeTextConfused(confusedClicks, textBool);
  
}

//Decides which boolean is true and then feeds that out to my text functions.
Three textMeaning(Three textBool, boolean lazy) {
  
  if(mouseX <= 600 && mouseY <= 600 && lazy != true) {
    if(mousePressed) {
      if(mouseButton == RIGHT) {
        //Thankful text is needed
        textBool = new Three(true,false,false);
      }
    }
  } else if(lazy == true) {
    //Help text is needed
    textBool = new Three(false,true,false);
  } else if(mouseX > 600 && mouseX <= 900 && lazy != true) {
    if(pmouseX <= 600) {
      //Confused text is needed.
      textBool = new Three(false,false,true);
      confusedClicks++;
      if(confusedClicks > 3) {
        confusedClicks = 0;
      }
    }
  }
  
  return textBool;
  
}

//Writes Text in the upper right hand corner.  I will use this function:
//When the person right clicks.
void writeTextThankful(int goodClicks, Three textBool) {
  
  if(textBool.a) {
    if(goodClicks == 1){
      //write "Alright, next one."
      noStroke();fill(0); rect(600,0,300,300); fill(255);textAlign(CENTER);
      text("Alright, next one.", 605, 25, 290, 270);
    } else if(goodClicks == 2) {
      //write "You're the best at this!"
      noStroke();fill(0); rect(600,0,300,300); fill(255);textAlign(CENTER);
      text("You're the best at this!", 605, 25, 290, 270);
    } else if(goodClicks == 3) {
      //write "Yeah, keep it going!"
      noStroke();fill(0); rect(600,0,300,300); fill(255);textAlign(CENTER);
      text("Yeah, keep it going!", 605, 25, 290, 270);
    } else if(goodClicks == 4) {
      //write "I'm loving this!"
      noStroke();fill(0); rect(600,0,300,300); fill(255);textAlign(CENTER);
      text("I'm loving this!", 605, 25, 290, 270);
    } else if(goodClicks == 5) {
      //write "Thanks hot stuff ;)"
      noStroke();fill(0); rect(600,0,300,300); fill(255);textAlign(CENTER);
      text("Thanks hot stuff ;)", 605, 25, 290, 270);
    } else if(goodClicks == 6) {
      //write "I think I love you."
      noStroke();fill(0); rect(600,0,300,300); fill(255);textAlign(CENTER);
      text("I think I love you.", 605, 25, 290, 270);
    } else if(goodClicks == 7) {
      //write "What, no I love you back?  Fine, let's just keep going then."
      noStroke();fill(0); rect(600,0,300,300); fill(255);textAlign(CENTER);
      textSize(30);
      text("What, no 'I love you' back?  Fine, let's just keep going then.", 605, 25, 290, 270);
      textSize(48);
    }
  }
}

//Counts how many seconds the mouse hasn't moved.
//If it's over five, he starts to yell at you.
boolean lazyCounter(boolean lazy) {
  
  if(pmouseX == mouseX && pmouseY == mouseY) {
    sec++;
  } else {
    sec = 0;
    helpClicks = 0;
    lazy = false;
  }
  
  if(sec == 80) {
    helpClicks++;
    sec = 0;
    lazy = true;
  }
  
  if(helpClicks > 4) {
    helpClicks = 0;
  }
  
  return lazy;
  
}

//Writes Text in the upper right hand corner.  I will use this function:
//when the person doesn't move the mouse for a while.
void writeTextHelp(int helpClicks, Three textBool) {
  
  if(textBool.b) {
    if(helpClicks == 1) {
      //write "I need you!"
      noStroke();fill(0); rect(600,0,300,300); fill(255);textAlign(CENTER);
      text("I need you!", 605, 25, 290, 270);
    } else if(helpClicks == 2) {
      //write "You're just mean."
      noStroke();fill(0); rect(600,0,300,300); fill(255);textAlign(CENTER);
      text("You're just mean.", 605, 25, 290, 270);
    } else if(helpClicks == 3) {
      //write "Why won't you help me?"
      noStroke();fill(0); rect(600,0,300,300); fill(255);textAlign(CENTER);
      text("Why won't you help?", 605, 25, 290, 270);
    } else if(helpClicks == 4) {
      //write "You're a bad person."
      noStroke();fill(0); rect(600,0,300,300); fill(255);textAlign(CENTER);
      text("You're a bad person.", 605, 25, 290, 270);
    }
  }
  
}

//Writes Text in the upper right hand corner.  I will use this function:
//when the person moves the mouse pass the x coordinate of six hundred.
void writeTextConfused(int confusedClicks, Three textBool) {
  
  if(textBool.c) {
    if(confusedClicks == 1) {
      //write "Get back over there!"
      noStroke();fill(0); rect(600,0,300,300); fill(255);textAlign(CENTER);
      text("Get back over there!", 605, 25, 290, 270);
    } else if(confusedClicks == 2) {
      //write "Seriously?"
      noStroke();fill(0); rect(600,0,300,300); fill(255);textAlign(CENTER);
      text("Seriously?", 605, 25, 290, 270);
    } else if(confusedClicks == 3) {
      //write "What are you doing?"
      noStroke();fill(0); rect(600,0,300,300); fill(255);textAlign(CENTER);
      text("What are you doing?", 605, 25, 290, 270);
    }
  }
}

//Reason you move the flashlight is because darkness is taking over.
int darkness(int darkCount) {
  if(darkCount == 100) {
    noStroke();
    fill(0);
    ellipse(random(80,520),random(80,520),160,160);
    darkCount = 0;
  } 
  
  darkCount++;
  
  return darkCount;
}

//Flashlight
//Makes a randomly color ball follow the mouse when it is in the right space.
void flashLight() {
  if(mouseX >= 0 && mouseX < 575) {
    if(mouseY >= 0 && mouseY < 575) {
      noStroke();
      fill(col1,col2,col3);
      ellipse(mouseX,mouseY,50,50);
    }
  }
}

//Returns three booleans that will be fed into drawMan
//These booleans will tell me which sector the mouse is in.
//The sectors are basically stair steps in the 600,600 frame 
//that the flashlight is pointing in.
Four mouseSector(Four t) {
  
  //checks the bottom sector
  if(mouseX < 150) {
    
    if(mouseY < 300) {
      t = new Four(false,true,false,false);
    } else if(mouseY >= 300) {
      t = new Four(true,false,false,false);
    }
    
  } else if(mouseX >= 150 && mouseX < 250) {
    
    if(mouseY < 350) {
      t = new Four(false,true,false,false);
    } else if(mouseY >= 350) {
      t = new Four(true,false,false,false);
    }
    
  } else if(mouseX >= 250 && mouseX < 300) {
    
    if(mouseY < 50) {
      t = new Four(false,false,true, false);
    } else if(mouseY >= 50 && mouseY < 350) {
      t = new Four(false,true,false,false);
    } else if(mouseY >= 350) {
      t = new Four(true,false,false,false);
    }
    
  } else if(mouseX >= 300 && mouseX < 350) {
    
    if(mouseY < 100) {
      t = new Four(false,false,true, false);
    } else if(mouseY >= 100 && mouseY < 400) {
      t = new Four(false,true,false,false);
    } else if(mouseY >= 400) {
      t = new Four(true,false,false,false);
    }
    
  } else if(mouseX >= 350 && mouseX < 400) {
    
    if(mouseY < 150) {
      t = new Four(false,false,true, false);
    } else if(mouseY >= 150 && mouseY < 400) {
      t = new Four(false,true,false,false);
    } else if(mouseY >= 400) {
      t = new Four(true,false,false,false);
    }
    
  } else if(mouseX >= 400 && mouseX < 450) {
    
    if(mouseY < 200) {
      t = new Four(false,false,true, false);
    } else if(mouseY >= 200 && mouseY < 400) {
      t = new Four(false,true,false,false);
    } else if(mouseY >= 400) {
      t = new Four(true,false,false,false);
    }
    
  } else if(mouseX >= 450 && mouseX < 500) {
    
    if(mouseY < 250) {
      t = new Four(false,false,true, false);
    } else if(mouseY >= 250 && mouseY < 400) {
      t = new Four(false,true,false,false);
    } else if(mouseY >= 400) {
      t = new Four(true,false,false,false);
    }
    
  } else if(mouseX >= 500 && mouseX < 550) {
    
    if(mouseY < 300) {
      t = new Four(false,false,true, false);
    } else if(mouseY >= 300 && mouseY < 400) {
      t = new Four(false,true,false,false);
    } else if(mouseY >= 400) {
      t = new Four(true,false,false,false);
    }
    
  } else if(mouseX >= 550 && mouseX < 600) {
    
    if(mouseY < 350) {
      t = new Four(false,false,true, false);
    } else if(mouseY >= 350 && mouseY < 400) {
      t = new Four(false,true,false,false);
    } else if(mouseY >= 400) {
      t = new Four(true,false,false,false);
    }
    
  } else {
    
    t = new Four(false,false,false,true);
    
  }
  
  return t;
  
}

//Draws the man with the flashlight.  I will use this function:
//1. when the program starts
//2. when the mouse moves from one of the three picture sectors to another
//3. when the mouse goes into the right off limits sector
void drawMan(Four t) {
  
  //draw black rectangle to clean slate
  noStroke();
  fill(0);
  rect(600,300,300,600);
  
  //draw legs, body, head
  strokeWeight(2);
  stroke(255);
  fill(255);
    //leg
  line(700,600,700,550);
  line(700,550,750,525);
    //leg
  line(800,600,775,550);
  line(775,550,750,525);
    //body
  line(750,525,775,400);
    //head
  ellipse(775,400,50,50);
  
  //draw flashlight then arm
  if(t.a) {
    
    noStroke();fill(100);
    beginShape();
    vertex(800,500);
    vertex(800,490);
    vertex(735,488);
    vertex(725,480);
    vertex(710,480);
    vertex(710,510);
    vertex(725,510);
    vertex(735,502);
    endShape(CLOSE);
    
    strokeWeight(2);stroke(255);
    line(750,500,775,490);
    line(775,490,765,450);
    
  } else if(t.b) {
    
    noStroke();fill(100);
    beginShape();
    vertex(793,500);
    vertex(796,489);
    vertex(745,470);
    vertex(736,456);
    vertex(722,450);
    vertex(708,484);
    vertex(723,490);
    vertex(738,485);
    endShape();
    
    strokeWeight(2);stroke(255);
    line(750,488,770,475);
    line(770,475,765,450);
    
  } else if(t.c) {
    
    noStroke();fill(100);
    beginShape();
    vertex(790,493);
    vertex(795,487);
    vertex(749,451);
    vertex(748,437);
    vertex(735,428);
    vertex(714,454);
    vertex(728,464);
    vertex(740,461);
    endShape();
    
    strokeWeight(2);stroke(255);
    line(750,460,770,475);
    line(770,475,765,450);
    
  } else if(t.d) {
    
    strokeWeight(5);stroke(255,0,0);
    line(810,390,825,385);
    line(805,380,820,375);
    line(740,390,725,385);
    line(745,380,730,375);
    line(785,365,790,355);
    line(765,365,760,353);
    
    noStroke();fill(100);
    beginShape();
    vertex(800,500);
    vertex(800,490);
    vertex(735,488);
    vertex(725,480);
    vertex(710,480);
    vertex(710,510);
    vertex(725,510);
    vertex(735,502);
    endShape(CLOSE);
    
    strokeWeight(2);stroke(255);
    line(750,500,775,490);
    line(775,490,765,450);
    
  }
  
  
}


//When the right button is pressed, these need to happen:
//1. the background needs to reset
//2. need to writeText that says something witty
//3. switch to next image
void mousePressed() {
  if (mouseButton == RIGHT) {
    noStroke();
    fill(0);
    rect(0,0,600,600);
    col1 = int(random(255));
    col2 = int(random(255));
    col3 = int(random(255));
    goodClicks++;
    if(goodClicks > 7) {
      goodClicks = 0;
    }
  }
}


//Haven't put images into the mix yet.
//function needs to uncover image when the mouse rolls over that space
//cannot work if x > 600
//void uncoverImage() {
//}




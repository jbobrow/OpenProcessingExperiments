
void setup() {
  
  size(900, 900, P2D);
  stroke(0, 0, 0, 20);
  for (int i = 0; i < ne; i++) {
    float ae = i + random(0, PI / 9);
    float re = ((i / (float) ne) * (width / 2) * (((ne-i) / (float) ne) * 3.3)) + random(-3, 3) + 3;
    all[i] = new Cell(int(re*cos(ae)) + (width/2), int(re*sin(ae)) + (height/2));
  }
  


  // Load the font
  f = createFont("Century Gothic", 15.5, true);
  textFont(f);

  // Create the array the same size as the String
  letters1 = new Letter[message1.length()];
  letters2 = new Letter[message2.length()];
  letters3 = new Letter[message3.length()];

  letters4 = new Letter[message4.length()];
  letters5 = new Letter[message5.length()];
  letters6 = new Letter[message6.length()];

  letters7 = new Letter[message7.length()];
  letters8 = new Letter[message8.length()];
  letters9 = new Letter[message9.length()];

  letters10 = new Letter[message10.length()];
  letters11 = new Letter[message11.length()];
  letters12 = new Letter[message12.length()];

  letters13 = new Letter[message13.length()];
  letters14 = new Letter[message14.length()];
  letters15 = new Letter[message15.length()];

  letters16 = new Letter[message16.length()];
  letters17 = new Letter[message17.length()];
  letters18 = new Letter[message18.length()];

  letters19 = new Letter[message19.length()];
  letters20 = new Letter[message20.length()];
  letters21 = new Letter[message21.length()];
  letters22 = new Letter[message22.length()];

 // Initialize Letters at the correct x location
  int x = 350;
  for(int i = 0; i < message1.length (); i++) {
    // second Letter parameter is the y position
    letters1[i] = new Letter(x, 190, message1.charAt(i));
    x += textWidth(message1.charAt(i));
  }
  // (Re)set x position here
  x = 380;
  for(int i = 0; i < message2.length (); i++) {
    // second Letter parameter is the y position
    letters2[i] = new Letter(x, 220, message2.charAt(i));
    x += textWidth(message2.charAt(i));
  }
  // (Re)set x position here
  x = 360;
  for(int i = 0; i < message3.length (); i++) {
    // second Letter parameter is the y position
    letters3[i] = new Letter(x, 250, message3.charAt(i));
    x += textWidth(message3.charAt(i));
  }
  
  //////
   x = 320;
  for(int i = 0; i < message4.length (); i++) {
    // second Letter parameter is the y position
    letters4[i] = new Letter(x, 280, message4.charAt(i));
    x += textWidth(message4.charAt(i));
  }
  // (Re)set x position here
  x = 255;
  for(int i = 0; i < message5.length (); i++) {
    // second Letter parameter is the y position
    letters5[i] = new Letter(x, 295, message5.charAt(i));
    x += textWidth(message5.charAt(i));
  }
  // (Re)set x position here
  x = 345;
  for(int i = 0; i < message6.length (); i++) {
    // second Letter parameter is the y position
    letters6[i] = new Letter(x, 325, message6.charAt(i));
    x += textWidth(message6.charAt(i));
  }
  
  //////
   x = 222;
  for(int i = 0; i < message7.length (); i++) {
    // second Letter parameter is the y position
    letters7[i] = new Letter(x, 340, message7.charAt(i));
    x += textWidth(message7.charAt(i));
  }
  // (Re)set x position here
  x = 385;
  for(int i = 0; i < message8.length (); i++) {
    // second Letter parameter is the y position
    letters8[i] = new Letter(x, 370, message8.charAt(i));
    x += textWidth(message8.charAt(i));
  }
  // (Re)set x position here
  x = 300;
  for(int i = 0; i < message9.length (); i++) {
    // second Letter parameter is the y position
    letters9[i] = new Letter(x, 400, message9.charAt(i));
    x += textWidth(message9.charAt(i));
  }
  
  //////
   x = 355;
  for(int i = 0; i < message10.length (); i++) {
    // second Letter parameter is the y position
    letters10[i] = new Letter(x, 430, message10.charAt(i));
    x += textWidth(message10.charAt(i));
  }
  // (Re)set x position here
  x = 335;
  for(int i = 0; i < message11.length (); i++) {
    // second Letter parameter is the y position
    letters11[i] = new Letter(x, 460, message11.charAt(i));
    x += textWidth(message11.charAt(i));
  }
  // (Re)set x position here
  x = 360;
  for(int i = 0; i < message12.length (); i++) {
    // second Letter parameter is the y position
    letters12[i] = new Letter(x, 475, message12.charAt(i));
    x += textWidth(message12.charAt(i));
  }
  
  //////
    x = 372;
  for(int i = 0; i < message13.length (); i++) {
    // second Letter parameter is the y position
    letters13[i] = new Letter(x, 505, message13.charAt(i));
    x += textWidth(message13.charAt(i));
  }
  // (Re)set x position here
  x = 255;
  for(int i = 0; i < message14.length (); i++) {
    // second Letter parameter is the y position
    letters14[i] = new Letter(x, 520, message14.charAt(i));
    x += textWidth(message14.charAt(i));
  }
  // (Re)set x position here
  x = 355;
  for(int i = 0; i < message15.length (); i++) {
    // second Letter parameter is the y position
    letters15[i] = new Letter(x, 550, message15.charAt(i));
    x += textWidth(message15.charAt(i));
  }
  
    //////
    x = 345;
  for(int i = 0; i < message16.length (); i++) {
    // second Letter parameter is the y position
    letters16[i] = new Letter(x, 580, message16.charAt(i));
    x += textWidth(message16.charAt(i));
  }
  // (Re)set x position here
  x = 345;
  for(int i = 0; i < message17.length (); i++) {
    // second Letter parameter is the y position
    letters17[i] = new Letter(x, 610, message17.charAt(i));
    x += textWidth(message17.charAt(i));
  }
  // (Re)set x position here
  x = 290;
  for(int i = 0; i < message18.length (); i++) {
    // second Letter parameter is the y position
    letters18[i] = new Letter(x, 640, message18.charAt(i));
    x += textWidth(message18.charAt(i));
  }
  
      //////
  x = 375;
  for(int i = 0; i < message19.length (); i++) {
    // second Letter parameter is the y position
    letters19[i] = new Letter(x, 670, message19.charAt(i));
    x += textWidth(message19.charAt(i));
  }
  // (Re)set x position here
  x = 355;
  for(int i = 0; i < message20.length (); i++) {
    // second Letter parameter is the y position
    letters20[i] = new Letter(x, 685, message20.charAt(i));
    x += textWidth(message20.charAt(i));
  }
  // (Re)set x position here
  x = 392;
  for(int i = 0; i < message21.length (); i++) {
    // second Letter parameter is the y position
    letters21[i] = new Letter(x, 715, message21.charAt(i));
    x += textWidth(message21.charAt(i));
  }
  
  // (Re)set x position here
  x = 330;
  for(int i = 0; i < message22.length (); i++) {
    // second Letter parameter is the y position
    letters22[i] = new Letter(x, 730, message22.charAt(i));
    x += textWidth(message22.charAt(i));
  }
  
}
  

void draw() {
  background(255);
  

  
for (int i = 0; i < letters1.length; i++) {
    // Display all letters
    letters1[i].display();
    // If the mouse is pressed the letters shake
    // If not, they return to their original location
    // Add mouseY position, based on your text location
    if(mouseY > 180 && mouseY < 200 && message1click == false) {
      letters1[i].home();
    } else {
      letters1[i].shake();
    }
    if (message1click == true) {
      letters1[i].home();
    }
  }
  for(int i = 0; i < letters2.length; i++) {
    // Display all letters
    letters2[i].display();
    // Add mouseY position, based on your text location
    if(mouseY > 210 && mouseY < 230 && message2click == false) {
      letters2[i].home();
    } else {
      letters2[i].shake();
       }
    if (message2click == true) {
      letters2[i].home();
    }
  }
  for(int i = 0; i < letters3.length; i++) {
    // Display all letters
    letters3[i].display();
    // Add mouseY position, based on your text location
    if(mouseY > 240 && mouseY < 260 && message3click == false) {
      letters3[i].home();
    } else {
      letters3[i].shake();
    }
    if (message3click == true) {
      letters3[i].home();
    }
  }
  
    for (int i = 0; i < letters4.length; i++) {
    // Display all letters
    letters4[i].display();
    if(mouseY > 270 && mouseY < 290 && message4click == false) {
      letters4[i].home();
    } else {
      letters4[i].shake();
     }
    if (message4click == true) {
      letters4[i].home();
    }
  }
  for(int i = 0; i < letters5.length; i++) {
    // Display all letters
    letters5[i].display();
    // Add mouseY position, based on your text location
    if(mouseY > 290 && mouseY < 310 && message5click == false) {
      letters5[i].home();
    } else {
      letters5[i].shake();
      }
    if (message5click == true) {
      letters5[i].home();
    }
  }
  for(int i = 0; i < letters6.length; i++) {
    // Display all letters
    letters6[i].display();
    // Add mouseY position, based on your text location
    if(mouseY > 315 && mouseY < 330 && message6click == false) {
      letters6[i].home();
    } else {
      letters6[i].shake();
      }
    if (message6click == true) {
      letters6[i].home();
    }
  }
    
    for (int i = 0; i < letters7.length; i++) {
    // Display all letters
    letters7[i].display();
    if(mouseY > 335 && mouseY < 350 && message7click == false) {
      letters7[i].home();
    } else {
      letters7[i].shake();
      }
    if (message7click == true) {
      letters7[i].home();
    }
  }
  for(int i = 0; i < letters8.length; i++) {
    // Display all letters
    letters8[i].display();
    // Add mouseY position, based on your text location
    if(mouseY > 360 && mouseY < 380 && message8click == false) {
      letters8[i].home();
    } else {
      letters8[i].shake();
      }
    if (message8click == true) {
      letters8[i].home();
    }
  }
  for(int i = 0; i < letters9.length; i++) {
    // Display all letters
    letters9[i].display();
    // Add mouseY position, based on your text location
    if(mouseY > 390 && mouseY < 410 && message9click == false) {
      letters9[i].home();
    } else {
      letters9[i].shake();
      }
    if (message9click == true) {
      letters9[i].home();
    }
  }
    
    for (int i = 0; i < letters10.length; i++) {
    // Display all letters
    letters10[i].display();
    if(mouseY > 420 && mouseY < 440 && message10click == false) {
      letters10[i].home();
    } else {
      letters10[i].shake();
      }
    if (message10click == true) {
      letters10[i].home();
    }
  }
  for(int i = 0; i < letters11.length; i++) {
    // Display all letters
    letters11[i].display();
    // Add mouseY position, based on your text location
    if(mouseY > 450 && mouseY < 470 && message11click == false) {
      letters11[i].home();
    } else {
      letters11[i].shake();
      }
    if (message11click == true) {
      letters11[i].home();
    }
  }
  for(int i = 0; i < letters12.length; i++) {
    // Display all letters
    letters12[i].display();
    // Add mouseY position, based on your text location
    if(mouseY > 470 && mouseY < 490 && message12click == false) {
      letters12[i].home();
    } else {
      letters12[i].shake();
      }
    if (message12click == true) {
      letters12[i].home();
    }
  }
    
    for (int i = 0; i < letters13.length; i++) {
    // Display all letters
    letters13[i].display();
    if(mouseY > 495 && mouseY < 510 && message13click == false) {
      letters13[i].home();
    } else {
      letters13[i].shake();
      }
    if (message13click == true) {
      letters13[i].home();
    }
  }
  for(int i = 0; i < letters14.length; i++) {
    // Display all letters
    letters14[i].display();
    // Add mouseY position, based on your text location
    if(mouseY > 510 && mouseY < 530 && message14click == false) {
      letters14[i].home();
    } else {
      letters14[i].shake();
      }
    if (message14click == true) {
      letters14[i].home();
    }
  }
  for(int i = 0; i < letters15.length; i++) {
    // Display all letters
    letters15[i].display();
    // Add mouseY position, based on your text location
    if(mouseY > 540 && mouseY < 560 && message15click == false) {
      letters15[i].home();
    } else {
      letters15[i].shake();
      }
    if (message15click == true) {
      letters15[i].home();
    }
  }
  
    for (int i = 0; i < letters16.length; i++) {
    // Display all letters
    letters16[i].display();
    if(mouseY > 570 && mouseY < 590 && message16click == false) {
      letters16[i].home();
    } else {
      letters16[i].shake();
     }
    if (message16click == true) {
      letters16[i].home();
    }
  }
  for(int i = 0; i < letters17.length; i++) {
    // Display all letters
    letters17[i].display();
    // Add mouseY position, based on your text location
    if(mouseY > 600 && mouseY < 620 && message17click == false) {
      letters17[i].home();
    } else {
      letters17[i].shake();
     }
    if (message17click == true) {
      letters17[i].home();
    }
  }
  for(int i = 0; i < letters18.length; i++) {
    // Display all letters
    letters18[i].display();
    // Add mouseY position, based on your text location
    if(mouseY > 630 && mouseY < 650 && message18click == false) {
      letters18[i].home();
    } else {
      letters18[i].shake();
     }
    if (message18click == true) {
      letters18[i].home();
    }
  }
  
    for (int i = 0; i < letters19.length; i++) {
    // Display all letters
    letters19[i].display();
    if(mouseY > 660 && mouseY < 680 && message19click == false) {
      letters19[i].home();
    } else {
      letters19[i].shake();
     }
    if (message19click == true) {
      letters19[i].home();
    }
  }
  for(int i = 0; i < letters20.length; i++) {
    // Display all letters
    letters20[i].display();
    // Add mouseY position, based on your text location
    if(mouseY > 680 && mouseY < 695 && message20click == false) {
      letters20[i].home();
    } else {
      letters20[i].shake();
     }
    if (message20click == true) {
      letters20[i].home();
    }
  }
  for(int i = 0; i < letters21.length; i++) {
    // Display all letters
    letters21[i].display();
    // Add mouseY position, based on your text location
    if(mouseY > 705 && mouseY < 720 && message21click == false) {
      letters21[i].home();
    } else {
      letters21[i].shake();
     }
    if (message21click == true) {
      letters21[i].home();
    }
  }
  
   for(int i = 0; i < letters22.length; i++) {
    // Display all letters
    letters22[i].display();
    // Add mouseY position, based on your text location
    if(mouseY > 725 && mouseY < 745 && message22click == false) {
      letters22[i].home();
    } else {
      letters22[i].shake();
     }
    if (message22click == true) {
      letters22[i].home();
    }
    
     {
  text(a, 380, 150);
}
  }
  
  for(int i = 0; i < ne; i++)
    all[i].sense();
}
 
void display(){ 
  for(int i=0;i<ne;i++)
    all[i].c = 0;
}
 
float det(int x1, int y1, int x2, int y2, int x3, int y3) {
  return (float) ((x2-x1)*(y3-y1) - (x3-x1)*(y2-y1));
}


void mouseReleased() {

    if(mouseY > 180 && mouseY < 200 && message1click == false){ 
    message1click = true;
    }
    //if(mouseY > 180 && mouseY < 200 && message1click == true) {
     //message1click = false;
    //}

    if(mouseY > 210 && mouseY < 230) {
     message2click = true;
    }
  
    if(mouseY > 240 && mouseY < 260) {
    message3click = true;
    }
  
    if(mouseY > 270 && mouseY < 290) {
    message4click = true;
    }
  
    if(mouseY > 290 && mouseY < 310) {
    message5click = true;
    }
  
    if(mouseY > 315 && mouseY < 330) {
     message6click = true;
    }
    
    if(mouseY > 330 && mouseY < 350) {
    message7click = true;
    }
  
    if(mouseY > 360 && mouseY < 380) {
     message8click = true;
    }
  
    if(mouseY > 390 && mouseY < 410) {
    message9click = true;
    }
    
    if(mouseY > 420 && mouseY < 440) {
    message10click = true;
    }

    if(mouseY > 450 && mouseY < 470) {
    message11click = true;
    }
  
    if(mouseY > 470 && mouseY < 490) {
    message12click = true;
    }
    
    if(mouseY > 495 && mouseY < 510) {
    message13click = true;
    }
  
    if(mouseY > 510 && mouseY < 530) {
    message14click = true;
    }
  
    if(mouseY > 540 && mouseY < 560) {
    message15click = true;
    }
  
    if(mouseY > 570 && mouseY < 590) {
    message16click = true;
    }
  
    if(mouseY > 600 && mouseY < 620) {
    message17click = true;
    }

  
    if(mouseY > 630 && mouseY < 650) {
     message18click = true;
    }
  
  
    if(mouseY > 660 && mouseY < 680) {
    message19click = true;
    }
 

    if(mouseY > 680 && mouseY < 695) {
    message20click = true;
    }
 

    if(mouseY > 705 && mouseY < 720) {
     message21click = true;
    }
 
  
    if(mouseY > 725 && mouseY < 745) {
     message22click = true;
    }
  }


class Cell {
  int x, y;
  float s = 0; // spin velocity
  float c = 0; // current angle
  Cell(int x, int y) {
    this.x=x;
    this.y=y;
  }

  void sense() {
    if (pmouseX != 0 || pmouseY != 0)
      s += sp * det(x, y, pmouseX, pmouseY, mouseX, mouseY) / (dist(x, y, mouseX, mouseY) + 1);
    s *= sl;
    c += s;
    float de = bd * s + .001;
    line(x, y, x + de * cos(c), y + de * sin(c));
  }
}

// A class to describe a single Letter
class Letter {
  char letter;
  // The object knows its original "home" location
  float homex, homey;
  // As well as its current location
  float x, y;
  Letter(float x_, float y_, char letter_) {
    homex = x = x_;
    homey = y = y_;
    letter = letter_;
  }
  // Display the letter
  void display() {
    fill(0);
    textAlign(LEFT);
    text(letter, x, y);
  }
  void home() {
    x = homex;
    y = homey;
  }
  void shake() {
    // use this if() statement to control total shake
    //if(x > homex-10 && x < homex+10 && y > homey-10 && y < homey+10) { 
      x += random(-2, 2);
      y += random(-2, 2);
    }
  }
//}

PFont f;
boolean message1click = false;
boolean message2click = false;
boolean message3click = false;
boolean message4click = false;
boolean message5click = false;
boolean message6click = false;
boolean message7click = false;
boolean message8click = false;
boolean message9click = false;
boolean message10click = false;
boolean message11click = false;
boolean message12click = false;
boolean message13click = false;
boolean message14click = false;
boolean message15click = false;
boolean message16click = false;
boolean message17click = false;
boolean message18click = false;
boolean message19click = false;
boolean message20click = false;
boolean message21click = false;
boolean message22click = false;

String a = "The Visual is Active";
float fa = 20;

String message1 = "inspiration over information";
String message2 =  "initiate experiences";
String message3 = "be  neat  and  be  messy";

String message4 = "abadon control and confinement";
String message5 = "be free, reject convention and advocate ambiguity";

String message6 = "obsession can lead to genius";
String message7 = "be inspired by mistakes and find opportunitues upon rejection";

String message8 = "creativity is limitless";
String message9 = "invent solutions to non-exixtent problems";

String message10 = "thrive on experimentation";
String message11 = "engross and nourish innovation";
String message12 = "emerging and emerged";

String message13 = "designers collaborate";
String message14 = "co-design, with the user, viewer, consumer and client";

String message15 = "immersion in all mediums";
String message16 = "seek hamrony and balance";

String message17 = "be bold, be brave, think big";
String message18 = "don't repeat what you have already done";

String message19 = "embrace hybridity";
String message20 = "layer, blend, be seamless";

String message21 = "Metamorphisis";
String message22 = "change, grow, mutate, evolve.";

Letter[] letters1, letters2, letters3, letters4, letters5, letters6, letters7, letters8, letters9, letters10, letters11, letters12, letters13, letters14, letters15, letters16, letters17, letters18, letters19, letters20, letters21, letters22;

int ne = 5000; // number of cells
float bd = 37; // base line length
float sp = 0.002; // rotation speed step
float sl = .95; // slow down rate


Cell[] all = new Cell[ne];



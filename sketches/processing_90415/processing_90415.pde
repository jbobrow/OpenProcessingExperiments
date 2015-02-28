
/* @pjs font="ComicYo.vlw" */
/* @pjs preload="UpPointUp.jpg", "LeftPointUp.jpg", "RightPointUp.jpg", "DownPointUp.jpg", "UpPointDown.jpg", "LeftPointDown.jpg", "RightPointDown.jpg", 
"DownPointDown.jpg", "LeftPointLeft.jpg", "RightPointLeft.jpg", "UpPointLeft.jpg", "DownPointLeft.jpg", "LeftPointRight.jpg", "RightPointRight.jpg", "UpPointRight.jpg", 
"DownPointRight.jpg", "WinterBackground.jpg" */

PFont font;
PImage img;
int score = 3;
float time = 0;

/*PImage UpUp = loadImage("UpPointUp.jpg");
PImage UpDown = loadImage("UpPointDown.jpg");
PImage UpLeft = loadImage("UpPointLeft.jpg");
PImage UpRight = loadImage("UpPointRight.jpg");

PImage LeftUp = loadImage("LeftPointUp.jpg");
PImage LeftDown = loadImage("LeftPointDown.jpg");
PImage LeftLeft = loadImage("LeftPointLeft.jpg");
PImage LeftRight = loadImage("LeftPointRight.jpg");

PImage RightUp = loadImage("RightPointUp.jpg");
PImage RightDown = loadImage("RightPointDown.jpg");
PImage RightLeft = loadImage("RightPointLeft.jpg");
PImage RightRight = loadImage("RightPointRight.jpg");

PImage DownUp = loadImage("DownPointUp.jpg");
PImage DownDown = loadImage("DownPointDown.jpg");
PImage DownLeft = loadImage("DownPointLeft.jpg");
PImage DownRight = loadImage("DownPointRight.jpg");*/

//int word = 1;
int word = int(random(1, 4));
int arrow = int(random(1, 4));
// 1 = Up
// 2 = Down
// 3 = Left
// 4 = Right

void setup() {
 img = loadImage("WinterBackground.jpg");
 font = loadFont("ComicYo.vlw");
 size(800, 800);
 background(255);
 textFont(font, 48);
 image(img, 0, 0);
 colorMode(HSB, 360, 100, 100, 100);
 textAlign(CENTER, CENTER);
}

void draw() {
 time += 0.0167;
 
 if (score >= 5) {
   fill(0, 0, 0);
   text("YOU'RE EXCELLENT!", width / 2, height / 2);
 }
 else if (score <= 0) {
   fill(0, 0, 0);
   text("YOU'RE TERRIBLE!", width/2, height/2);
 }
 
 if (time > 0.7) {
   background(255);
   image(img, 0, 0);
   word = int(random(1, 5));
   arrow = int(random(1, 5));
   
   if (word == 1 && arrow == 1) {
     //image(UpUp, width/2, 50);
     pointer();
     direction();
   }
   else if (word == 1 && arrow == 2) {
     //image(UpDown, width/2, 750);
     pointer();
     direction();
   }
   else if (word == 1 && arrow == 3) {
     //image(UpLeft, 50, height/2);
     pointer();
     direction();
   }
   else if (word == 1 && arrow == 4) {
     //image(UpRight, 750, height/2);
     pointer();
     direction();
   }
   
   else if (word == 2 && arrow == 1) {
     //image(DownUp, width/2, 50);
     pointer();
     direction();
   }
   else if (word == 2 && arrow == 2) {
     //image(DownDown, width/2, 750);
     pointer();
     direction();
   }
   else if (word == 2 && arrow == 3) {
     //image(DownLeft, 50, height/2);
     pointer();
     direction();
   }
   else if (word == 2 && arrow == 4) {
     //image(DownRight, 750, height/2);
     pointer();
     direction();
   }
   
   else if (word == 3 && arrow == 1) {
     //image(LeftUp, width/2, 50);
     pointer();
     direction();
   }
   else if (word == 3 && arrow == 2) {
     //image(LeftDown, width/2, 750);
     pointer();
     direction();
   }
   else if (word == 3 && arrow == 3) {
     //image(LeftLeft, 50, height/2);
     pointer();
     direction();
   }
   else if (word == 3 && arrow == 4) {
     //image(LeftRight, 750, height/2);
     pointer();
     direction();
   }
   
   else if (word == 4 && arrow == 1) {
     //image(RightUp, width/2, 50);
     pointer();
     direction();
   }
   else if (word == 4 && arrow == 2) {
     //image(RightDown, width/2, 750);
     pointer();
     direction();
   }
   else if (word == 4 && arrow == 3) {
     //image(RightLeft, 50, height/2);
     pointer();
     direction();
   }
   else if (word == 4 && arrow == 4) {
     //image(RightRight, 750, height/2);
     pointer();
     direction();
   }
 
   time = 0;
 }
 
 noStroke();
 fill(0, 0, 100);
 rect(0, 0, 200, 60);
 fill(0, 100, 100);
 text("Power: " + score, 90, 20);
}

void keyPressed() {
  
 if (key == 'w' || key == 'W') {
  if (word == 1) {
   score++;
  }
  else if (word != 1) {
   score = score - 1;
  }
 }
 
 if (key == 'a' || key == 'A') {
   if (word == 3) {
     score++;
   }
   else if (word != 3) {
     score = score - 1;
   }
 }
 
 if (key == 'd' || key == 'D') {
   if (word == 4) {
     score++;
   }
   else if (word != 4) {
     score = score - 1;
   }
 }
 
 if (key == 's' || key == 'S') {
   if (word == 2) {
     score++;
   }
   else if (word != 4) {
     score = score - 1;
   }
 }
 
}

void pointer() {
 fill(0, 100, 100);
 
 if (arrow == 1) {
  triangle(width/2, 50, (width/2)-75, 150, (width/2)+75, 150);
 }
 else if (arrow == 2) {
  triangle(width/2, 750, (width/2)-75, 650, (width/2)+75, 650);
 }
 else if (arrow == 3) {
  triangle(50, height/2, 150, (height/2)-75, 150, (height/2)+75);
 }
 else if (arrow == 4) {
  triangle(750, height/2, 650, (height/2)-75, 650, (height/2)+75);
 }
}

void direction() {
 fill(0, 0, 0);
//Print the word UP on a misleading arrow
 if (word == 1) {
  if (arrow == 1) {
  text("Up", width/2, 100);
  }
  else if (arrow == 2) {
  text("Up", width/2, 700);
  }
  else if (arrow == 3) {
  text("Up", 100, height/2);
  }
  else if (arrow == 4) {
  text("Up", 700, height/2);
  }
 }
//Print the word DOWN on a misleading arrow
 else if (word == 2) {
   if (arrow == 1) {
   text("Down", width/2, 100);
   }
   else if (arrow == 2) {
     text("Down", width/2, 700);
   }
   else if (arrow == 3) {
     text("Down", 100, height/2);
   }
   else if (arrow == 4) {
     text("Down", 700, height/2);
   }
 }
//Print the word LEFT on a misleading arrow
 else if (word == 3) {
  if (arrow == 1) {
    text("Left", width/2, 100);
  }
  else if (arrow == 2) {
    text("Left", width/2, 700);
  }
  else if (arrow == 3) {
    text("Left", 100, height/2);
  }
  else if (arrow == 4) {
    text("Left", 700, height/2);
  }
 }
//Print the word RIGHT on a misleading arrow
 else if (word == 4) {
  if (arrow == 1) {
    text("Right", width/2, 100);
  }
  else if (arrow == 2) {
    text("Right", width/2, 700);
  }
  else if (arrow == 3) {
    text("Right", 100, height/2);
  }
  else if (arrow == 4) {
    text("Right", 700, height/2);
  }
 } 
}



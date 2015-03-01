
 void setup(){
  //setup- runs one time
   
  size(600, 600);
  //the size of the stage is 600x300
   
  smooth();
   
}
 
void draw (){
  
   if (key == 'q' || key == 'Q') {
     groupone();
   }
   if (key == 'w' || key == 'W') {
   grouptwo();
   }
  if (key == 'e' || key == 'E') {
   groupthree();
   }
}
 
 
void groupone (){
  size(640, 360);
noStroke();
background (255);

color inside = color(80, 102, 0);

color outside = color(45, 51, 0);


pushMatrix();
translate(80, 80);
fill(outside);
rect(0, 0, 200, 200);
rect(40, 60, 120, 120);
fill(inside);
rect(60, 90, 80, 80);
popMatrix();

pushMatrix();
translate(360, 80);
fill(inside);
rect(0, 0, 200, 200);
fill(outside);
rect(40, 60, 120, 120);
rect(60, 90, 80, 80);
popMatrix();
  
}

void grouptwo (){
  noStroke();
  // Body
 
  fill(175, 0, 45, 30);
  rectMode(CENTER);
  
  // mouseX is a keyword that the sketch replaces with the horizontal position of the mouse.
  // mouseY is a keyword that the sketch replaces with the vertical position of the mouse.
  rect(mouseX,mouseY,50,50,30);
 rect(mouseX,mouseY,60,60,30);
 rect(mouseX,mouseY,30,30,30); 
  
}

void groupthree (){
  int value = 0;


//PFont =telling processing to use its text rendering
//nasraFont is the variable that name

PFont nasraFont;

//loadFont = load the font that I created in the data file

nasraFont = loadFont ("IowanOldStyle-Italic-48.vlw");


//textFont = current font being used in a sketch
textFont(nasraFont, 50);

fill(255);
//telling processing to use the text in a sketch

text ("'Hello'", 300, 300);




  if (mousePressed) { 
    //PFont =telling processing to use its text rendering
//nasraFont is the variable that name



//loadFont = load the font that I created in the data file

nasraFont = loadFont ("IowanOldStyle-Italic-48.vlw");


//textFont = current font being used in a sketch
textFont(nasraFont);

   
  } else 
   rect(0,0,width, height);
   fill(0);
   nasraFont = loadFont ("IowanOldStyle-Italic-48.vlw");


//textFont = current font being used in a sketch
textFont(nasraFont);


//telling processing to use the text in a sketch
text ("'Hi'", 200, 200);
  }







//Name I-Shan Naomi Lin
//N-Number  N00204421
//Recreation of Kandinsky’s Transverse Line

size(660,420);  // canvas

background(255,234,173);
smooth();
/*********/
noStroke();
fill(255,255,153);  // yellow
triangle(210,10,380,380,540,180);
fill(0,0,102);
ellipse(120,120,60,60);
/*******/
fill(152,102,51); //brown
ellipse(300,235,55,45); //center
beginShape();
  vertex(90,410);
  vertex(30,220);
  vertex(160,150);
  vertex(285,180);
endShape(CLOSE);
fill(255,0,0);
noStroke();
triangle(300,100,310,60,360,105);
//////////////


///********////
fill(255,214,173); //brown
beginShape();
  vertex(40,300);
  vertex(70,200);

  vertex(240,180);
  vertex(160,360);  
endShape(CLOSE);
////////////
//black
fill(0);
ellipse(510,180,240,240);
ellipse(220,120,45,45);
stroke(0);
strokeWeight(4);
line(60,410,540,0);
line(170,75,60,180);
strokeWeight(3);
line(60,80,400,0);
strokeWeight(2);
line(160,160,360,60);
line(240,100, 460,410);
noFill();
arc(420, 260,160,160, PI/2, PI);

noStroke();
fill(220);
ellipse(220,120,45,45);
fill(0);
ellipse(220,120,35,35);
fill(255);
ellipse(220,120,25,25);
fill(0);
ellipse(220,120,15,15);
fill(255,234,173);
ellipseMode(CORNER);
ellipse(510,180,240,240);
noFill();

/////
strokeWeight(6);
stroke(255,153,0);
bezier(55,122,28,125,46,82,105,124);
bezier(105,124,163,166,175,181,197,233);
strokeWeight(2);
bezier(382,372,383,326,420,190,484,150);

strokeWeight(3);
stroke(0);
bezier(482,371,471,441,486,466,536,479);
bezier(536,479,587,491,628,425,624,366);

strokeWeight(6);
stroke(0);
bezier(471.6,514.3,416.8,482.5,402,429.5,430.3,400.3);
bezier(430.3,400.3,443,363.5,501.6,424,536.3,424.6);
bezier(536.3,424.6,580.5,425.5,557.5,391,568.3,360.3);
bezier(568.3,360.3,580.5,326,734.5,332,783,420.3);

/////
fill(0);
PFont font;

// The font must be located in the sketch's 
// "data" directory to load successfully

font = loadFont("Serif-48.vlw"); 
textFont(font, 15); 
text("This is not Wassily Kandinsky", 200, 350);
text("It's frustrating!", 200, 370);


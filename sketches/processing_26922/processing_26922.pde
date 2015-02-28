
// Florence Kelly 
// z3252748
// Due 14/4/2011
// Help me Process my Ideas
// Concept for this project =  A design concept is never easy to come up with.
// I feel taht the only thing that constrains a design is ones mind, memory and the 
// technology that we have on offer. A concept is a very specail thing, filled with
// millions of thoughts and ideas. As designers we think about our ideas everywhere,
// on the bus, in the shower, havong coffee, whilst at work and while thinking about 
// other concepts. Our ideas and thoughts are limitless and never ending. As quickly 
// as we think of an idea it can be goe again in a mater of seconds. So how does our
// mind decide which ideas we will remember and keep and which will we throw away?

// By using processing as a medium to express my concept I needed to make such my code
// gives he user freedom but am also constraining the user from seeing everything.


// Move the mouse around the screen, you can control my thoughts, make a new thought 
// by typing IDEA. I will try to block the thought whihc you are making , clear my 
//thoughts by pressing the space bar.  Try and make a grphic based design with my 
// thoughts. 

// References = sketch_mar18a.pde,Fun program of happy things,Developed and tested by Cameron Johnston 




// float Red,Green,Blue
float R;
float G;
float B;
//Float Balls that fallow mouseX,mouseY
float ball;

void setup()

{
//set up screen and baack ground colour  
size(1000,800);
smooth();
noStroke();
//Colour White
background(255);
frameRate(100);

}
// angle of the moving lines
void draw () {
  float angle = 5;
  //fill with colour white
  fill (255);
// 1st = VL line
for (int y = 0; y <= height; y += 5) { 
  float x = 0 + (cos(angle) * 15.0); 
  rect(x, y, 5, 5); 
  angle += PI/(mouseX/2);

}  
for (int y = 0; y <= height; y += 5) { 
  float x = 100 + (cos(angle) * 2.0); 
  rect(x, y, 5, 5); 
  angle += PI/(mouseX/2);

} 
// 2nd = VL line
for (int y = 0; y <= height; y += 5) { 
  float x = 200 + (cos(angle) * 15.0); 
  rect(x, y, 5, 5); 
  angle += PI/(mouseX/2);
}
for (int y = 0; y <= height; y += 5) { 
  float x = 300 + (cos(angle) * 1.0); 
  rect(x, y, 5, 5); 
  angle += PI/(mouseX/2);

} 
// 3rd = VL line
for (int y = 0; y <= height; y += 5) { 
  float x = 400 + (cos(angle) * 15.0); 
  rect(x, y, 5, 5); 
  angle += PI/(mouseX/2);
}
for (int y = 0; y <= height; y += 5) { 
  float x = 500 + (cos(angle) * 2.0); 
  rect(x, y, 5, 5); 
  angle += PI/(mouseX/2);

} 
// 4th = Vl Line
for (int y = 0; y <= height; y += 5) { 
  float x = 600 + (cos(angle) * 15.0); 
  rect(x, y, 5, 5); 
  angle += PI/(mouseX/2);
}
for (int y = 0; y <= height; y += 5) { 
  float x = 700 + (cos(angle) * 1.0); 
  rect(x, y, 5, 5); 
  angle += PI/(mouseX/2);

} 
// 5th = Vl Line
for (int y = 0; y <= height; y += 5) { 
  float x = 800 + (cos(angle) * 15.0); 
  rect(x, y,5,5); 
  angle += PI/(mouseX/2);
}
for (int y = 0; y <= height; y += 5) { 
  float x = 900 + (cos(angle) * 2.0); 
  rect(x, y, 5, 5); 
  angle += PI/(mouseX/2);

} 
//6th = VL line
for (int y = 0; y <= height; y += 5) { 
  float x = 1000 + (cos(angle) * 15.0); 
  rect(x, y, 5,5); 
  angle += PI/(mouseX/2);
}
// 1st = HL line
for (int x = 0; x <= width; x += 5) { 
  float y = 100 + (sin(angle) * 15.0); 
  rect(x, y, 5,5); 
  angle += PI/(mouseX/2);

}
// 1st = HL line
for (int x = 0; x <= width; x += 5) { 
  float y = 200 + (sin(angle) * 1.0); 
  rect(x, y, 5,5); 
  angle += PI/(mouseX/2);

}
// 2nd - VL
for (int x = 0; x <= width; x += 5) { 
  float y = 300 + (sin(angle) * 15.0); 
  rect(x, y, 5,5); 
  angle += PI/(mouseY/2);

}// 1st = HL line
for (int x = 0; x <= width; x += 5) { 
  float y = 400 + (sin(angle) * 2.0); 
  rect(x, y, 5,5); 
  angle += PI/(mouseX/2);

}
// 3rd = VL
for (int x = 0; x <= width; x += 5) { 
  float y = 500 + (sin(angle) * 15.0); 
  rect(x, y, 5,5); 
  angle += PI/(mouseX/2);
   
}
// 1st = HL line
for (int x = 0; x <= width; x += 5) { 
  float y = 600 + (sin(angle) * 1.0); 
  rect(x, y, 5,5); 
  angle += PI/(mouseX/2);

}
// 4th = Vl
for (int x = 0; x <= width; x += 5) { 
  float y = 700 + (sin(angle) * 15.0); 
  rect(x, y,5,5); 
  angle += PI/(mouseY/2);
 
}

// Make red, green, blue random, make more red, then more blue when mousePressed
  R = random(255);
  G = random(255);
  B = random(255);
  if(mousePressed){
    fill (20,R,G,B); }
    
else {
  fill(211,R,G,B);
}
//hold i then it is red
 if (key == 'i' || key =='I') {
    fill(245,70,70);
}
// hold d then it is blue
 if (key == 'd' || key =='D') {
    fill(R,G,B);
}
// hold e then it is yellow
  if (key == 'e' || key =='E') {
    fill(245,246,142);
}
//hold a then it is green
  if (key == 'a' || key =='A') {
    fill(153,204,51);
}
// press '.' then back to random red
   if (key == '.' || key =='.') {
    fill(0,R,G,B);
}

// balls move and follow mouse and size of ellipse and screen cleared if you press space bar.
ball = dist(pmouseX,pmouseY,mouseX,mouseY);
ellipse((pmouseX + pmouseX) / 2, (pmouseY + pmouseY) / 2, ball, ball);

}
void keyPressed()
{
 
  if(key == ' ') {
  background(255);
  }
 
}


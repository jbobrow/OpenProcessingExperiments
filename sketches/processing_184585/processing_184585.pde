
/*Created by Terry Moore
Art 3001
Contact: terryjuku@yahoo.com
Last Modified: 2.5.15*/

void setup () {
  size (400, 400); //establishing canvas size
}

void draw () {
  rectMode(CENTER);
  rect (200, 200, 100, 100); //establishing rectangle area
 
 //right side pink button 
  if (mouseX>width/2 && mouseX<250 && mouseY>150 && mouseY<250) 
{fill(240, 56, 117);
}

//left side blue button
if (mouseX<width/2 && mouseX>150 && mouseY>150 && mouseY<250) {
fill(56, 191, 240);
}
}

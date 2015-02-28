
void setup() {  //setup function called initially, only once
  size(500, 500);
  background(255);  //set background white
}

void draw() {  //draw function loops 
  fill(255,0,0);
  rect(150, 150, 200, 200, 10);
  fill(0,255,0);
  rect(300, 160, 40, 40);
  fill(0,0,255);
  var t = "Ciao Beppe";
   float twidth = textWidth(t);         // get the width for the text
   text(t, (500-twidth)/2, 500/2);  // place the text centered on the drawing area
}

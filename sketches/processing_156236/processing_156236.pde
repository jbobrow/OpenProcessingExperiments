

void setup() {  //setup function called initially, only once
  size(500, 500);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  
}
void draw() {  //draw function loops
fill(219,162,45);
rect(180, 150, 150, 200);
fill(71,154,206);
triangle (180, 200, 250, 220, 250, 210);
triangle (330, 200, 250, 200, 250, 210);
fill(255,253,253);
triangle (250, 220, 330, 200, 250, 210);
triangle (180, 200, 250, 200, 250, 210);
fill(227,20,20);
triangle (190, 220, 240, 230, 215, 235);
triangle (315, 220, 260, 230, 305, 235);
fill (251 ,244 ,244);
stroke (251, 244, 244)
triangle (190, 275, 250, 300, 215, 310); 
triangle (215, 310, 250, 300, 250, 315);
triangle (190, 335, 250, 315, 215, 310);
triangle (250, 300, 250, 315, 290, 310);
triangle (250, 300, 290, 310, 305, 275);
triangle (250, 315, 290, 310, 305, 335);
fill(231 ,8 ,8);
stroke(23 ,18 ,18);
triangle (190, 225, 215, 240, 215, 250); // eyes
triangle (235, 235, 220, 240, 220, 250);
triangle (310, 250, 260, 235, 305, 240);
triangle (317, 255, 320, 218, 310, 238);
fill(146 ,79 ,43);
triangle (250, 245, 240, 275, 250, 269); // nose
triangle (250, 245, 265, 275, 250, 269);
fill(165,9,43);
triangle (200, 150, 225, 150, 210, 180); // forehead thingy
triangle (280, 150, 300, 150, 290, 180)
 }
  

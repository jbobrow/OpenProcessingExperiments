
//only works in java mode

void setup(){
  size(400,400);
  background(#fff8e6);
  stroke(grey);
  strokeWeight(2);
  strokeJoin(ROUND);
  fill(#981560);
  
int a_x = 198,
    b_x = 218,
    c_x = 228,
    d_x = 248,
    
    a_y = 173,
    b_y = 193,
    c_y = 203,
    d_y = 223;
     
  beginShape();  // Exterior part of shape, go counter-clockwise 
  vertex(223, 142);
  bezierVertex(315, 44, 416, 215, 221, 282);  //1c, 2c, anchor

  vertex(221, 282);
  bezierVertex(1, 208, 157, 35, 223, 142);  //1c, 2c, anchor
  
  beginContour();  // Interior part of shape, go clockwise 
  vertex(b_x,a_y);
  vertex(b_x,b_y);
  vertex(a_x,b_y);
  vertex(a_x,c_y);
  vertex(b_x,c_y);
  vertex(b_x,d_y);
  vertex(c_x,d_y);
  vertex(c_x,c_y);
  vertex(d_x,c_y);
  vertex(d_x,b_y);
  vertex(c_x,b_y);
  vertex(c_x,a_y);
  endContour();
  
  endShape(CLOSE);
}
color black  = #000000,
      white = #ffffff,
      red = #cd364d,
      orange = #FF9217,
      yellow = #fcffb4,
      green = #2eeea3,
      darkGreen = #639f89,
      purple = #b5b2be,
      blue = #5fa6e7,
      pink = #ffd2ff,
      grey= #444444,
      darkGrey = #858585,
      darkGrey2 = #949494;



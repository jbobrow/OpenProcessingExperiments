
void setup(){
  size(599,599);
}

void draw(){
  background(230,227,210);
  noStroke();  
  fill(228,53,36); // Red square & rect
  rect(74,74,300,300);
  rect(565,449,35,150);
  
  fill(237,199,100); //yellow rectangles
  rect(0,444,80,154);
  rect(369,0,207,74);
  rect(370,74,206,150);
  
  fill(0); //black square and rect
  rect(74,374,150,150);
  rect(224,524,150,46);
  
  fill(47,26,157); //blue rect
  rect(374,449,196,121);
  
  stroke(0);
  strokeCap(SQUARE);
  strokeWeight(10);
  
  line(74,74,74,580); //vertical lines, L->R
  line(149,12,149,74);
  line(224,374,224,589);
  line(374,7,374,574);
  line(472,224,472,374);
  line(570,17,570,589);
  
  line(7,74,570,74); //horizontal lines, T->B
  line(15,224,74,224);
  line(374,224,570,224);
  line(74,374,570,374);
  line(10,449,74,449);
  line(224,449,599,449);
  line(74,524,375,524);
  line(224,570,570,570);
  
}



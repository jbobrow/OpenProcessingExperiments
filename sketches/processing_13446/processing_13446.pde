
void setup(){
  size(640,480);
}


void draw(){
  background(255,255,0);
  stroke(0,0,255);
  strokeWeight(5);
  fill(255,0,0); 
  quad(38, 31, 86,20,69,63,30,76);
  quad(138, 131, 186, 120, 169, 163, 130, 176);
  stroke(255,0,0);
  strokeWeight(8);
  fill(0,0,255);
  quad(238, 231, 286, 220, 269, 263, 230, 276);
  quad(338, 331, 386, 320, 369, 363, 330, 376);
  triangle(80,125,108,70,136,125);
  stroke(0,0,255);
  strokeWeight(11);
  fill(255,0,0);
  triangle(180,225,208,170,236,225);
  stroke(0,0,255);
  strokeWeight(14);
  fill(255,0,0);
  triangle(280,325,308,270,336,325);
  rect(330,320,355,355);
  fill(0,0,255);
  
  //println("x: " + mouseX + "y" + mouseY);
  
}


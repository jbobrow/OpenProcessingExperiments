
//Mondrian's Composition C no. III, practice_0925_2
//Mei


void setup() { 
  size(496,537);
  background(214,223,217);
}

void draw() {
//rectangles red,yellow,blue
  noStroke();
  fill(189,43,15);
  rect(0,0,220,220);
  fill(226,187,15);
  rect(0,350,40,187);
  fill(2,30,86);
  rect(220,350,170,170);
//lines  
  stroke(0,14,10);
  strokeWeight(6);
  line(220,0,220,537);
  strokeWeight(10);
  line(0,220,496,220);
  line(0,350,496,350);
  strokeWeight(6);
  line(40,350,40,537);
  line(390,350,390,537);
  line(220,520,390,520);
  
}




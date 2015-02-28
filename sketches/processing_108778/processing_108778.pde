
void setup(){
  size(1280, 1000);
  colorMode(HSB,360,100,100);
  smooth();
  background(203, 40, 93);
println(); 
}


void draw(){
  fill(60, 7, 98);
  ellipse(width/2, height/2, 1280, 1000);
  int i=0;
  while (i<75){
    //strokeWeight(5);
  stroke(0, 99, 99);
  line(0, 100, width, i);
  stroke(309, 99, 99);
  line(0, 300, width, i);
  stroke(276, 99, 99);
  line(0, 500, width, i);
  stroke(267, 99, 99);
  line(0, 700, width, i);
  stroke(244, 99, 99);
  line(0, 900, width, i);
  stroke(210, 99, 99);
  line(0, 1100, width, i);
  stroke(185, 99, 99);
  line(0, 1300, width, i);
  stroke(115, 99, 99);
  line(0, 1500, width, i);
  stroke(61, 99, 99);
  line(0, 1700, width, i);
  stroke(31, 99, 99);
  line(0, 1900, width, i);
  stroke(3, 99, 99);
  line(0,2100, width, i);
  stroke(0, 99, 99);
  i=i+4;
}
}





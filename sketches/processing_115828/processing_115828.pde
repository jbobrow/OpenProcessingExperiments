
// note by 教室最右排 !

void setup(){
size(800,200);
background(255);
smooth();
}
void draw(){
  noFill();
  stroke(2);
  strokeWeight(0.5);
  ellipse(100,100,200,70);
  ellipse(270,105,200,70);
  strokeWeight(3);
  line(140,100,270,100);
  line(270,100,260,95);
  line(270,100,260,105);
  fill(0);
  textSize(20);
  text("Program",50,110);
  text("Process",150,150);
  text("Projects",280,110);
  noFill();
  line(370,105,450,75);
  line(370,105,450,135);
  text("available of art ",455,80);
  text("future ",455,135);
  textSize(11);
  fill(random(0,250),random(0,250),0);
  text("Wen Yu / Chi Ming / Te Pang / Chun Yi / Chen hsin" , 510,190);
  
}



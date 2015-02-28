
//code modeled after http://forum.processing.org/topic/how-do-i-write-a-trig-equation-in-processing

PImage meluke;
float randx1,randy1,randx2,randy2;

void setup() {
  size(600,600);
  
  meluke = loadImage("meluke.jpg");
  
}

void draw() {
 image(meluke,mouseX,mouseY);
  randx1= mouseX;
  randy1= mouseY;
 
  noStroke();
  fill(128,14,170);
  strokeWeight(1);
  stroke(0);
  line(randx1,randy1,randx2,randy2);
  strokeWeight(3);
  stroke(237,26,209);
  line(randx1,randy2,randx2,randy2);
  line(randx1,randy2,randx1,randy1);
  stroke(128,14,170);
  float angle = atan2(randy2-randy1,randx2-randx1);
  line(randx1,randy1,randx1+cos(angle)*90,randy1+sin(angle)*45);
  
  

}



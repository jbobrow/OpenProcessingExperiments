
int lineColor;
int lineSize;

void setup(){
  background(34,65,134);
  size(1000,1000);
  smooth();
  colorMode(HSB, 100);
  lineSize = 1;
}

void draw(){

   if (mousePressed == true) {
    fill(0);
  } else {
    fill(50,50,random(100),.5);
  }
  stroke(lineColor++);
  stroke(random(100), 20, random(100));
  line(mouseX, mouseY, pmouseX, pmouseY);
  rect(random(1000), random(1000), 50, 50);
  
  quad(random(1000),random(300), 300,400,50,50,600,800);
  lights();
  translate(98, 78, 30);
  sphere (28);
  
  if (keyPressed) {
    if (key == 'w' || key =='W') {
      strokeWeight(lineSize++);
    }
    if (key =='s' || key =='S'){
      strokeWeight(lineSize--);
    }
  }
  
}

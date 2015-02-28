
void setup() {
  size (300,331);
  background(255,255,255);
}

void draw() {
  noStroke();
  fill (193,38,32);
  rect (0,0,20,65);
  fill (193,38,32);
  rect (0,140,20,25);
  

  stroke(0);
  strokeWeight (5);  
  line(0,30,290,30);//horizontal
  line(20,95,300,95);
  line(0,165,300,165);
  line(100,315,331,315);
  line(230,250,300,250);
  
  
  
  line(20,0,20,165);//vertical
  line(100,0,100,331);
  line(140,0,140,165);
  line(230,0,230,331);
  line(238,0,238,331);
  line(250,0,250,315);
  line(270,0,270,331);
  line(295,0,295,165);
}



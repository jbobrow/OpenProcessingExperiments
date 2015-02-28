
float a = 0.0;
float inc = TWO_PI/50.0;


void setup(){
 size(800,600);
 background(0);
 smooth(); 
 
  
}


void draw(){
  
   noStroke();
  fill(0, 0, 0, 20);
  rect(0, 0, width, height);
  
 fill(random(127),random(5),0, 127);
  line (width/2, height/2, 50,50);
  
  translate (width/2, height/2); 
  
  stroke(255);
  strokeWeight(random(10));
  fill(random(127), 0, random(127), 20);
  for (int i=0; i<100; i=i+2) {
    
    line(i*tan(a), 50, i*sin(a), 50+tan(a)*2.0);
    a = a + inc;
    rotate (180);
  }
  
  
}


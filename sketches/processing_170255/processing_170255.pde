

float time = 10; 
float r = 200;
float diff =1; 

void setup() {
  size(600, 600);
}

void draw() {
    
  background(255); 
  
  
  
  float x = r * cos(time); 
  float y = r * sin(time); 

  stroke (30, 100, 90);
  fill(255);
  ellipse(width/2+y, height/2+x, 400, 400, 200);
  
  stroke (30, 100, 90);
  ellipse(width/2, height/2, 400, 400, 200); 
  
  ellipse(width/2 +x, height/2, 5, 5);
  stroke (30, 100, 90);
  ellipse(width/2+x, height/2+y, 400, 400, 200);
  
  ellipse(width/2 +x, height/2, 5, 5);
  stroke (30, 100, 90);
  ellipse(width/4+x, height/4+y, 400, 400, 200);
  
  stroke(20); 
  strokeWeight(20);
  line(width/2, height/2, width/2 + x, height/2 +y);
  fill(255);

  stroke(200,201,20, 30); 
  strokeWeight(10);
  line(width/2+x, height/2+y, width/2 + x, height/2);
  ellipse(width/2 +x, height/2, 5, 5);  

  stroke(30, 10, 50); 
  line(width/2+x, height/2+y, width/2, height/2+y);
  ellipse(width/2, height/2+y, 5, 5);  

  ellipse(width/2 +x, height/2, 5, 5);
  stroke (30, 100, 90);
  ellipse(width/3+x, height/1+y, 400, 400, 200);
  
  ellipse(width/2 +x, height/2, 5, 5);
  stroke (30, 100, 90);
  ellipse(width/1+x, height/3+y, 400, 400, 200);
  
  
  
  time += 0.10;
  r = map(sin(time/10), -1, 1, 10, 200);
  println(sin(time));

}

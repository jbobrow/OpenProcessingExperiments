

float x, y; 
float angle = 0;
float r = 200;
float diff =1; 

void setup() {
  size(600, 600);
  background(0);
  smooth();
}

void draw() {
  
  fill(241,243,181);

  float x = r * cos(angle); 
  float y = r * sin(angle); 
  

  stroke(0); 
  strokeWeight(3);
  line(width/2, height/2, width/2 + x, height/2 +y);

  stroke(1); 
  strokeWeight(1);
  line(width/2+x, height/2+y, width/2 + x, height/2);
  ellipse(width/2 +x, height/2, 5, 5);  
  
  stroke(1); 
  strokeWeight(1);
  line(500+x, 400+y, width/2 + x, height/2);
  ellipse(500+x, 400, 5, 5);  
  
  stroke(1); 
  strokeWeight(1);
  line(200+x, 100+y, width/2 + x, height/2);
  ellipse(200+x, 100, 5, 5);  
  
    stroke(1); 
  strokeWeight(1);
  line(350+x, 200+y, width/2 + x, height/2);
  ellipse(350+x, 200, 5, 5);  
  
    stroke(1); 
  strokeWeight(1);
  line(100+x, 100+y, width/2 + x, height/2);
  ellipse(100+x, 100, 5, 5);  
  
    stroke(1); 
  strokeWeight(1);
  line(550+x, 550+y, width/2 + x, height/2);
  ellipse(550+x, 550, 5, 5);  
  
    stroke(1); 
  strokeWeight(1);
  line(10+x, 510+y, width/2 + x, height/2);
  ellipse(10+x, 510, 5, 5);  
  
   stroke(1); 
  strokeWeight(1);
  line(10+x, 30+y, width/2 + x, height/2);
  ellipse(10+x, 30, 5, 5);  
  
  

  
angle = angle +3;
  r = r - diff;
  if ( r == 0 || r == 100) {
    diff =  diff * -1;
  }
  
println(x);


}




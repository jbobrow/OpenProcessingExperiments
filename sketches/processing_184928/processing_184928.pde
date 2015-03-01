
float slow_circle_x = 0;
float fast_circle_x = 0;

void setup(){
size(400,400);
noStroke();
background(#9BCDE8);

}
void draw(){
  
  
  float slow_circle_size = 100;
  
  if(random(10) > 9.95) {
    slow_circle_size = 60;
  }
  stroke(random(256),0,0);
line(200,200, random(400),random(400));

  fill(#FA3F00);
  ellipse(slow_circle_x,50, slow_circle_size, slow_circle_size);
  slow_circle_x = slow_circle_x + 1;
  
   fill(#FA3F00);
  ellipse(slow_circle_x,350, slow_circle_size, slow_circle_size);
  slow_circle_x = slow_circle_x + 1;
  
  fill(#E8F1F5);
  ellipse(fast_circle_x,200, 100, 100);
  fast_circle_x = fast_circle_x + 5;
  
  fill(#DECEC9);
  ellipse(fast_circle_x,100, 50, 50);
  fast_circle_x = fast_circle_x + 5;
  
  fill(#DECEC9);
  ellipse(fast_circle_x,300, 50, 50);
  fast_circle_x = fast_circle_x + 5;
  
 if (slow_circle_x > 400) {slow_circle_x = 0;
 }
    
    if(fast_circle_x > 400) {
    fast_circle_x = 0;
  }
}

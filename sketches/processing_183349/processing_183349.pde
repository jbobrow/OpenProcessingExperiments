
float slow_circle_x = 0;


void setup() {
  size(400,400); 
  noStroke();
  frameRate(8);
  background(#1BB1F5);
}

void draw() {
  
  
  fill(random(255),random(255), random(255));
   ellipse(slow_circle_x,0, random(100), 50);
  slow_circle_x = slow_circle_x + .5;
  fill(random(255),random(255), random(255));
  ellipse(slow_circle_x,50, random(100), 50);
  slow_circle_x = slow_circle_x + .5;
  fill(random(255),random(255), random(255));
  ellipse(slow_circle_x ,100, random(100), 50);
  slow_circle_x = slow_circle_x + .5;
  fill(random(255),random(255), random(255));
  ellipse(slow_circle_x,150, random(100), 50);
  slow_circle_x = slow_circle_x + .5;
    fill(random(255),random(255), random(255));
  ellipse(slow_circle_x ,200, random(100), 50);
  slow_circle_x = slow_circle_x + .5;
  fill(random(255),random(255), random(255));
  ellipse(slow_circle_x,250, random(100), 50);
  slow_circle_x = slow_circle_x + .5;
   fill(random(255),random(255), random(255));
  ellipse(slow_circle_x ,300, random(100), 50);
  slow_circle_x = slow_circle_x + .5;
fill(random(255),random(255), random(255));
  ellipse(slow_circle_x,350, random(100), 50);
  slow_circle_x = slow_circle_x + .5;
  fill(random(255),random(255), random(255));
   ellipse(slow_circle_x,400, random(100), 50);
  slow_circle_x = slow_circle_x + .5;
   fill(random(255),random(255), random(255));
   ellipse(slow_circle_x,0, random(100), 50);
  slow_circle_x = slow_circle_x + .5;
  fill(random(255),random(255), random(255));
  ellipse(slow_circle_x,50, random(100), 50);
  slow_circle_x = slow_circle_x + .5;
  fill(random(255),random(255), random(255));
  ellipse(slow_circle_x ,100, random(100), 50);
  slow_circle_x = slow_circle_x + .5;
  fill(random(255),random(255), random(255));
  ellipse(slow_circle_x,150, random(100), 50);
  slow_circle_x = slow_circle_x + .5;
    fill(random(255),random(255), random(255));
  ellipse(slow_circle_x ,200, random(100), 50);
  slow_circle_x = slow_circle_x + .5;
  fill(random(255),random(255), random(255));
  ellipse(slow_circle_x,250, random(100), 50);
  slow_circle_x = slow_circle_x + .5;
   fill(random(255),random(255), random(255));
  ellipse(slow_circle_x ,300, random(100), 50);
  slow_circle_x = slow_circle_x + .5;
fill(random(255),random(255), random(255));
  ellipse(slow_circle_x,350, random(100), 50);
  slow_circle_x = slow_circle_x + .5;
  fill(random(255),random(255), random(255));
   ellipse(slow_circle_x,400, random(100), 50);
  slow_circle_x = slow_circle_x + .5;
   fill(random(255),random(255), random(255));
   ellipse(slow_circle_x,0, random(100), 50);
  slow_circle_x = slow_circle_x + .5;
  fill(random(255),random(255), random(255));
  ellipse(slow_circle_x,50, random(100), 50);
  slow_circle_x = slow_circle_x + .5;
  fill(random(255),random(255), random(255));
  ellipse(slow_circle_x ,100, random(100), 50);
  slow_circle_x = slow_circle_x + .5;
  fill(random(255),random(255), random(255));
  ellipse(slow_circle_x,150, random(100), 50);
  slow_circle_x = slow_circle_x + .5;
    fill(random(255),random(255), random(255));
  ellipse(slow_circle_x ,200, random(100), 50);
  slow_circle_x = slow_circle_x + .5;
  fill(random(255),random(255), random(255));
  ellipse(slow_circle_x,250, random(100), 50);
  slow_circle_x = slow_circle_x + .5;
   fill(random(255),random(255), random(255));
  ellipse(slow_circle_x ,300, random(100), 50);
  slow_circle_x = slow_circle_x + .5;
fill(random(255),random(255), random(255));
  ellipse(slow_circle_x,350, random(100), 50);
  slow_circle_x = slow_circle_x + .5;
  fill(random(255),random(255), random(255));
   ellipse(slow_circle_x,400, random(100), 50);
  slow_circle_x = slow_circle_x + .5;
   fill(random(255),random(255), random(255));
   ellipse(slow_circle_x,0, random(100), 50);
  slow_circle_x = slow_circle_x + .5;
  fill(random(255),random(255), random(255));
  ellipse(slow_circle_x,50, random(100), 50);
  slow_circle_x = slow_circle_x + .5;
  fill(random(255),random(255), random(255));
  ellipse(slow_circle_x ,100, random(100), 50);
  slow_circle_x = slow_circle_x + .5;
  fill(random(255),random(255), random(255));
  ellipse(slow_circle_x,150, random(100), 50);
  slow_circle_x = slow_circle_x + .5;
    fill(random(255),random(255), random(255));
  ellipse(slow_circle_x ,200, random(100), 50);
  slow_circle_x = slow_circle_x + .5;
  fill(random(255),random(255), random(255));
  ellipse(slow_circle_x,250, random(100), 50);
  slow_circle_x = slow_circle_x + .5;
   fill(random(255),random(255), random(255));
  ellipse(slow_circle_x ,300, random(100), 50);
  slow_circle_x = slow_circle_x + .5;
fill(random(255),random(255), random(255));
  ellipse(slow_circle_x,350, random(100), 50);
  slow_circle_x = slow_circle_x + .5;
  fill(random(255),random(255), random(255));
   ellipse(slow_circle_x,400, random(100), 50);
  slow_circle_x = slow_circle_x + .1;
  

  
  if(slow_circle_x > 400) {
    slow_circle_x = 0;
  }

}





class Evil {
  float x;
  float y;
  float d=40;
  float angle = 0;
  float speed = 0.02;
  float direction =1;
  
Evil (float x_in, float y_in) {
  x = x_in;
  y = y_in;

}

void display () {
  smooth();
  fill(46, 3, 3);
  rectMode(CENTER); //BODY
  rect (x, y, d, d);
  triangle(x-d/2, y-d/2+1, x-d/2.5, y-d/1.5, x-d/4, y-d/2+1); //EARS
  triangle(x+d/2, y-d/2+1, x+d/2.5, y-d/1.5, x+d/4, y-d/2+1);
 
  noFill(); //TAIL
  stroke(46, 3, 3);
  arc(x+d/2, y, d/2, d/2, 0, PI);
  
  
    fill(255); //EYES
    noStroke();
    ellipse (x-d/5, y-d/4.9, d/4, d/4);
    ellipse (x+d/5, y-d/4.9, d/4, d/4);

    fill(0);
    ellipse (x-d/6, y-d/4.5, d/6, d/6);
    ellipse (x+d/6, y-d/4.5, d/6, d/6);
}

void move () {
  angle+=speed;
  x += direction*0.5+ cos(angle)*2;
  y += direction*0.5+ sin(angle)*2;
  if (y<=0||y>=height||x<=0||x>=width) {
    direction = -direction;
  }
}
}


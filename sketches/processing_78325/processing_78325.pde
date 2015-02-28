
//Loneliness

float x, xp;
float y, yp;

float theta;
float t;
float resolve = 255;

void setup() {
  background(0);
  size(500, 500);
}

void draw() {
  fill(0,10);
  noStroke();
  rect(0,0,500,500);


  stroke(255);
  
  sadness(75*t*0.1);
  sadness(75*t*0.01);
  sadness(75);
  sadness(85);
  sadness(95);
  sadness(105);
  
  
   noStroke();
    fill(resolve);
  ellipseMode(CENTER);
  ellipse(250, 250, 120, 120);
  
  resolve = resolve*0.99;
 

}


void sadness(float frusteration){
  
    //theta = random(0,2*PI); 
    theta = 5*PI*noise(t);
  x = sin(theta)*random(55,frusteration);
  y = cos(theta)*random(55,frusteration);
  
   line(250+x, 250+ y,250+xp,250+yp);
  
  xp = x;
  yp = y;
  t += 0.06;
  
}

void mousePressed(){
  background(0);
  resolve = 255;
  t = 0;
}



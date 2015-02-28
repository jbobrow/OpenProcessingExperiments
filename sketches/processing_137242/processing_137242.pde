
int position = 0;
int x = -50;
int start_time = 0;

void setup() {
  size(600,600);
  smooth();
  stroke(50,50,150);
  frameRate(30);
}

void draw() {
fill(random(0, 255), random(0, 255), random(0, 255) );
  background(255);
  
  x = x + 6;
   if (x >= 650) {
   x = -50;
   }

  ellipse(x,300,100,100);  
  ellipse(position,100,150,150); 
  ellipse(position,435,50,50); 
  ellipse(x,520,10,10); 


  if ( millis() > 1000 + start_time && millis() < 2000 + start_time ) {
    position = position + 1;  
  }

if ( millis() > 2000 + start_time ) {
    start_time = millis();
  }

}



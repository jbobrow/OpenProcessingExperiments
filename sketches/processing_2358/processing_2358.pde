
// Stylish Clock
// Claudio Gonzales, December 2012
// Albuquerque, New Mexico

int dim = 500;
int ticks = 0;

// get initial data
int initial_time = hour()%12 * 3600 + minute() * 60 + second();
int initial_displacement = 150;
float adjusted_time;
float decay_rate = 0.05;

// clock dimensions
float radius = dim/3.0;
float s_hand = dim/3.25;
float m_hand = dim/3.50;
float h_hand = dim/4.25;

// time variables
float s;
float m;
float h;

// scaled time variables
float as = s/60.0;
float am = m/60.0 + as/60.0;
float ah = h/12.0 + am/60.0;
 
void setup() {
    
  // size(dim,dim,P3D);

  size(500,500,P3D); // for HTML data
  background(50);
  frameRate(30);
  smooth();

}
 
void draw() {
    
  // calculates time based on framerate
  adjusted_time = initial_time + ticks/30.0;
  
  // clock winds into position exponentially
  adjusted_time -= initial_displacement * exp( -decay_rate * ticks ); 
  
  s = adjusted_time % 60;
  m = adjusted_time % 3600 / 60.0;
  h = adjusted_time / 3600.0;
  
  as = s/60.0;
  am = m/60.0;
  ah = h/12.0;
  
  //draw the clock
  
  strokeWeight(10);
  stroke(0);
  fill(170,170,250);
  ellipse(width/2, height/2, radius * 2.2, radius * 2.2);

  strokeWeight(3);
  stroke(50);
  fill(190,190,250);
  ellipse(width/2, height/2, radius * 2, radius * 2);
  stroke(150);
  fill(150);
  ellipse(width/2, height/2, 10, 10);
  
  // render the markings on the clock face

  stroke(100);
  RenderTicks(60,2,width/2,height/2,radius*9.0/10.0);
  RenderTicks(12,4,width/2,height/2,radius);
 
  //draw the second hand

  strokeWeight(2);
  stroke(255,0,0);
  line(width/2, height/2, width/2 + s_hand*sin(TWO_PI*as), height/2 - s_hand*cos(TWO_PI*as) ); 
   
  //draw the minute hand

  strokeWeight(3);
  stroke(0,0,0);
  line(width/2, height/2, width/2 + m_hand*sin(TWO_PI*am), height/2 - m_hand*cos(TWO_PI*am) ); 
   
  //draw the hour hand

  strokeWeight(4);
  stroke(0,0,0);
  line(width/2, height/2, width/2 + h_hand*sin(TWO_PI*ah), height/2 - h_hand*cos(TWO_PI*ah) ); 
  
  ticks++;

} 

void RenderTicks(int numberofticks, int weight, float x, float y, float R) {
  float c;
  int j;
   
  strokeWeight(weight);
  for(j = 0; j <= numberofticks; j++) {
    c = TWO_PI * float(j)/float(numberofticks);
    line( x + cos(c)*(R - weight*1.5), y + sin(c)*(R - weight*1.5), x + cos(c)*(R + weight*1.5), y + sin(c)*(R + weight*1.5) );
  }
}



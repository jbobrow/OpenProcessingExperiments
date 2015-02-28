
int my_width = 600; //screen width
int my_height = 400; //screen height

float radius = my_width/2 ; //dynamic radius, standard:(width/2)
int cenX = my_width/2 ;
int cenY = my_height/2; 

float offset_step=0.1;// step to change color range
int turn = 0; //change position of rainbow

void setup() { 
  size(800,400,P3D);  
  background(20); 
  colorMode(HSB,360); 
  strokeWeight(30); 
  noFill();
  frameRate(60);


} 
 
void draw() {
// clear screen
  fill(20,20);
  noStroke();
  translate(0,0);
  rect(0,0,width+1,height+1);

  translate(width/2,height/2,0);  
//rotate screen  
  rotateX(float(frameCount%800)/800*TWO_PI);
  rotateY(float(frameCount%800)/800*TWO_PI);


//draw screen
//just a hole build with X bezier lines
// d can maximal be 360, it is then a hole 

  for (int d = 0; d < 150; d+=5) { 
    float r = radians(d - turn); // 360->2PI, 180->PI
    stroke(round(d+sin(((turn*offset_step)%180)/360.0*TWO_PI)*50-30),300,360,30);
    noFill();
    bezier(
    cenX,cenY,cenX,
    radius / 2 * cos(r), radius / 2 * sin(r) , cenX*2/3,
    radius * cos(r + HALF_PI), radius * sin(r + HALF_PI), cenX*1/3,
    radius * cos(r + PI), radius * sin(r + PI), 0
    );


  } 
  
  turn++; 
} 




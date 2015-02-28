


int paris = 600;
int berlin = 0;
int london = 400;


void setup()
{
size(600,600);
background(255);


  
}

void draw(){
  smooth();
  stroke(255,140,86,70);
  strokeWeight(5);
  line(600, berlin, berlin,600);
  stroke(121,188,255,70);
  line(600,berlin,berlin,london);
  line(600,paris,london,berlin);
  stroke(232,148,198,70);
  line(berlin,0,600,london);
  //line(berlin,london,paris,600);
  //line(berlin,paris,london,600);
  
  paris = paris + 20;
  berlin = berlin + 9;
  london = london * 2;
  
 
}


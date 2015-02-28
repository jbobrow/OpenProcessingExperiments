
int paris = 0;
int berlin = 560;
float london = 100;
int rome = 20;
int moscow = 40;
float venice = random(100);
void setup(){
  size(600,600);
  background(0);
  
}

void draw() {
  
  smooth();
  strokeWeight(2);
  stroke(46,rome,232,100);
  rome = rome + 10;
  if(rome > 255)
{ rome = 1;}
  fill(46,rome,232,random(10));
  //line(paris,paris,london,london);
  //line(london,london,paris,berlin);
  //line(berlin,paris,london,london);
  //(london,london,600,paris);
  //(london,london,paris,600);
  //(paris,berlin,london,london);
 rotate(PI/random(90));
 rect(random(500),random(500),london,london);
 
 //(london,london,london,berlin);
  //(london,london,berlin,berlin);
  //(moscow,moscow,berlin,berlin);
  stroke(195,57,255);

  
  moscow = moscow + 2;  
  paris = paris + 5^2;
  berlin = berlin - 40;
  london = london + 10;
  
  while(paris > 200){
    berlin = berlin + 70;
    london = london - 100;
}
}


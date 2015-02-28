
int paris = 0;
int berlin = 560;
float london = 100;
int a = 20;
int moscow = 40;
float venice = random(100);
void setup(){
  size(600,600);
  background(0);
  
}

void draw() {
  
  smooth();
  strokeWeight(2);
  stroke(a,129,255,100);
  a = a + 6;
  if(a > 255)
{ a = 1;}
  
  //line(paris,paris,london,london);
  line(london,london,paris,berlin);
  line(berlin,paris,london,london);
  line(paris,berlin,london,london);
  line(berlin,berlin,london,london);
  line(london,moscow,moscow,london);
  noFill();
  ellipse(moscow,moscow,berlin,berlin);
  stroke(195,57,255);

  moscow = moscow + 90;  
  paris = paris + 5^2;
  berlin = berlin - 10;
  london = london + 50;
  
  while(paris > 75){
    berlin = berlin + 70;
    london = london - 100;
}
}


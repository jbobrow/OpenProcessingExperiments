
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
  //line(paris,berlin,london,london);
  //line(berlin,berlin,london,london);
  noFill();
  //ellipse(moscow,moscow,berlin,berlin);
  stroke(195,57,255);

  moscow = moscow + 20;  
  paris = paris + 5^2;
  berlin = berlin - 40;
  london = london + 30;
  
  while(paris > 100){
    berlin = berlin + 70;
    london = london - 100;
}
}


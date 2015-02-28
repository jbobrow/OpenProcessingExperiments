
int timer;
void setup() {
  timer=millis();
  size(800,700);
  background(0,150,200);
}
void draw(){
  if(millis()-timer>3*1000){
    background(random(255),random(255),random(255));
    timer=millis();}
  
  strokeWeight(1);
  stroke(255,255,255);
  fill(random(58,50),random(221,50),random(210,50),255);
  rect(500,500,300*sin(millis()/300.0),700*sin(millis()/700.0));
  fill(random(200,120),random(200,190),random(178,90),210);
  ellipse(200,200,600*sin(millis()/200.0),700*sin(millis()/700.0));
  fill(random(155,220),random(200,190),random(178,90),210);
  rect(450,650,400*sin(millis()/400.0),500*sin(millis()/300.0));
  fill(random(120,150),random(200,120),random(44,199),200);
  ellipse(mouseX,mouseY,400*sin(millis()/200.0),400*sin(millis()/700.0));
}
  




float x=1;
void setup(){
  size(600,600);
  colorMode(HSB);
}
void draw(){
  background(146,200,250);
  translate(300,300);
  
  strokeWeight(10);
  fill(80,200,100);
  rect(-x/2,0,x,300);
  fill(32,250,150);
  ellipse(0,0,2*x+30,2*x+30);
  rotate(PI);
  strokeWeight(1);
  noStroke();
  for (float t=1; t<250; t++){
    fill(t,240,240);
  rotate(137.5*PI/180);
  //ellipse(t,0,2*sqrt(t),2*sqrt(t));
  //triangle(t,t/20+5,t,-t/20-5,t/1.2,0);
  if(t-250+x > 0){
  ellipse(abs(t-250+x),0,2*sqrt((t-250+x)),2*sqrt((t-250+x)));
  triangle((t+x-250),(t+x-250)/20+5,(t+x-250),-(t+x-250)/20-5,(t+x-250)/1.2,0);
  }
  }
  stroke(0);
  for(int i = 0; i < 55; i++){
    rotate(34*TWO_PI/55);
    fill(32,250,250);
    ellipse(2*x+10,0,2*x,x/2);
  }
  x+=.1;
  if(x>250){
    x-=5;
  }
  if(mousePressed){
    x=mouseX;
  }
}

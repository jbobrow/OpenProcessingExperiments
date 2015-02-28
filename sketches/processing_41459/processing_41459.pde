
void setup(){
  size(700,400);
  background(255);
  stroke(0);
  line(350,180,350,220);
  line(330,200,370,200);
  noFill();
  
  ellipse(350,200,40,40);
}


float radius = 10;

void draw(){
  fill(255,50);
  noStroke();
  rect(0,0,700,400);

  translate(350,200);
  fill(255,127,0);
  ellipse(0,0,10,10);
if (mousePressed == true){

  noFill();
  stroke(0);
  ellipse(0,0,radius,radius);
  radius++;}
  if (mousePressed == false){radius = 10;}

}


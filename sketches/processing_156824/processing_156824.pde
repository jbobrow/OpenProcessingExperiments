
PFont Helvetica18;

void setup(){
  size(500,500);
  background(255);

}

void draw(){
  //y=sinx
 
  float time = millis()*0.001;
  float sine = sin(time);
   
  fill(240);
  noStroke();
  ellipse(250,250,210,210);
  if(dist(250,250,mouseX,mouseY) <=100) {
//tan(angle)=y/x
//angle=arctan(y/x)
//float angle = atan2(mouseY-height/2 mouseX-width/2);
float angle = atan2(mouseY-height/2, mouseX-width/2);
translate(width/2, height/2);
rectMode(CENTER);
rotate(sine*5);
//rotate(angle);
fill(random(0), random(255), random(255));
rect(0,0,10,200);
}
}



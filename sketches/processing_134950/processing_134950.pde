

void setup(){
 size(500,500);
 background(35);
   fill(69,196,206);
  rect(220,166,60,160);
 fill(155,240,39);
  stroke(155,240,39);
  ellipse(252,367,150,150);
}
void draw(){

  stroke(255);
  fill(0);
  line(221,166,181,111);
  stroke(255);
  line(282,166,320,111);
   fill(random(144),random(40),random(219),random(55));
  ellipse(213,365,35,75);
  fill(random(144),random(40),random(219),random(55));
  ellipse(293,365,35,75);
    println("posX="+mouseX,"posY="+mouseY);
}

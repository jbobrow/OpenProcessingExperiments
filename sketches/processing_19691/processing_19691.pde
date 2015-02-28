
float angle=0.0;
void setup(){
  size (250,250);
  background(170,191,219);
  noStroke();
  smooth();
  fill(219,215,170);
  ellipse (125,125,10,10);
  //middle circle
}

void draw (){
  fill(255);
 ellipse(0,0,width,height);
  ellipse(250,250,250,250);//white circle
  fill(76,110,157);
  angle=angle+0.02;
  translate (125,125);
  rotate (angle);
  rect(-60,-60,15,15);
   rect(-30,-30,5,5);
    rect(-40,-40,2,2);
      rect(-80,-80,5,5);
       rect(-70,-70,2,2);
       //rotating squares
    
}


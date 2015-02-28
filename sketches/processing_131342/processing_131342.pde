
 int x= 0;
void setup(){
  size(600,600);
}
void draw(){
 background(230);
 translate(300,300);
 noStroke();
 fill(255,100);
 ellipse(0,0,500,500);
 fill(255,120);
 ellipse(0,0,80,80);
 ellipse(0,0,30,30);
 rotate(x*(TWO_PI/360));
 stroke(1,100);
 strokeCap(ROUND);
 strokeWeight(3);
 line(0,0,150,150);
 x=x+1;
}


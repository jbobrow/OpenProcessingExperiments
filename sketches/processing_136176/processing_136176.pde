
void setup(){
  size( 600, 600);
  noStroke();
  fill(3, 3, 28);
  rect(0, 0, 600, 600);
  fill(223, 159, 62);
  ellipse( 0, 220, 50, 150);
  ellipse( 600, 220, 50, 150);
}

void draw(){
  fill(62, random(30, 62), random(180, 255));
  float time = radians(millis()/33);
  float start = radians(315);
  float end = radians(35);
  float back =((start - time)-9.7);
  float forth = (start + time);
  translate(300, 500);
  if (forth < 7 ){
    rotate(forth);
  }
    if (forth > 7){
    rotate(back);
    forth = forth - 1;
    }
    if (back < -7){
      rotate(forth);
    }
  quad( -50, -400, 0, -450, 50, -400, 0, -350);
  
  //println(back);

}


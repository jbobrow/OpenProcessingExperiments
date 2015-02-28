
void fly(float x, float y, float bodyW, float bodyL){
  noStroke();
  
  fill(180, random(100, 200));
  ellipse(x+random(2,8), y-random(1,5), random(2,8), random(1,5));

  
  fill(50);
  ellipse(x, y, bodyW, bodyL);
  
  fill(180, random(100, 200));
  ellipse(x+random(2,8), y-random(1,5), random(2,8), random(1,5));

}


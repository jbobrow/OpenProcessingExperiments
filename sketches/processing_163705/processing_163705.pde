

void setup(){
  size(500,500);
  background(20);
  translate(width/2.225,height/2);
  rotate(-HALF_PI);

//  recurse(HALF_PI/6,0);
   recurse(1,0);
}

void recurse(float angle, int limit){
  if(limit<13){
    pushMatrix();
    stroke(limit*7,120,100,8);
    line(0,0,350,0);
    translate(10,15);
    rotate(angle);
    recurse(angle+random(1)*0.2, limit+1);
    recurse(angle-random(1)*0.1, limit+1);
    popMatrix();
   } 
}



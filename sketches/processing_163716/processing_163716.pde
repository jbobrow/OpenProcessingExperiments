

void setup(){
  size(500,500);
  background(20);
  translate(width/2.225,height/2);
  rotate(-HALF_PI);

//  recurse(HALF_PI/6,0);
   recurse(4.2,0);
}

void recurse(float angle, int limit){
  if(limit<10){
    pushMatrix();
    stroke(limit*4,90,150,40);
    line(0,0,450,0);
    stroke(160,limit*4,150,40);
    line(3,3,450,3);
    stroke(160,200,limit*4,40);
    line(5,5,450,5);
    translate(10,15);
    rotate(angle);
    recurse(angle+random(1)*0.2, limit+1);
    recurse(angle-random(1)*0.1, limit+1);
    popMatrix();
   } 
}



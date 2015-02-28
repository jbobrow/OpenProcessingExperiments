


void pattern(float x,float y){
  for(x = cos(300); x<=width; x=x+20){
    for(y = sin(150); y<=height; y=y+20){
  fill(222  ,random(150,200),141);
  noStroke();
  //pushMatrix();
  rotate(PI);
      ellipse(x+random(10), y+random(10), x+random(10),x+random(10));
      fill(30,random(100),random(100));
      quad(x*2,y, y*2, x, x+y, x-y, x*y, x/y);
      //popMatrix();
       image(pulp,0,0);
    }
  }
}


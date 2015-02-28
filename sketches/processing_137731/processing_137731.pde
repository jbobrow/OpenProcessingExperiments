
float px, py, px2, py2;
float angle, angle2;
float radius = 50;
float frequency = 2;
float frequency2 = 2;
float x, x2;



void setup(){
  size(500, 200);
  background (71,71,71);

}

void draw(){
  fill(0, 8);
  rect(0,0,width, height);
  noStroke();
  py = 100+sin(radians(angle))*(radius);
  fill(0);
  angle2 = 0;
  for (int i = 0; i< width; i++){
      py2 =sin(radians(angle2))*(radius);
    point(width+radius+i, py2);
    }

  
  noStroke();
  fill(random(155),random(100),random(105));
  ellipse(width/radius+x, py, 20, 20);
  angle -= frequency;
  x+=1;

 
  if (x>= width-60) {
    x = 10;
    angle = 0;
  }
}


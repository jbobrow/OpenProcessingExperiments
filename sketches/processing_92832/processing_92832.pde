
//Mel Touw (13.03.13)

size(700,700);
background(40);
noFill();
stroke(255);

float offset = 50.0;
float scaleVal = 35.0;
float angleInc = PI/28.0;
float angle = 0.0;

for(int x = 0; x <= width; x += 5) {
  float y = offset + (sin(angle) * scaleVal);
  arc(350,350,x,y*9,HALF_PI,TWO_PI*2);
  angle += angleInc;   
}




size(455,400);
//noStroke();
//fill(0);
//float angle = 0.0;
//for (int x = 0; x <= width;x += 5) {
//  float y = 50 + (sin(angle) * 35.0);
//  rect(x,y,2,4);
//  angle += PI/40.0;
//}


//for (float angle = 0; angle < TWO_PI; angle += PI/24.0) {
//  println((sin(angle)+1)/2);
//}

background(50);
float offset = 200.0;
float scaleVal = 130.0;
float angleInc = PI/30.0;
float angle = 0.0;
noStroke();

beginShape (TRIANGLE_STRIP);

for (int x = 4; x <= width+5; x += 3) {
  float y = sin(angle) * scaleVal;
  if(( x % 2) == 0) {
    fill(75,240,240,70);
    vertex(x, offset + y);
  } else {
    fill(240,200);
    vertex(x, offset - y);
  }
  angle += angleInc;
}
endShape();

beginShape (TRIANGLE_STRIP);

for (int x = 4; x <= width+5; x += 3) {
  float y = cos(angle) * scaleVal;
  if(( x % 2) == 0) {
    fill(75,240,240,30);
    vertex(x, offset + y);
  } else {
    fill(240);
    vertex(x, offset - y);
  }
  angle += angleInc;
}
endShape();

beginShape (TRIANGLE_STRIP);

for (int x = 4; x <= width+5; x += 3) {
  float y = sin(angle) * scaleVal;
  if(( x % 2) == 0) {
    fill(75,240,240,100);
    vertex(x, offset + y);
  } else {
    fill(0,100);
    vertex(x, offset - y);
  }
  angle += angleInc;
  offset = 300;
}
endShape();

beginShape (TRIANGLE_STRIP);

for (int x = 4; x <= width+5; x += 3) {
  float y = cos(angle) * scaleVal;
  if(( x % 2) == 0) {
    fill(75,240,240,100);
    vertex(x, offset + y);
  } else {
    fill(240,100);
    vertex(x, offset - y);
  }
  angle += angleInc;
  offset = 300;
}
endShape();

beginShape (TRIANGLE_STRIP);

for (int x = 4; x <= width+5; x += 3) {
  float y = sin(angle) * scaleVal;
  if(( x % 2) == 0) {
    fill(75,240,240,100);
    vertex(x, offset + y);
  } else {
    fill(0,100);
    vertex(x, offset - y);
  }
  angle += angleInc;
  offset = 100;
}
endShape();

beginShape (TRIANGLE_STRIP);

for (int x = 4; x <= width+5; x += 3) {
  float y = cos(angle) * scaleVal;
  if(( x % 2) == 0) {
    fill(75,240,240,100);
    vertex(x, offset + y);
  } else {
    fill(240,100);
    vertex(x, offset - y);
  }
  angle += angleInc;
  offset = 100;
}
endShape();




float radius = 100;
float angle = 0;
color pastelColor;



void setup() {
  size(500, 500);
  background(0);
  noFill();
}

void draw() {
  smooth();
  translate(width/2, height/2);
  rotate(radius);
   int pastel = int(random(5));
  if (pastel == 0) { pastelColor = color (146,240,128); //green
  } else if (pastel == 1) { pastelColor = color (176,128,240); //purple
  } else if (pastel == 2) { pastelColor = color (225,238,136); //yellow
  } else if (pastel == 3) { pastelColor = color (234,128,240); //red
  } else if (pastel == 4) { pastelColor = color (128,146,240); //blue
  }
  stroke (pastelColor);
  arc(80, 50, 200, 200, HALF_PI*radius, PI*radius);
  arc(50, 30, 300, 100, PI+QUARTER_PI*radius, TWO_PI*radius);

  if (angle>300) {  
    noLoop();
  } 
  else {
    radius=radius+10;
    angle++;
  }
}

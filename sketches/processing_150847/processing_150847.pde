
int distanceUntilDraw = 200;

PShape sine;
float sineX = distanceUntilDraw;
float sineY = height/2;

void setup() {
	size(800,400, P2D);
	smooth();
	background(#FFFFFF);

	sine = createShape();
}

void draw() {
	background(#FFFFFF);
	translate(200, height/2);
	
	stroke(#AAAAAA);
	strokeWeight(4);
	noFill();
	ellipse(0, 0, 200, 200);

	float x = 100*cos(radians(frameCount));
	float y = 100*sin(radians(frameCount));

	stroke(#3A9977, 90);
	strokeWeight(1);
	fill(#3AAA77, 20);
	arc(0,0,50,50,0,radians(frameCount%360));

	stroke(#333333);
	strokeWeight(1);
	line(0,0,x,y);
	fill(#FF3366);
	ellipse(x, y, 8, 8);

	stroke(#333333);
	strokeWeight(1);
	line(x,y,distanceUntilDraw,y);

	fill(#FF3366);
	ellipse(distanceUntilDraw, y, 8, 8);

  sineX += 1;
  sineY = y;

	noFill();
  stroke(0);
  strokeWeight(3);

	sine = addVertexToPShape(sine, sineX, sineY);

	shape(sine);
}

PShape addVertexToPShape(PShape s, float x, float y) {
	PShape sCopy = createShape();
	sCopy.beginShape();
		sCopy.vertex(distanceUntilDraw, y);
    int sVertexCount = s.getVertexCount();
    for (int i = 0; i < sVertexCount; ++i) {
      if(i > 400) break;
      sCopy.vertex(distanceUntilDraw+1+i, s.getVertex(i).y);
    }
	sCopy.endShape();

	return sCopy;
}



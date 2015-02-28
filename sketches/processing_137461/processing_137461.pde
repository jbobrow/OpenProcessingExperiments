
float x = 50;
float y2 = 50;

void setup(){
size(600, 600);
}

void draw(){
  fill(255);
  rect(0, 0, 600, 600);
  noStroke();
  fill(90, 190, 200, 150);
x = width/2 + 150 * sin( float(frameCount)/80 );
y2 = height/2 + 150 * cos( float(frameCount)/80 );

ellipse( x, y2, 100, 100);

;
x = width/2 + 250 * sin( float(frameCount)/50 );
y2 = height/2 + 250 * cos( float(frameCount)/50 );

ellipse( x, y2, 100, 100);

x = width/2 + 50 * sin( float(frameCount)/30 );
y2 = height/2 + 50 * cos( float(frameCount)/30 );

ellipse( x, y2, 100, 100);


fill(254, 255, 15);
x = width/2 + 50 * cos( float(frameCount)/80 );
y2 = height/2 + 50 * sin( float(frameCount)/80 );

ellipse( x, y2, 10, 10);

x = width/2 + 150 * cos( float(frameCount)/50 );
y2 = height/2 + 150 * sin( float(frameCount)/50 );

ellipse( x, y2, 10, 10);

x = width/2 + 250 * cos( float(frameCount)/50 );
y2 = height/2 + 250 * sin( float(frameCount)/50 );

ellipse( x, y2, 10, 10);

save("stuffhappening.tif");
}



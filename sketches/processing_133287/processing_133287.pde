
size(800, 400);
background(#3EEACC);

int resolution= 200; // number of points we would like in our resolution
float radius = 100; // have to multitply the size of the circle because we are using unit circle
float circleX = width*0.5;
float circleY = height*0.5;

beginShape(); //big shape at back
fill(#FFA805);
stroke(#FF9900);

for( int i=0; i<resolution; i=i+1){
float angle = map(i, 0, resolution, 0, TWO_PI); // two Pi is equal to a full circle
float circleOffX = cos(angle) *(radius*1.9);  // always use cos to calculate x angle
float circleOffY = sin(angle) *(radius*1.9);
float x= circleX + circleOffX +random( -7,7); // circleX - centre of the shape, circleOffX shape edges, values in which it could move
float y= circleY + circleOffY +random( -7,7);
vertex(x,y);

}
endShape(CLOSE);

beginShape(); //smaller shape at back
fill(#FA03FF,90 );
stroke(#ffffff);

for( int i=0; i<resolution; i=i+1){
float angle = map(i, 0, resolution, 0, TWO_PI); // two Pi is equal to a full circle
float circleOffX = cos(angle) *(radius*1.2);  // always use cos to calculate x angle
float circleOffY = sin(angle) *(radius*1.2);
float x= circleX + circleOffX +random( -4,4); // circleX - centre of the shape, circleOffX shape edges, values in which it could move
float y= circleY + circleOffY +random( -4,4);
vertex(x,y);

}

endShape(CLOSE);

beginShape(); //smaller shape at back
fill(#FAFADE);
stroke(#ffffff);

for( int i=0; i<resolution; i=i+1){
float angle = map(i, 0, resolution, 0, TWO_PI); // two Pi is equal to a full circle
float circleOffX = cos(angle) *radius;  // always use cos to calculate x angle
float circleOffY = sin(angle) *radius;
float x= circleX + circleOffX +random( -4,4); // circleX - centre of the shape, circleOffX shape edges, values in which it could move
float y= circleY + circleOffY +random( -4,4);
vertex(x,y);

}

endShape(CLOSE);

beginShape();
fill(#08CBC0);
stroke(#FFF303);
for ( int i=0; i<resolution; i=i+1) {

  float waveAngle = map(i, 0, resolution, 0, TWO_PI*13); // amount of resoltion 5- number of waves i want. 
  float waveOffset = sin(waveAngle) * 80; // 10 - have to scale it up as the value returned by the computer will be in the range of 1 pixel

  float angle = map(i, 0, resolution, 0, TWO_PI); //calculating angle-  two Pi is equal to a full circle
  float circleOffX = cos(angle) *(radius + waveOffset);  // always use cos to calculate x angle
  float circleOffY = sin(angle) *(radius + waveOffset);

  float x= circleX + circleOffX; // circleX - centre of the shape, circleOffX shape edges, values in which it could move
  float y= circleY + circleOffY;

  vertex(x, y);
}
endShape(CLOSE);

beginShape();
for ( int i=0; i<resolution; i=i+1) {

  float waveAngle = map(i, 0, resolution, 0, TWO_PI*13); // amount of resoltion 5- number of waves i want. 
  float waveOffset = sin(waveAngle) * 80; // 10 - have to scale it up as the value returned by the computer will be in the range of 1 pixel

  float angle = map(i, 0, resolution, 0, TWO_PI); //calculating angle-  two Pi is equal to a full circle
  float circleOffX = cos(angle) *(radius + waveOffset);  // always use cos to calculate x angle
  float circleOffY = sin(angle) *(radius + waveOffset);

  float x= circleX + circleOffX; // circleX - centre of the shape, circleOffX shape edges, values in which it could move
  float y= circleY + circleOffY;

  vertex(x, y);
}
endShape(CLOSE);

radius = 70;
fill(#08FAF8);
stroke(#ffffff);
beginShape();
for ( int i=0; i<resolution; i=i+1) {

  float waveAngle = map(i, 0, resolution, 0, TWO_PI*25); // amount of resoltion 5- number of waves i want. 
  float waveOffset = sin(waveAngle) * 70; // 10 - have to scale it up as the value returned by the computer will be in the range of 1 pixel

  float angle = map(i, 0, resolution, 0, TWO_PI); //calculating angle-  two Pi is equal to a full circle
  float circleOffX = cos(angle) *(radius + waveOffset);  // always use cos to calculate x angle
  float circleOffY = sin(angle) *(radius + waveOffset);

  float x= circleX + circleOffX; // circleX - centre of the shape, circleOffX shape edges, values in which it could move
  float y= circleY + circleOffY;

  vertex(x, y);
}
endShape(CLOSE);

radius = 30;
fill(#FF03EF);
stroke(#ffffff);
beginShape();
for ( int i=0; i<resolution; i=i+1) {

  float waveAngle = map(i, 0, resolution, 0, TWO_PI*16); // amount of resoltion 5- number of waves i want. 
  float waveOffset = sin(waveAngle) * 40; // 10 - have to scale it up as the value returned by the computer will be in the range of 1 pixel

  float angle = map(i, 0, resolution, 0, TWO_PI); //calculating angle-  two Pi is equal to a full circle
  float circleOffX = cos(angle) *(radius + waveOffset);  // always use cos to calculate x angle
  float circleOffY = sin(angle) *(radius + waveOffset);

  float x= circleX + circleOffX; // circleX - centre of the shape, circleOffX shape edges, values in which it could move
  float y= circleY + circleOffY;

  vertex(x, y);
}
endShape(CLOSE);






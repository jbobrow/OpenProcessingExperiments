
//draw circles in a circle
size(800,800);
//number of circles
int resolution = 256;
float radius = 300;
float circleX = width * 0.5;
float circleY = height * 0.5;
background(#DCF5F4);
stroke(#B2A2B4);
strokeWeight(2);

beginShape();
for (int i=0; i<resolution; i=i+1) {
  // radian: 0 to 2pi = 0 to 360
  
  //#of waves:5
  float waveAngle = map(i, 0, resolution, 0, TWO_PI*20);
  // 30 px
  float waveOffset = sin(waveAngle) * 10;
  
  float angle = map (i, 0, resolution, 0, TWO_PI );
  //find point on circumference
  //wave: waveoffset is calculated and +/- to radius
  float circleOffX = cos(angle) * (radius + waveOffset);
  float circleOffY = sin(angle) * (radius + waveOffset);
  
  // find point based on starting point of canvas
  float x = circleX + circleOffX ;
  // add some randomness to shape - larger the number, the more random - will screw up
  float y = circleY + circleOffY ;
  //draw circles
  vertex(x, y);
  fill(#EBD0F0);
}
endShape(CLOSE);

radius = 260;
beginShape();
for (int i=0; i<resolution; i=i+1) {
  // radian: 0 to 2pi = 0 to 360
  
  //#of waves:5
  float waveAngle = map(i, 0, resolution, 0, TWO_PI*14);
  // 30 px
  float waveOffset = sin(waveAngle) * 20;
  
  float angle = map (i, 0, resolution, 0, TWO_PI );
  //find point on circumference
  //wave: waveoffset is calculated and +/- to radius
  float circleOffX = cos(angle) * (radius + waveOffset);
  float circleOffY = sin(angle) * (radius + waveOffset);
  
  // find point based on starting point of canvas
  float x = circleX + circleOffX ;
  // add some randomness to shape - larger the number, the more random - will screw up
  float y = circleY + circleOffY ;
  //draw circles
  vertex(x, y);
  fill(#F7D4FC);
}
endShape(CLOSE);

radius = 220;
beginShape();
for (int i=0; i<resolution; i=i+1) {
  // radian: 0 to 2pi = 0 to 360
  
  //#of waves:5
  float waveAngle = map(i, 0, resolution, 0, TWO_PI*10);
  // 30 px
  float waveOffset = sin(waveAngle) * 30;
  
  float angle = map (i, 0, resolution, 0, TWO_PI );
  //find point on circumference
  //wave: waveoffset is calculated and +/- to radius
  float circleOffX = cos(angle) * (radius + waveOffset);
  float circleOffY = sin(angle) * (radius + waveOffset);
  
  // find point based on starting point of canvas
  float x = circleX + circleOffX ;
  // add some randomness to shape - larger the number, the more random - will screw up
  float y = circleY + circleOffY ;
  //draw circles
  vertex(x, y);
  fill(#EBD0F0);
}
endShape(CLOSE);

radius = 180;
beginShape();
for (int i=0; i<resolution; i=i+1) {
  // radian: 0 to 2pi = 0 to 360
  
  //#of waves:5
  float waveAngle = map(i, 0, resolution, 0, TWO_PI*8);
  // 30 px
  float waveOffset = sin(waveAngle) * 30;
  
  float angle = map (i, 0, resolution, 0, TWO_PI );
  //find point on circumference
  //wave: waveoffset is calculated and +/- to radius
  float circleOffX = cos(angle) * (radius + waveOffset);
  float circleOffY = sin(angle) * (radius + waveOffset);
  
  // find point based on starting point of canvas
  float x = circleX + circleOffX ;
  // add some randomness to shape - larger the number, the more random - will screw up
  float y = circleY + circleOffY ;
  //draw circles
  vertex(x, y);
  fill(#F7D4FC);
}
endShape(CLOSE);

radius = 140;
beginShape();
for (int i=0; i<resolution; i=i+1) {
  // radian: 0 to 2pi = 0 to 360
  
  //#of waves:5
  float waveAngle = map(i, 0, resolution, 0, TWO_PI*6);
  // 30 px
  float waveOffset = sin(waveAngle) * 30;
  
  float angle = map (i, 0, resolution, 0, TWO_PI );
  //find point on circumference
  //wave: waveoffset is calculated and +/- to radius
  float circleOffX = cos(angle) * (radius + waveOffset);
  float circleOffY = sin(angle) * (radius + waveOffset);
  
  // find point based on starting point of canvas
  float x = circleX + circleOffX ;
  // add some randomness to shape - larger the number, the more random - will screw up
  float y = circleY + circleOffY ;
  //draw circles
  vertex(x, y);
  fill(#EBD0F0);
}
endShape(CLOSE);

radius = 100;
beginShape();
for (int i=0; i<resolution; i=i+1) {
  // radian: 0 to 2pi = 0 to 360
  
  //#of waves:5
  float waveAngle = map(i, 0, resolution, 0, TWO_PI*6);
  // 30 px
  float waveOffset = sin(waveAngle) * 30;
  
  float angle = map (i, 0, resolution, 0, TWO_PI );
  //find point on circumference
  //wave: waveoffset is calculated and +/- to radius
  float circleOffX = cos(angle) * (radius + waveOffset);
  float circleOffY = sin(angle) * (radius + waveOffset);
  
  // find point based on starting point of canvas
  float x = circleX + circleOffX ;
  // add some randomness to shape - larger the number, the more random - will screw up
  float y = circleY + circleOffY ;
  //draw circles
  vertex(x, y);
  fill(#F7D4FC);
}
endShape(CLOSE);


fill(#B2A2B4);
ellipse(width/2,height/2,100,100);



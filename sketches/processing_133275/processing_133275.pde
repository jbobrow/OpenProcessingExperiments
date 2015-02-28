
size(400,400);
background (252,227,140);

int resolution = 200;
float radius =100;
float circleX= width * 0.5;
float circleY= height * 0.5;

//flower LINES
beginShape();
for(int i=0; i<resolution; i++){
  
  float waveAngle = map (i,0,resolution,0,TWO_PI*20); //petals
  float waveOffset = sin(waveAngle) * 30; // height of petals
  
  
  float angle = map (i, 0, resolution, 0, TWO_PI);
  float circleOffX = cos(angle) * (radius + waveOffset);
  float circleOffY = sin (angle) * (radius + waveOffset);
 
  
  float x= circleX + circleOffX ;
  float y = circleY + circleOffY ;
  
  stroke (15,64,57,40);
  strokeWeight(3);
  line(x,y,200,200);
}
endShape(CLOSE);


//Flower Ellipses
beginShape();
for(int i=0; i<resolution; i++){
  
  float waveAngle = map (i,0,resolution,0,TWO_PI*7); //petals
  float waveOffset = sin(waveAngle) * 70; // height of petals
  
  
  float angle = map (i, 0, resolution, 0, TWO_PI);
  float circleOffX = cos(angle) * (radius + waveOffset);
  float circleOffY = sin (angle) * (radius + waveOffset);
 
  
  float x= circleX + circleOffX ;
  float y = circleY + circleOffY ;
  
  fill(214,127,19,40);
  noStroke();
  ellipse(x,y,20,20);
}
endShape(CLOSE);

//flower vertex
radius = 50;

beginShape();
for(int i=0; i<resolution; i++){
  
  float waveAngle = map (i,0,resolution,0,TWO_PI*5); //petals
  float waveOffset = sin(waveAngle) * 30; // height of petals
  
  
  float angle = map (i, 0, resolution, 0, TWO_PI);
  float circleOffX = cos(angle) * (radius + waveOffset);
  float circleOffY = sin (angle) * (radius + waveOffset);
 
  ;
  
  float x= circleX + circleOffX ;
  float y = circleY + circleOffY ;
  fill(#ffffff,40);
  noStroke();
  vertex(x,y);
}
endShape(CLOSE);

//button
fill(240,226,152);
stroke (220,226,152);
strokeWeight(4);
ellipse (200, 200, 20, 20);

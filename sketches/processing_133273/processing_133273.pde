
void setup(){
  size(800,600);
  frameRate(5);
}

void draw(){
  background(255);
  //noLoop();
  drawCircles(512, 256, 0.5*width, 0.5*height);
}

void drawCircles(int resolution, float radius, float circleX, float circleY){

if(radius>10){
  fill((200/radius)%255, (150+radius)%255, radius%255);
  stroke((200+radius)%255, 150, radius%255);
  beginShape();
  for(int i=0; i<resolution; i+=1){
      float waveAngle = map(i,0,resolution,0,TWO_PI*10);
      float waveOffset = sin(waveAngle)*20;

      float angle = map(i+random(3)*100,0,resolution,0,TWO_PI);
      float circleOffX = cos(angle) * (radius+waveOffset);
      float circleOffY = sin(angle) * (radius+waveOffset);

      //ellipse(circleOffX+circleX, circleOffY+circleY, 10+resolution-i, 10-i+resolution);
      vertex(circleOffX+circleX, circleOffY+circleY);
    }
  endShape(CLOSE);

  float phi = 1.618;

  drawCircles(int(512/phi), int(radius/phi), 0.5*width, 0.5*height);
}
}


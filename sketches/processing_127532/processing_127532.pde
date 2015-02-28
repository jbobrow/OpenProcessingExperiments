
float rotatex,rotatey;
float zoom = 0;

void setup() {
  size(600, 400, P3D);
  frameRate(30);
}

void draw() {

  background(200,200,255);
  camera(width/2.0, height/2.0, (height/2.0) / tan(PI*30.0 / 180.0)+zoom, width/2.0, height/2.0, 0, 0, 1, 0);
  noStroke();
  translate(width/2, height/2);
  rotateX(radians(rotatex));
  rotateY(radians(rotatey));
  
  lights();
  directionalLight(255, 255, 200, 1, 1, 0);
  directionalLight(155, 155, 100, -1, -1, 0);

  fill(color(255,200,200));
  for(int x=-100;x<100;x++){
    beginShape(TRIANGLE_STRIP);
    for(int y=-100;y<100;y++){
        vertex(x, y, rosenBlock(x,y));
        vertex(x+2, y, rosenBlock(x+2,y));
    }
    endShape();
  }
}

float rosenBlock(float x, float y){
  x/=200;
  y/=200;
  return (1-x)*(1-x)+100*((y-x*x)*(y-x*x));
}

void keyPressed() {
  if (key == 'z') {
    zoom+=5;
  }
  else if(key == 'x'){
    zoom-=5;
  }
  else if(key == 'a'){
    rotatex-=30;
  }
  else if(key == 'd'){
    rotatex+=30;
  }
  else if(key == 'w'){
    rotatey-=30;
  }
  else if(key == 's'){
    rotatey+=30;
  }
}

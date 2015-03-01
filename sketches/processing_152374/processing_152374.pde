
float num=30;

void setup() {
  size(800, 800);
  smooth();
  colorMode(HSB);
  rectMode(CENTER);
  //frameRate(1);
}

void draw() {
  background(200);
  float distance = width/num;

  for (float i=1; i<num; i++) {
    for (float n=1; n<num; n++) {
      //float tam = noise(millis()/91.3)*i;
      //float tam2 = n*noise(millis()/-91.3);
//      float tam = (1-sin(millis()/91.3))*i;
//      float tam2 = n*(1-sin(millis()/-91.3));
      float tam = abs(sin(millis()/91.3)*i);
      float tam2 = abs(n*sin(millis()/-91.3));
      
      noFill();
      stroke(map(tam,0,num/2,0,255),map(tam2,0,num,0,255),100);
      cell(n*distance , i*distance , distance +tam2);
      stroke(map(tam2,0,num/2,0,255),map(tam,0,num,0,255),100);
      cell(n*distance , i*distance , distance *0.6+tam);
      stroke(map(tam,0,num/2,0,255), 100, map(tam2,0,num,0,255));
      cell(n*distance +distance /2, i*distance +distance /2, distance *0.3+tam);
    }
  }
  
  if(keyPressed == true && key == 's'){
    saveFrame(frameCount + ".jpg");
  }
}

void cell(float tempX, float tempY, float tempSz) {
  float x = tempX;
  float y = tempY;
  float sz = tempSz;
  rect(x, y, sz, sz, sz/3);
}

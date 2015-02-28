
// Flowering Flowers
// use class and []
// lin wenyu  (ken3101462@gmail.com)


myFlower[] Flowers = new myFlower[10]; 

float angle;

void setup() {
  size(800, 600);
  frameRate(12);
  background(0); 
  for (int i=1 ; i < Flowers.length ; i++) {
    float x=random(width);
    float y=random(height);
    float r = i+1;
    Flowers[i]=new myFlower(x, y, r);
  }
  //noLoop();
}

void draw() {
  background(0);

  translate(600, 300);
  rotate(angle);
  for (int i=1 ; i < Flowers.length ; i++) {

    Flowers[i].ro();
    Flowers[i].show();

  }
  angle += 0.01;
//    fill(0, 120);
//    noStroke();
//    rect(0, 0, width, height);
}

// flowers
class myFlower {

  float centX = random(800);
  float centY = random(600);
  float radius = random(50, 100);

  myFlower(float centX, float centY, float radius) {
    
  }

  float x1, y1; 
  float noiseval = random(10);
  float radVariance, thisRadius, rad;
  float c1 = random(240, 245);
  float c2 = random(165, 190);
  float c3 = random(230, 240);
  float s = second();
  float posx = centX-radius*random(1, 2);
  float posy = centY-radius*random(1, 2);

  void show() {

    pushMatrix();
    //translate(600, 300);
    //rotate(angle);
    beginShape();
    for (float ang=0; ang<=360; ang+=1.15) {
      noStroke();
      fill(c1, c2, c3);
      //println("print!, c1:" + c1 + ",c2:" + c2 + ",c3:" + c3);

      noiseval += .1; 
      radVariance = 90 * customNoise(noiseval);
      thisRadius = radius + radVariance; 
      rad = radians(ang);

      x1 = abs(posx-centX + (thisRadius * cos(rad)/3)); 
      y1 = abs(posy-centY + (thisRadius * sin(rad)/3));
      //println("posx:" + posx + ",posy:" + posy);
      //println("x:"+ x +",y:" + y + ",rad:" + rad);
      curveVertex(x1, y1);
    }
    endShape(CLOSE);
    angle += 0.01;
    popMatrix();
  }

  void ro(){
//    float a1=random(300,500);
//    float a2=random(300,500);
//  translate(a1, a2);
  translate(500, 300);  
  rotate(angle);
  angle += .01;
  }
}


//new Noise
float customNoise(float value) {
  float retValue=pow(sin(value), 3);
  return retValue;
}

void mousePressed() {
  redraw();
  saveFrame("circle####.png");
}




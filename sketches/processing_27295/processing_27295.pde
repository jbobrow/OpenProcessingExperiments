
Node[] dataset;

color bgcolor = color(50);
float scaleValue;

float lightMap, tempMap;
float sine, sinePoint, cosine, cosinePoint;

float thetaStatic, thetaRunning;

void setup(){
  size(1000,300);
  colorMode(HSB, 360, 100, 100);
  background(50);
  smooth();

  populateArrays();
  //visSin();
  visLines();
  visSin();
}

void draw(){
  fill(50, 50);
  rect(0,0,width,height);
  visLines();
  visSin();
  thetaRunning++;
}

void populateArrays(){
  String[] data = loadStrings("light_temp_data_small.csv");
  dataset = new Node[data.length];
  for(int i = 0; i < dataset.length; i++){
    String[] pieces = split(data[i], ",");
    float p0 = parseFloat(pieces[0]);  //light
    float p1 = parseFloat(pieces[1]);  //temp
    dataset[i] = new Node(i, p0, p1, map(i, 0, dataset.length, 0, width),map(p1, 18, 21, 5, height),map(p0, 0, 475, 10, 50));
  }
}


void visLines(){
  for(int i = 0; i < dataset.length; i++){
    pushMatrix();
    translate(width/5, height/10);
    lightMap=map(dataset[i].light, 0, 475, 10, width);
    stroke(0,0,100,map(dataset[i].temp, 18, 21, 3, 25));
    //line(i*.5, 0, map(dataset[i].light, 0, 475, 0, width), map(dataset[i].temp, 18, 21, 50, height));
    line(dataset[i].xpos-dataset[i].ypos, dataset[i].ypos-dataset[i].zpos, dataset[i].ypos, dataset[i].zpos);
    popMatrix();
  }
}

void visSin(){
  //translate(width/2, height/2);
  for(int i = 0; i < dataset.length; i++){
    sine = map(sin(radians(thetaStatic)), 0, 1, 0, width);
    cosine = map(cos(radians(thetaStatic)), 0, 1, 0, height);
    lightMap=map(dataset[i].light, 0, 475, 10, width);
    stroke(0,0,100,map(dataset[i].temp, 18, 21, 3, 5));
    float dataX = map(dataset[i].light, 0, 475, 0, width/sine);
    dataX = dataX*sine;
    float dataY = map(dataset[i].temp, 18, 21, 50, height/cosine);
    dataY = dataY*cosine;
    line(sine, 0, dataX, dataY);
    thetaStatic++;
  }
}

void visCircle(){
  for(int i = 0; i < dataset.length; i++){
    //lightMap = map(dataset[i].light, 0, 475, 10, width/10);  // size
    //tempMap = map(dataset[i].temp, 18, 21, 5, height);       // y-pos
    
    lightMap = map(dataset[i].light, 0, 475, 10, height);  // y-pos
    tempMap = map(dataset[i].temp, 18, 21, 5, 50);         // size

    fill(0,80,map(dataset[i].temp, 18, 21, 0, 80),map(dataset[i].temp, 18, 21, 3, 15));
    noStroke();
    //ellipse(dataset[i].entry*.5, tempMap, lightMap, lightMap);
    dataset[i].circle();
  }
}

class Node {
  float entry, light, temp;
  float xpos, ypos, zpos;

  Node(float _entry, float _light, float _temp, float _xpos, float _ypos, float _zpos){
    entry = _entry;
    light = _light;
    temp = _temp;
    xpos = _xpos; ypos = _ypos; zpos = _zpos;
  }
  
  void circle(){
    ellipse(xpos,ypos,zpos,zpos);
  }
  }



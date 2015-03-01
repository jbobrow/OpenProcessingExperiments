
float[] serie = {
  50,30,80,200
}; 

void setup() {
  size(760, 500);
  noLoop();
  noStroke();
  // rectMode(CORNERS);
  background(255);
}

void draw() {


  println(max(serie));

  int largura = (width/serie.length);

  for (int i=0;i<serie.length;i=i+1) {
    float j = map(serie[i], 0.0, max(serie), 0.0, height);
    if(serie[i]>50){
      fill(200,0,0);
    } else {
      fill(90);
    }
    rect((i*largura)+2, height-j, largura-2, j);
    
  }
}


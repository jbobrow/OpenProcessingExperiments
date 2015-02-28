


void setup() {
  background(0); 
  size(800, 800);
  smooth();
  colorMode(HSB); //HSBモードを指定
  noStroke(); 
}

void draw() {
  for (int x=0; x<=width; x += random(800)) { //x軸ランダム
    for (int y=0; y<=height; y += random(800)) { //y軸ランダム
      fill(random(255), 100, 250, 35); //カラー
      triangle(random(x), random(y), random(x)/2, random(y)/2, x, y); //三角形ランダム
      rect(random(x),random(y),random(x)/2,random(y)/2); //四角ランダム指定
    }
  }
}




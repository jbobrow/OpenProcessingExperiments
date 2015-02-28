
void setup() {
  size(400,400,P2D);
  smooth();
  // stroke(0,20);
 color c1 = color(159, 161, 122);
 color c2 = color(255, 255, 255);
}

float time = 0;
float lines = 200;
float rectsize = 50;

void draw() {
  background(255);
  time += 1.0 / frameRate;
  
  for(int i = 0; i < lines;i++) {
    float x = noise(time + i * 0.01) * width;
    float x2 = noise(time + 100 + i * 0.01) * width;
    setGradient(x2,height/4+i,rectsize,rectsize, color(183), color(200));
    stroke(0,i / lines * 100);
    fill(0,i / lines * 100/4);
    if(i % 2 == 0)ellipse(x2, height/4+i,rectsize, rectsize);

  }
}

void setGradient(float x, float y, float w, float h, color c1, color c2){
  float deltaR = red(c2)-red(c1);
  float deltaG = green(c2)-green(c1);
  float deltaB = blue(c2)-blue(c1);
    for (int i=(int)x; i<=(x+w); i++){
      // row
      for (int j = (int)y; j<=(y+h-50); j++){
        color c = color(
        (red(c1)+(j-i)*(deltaR/h)),
        (green(c1)+(j-i)*(deltaG/h)),
        (blue(c1)+(j-i)*(deltaB/h)) 
          );
        set((int)i, (int)j+40, c);
      }
    }  
}


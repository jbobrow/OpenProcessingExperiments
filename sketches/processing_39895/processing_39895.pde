

int num = 100000;
float[] xpos = new float [num];
float [] ypos = new float [num];
PImage img;

void setup(){
  size (555,367);
  img = loadImage("guggenheiminvert.jpg");
  
  for(int i = 0; i <num; i++){
    xpos[i] = random (width);
    ypos[i] = random (height);
  }
  stroke(255);
}

void draw(){
  background(0);
  for(int i = 0; i < num; i++){
    color c = img.get(int(xpos[i]), int(ypos[i]));
    float b = brightness (c) / 255.0;
    float speed = pow(b,2) + 0.05;
    ypos[i] += speed*10;
    
    if (ypos[i] > height) {
      ypos[i] = 0;
      ypos[i] = random(height);
    }
    
    point(xpos[i], ypos[i]);
  }
}


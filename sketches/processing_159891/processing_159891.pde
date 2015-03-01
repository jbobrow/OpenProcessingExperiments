
float num, pathR, pathG, pathB;

void setup(){
  size(640, 640);
}

void draw(){
  fill(0, 30);
  rect(-1, -1, width+1, height+1);
  
  float maxX = map(mouseX, 0, width, -150, 150);
  float maxY = map(mouseY, 0, height, -150, 150);
  
  translate(width/2, height/2);
  for(int i = 0; i < 360; i+=2){
    float angle = sin(i+num);
    float x = sin(radians(i)) * (maxX + angle*30);
    float y = cos(radians(i)) * (maxX + angle*30);
    
    float x2 = sin(radians(i+num*50)) * (maxY + angle*60);
    float y2 = cos(radians(i+num*50)) * (maxY + angle*60);
    
    pathR = 50+angle+125*sin(PI+num*3);
    pathG = 50+angle+125*sin(TWO_PI+num*3);
    pathB = 50+angle+125*sin(HALF_PI+num*3);
    
    stroke(pathR, pathG, pathB, 50);
    fill(pathR, pathG, pathB, 30);

    
    bezier(x, y, x+x, y+y, x+x2, y+y2, x+x2, y+y2);
  }
  num += 0.01;
}



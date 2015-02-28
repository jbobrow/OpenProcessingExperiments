
size(803, 600);
background(0);
smooth();
PImage cloudImg = loadImage("hotel.jpg");

int space = 4;
noStroke();
//stroke(255);

for (int i = 0; i < 10000;i++){
    int x = (int)random(width);
    int y = (int)random(height);
    
    color col = cloudImg.get(x, y);
    float brightness = (0.3 * red(col) + 0.59 * green(col) + 0.11 * blue(col)) / 255;
    
    float x1 = x + random(-20,20) * brightness;
    float y1 = y + random(-20,20) * brightness;
    float x2 = x + random(-20,20) * brightness;
    float y2 = y + random(-20,20) * brightness;
    float x3 = x + random(-20,20) * brightness;
    float y3 = y + random(-20,20) * brightness;
    
    fill(col);
    triangle(x1,y1,x2,y2,x3,y3);
  
}

if(!online)saveFrame("frame.png");



ArrayList<Bullet> bullets;

void setup() {
  size(360, 240);
  bullets = new ArrayList<Bullet>();
  for(int i=0;i<10;i++){
    bullets.add(new Bullet(random(width),random(1000)));
  }
  frameRate(30);
}
 
void draw() {
  background(0);
 
 for(int i=0;i<bullets.size();i++){
   bullets.get(i).update();
 }
 
 //render bullets
  loadPixels();
  for(int i = 0; i < bullets.size(); i++){
    for (int y = 0; y < height; y++) {
      for (int x = 0; x < width; x++) {
        int pixelIndex = x + y * width;
 
        float dx = bullets.get(i).x - x;
        float dy = bullets.get(i).y - y;
        float distance = max(sqrt(dx * dx + dy * dy), 1);
                
        int r = pixels[pixelIndex] >> 16 & 0xFF;
        int g = pixels[pixelIndex] >> 8 & 0xFF;
        int b = pixels[pixelIndex] & 0xFF;
        
        r += (255 * bullets.get(i).lightPower) / distance;
        g += (205 * bullets.get(i).lightPower) / distance;
        b += (255 * bullets.get(i).lightPower) / distance;
 
        pixels[pixelIndex] = color(r, g, b);
      }
    }
  }
  updatePixels();
}

class Bullet{
  float x,y;
  float lightPower;
  float powerPhase = random(360);
  float speed = random(-5,-2);
  Bullet(float xx,float yy){
    x = xx;
    y = yy;
  }
  
  void update(){
    y+= y>0 ? speed : 500;
    lightPower = sin(radians(frameCount+powerPhase))*5+5;
  }
}

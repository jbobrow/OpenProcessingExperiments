
ArrayList pond;

void setup(){
  size (800, 640);
  noStroke();
  pond = new ArrayList();
}
void draw(){
  background(0,15,220); 
  if (mouseButton == LEFT){
    pond.add(new Ripple(mouseX, mouseY, 1, 1, pond, 1, 255));
 } 
  else if (mouseButton == RIGHT){
    pond.add(new Ripple(mouseX, mouseY, 150, 150, pond, -1, 255));
 } 
 
 
 for (int i = 0; i < pond.size(); i++){
   Ripple rip = (Ripple) pond.get(i);
   rip.grow();
 }
}

class Ripple {
  int x;
  int y;
  int height;
  int width;
  ArrayList pond;
  int opacity;
  int maxOpacity;
  int maxRadius;
  int growthRate;

  Ripple(int x, int y, int height, int width, ArrayList pond, int growthRate, int opacity){
    this.x = x;
    this.y = y;
    maxRadius = (width + height)/2;
    this.height = height;
    this.width = width;
    this.pond = pond;
    this.opacity = opacity;
    maxOpacity = opacity;
    this.growthRate = growthRate;
  }
  
  void grow(){
    if(opacity < 0 || height < 0 || width < 0){
      if (opacity < 0 && maxOpacity > 75){
        pond.add(new Ripple(x + width, y, 1, 1, pond, 1, maxOpacity/2));
        pond.add(new Ripple(x - width, y, 1, 1, pond, 1, maxOpacity/2));
        pond.add(new Ripple(x, y + height, 1, 1, pond, 1, maxOpacity/2));
        pond.add(new Ripple(x, y - height, 1, 1, pond, 1, maxOpacity/2));
      }
      else if ( (height < 0 || width < 0) && maxRadius > 20){
        pond.add(new Ripple(x + maxRadius, y, maxRadius/2, maxRadius/2, pond, -1, maxOpacity/2));
        pond.add(new Ripple(x - maxRadius, y, maxRadius/2, maxRadius/2, pond, -1, maxOpacity/2));
        pond.add(new Ripple(x, y + maxRadius, maxRadius/2, maxRadius/2, pond, -1, maxOpacity/2));
        pond.add(new Ripple(x, y - maxRadius, maxRadius/2, maxRadius/2, pond, -1, maxOpacity/2));
      }
    pond.remove(this);
    }
    ellipse(x, y, height, width);
    fill(51,218,255, opacity);
    opacity = opacity - 1;
    height = height + growthRate;
    width = width + growthRate;
  }
  
  
}




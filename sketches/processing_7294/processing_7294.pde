
class Point
{
  PVector location;
  PVector animatedLocation;
  PVector direction;
  int radius;
  int timeToAnimate; 
  int currentTime; 
  boolean animate;
  boolean isActive;

  Point(int x, int y, int radius, int timeToAnimate)
  {
    this.location = new PVector(x, y);
    this.direction = new PVector();
    this.radius = radius;
    this.timeToAnimate = timeToAnimate;
    this.currentTime = 0;
    this.animate = false;
    this.isActive = true;
  }

  void toggleActive(boolean flag)
  {
    this.isActive = flag;
  }

  void setDirection(PVector startPoint, PVector endPoint)
  {
    this.direction= PVector.sub(endPoint, startPoint); 
    this.animate = true;
  }

  void update()
  {
    if(this.currentTime > this.timeToAnimate) { 
      this.animate = false; 
      this.currentTime = 0; 
      this.location.set(this.animatedLocation); 
      return;
    }  

    float normalizedTime = lerp(0.0, 1.0, this.currentTime/float(this.timeToAnimate)); 
    this.animatedLocation = PVector.add(this.location, PVector.mult(this.direction, normalizedTime)); 
    this.currentTime += 1;
  }

  void draw()
  {
    if (this.isActive){
      stroke(0, 0, 0);
    } 
    else {
      stroke(255, 255, 0);
    }

    fill(255, 0, 0);

    if(this.animate){
      this.update();
      ellipse(this.animatedLocation.x, this.animatedLocation.y, this.radius, this.radius); 
    } 
    else {
      ellipse(this.location.x, this.location.y, this.radius, this.radius); 
    }
  }
}










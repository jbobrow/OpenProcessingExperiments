
class Circle {
  float x, y, r, original_r;
  boolean isHovered = false;
  Label label;

  Circle(float x_, float y_, float r_, String _name, String _number) {
      x = x_;
      y = y_;
      r = r_;
      original_r = r_;
    
    // initialize label
    String txt =  _name + " : " +  _number;
    label = new Label(txt);
  }

  void display() {

    ellipseMode(CENTER); //PUT THIS IN RANDOMLY

    // set fill
    if (isHovered) {
      fill(255, 10);
      strokeWeight(3);
      smooth();
      stroke(random(0), random(255), random(255), 90);
      r++;
      frameRate(30);
      r = min(100.0, r);//grows to only this size
    } 
    else {
      noStroke();
//      fill(255, random(90));
      fill(0, 227, 255, 150);
      r = original_r;
    }


   // ellipse(mapX, mapY, r*2, r*2);
     ellipse(x, y, r*2, r*2);
  }

  void onMouseOver(float mx, float my) {

    // map x, y coords to visible area
    float mapX = (x);
    float mapY = (y);

    if (dist(mx, my, mapX, mapY) <= 10) {
      isHovered = true;
      label.display(mx, my);
    } 
    else {
      isHovered = false;
    }
  }
}



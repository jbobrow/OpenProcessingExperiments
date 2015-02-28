
public class Circle {

  public boolean drawn;
  public boolean hovered;  //if mouse is on top of the circle
  public boolean resizing; 
  public float radius;    //Diameter IRL, wrong naming
  
  public Vect2 center; 

  Circle() {
    center = new Vect2(0,0);
    radius = 0;
    drawn = false;
    hovered = false;
  }
  
  Circle( Vect2 cen, float rad){
    center = cen;
    radius = rad;   
    drawn = false;
    hovered = false;
    
  }

  void draw() {
    stroke(33, 107, 22);
    if (hovered) {
      strokeWeight(3);
    } 
    else {
      strokeWeight(2);
    }
    noFill();
    ellipse(center.x, center.y, radius, radius);
  }
}



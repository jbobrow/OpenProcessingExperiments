
class Picker {
  int x;
  int y;
  int w;
  int h;
  int speed;
  int reloadCountdown; //0 is the normal status; if > 0, the Picker is having hallucination (and the number is indicating how many cycles until the hallucination is finished)
  PImage img;

  Picker (int x, int y, int speed, int reloadCountdown, PImage img) {
    this.x = x;
    this.y = y;
    this.speed = speed;  //Doesn't change. For optional future uses.  
    this.reloadCountdown = reloadCountdown;    
    this.img = img;
    w = img.width;
    h = img.height;
  }

/*Collision detection */
  boolean pointInside (float pointX, float pointY) {
    return (pointX > x - w/2 && pointX < x + w/2 && pointY > y - h/2 && pointY < y + h/2);
  }

  void drawAndUpdate() {
    if (reloadCountdown == 0) { // If picker is not hallucinating - moves.
      movement();
    }
    else {
      hallucination();
    }
  } 



  void movement() {
    y += speed; 

    if (y > height) {
      y = 0 - h;
      x =int(random(0, width));
    }

    if (x> width) {
      y = 0 - h;
      x = int(random(0, width));
    }
    draw();
  }
  
  void hallucination() {
    tint((reloadCountdown*3)%225+30, (reloadCountdown*5)%225+30, (reloadCountdown*7)%225+30);
    pushMatrix();
    translate(x,y);
    rotate(cos(2-2*reloadCountdown/10.0));
    translate(-x,-y);
    draw(); 
    popMatrix(); 
    tint(255);


    this.reloadCountdown--;//Duration of the hallucination   
    
    if (reloadCountdown == 1) {
      y = -(int)random(pickerStartingYMin, pickerStartingYMax);  //kills the picker by putting it 
      x = (int)random(pickerStartingXMin+w, pickerStartingXMax);  //...outside of the screen-above
    }

  }

  void draw() {
    image(img, x, y);
  }
} 



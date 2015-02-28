
inputNode zero = new inputNode(0, 100, 20);
inputNode one = new inputNode(50, 100, 20);
inputNode two = new inputNode(150, 100, 20);
inputNode three = new inputNode(250, 100, 20);
inputNode four = new inputNode(350, 100, 20);
inputNode five = new inputNode(400, 100, 20);



void setup(){
  size(400,400);
  background(0);
  smooth();

}

void draw() {
  background(0); 

  zero.update(mouseX,mouseY);
  one.update(mouseX,mouseY);
  two.update(mouseX,mouseY);
  three.update(mouseX,mouseY);
  four.update(mouseX,mouseY);
  five.update(mouseX,mouseY);

  fill(200);
  strokeWeight(4);
  stroke(255);
  beginShape();
  vertex(0,height);
  curveVertex(zero.getPosition()[0], zero.getPosition()[1]);
  curveVertex(zero.getPosition()[0], zero.getPosition()[1]);
  curveVertex(zero.getPosition()[0], zero.getPosition()[1]);
  curveVertex(one.getPosition()[0], one.getPosition()[1]);
  curveVertex(two.getPosition()[0], two.getPosition()[1]);
  curveVertex(three.getPosition()[0], three.getPosition()[1]);
  curveVertex(four.getPosition()[0], four.getPosition()[1]);
  curveVertex(five.getPosition()[0], five.getPosition()[1]);
  curveVertex(five.getPosition()[0], five.getPosition()[1]);
  vertex(width,height);
  endShape(CLOSE);

  strokeWeight(0.5);
  line(zero.getPosition()[0],0,zero.getPosition()[0],height);
  line(one.getPosition()[0],0,one.getPosition()[0],height);
  line(two.getPosition()[0], 0, two.getPosition()[0], height);
  line(three.getPosition()[0], 0, three.getPosition()[0], height);
  line(four.getPosition()[0], 0, four.getPosition()[0], height);
  line(five.getPosition()[0], 0, five.getPosition()[0], height);




  strokeWeight(2);
  zero.display();  
  one.display();
  two.display();
  three.display();
  four.display();
  five.display();

}
void mousePressed() {
  one.press(mouseX,mouseY);
  two.press(mouseX,mouseY);
  three.press(mouseX,mouseY);
  four.press(mouseX,mouseY);
}
void mouseReleased() {
  one.release();
  two.release();
  three.release();
  four.release();
}


















class inputNode {
  int x; 
  int y;
  int r;

  boolean rollover;
  boolean over;
  boolean locked;


  float inputDistance;

  inputNode(int inx, int iny, int inr) { 
    x = inx;
    y = iny;
    r = inr;
  }

  void update(int mx, int my) {
    if (over(mx, my) == true) {
      rollover = true;
    } 
    else {
      rollover = false;
    }
    if (locked == true) {
      x = mx;
      y = my;
    }
  }



  void display(){
    if(locked == true) {
      fill(100);
    }
    else {
      noFill();
    }
    ellipse(x,y,r,r);
  }

  // Returns the current value of the node
  int[] getPosition(){
    int[] myLocation = {
      x,y                                    };
    return myLocation;
  } 







  // Locks the object being interacted with so the mouse can move off and still update
  void press(int mx, int my) {
    if (rollover == true) {
      locked = true;
    } 
    else {
      locked = false;
    }
  }


  // Resets the object input to neutral
  void release() {
    locked = false;
  }


  // Returns true if the cursor is over the ellipse object input
  boolean over(int mx, int my) {
    float inputDistance = sqrt(pow((mx - x),2) + pow((my - y),2));  // a^2 + b^2 = sqrt(c)
    if(inputDistance < r/2) {
      return true;
    } 
    else {
      return false;
    }
  }

}















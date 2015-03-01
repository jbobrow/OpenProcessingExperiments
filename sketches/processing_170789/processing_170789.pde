
float dbp=100; //distance between points

ArrayList<Point> ALpoints; //preps for creation an arraylist of points
void setup() {
  size(400,400);
  ALpoints = new ArrayList<Point>(); //creates that arraylist
  for (int i=0; i<75; i++){ 
    ALpoints.add(new Point(random(0,width),random(0,height))); //fills it with 75 points at random locations
  }
}

void draw(){
  background(255);
  for (int i=ALpoints.size()-1; i>=0; i--) { //for each point in ALpoints, starting from the last
    Point p = ALpoints.get(i); //call the point we're on "p"
    p.move(); //move p
    p.display(); //display p
    //we want to look at two points at once, so let's do another for loop to go through all of our points
    for (int j=ALpoints.size()-1; j>=0; j--) { //for each point in ALpoints, starting from the last
      Point pj = ALpoints.get(j); //call the point we're on "pj"
      float dist=(sqrt(pow((p.x-pj.x),2)+pow((p.y-pj.y),2))); //define "dist" as the distance between p and pj
      if (dist<dbp) { //if the points are close enough together, draw a line between them
        stroke(0);
        line(p.x,p.y,pj.x,pj.y);
      }
    }
  }
}


class Point {
  float x,y,xs,ys;
  Point(float x_,float y_) { //define our point: set our point's values to the inputs
    x=x_;
    y=y_;
    xs=random(-5,5);
    ys=random(-5,5);
  }
  void move(){//move the point, based on speed
    x+=xs;
    y+=ys;
    if (x < 0 || x > width){ //bounce off the walls
      xs=-xs;
    }
    if (y < 0 || y > width){
      ys=-ys;
    }
  }
  void display() { //display the point
    noStroke();
    ellipse(x,y,2,2);
  }
}

void keyPressed(){ //increase or decrease the distance required for a line
  if(key=='2'){
    dbp+=5;
  }
  if(key=='1'){
    dbp-=5;
  }
}

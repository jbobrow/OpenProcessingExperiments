
color[] colors = {color(34,105,193),
                  color(76,156,225),
                  color(137,190,225)};
                  
float[] axis = {20,20,580,580};
int maxCircles = 10;
int maxSize = 150;
int minSize = 100;
int[] dimensions = {600,600};
ArrayList<ArrayList<Circle>> circles = new ArrayList<ArrayList<Circle>>();

void setup() {
  size(800,800);
  smooth(8);
  
  ArrayList<Circle> toAdd = new ArrayList<Circle>();
  for(int i = 0; i < maxCircles; ++i){
    if(i != 0){
    Circle c = toAdd.get(i-1);
    toAdd.add(new Circle(random(dimensions[0]),
                         random(dimensions[1]),
                         random(c.size_/4)+3*c.size_/(4.2),
                         color(colors[0]),
                         toAdd.get(i-1)));
    }else{
    toAdd.add(new Circle(random(dimensions[0]),
                         random(dimensions[1]),
                         maxSize+random(minSize),
                         color(colors[0]),
                         null));
    }
  }
  circles.add(toAdd);
  for(int i = 1; i < colors.length; ++i){
    toAdd = new ArrayList<Circle>();
    for(int j = 0; j < circles.get(circles.size()-1).size(); ++j){
      Circle c = circles.get(circles.size()-1).get(j);
      if(j != 0){
      toAdd.add(new Circle(random(dimensions[0]),
                           random(dimensions[1]),
                           random(c.size_/7)+6*c.size_/(7.5),
                           color(colors[i]),
                           toAdd.get(j-1)));
      }else{
      toAdd.add(new Circle(random(dimensions[0]),
                           random(dimensions[1]),
                           random(c.size_/7)+6*c.size_/(7.5),
                           color(colors[i]),
                           null));
      }
    }
    circles.add(toAdd);
  }
  
//  for(int i = 0; i < colors.length; ++i){
//    circles.add(new ArrayList<Circle>());
//    for(int j = 0; j < random(maxCircles/colors.length); ++j){
//      float s = (colors.length-i)*(maxSize/colors.length)+(random(maxSize/colors.length)-(maxSize/colors.length)/2);
//      
//      circles.get(i).add(new Circle(random(dimensions[0]),
//                                    random(dimensions[1]),
//                                    s,
//                                    color(colors[i]),
//                                    random(10)-5,
//                                    random(10)-5));
//    } 
//  }
  print(circles.size());
}
void draw() {
  updateAndRenderAll();
}

void updateAndRenderAll(){
  background(127);
  for(int i = 0; i < circles.size(); ++i){
    for(int j = 0; j < circles.get(i).size(); ++j){
      circles.get(i).get(j).update();
      circles.get(i).get(j).render();
    }
  }
}

class Circle {
  float x_;
  float y_;
  float vx_;
  float vy_;
  float size_;
  color color_;
  Circle target_;

  Circle(float x, float y, float size, color c, Circle target) {
    x_ = x;
    y_ = y;
    size_ = size;
    color_ = c;
    target_ = target;
  }
  
  void render() {
    noStroke();
    fill(color_);
    ellipse(x_, y_, size_, size_);
  }
  
  void update(){
    float dx;
    float dy;
    float d;
    float mind;
    if(target_ == null){
      dx = mouseX-x_;
      dy = mouseY-y_;
      mind = 150;
    }else{
      dx = target_.x_ - x_;
      dy = target_.y_ - y_;
      mind=(size_+target_.size_)/2;
    }
    d = sqrt(dx*dx+dy*dy);
    
    vx_ += dx*d/8000;
    vy_ += dy*d/8000;
     
    if(d > mind){
      vx_ += mind*dx/d/80;
      vy_ += mind*dy/d/80;
    }
    vx_ += random(0.6)-0.3;
    vy_ += random(0.6)-0.3;
    
    vx_ *= 0.8;
    vy_ *= 0.8;
    x_ += vx_;
    y_ += vy_;
   
  }
  
//  void update(){
//    if(axis[0] != axis[2]){
//    // Calculate force due to axis
//    float slope = (axis[3]-axis[1])/(axis[2]-axis[0]);
//    float intercept = axis[1]-slope*(axis[0]);
//    float a = -slope;
//    float b = 1;
//    float c = -intercept;
//    float dist = (a*x_+b*y_+c)/sqrt(a*a+b*b);
//    float dx = dist/sqrt(1+slope*slope);
//    float dy = -(1/slope)*dx;
//    float xIntercept = x_+dx;
//    float yIntercept = y_+dy;
//    //
//    
//    // deal with forces now
//    float f = force(dist);
//    float ac = accel(f);
//    
//    vx_ += dx/abs(dist)*ac;
//    vy_ += dy/abs(dist)*ac;
//    
//    // move around
//    x_ += vx_;
//    y_ += vy_;
//    
//    // dampen and randomize
//    vx_ *= 0.9;
//    vy_ *= 0.9;
//    vx_ += dx/abs(dist)*random(1);
//    vy_ += dy/abs(dist)*random(1);
//    
//    // forces due to mouse
//    float dtomouse = sqrt((mouseX-x_)*(mouseX-x_)+(mouseY-y_)*(mouseY-y_));
//    vx_ -= (1/(size_*size_))*(1/dtomouse)*(mouseX-x_)*10000/2;
//    vy_ -= (1/(size_*size_))*(1/dtomouse)*(mouseY-y_)*10000/2;
//    
//    // forces to keep the circles on screen
//    if(x_<min(axis[0],axis[2]) || y_<min(axis[1],axis[3]) || x_>max(axis[0],axis[2]) || y_>max(axis[1],axis[3])){
//      float midx = (axis[0]+axis[2])/2;
//      float midy = (axis[1]+axis[3])/2;
//      float dtomid = sqrt((midx-x_)*(midx-x_)+(midy-y_)*(midy-y_));
//      
//     
//      vx_ += (1/(size_*size_))*(1/dtomid)*(midy-x_)*10000;
//      vy_ += (1/(size_*size_))*(1/dtomid)*(midy-y_)*10000;
//    }
//    }
//  }
//  
//  float force(float d){
//    return d;
//  }
//  
//  float accel(float f){
//    return f/(size_);
//  }
}





float diam = 30;
float grow = 1.1;
float shrink = .9;
float max_diam = 100;
float min_diam = 10;

float color_wheel = 360;

float h = 0;
float s = color_wheel;
float b = color_wheel;
float h_incr = 1;

boolean doidraw = false;
boolean grow_flag = false;

void setup() {
   size(600,600);
   background(0);
   noStroke();
   colorMode(HSB,color_wheel);
}

void draw() {
  
  if(grow_flag == true)
      if (grow_flag == true){
    diam = diam * grow;
    h = h + h_incr;
    if (h >= color_wheel){
      h = h - color_wheel;
    }
  
  }
  if(grow_flag == false){
    diam = diam * shrink;
  }
  
   if(doidraw == true){
     fill(h,s,b);
    ellipse(mouseX,mouseY,diam,diam);
    //doidraw = false;
  }
  
  if (diam > max_diam){
    grow_flag = false;
  }
  if (diam < min_diam){
    grow_flag = true;
  }
}

void mousePressed () {
  doidraw = true;
  grow_flag = !grow_flag;
}

void mouseReleased() {
  doidraw = false;
}


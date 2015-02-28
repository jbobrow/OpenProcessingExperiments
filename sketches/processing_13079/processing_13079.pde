
int num=99;//ball number
Ball[] ball=new Ball[num];

// Global gravity variable
float gravity = 0.05;  
int track=50;
float[] dir=new float[num];
int[] c=new int[num];

void setup() { 
  size(600,400); 
  smooth();
// Create ball objects
for (int i=0;i<num;i++){
  ball[i] = new Ball(width/2,height/2,50);
  dir[i]=random(-PI,PI); //initial move directions;
  c[i]=int(random(0,255)); //balls colors;
}
} 

void draw() { 
  background(60); 
  
 for (int i=0;i<num;i++){
  // Display ball objects
  ball[i].display(c[i]);
  // Move ball objects
  ball[i].update(dir[i]);
} 
}

class Ball{
  float x;       // x location of square 
  float y;       // y location of square 
  float speed;   // speed of square 
  float w;       // size
  //change move direction when hit boundarys
  int jumpx=0; 
  int jumpy=0;
  
  // Ball constuctor
  Ball(float tempX, float tempY, float tempW) {
    x = tempX;
    y = tempY;
    w = random(tempW/3,tempW);
    speed = 0;
  }

  void display(int co) {
    // Display the square 
    noStroke(); 
    fill(255,co,co/2); 
    ellipse(x,y,w,w); 
    } 

  void update(float d) {
    // Add speed to location
    x = x + cos(d)*speed*pow(-1,jumpx); 
    y = y + sin(d)*speed*pow(-1,jumpy); 
   
    // Add gravity to speed
    speed = speed + gravity; 
    // If square reaches the bottom 
    // Reverse speed 
    if (y > height-w/2) { 
      speed = speed * -1; 
      jumpx=jumpx+1;
    } 
    if (y < w/2) { 
      speed = speed * -1; 
      jumpx=jumpx+1;
    } 
    if (x >width- w/2) { 
      speed = speed * -1; 
      jumpy=jumpy+1;
    } 
    if (x < w/2) { 
      speed = speed * -1; 
      jumpy=jumpy+1;
    } 
  }
}

void mouseDragged(){
  for (int i=0;i<num;i++){
  dir[int(random(0,num))]= atan2(mouseY-height/2, mouseX-width/2);
}
}

                
                                                                

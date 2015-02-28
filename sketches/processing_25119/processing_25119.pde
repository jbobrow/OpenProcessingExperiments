

int num=10;
Ball[]myBall = new Ball[num];//define class ,number of flowers
color[] myColors = new color[5];
float a=0;

void setup() {
  size(600, 600);
  smooth();
  
  myColors[0] = color (254,67,101);
  myColors[1] = color (252,157,154);
  myColors[2] = color (249,205,173);
  myColors[3] = color (200,200,169);
  myColors[4] = color (131,175,155);
  
   for(int i=0;i<myBall.length;i++){
   myBall[i]= new Ball();
}
}

void draw() {
background(50);
  frameRate(100);

 for(int i=0; i < myBall.length; i++) {
    myBall[i].update();
    myBall[i].draw();
  }
}

void flower(float xpos,float ypos,float radius){
translate(xpos,ypos);
rotate(2*PI/3);
branch(radius);
rotate(-2*PI/3);
branch(radius);
rotate(4*PI/3);
branch(radius);
}

void branch(float h) {
  // Each branch will be 2/3rds the size of the previous one
  h *= 0.6;
  // All recursive functions must have an exit condition!!!!
  // Here, ours is when the length of the branch is 2 pixels or less
  if (h > 2) {
    pushMatrix();    // Save the current state of transformation (i.e. where are we now)
    rotate(0.5);   // Rotate by theta
    line(0, 0, 0, -h);  // Draw the branch
    translate(0, -h); // Move to the end of the branch
    branch(h);       // Ok, now call myself to draw two new branches!!
    popMatrix();     // Whenever we get back here, we "pop" in order to restore the previous matrix state
    
    // Repeat the same thing, only branch off to the "left" this time!
    pushMatrix();
    rotate(-0.5);
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
  }
}
    
 class Ball {
  float x=random(50,width-50); 
  float y=random(50,height-50); 
  float Size=random(10,20);
  color col = myColors[floor(random(0,5))];
  Ball(){
}

  void update() {
    Size+=1;
   if(Size>80){
      x=random(50,width-50); 
       y=random(50,height-50);
     Size=random(0,30);
   }
  }

 void draw() {
    stroke(col);
    strokeWeight(random(1,5));
    flower(x,y,Size);
     
  }
}   

 


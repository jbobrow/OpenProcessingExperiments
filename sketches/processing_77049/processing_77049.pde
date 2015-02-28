
// Riho Mineta
// Midterm Project
// Bad Trip

int num_part = 10;
int time = 25000;
Vomit [] greenballs = new Vomit[num_part];
Vomit [] moreballs = new Vomit [num_part];
Raindrop[] raindrops = new Raindrop[200];
Boolean isSetup = false;

void setup() {
  background(0);
  size(500, 700);
  
  //face
  fill(255, 247, 0);
  ellipse(width/2, height/2 - 80, 200, 200);
  
  for(int q = 0; q<raindrops.length; q++) {
    raindrops[q] = new Raindrop(random(5));
  }
  for (int i = 0; i<num_part; i++) {
    float x = width/2;
    float y = height/2;
  }
  
}


void draw() {
    fill (0);
  strokeWeight(10);
  line (200, 240, 225, 270);
  line (225, 240, 200, 270);
  line (275, 240, 300, 270);
  line (300, 240, 275, 270);
  
  strokeWeight(1);
  fill(255);
  int currentTime = millis();
  if (currentTime > time) {
    for(int q = 0; q<raindrops.length; q++)
    raindrops[q].raining();
  }
 


//colorful dots
noStroke();
fill(random(255), random(255), random(255), 30);
ellipse (random(width), mouseY, 80, 80);


  if (mousePressed == true) {
    //this sets up all the particles
    for (int i = 0; i<num_part; i++) {
      greenballs[i] = new Vomit(width/2, height/2 + 10);
      moreballs[i] = new Vomit (width/2, height/2);
    }
    isSetup = true;//we have to use this to check if they are setup or not
  }
  if (isSetup == true) { //if setup, then move and display them
    for (int i = 0; i<num_part; i= i+1) {
      greenballs[i].move();
      greenballs[i].display();
      moreballs[i].move();
      moreballs[i].display2();
    }
  }
  int timer = millis();
  println(timer); 

  }


 
class Vomit {
  float x_pos;
  float y_pos;
  float x_speed;
  float y_speed;
 
  Vomit (int _x, int _y) {
    x_pos = _x;
    y_pos = _y;
    x_speed += random(-1, 1);
    y_speed += random(-3, 2);
  }//end constructor. It should only run once when you setup the particle, like the setup() function
  //
  
  void move() {//i use update to do math. In this case move the particle
    x_pos = x_pos + x_speed;
    y_pos = y_pos + y_speed;
    y_speed += .1;//this makes it behave like gravity.
       if (y_pos > height - 12.5) {
   y_speed = y_speed * -1;//bounce
   y_speed = y_speed *.8;//lose a bit of bounce
   y_pos = height - 12.5;
  }
  }//end update
  
  void display() {//if you wanted to draw a different shape, this is where you would do it
  stroke(115,247,65);
  strokeWeight(1);
  fill(random(255), random(0), random(255), 40);
    ellipse(x_pos, y_pos, 15, 15);
  }//display
  
  void display2() {
  stroke(255);
  strokeWeight(1);
  fill(random(0), random(255), random(0), 20);
  ellipse (x_pos, y_pos, 25, 25);
  }
}//end of class


class Raindrop{
  float x = 0;
  float y = 0;
  float m = 0;
   
  public Raindrop(float m){
    this.x=random(width);
    this.y=random(height);
    this.m=m;
  }
   
  public void raining(){
    fill(225);
    ellipse(x,y,random(5),random(10));
     
     
    if(y<height){
      y+=m;
    }else{
      y=0;
    }
  } 
}

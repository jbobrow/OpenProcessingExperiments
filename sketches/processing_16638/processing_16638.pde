
//Hello everybody, this is my little creature but in object oriented programming.
Face[] faceParts = new Face[20];
int s=100;

//defining the setup
void setup() {
  size(500,500);
  smooth();
  for (int i=0; i<20;i++) {
    faceParts[i] = new Face(color(0),int(random(0,700)), int(random(0,700)), int(random(0,5)), int(random(0,5)));
  
  }//end of the for-loop
}//end of void setup

void draw() {
  //list of functions which are called
  background(255);
  
  //The bounce between the Fireflies
  for (int i = 0; i < 20; i++) 
  {
   faceParts[i].display();
   faceParts[i].move();
    for (int j = 0; j < 20; j++) 
    {
      float distance =
        dist(faceParts[i].x_position+s*0.15,faceParts[i].y_position+s*0.15,faceParts[j].x_position+s*0.15,faceParts[j].y_position+s*0.15);
      if (i!=j && distance < faceParts[i].s * 0.25 + faceParts[j].s * 0.25) {  //radius = 1.2
        float xi = faceParts[i].x_speed;
        float yi = faceParts[i].y_speed;

        faceParts[i].x_speed = faceParts[j].x_speed;
        faceParts[i].y_speed = faceParts[j].y_speed;

        faceParts[j].x_speed = xi;
        faceParts[j].y_speed = yi;
      }
    }
  }
  }


class Face {
  
  float x_position, y_position; 
  float x_speed, y_speed;
  color c;
  float r, g, b;
  int s;
  
  Face(color tempC, float tempX, float tempY, float tempXspeed, float tempYspeed) {
    c = tempC;
    x_position = tempX;
    y_position = tempY;
    x_speed = tempXspeed;
    y_speed = tempYspeed;
    s = 100;
  }
  
  //defining the eyes
  void display() {
    fill(255);
    stroke(0);
    strokeWeight(2);
    ellipse(x_position,y_position,s*0.20,s*0.10);
    ellipse(x_position+s*0.3,y_position,s*0.20,s*0.10);
  
  //defining the pupils
    fill(0);
    stroke(162,0,0);
    strokeWeight(2);
    ellipse(x_position,y_position,s*0.08,s*0.08);
    ellipse(x_position+s*0.3,y_position,s*0.08,s*0.08);
  
  //display the eyebrows
    rectMode(CENTER);
    stroke(0);
    rect(x_position,y_position-s*0.1,s*0.20,s*0.01);
    rect(x_position+s*0.3,y_position-s*0.1,s*0.20,s*0.01);
  
    
  //display the nose
  rectMode(CENTER);
  rect(x_position+s*0.15,y_position+s*0.15,s*0.03,s*0.12);
  
  //display mouth
  ellipse(x_position+s*0.15,y_position+s*0.3,s*0.40,s*0.08);
  }//end of void display
  
  //let the ellipses bounce
  void move()
  {
    //move faceParts
    x_position +=  x_speed;
    y_position +=  y_speed;

    //bounce faceParts
    if (x_position > width || x_position < 0 ) x_speed = -x_speed;
    if (y_position > height || y_position < 0 ) y_speed = -y_speed;
    
    if (mousePressed == true) {
      x_position =random(100,400); //x_position - xspeed;
      y_position =random(100,400); //y_position - yspeed;
      
 }//end of mousePressed
 }//end of void move
}//end of class




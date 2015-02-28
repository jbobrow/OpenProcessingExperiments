
//This is my happy happy smiley face bouncing through the screen.
smiley[] smileyParts = new smiley[20];
int s=100;

void setup() {
  size(500,500);
  smooth();
  for (int i=0; i<20;i++) {
    smileyParts[i] = new smiley(color(0),int(random(0,400)), int(random(0,400)), int(random(0,8)), int(random(0,8)));
  }  //random places and random speed
}

void draw() {
  background(50,50,50);
  
  //bounce between smileys
  for (int i = 0; i < 20; i++) {
    smileyParts[i].display();
    smileyParts[i].move();
    for (int j = 0; j < 20; j++) {
      float distance = 
        dist(smileyParts[i].x_position+s-2,smileyParts[i].y_position+s-2,smileyParts[j].x_position+s-2,smileyParts[j].y_position+s-2);
      if (i!=j && distance < smileyParts[i].s*0.25 + smileyParts[j].s*0.25) {
        float xi = smileyParts[i].x_speed;
        float yi = smileyParts[i].y_speed;
        
        smileyParts[i].x_speed = smileyParts[j].x_speed;
        smileyParts[i].y_speed = smileyParts[j].y_speed;

        smileyParts[j].x_speed = xi;
        smileyParts[j].y_speed = yi;
      }
    }
  }
}
        
class smiley {
  
  float x_position, y_position;
  float x_speed, y_speed;
  color c;
  float r, g, b;
  int s;
  
  smiley(color tempC, float tempX, float tempY, float tempXspeed, float tempYspeed) {
    c = tempC;
    x_position = tempX;
    y_position = tempY;
    x_speed = tempXspeed;
    y_speed = tempYspeed;
    s = 100;
  }
  
  void display() {
    //the face
    ellipseMode(CENTER);
    fill(255,247,3);
    stroke(0);
    ellipse(x_position,y_position,40,40);
        
    //mouth
    ellipseMode(CENTER);
    fill(0);
    ellipse(x_position,y_position,33,33);
    
    //mouth cover
    rectMode(CENTER);
    noStroke();
    fill(255,247,3);
    rect(x_position,y_position,36,10);
    rect(x_position,y_position-5,32,10);
    rect(x_position,y_position-10,24,10);
    rect(x_position,y_position-15,18,9/2);
    
    //eye white
    ellipseMode(CENTER);
    fill(255);
    stroke(0);
    ellipse(x_position-7,y_position-6,10,15);
    ellipse(x_position+7,y_position-6,10,15);
    
    //eye black
    ellipseMode(CENTER);
    fill(0);
    ellipse(x_position-5,y_position-9,5,5);
    ellipse(x_position+9,y_position-9,5,5);
}

  void move()
  {
    //move smileys
    x_position +=  x_speed;
    y_position +=  y_speed;

    //bounce Smileys of the walls
    if (x_position > width-20 || x_position < 20 ) x_speed = -x_speed;
    if (y_position > height-20 || y_position < 20 ) y_speed = -y_speed;

 }
}



color c = color(0,255,0);
float x = 100;
float y = 0;
float speed = 2;

void setup() {
    size(400, 400);   
}
void draw() {
    background(255);
    move();
    display();
    stroke(0);
    fill(0,0,255);
    rectMode(CENTER);
    rect(width/2, height/2, 50, 100);
    rect(160, 112.5, 2.5, 5);
    rect(239, 112.5, 2.5, 5);
    ellipse(200, 112.5, 75, 75);
    ellipse(185, 102.5, 15, 20);
    ellipse(215, 102.5, 15, 20);
    line(225, 250, 255, 350);
    line(175, 250, 145, 350);
    line(175, 160, 120, 180);
    line(120, 180, 100, 115);
    line(225, 160, 275, 190);
    line(275, 190, 225, 225);
    
}
void move() {
    y = y + speed;
  if (y >= 90) {
  y = 90
  }  
}
void display() {
    fill(c);
    ellipse(x,y,50,50)
}    
     
                
                
                                                

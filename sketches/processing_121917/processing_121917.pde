

float x, y;
float x_velocity, y_velocity;
float gravity;
float radius;
int counter;
int HScounter;
boolean dead = false;
color bg = color(55);
float alpha;

void setup()

{
    textFont(createFont("Ariel", 25));
    size(600, 300);
    x = 2;
    y = 10;
    x_velocity = random(-10, 10);
    y_velocity = random(-10, 0);
    gravity = .2;
    radius = 25;
    counter = 0;
}

void draw(){
  
background(bg);
    
    y_velocity += gravity;
    x += x_velocity ;
    y += y_velocity ;
    
    if ( y>(height-radius) )
      {
      y = height-radius;
      y_velocity *= -0.7;
      counter = 0;
      radius = 25;
      dead = true;
       }
       
       if ( x<radius )
          {
            x = radius;
            x_velocity *= -0.5;
          }
          
            if ( x>(width-radius) )
            {
            x = width-radius;
            x_velocity *= -0.5;
            }
            
              ball(x, y);
              stroke(1);
              text("Clicks: " + counter, 10, 290);
              text("HighScore: " + HScounter, 420, 30);
              color(255, 0, 0, alpha);
              
                if(dead){
                  text("Try Again", 200, 100);
                  }
                     
                    if(counter >= HScounter){
                       HScounter = counter;
                       }
}

void ball(float x, float y)
{
  
    pushMatrix();
    translate(x, y);
    ellipseMode(RADIUS);
    ellipse(0, 0, radius, radius);
    popMatrix();
    
}

void mousePressed() {
  if(mouseX > x - radius && mouseX < x + radius && mouseY > y-radius && mouseY < y+radius) {
     x_velocity = random(-7, 7);
    y_velocity = random(-5, -2);
    dead = false;
    gravity = .15;
    radius -= 0.5;
    counter += 1;
  }
}









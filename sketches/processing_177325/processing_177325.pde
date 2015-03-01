
float y = 0.1;
float x = 0.1;
float z = 0.1;
int value = 0;
int fraMes = 10;
int frAmes = 50;
int savedTime;
int totalTime = 10000;

void setup()
{
  
  background(255);

  size(1000, 200, P3D);
 
    
}

void draw()
{
  
  

  stroke(0);

 line(random(1000) ,mouseY, random(500), mouseX);
 
 fill(255);

 translate(mouseX, mouseY);
    rotateX(x);
    rotateY(y);
    rotateZ(z);
    box(50);
    x += random(-.1);
    y += random(-.1);

 


    
  

 

// Calculate how much time has passed
  int passedTime = millis() - savedTime;
  // Has five seconds passed?
  if (passedTime > totalTime) {

    background(255);
    savedTime = millis(); // Save the current time to restart the timer!
  }
}



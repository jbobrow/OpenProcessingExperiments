
// physics 101:
// moving an object at a certain speed is just adding a number
// to the object's postion

// making an object accelerate means every frame the speed gets
// larger by a small ammount

float y = 0;
float speed = 0;
float gravity = 0.1;

//--------------------------------------------------------
void setup() {
  size(200, 500);
  smooth();
}

//--------------------------------------------------------
void draw() {
  background(64);
  
  y = y + speed;
  speed = speed + gravity;

  ellipse(width/2, (float)y, 50, 50);
  
  if (y >= height-100) {
    // reduce the speed on every bounce to make it more 
    // realistic.. try -1 and see what happens
    speed *= -0.9;  
  }
}                               

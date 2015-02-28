
String imgUri = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAEJGlDQ1BJQ0MgUHJvZmlsZQAAOBGFVd9v21QUPolvUqQWPyBYR4eKxa9VU1u5GxqtxgZJk6XtShal6dgqJOQ6N4mpGwfb6baqT3uBNwb8AUDZAw9IPCENBmJ72fbAtElThyqqSUh76MQPISbtBVXhu3ZiJ1PEXPX6yznfOec7517bRD1fabWaGVWIlquunc8klZOnFpSeTYrSs9RLA9Sr6U4tkcvNEi7BFffO6+EdigjL7ZHu/k72I796i9zRiSJPwG4VHX0Z+AxRzNRrtksUvwf7+Gm3BtzzHPDTNgQCqwKXfZwSeNHHJz1OIT8JjtAq6xWtCLwGPLzYZi+3YV8DGMiT4VVuG7oiZpGzrZJhcs/hL49xtzH/Dy6bdfTsXYNY+5yluWO4D4neK/ZUvok/17X0HPBLsF+vuUlhfwX4j/rSfAJ4H1H0qZJ9dN7nR19frRTeBt4Fe9FwpwtN+2p1MXscGLHR9SXrmMgjONd1ZxKzpBeA71b4tNhj6JGoyFNp4GHgwUp9qplfmnFW5oTdy7NamcwCI49kv6fN5IAHgD+0rbyoBc3SOjczohbyS1drbq6pQdqumllRC/0ymTtej8gpbbuVwpQfyw66dqEZyxZKxtHpJn+tZnpnEdrYBbueF9qQn93S7HQGGHnYP7w6L+YGHNtd1FJitqPAR+hERCNOFi1i1alKO6RQnjKUxL1GNjwlMsiEhcPLYTEiT9ISbN15OY/jx4SMshe9LaJRpTvHr3C/ybFYP1PZAfwfYrPsMBtnE6SwN9ib7AhLwTrBDgUKcm06FSrTfSj187xPdVQWOk5Q8vxAfSiIUc7Z7xr6zY/+hpqwSyv0I0/QMTRb7RMgBxNodTfSPqdraz/sDjzKBrv4zu2+a2t0/HHzjd2Lbcc2sG7GtsL42K+xLfxtUgI7YHqKlqHK8HbCCXgjHT1cAdMlDetv4FnQ2lLasaOl6vmB0CMmwT/IPszSueHQqv6i/qluqF+oF9TfO2qEGTumJH0qfSv9KH0nfS/9TIp0Wboi/SRdlb6RLgU5u++9nyXYe69fYRPdil1o1WufNSdTTsp75BfllPy8/LI8G7AUuV8ek6fkvfDsCfbNDP0dvRh0CrNqTbV7LfEEGDQPJQadBtfGVMWEq3QWWdufk6ZSNsjG2PQjp3ZcnOWWing6noonSInvi0/Ex+IzAreevPhe+CawpgP1/pMTMDo64G0sTCXIM+KdOnFWRfQKdJvQzV1+Bt8OokmrdtY2yhVX2a+qrykJfMq4Ml3VR4cVzTQVz+UoNne4vcKLoyS+gyKO6EHe+75Fdt0Mbe5bRIf/wjvrVmhbqBN97RD1vxrahvBOfOYzoosH9bq94uejSOQGkVM6sN/7HelL4t10t9F4gPdVzydEOx83Gv+uNxo7XyL/FtFl8z9ZAHF4bBsrEwAAAMJJREFUOBGdk9EJwkAQRC+SHvzwyy7sI2AnkhrETgT7SBf5yoc9CJoR3rJc9k68g7Cb3Zm52SXprqf+nRrPOL1SL+552DdJjNOSdjCPl4X0Z/TYrwMx5tvBiPfH03IS79JjzQFAyJqPRz3q4IgbARqKusnf5q2DqwoAqkXbASDN6m8qWQe/EVAD25C1i9IJBSIwonmvKpCPk5P1Xl2iRlg/dRvpbwEIfqnUiOYgAmmEaIEeazsoLSmq+1q3Wmn+nTXGB7NuP4WmMeWDAAAAAElFTkSuQmCC";

PImage tex;
PImage out;
PImage darkOverlay;

PVector acceleration = new PVector(0, 0);
PVector velocity = new PVector(0, 0);
PVector position = new PVector(0, 0);

// start at 100 to avoid having to flip x
float offset = 100.0f;

void setup() {
  size(550, 310);

  tex = loadImage(imgUri);
  out = createImage(width, height, RGB); 
  darkOverlay = createImage(width, height, ARGB);

  darkOverlay.loadPixels();
  for (int y = 0; y < height; y++) {
    float c = 1.0 - abs((y / (float)height) * 2.0 - 1.0f); 
    for (int x = 0; x < width; x++) {
      darkOverlay.pixels[y * width + x] = color(0, c * 255.0f );
    }
  }
  darkOverlay.updatePixels();
}

color texture2D(float x, float y, boolean flip) {

  int ix = ((int)abs(x)) % tex.width;
  int iy = ((int)abs(y)) % tex.height;

  if (flip) {
    iy = tex.height - iy - 1;
  }

  return tex.pixels[iy * tex.width + ix];
}


void update() {

  acceleration.set(mouseX - width/2.0, mouseY - height/2.0);
  acceleration.normalize();
  
  acceleration.x /= 200.0f;
  acceleration.y /= 200.0f;
  
  velocity.x += acceleration.x;
  velocity.y += acceleration.y;

  limit(velocity, 10);
  
  position.x += velocity.x / 20.0f;
  position.y += velocity.y / 20.0f;
  
  float cx;
  float cy;

  // out.loadPixels(); for p5
  int x = 0;
  float y = 0;
    
  for(int i = 0; i < width * height; i++,x++){
    if(x >= width){
      y++;
      x = 0;
    }
    cx = (x/(float)width) * 2.0f - 1.0f;
    cy = (y/(float)height) * 2.0f - 1.0f;

    float deformy = abs(1.0/cy) * 10; 
    float deformx = cx * deformy;
    color c = texture2D(deformx + position.x, deformy - position.y, y > height/2);
    out.pixels[i]  = c;
  }
  
  //out.updatePixels(); for p5
}

void limit(PVector v, float m) {
  if (v.mag() > m)
  {
    v.normalize();
    v.mult(m);
  }
}
void draw() {
  update();
  image(out, 0, 0);
  image(darkOverlay, 0, 0);
}


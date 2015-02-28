
/*
Copyright Lucas Walter 2012

This work is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by 
the Free Software Foundation; either version 2 of the License, or any later version.
This work is distributed in the hope that it will be useful, but without any warranty; without even the implied warranty of 
merchantability or fitness for a particular purpose. See version 2 and version 3 of the GNU General Public License for more details. 
You should have received a copy of the GNU General Public License along with this program; 
if not, write to the Free Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
*/
int NUM_CARS=1;
float world_y = 450; //500; //1080;
float world_x = 900; // 400; //1920;

float STEER_MAX = 2.5*PI/8.0;

void drawRotatedRect(float x, float y, float wd, float ht, float wd_off, float angle, float x_off, float y_off, float angle2)
{
  pushMatrix();
  translate(x,y);
  rotate(-angle);
  translate(x_off,y_off);
  rotate(-angle2);
  rect(wd_off, -ht/2, wd, ht);
  
  popMatrix();
  return;
}

class Car {
  float x;
  float y;
  float orientation;
  
  float steering_angle;
  float forward_vel;
  
  float xc;
  float yc;
  
  int wd;
  int ht;
  
  color col;
  //float old_x;
  //float old_y;
  
  float steer_noise_offset;
  float forward_noise_offset;
  
  Car(float x, float y) {
    this.x = x;
    this.y = y; 
    wd = 36;
    ht = 64;
    
    orientation = 0;
    
    steering_angle = 0;
    
    steer_noise_offset = 0;
    forward_noise_offset = 0;
    
    col = color(100 + random(20),200 + random(55),150 + random(95));
  }
  
  void move(float steering_delta, float forward_acc) 
  {
    steering_angle += steering_delta;
    
    forward_vel += forward_acc;
    
    if (forward_vel > ht/13.0) {
      forward_noise_offset = random(10000);
      forward_vel = ht/13.0;
    }
    if (forward_vel < -ht/60.0) { 
      forward_vel = -ht/60.0;
      forward_noise_offset = random(10000);
    }
    
    if (steering_angle > STEER_MAX) {
      steering_angle = STEER_MAX;
      steer_noise_offset = random(10000); 
    }
    if (steering_angle < -STEER_MAX) { 
      steering_angle = -STEER_MAX; 
      steer_noise_offset = random(10000);
    }
        
    float xp = x + forward_vel * cos(-orientation);
    float yp = y + forward_vel * sin(-orientation);
    float orientationp = orientation;
       
    xc = x;
    yc = y;
    
    if (abs(steering_angle) > 0.15) {
            float r = ht/tan(steering_angle);
        
            xc = x - r * cos (-orientation - PI/2.0);
            yc = y - r * sin (-orientation - PI/2.0);
        
            float psi = forward_vel/r;
        
            xp = xc + r * cos(-orientation - PI/2.0 + psi);
            yp = yc + r * sin(-orientation - PI/2.0 + psi);
            
            orientationp = orientation + psi;
            
            orientationp %= 2*PI;        
            
            // TBD the xc, yc above are in wrong direction but motion comes out okay
            xc = x + r * cos (-orientation - PI/2.0);
            yc = y + r * sin (-orientation - PI/2.0);
      }
      
      x = xp;
      y = yp;
      orientation = orientationp;
      
    if (y >= world_y) {
      y -= world_y; 
    }
    if (y < 0) {
      y += world_y; 
    }
    
    if (x >= world_x) {
      x -= world_x; 
    }
    if (x < 0) {
      x += world_x; 
    }
      
                 
  }
  
  void draw() {
    
    
    fill(col);
//    noStroke();
    stroke(0,20);
    
    drawRotatedRect(x,y, ht,wd, 0, orientation,0,0,0);

    // draw tires    
    fill(225, 255,225,255);
    stroke(0,35);
    
    // rear tires
    drawRotatedRect(x,y, ht/4, wd/4, 0, orientation , 0, -wd/2 + wd/8, 0);    
    drawRotatedRect(x,y, ht/4, wd/4, 0, orientation , 0,  wd/2 - wd/8, 0); 
    
    // steering tires
    drawRotatedRect(x,y, ht/4, wd/4, -wd/8, orientation , ht - ht/8, -wd/2 + wd/8, steering_angle);    
    drawRotatedRect(x,y, ht/4, wd/4, -wd/8, orientation , ht - ht/8,  wd/2 - wd/8, steering_angle);    
//    drawRotatedRect(x,y, ht/4, wd/4, orientation , ht/2, -wd/2, steering_angle);    
  //  drawRotatedRect(x,y, ht/4, wd/4, orientation , ht/2,  wd/2, steering_angle);    
    
    stroke(255,100,0);
    ellipse(xc,yc, 3,3);
    stroke(205,0,30);
    line(x,y, xc,yc);
    //rect(offx+x-wd/2,offy+y-ht/2, wd,ht); 
  }
  
};

ArrayList cars;

void setup() {
size(900,450);
//   size(int(world_x),int(world_y));
  
  background(0);
  
  cars = new ArrayList();
 
  for (int i = 0; i < NUM_CARS; i++) {
      cars.add(new Car( world_x/4.0 + random(world_x/2.0), world_y/4.0 + random(world_y/2.0)));
  }
  
  frameRate(25);
}

float t = 0;

int MANUAL_CONTROL_IND = -1;
float manual_steer_acc = 0;
float manual_forward_acc = 0;

void update() {
  
  if (keyPressed) {
    
    if (keyCode == UP) {
      manual_forward_acc += 0.015;
    }
    
    if (keyCode == DOWN) {
      manual_forward_acc -= 0.025;
    }
    
    if (keyCode == RIGHT) {
      manual_steer_acc -= 0.01;
    }
    if (keyCode == LEFT) {
      manual_steer_acc += 0.01;
    }
    
  } else {       
    manual_forward_acc *= 0.8;
    manual_steer_acc *= 0.5;
  }

  t+= 0.001;
    for (int i = cars.size()-1; i >= 0; i--) {
      Car car = (Car) cars.get(i);
      
      if (i != MANUAL_CONTROL_IND) { 
      
      
      float steer_acc = noise(t*55.0 + i * 10.0 + car.steer_noise_offset) -0.5;
      float forward_acc = noise(t + i * 100.0 +10000 + car.forward_noise_offset) - 0.5;
      //println(i + " " + steer_acc + " " + forward_acc);
      steer_acc += random(-0.1,0.1);
      forward_acc += random(-0.1,0.1);
      steer_acc /= 3.0;
      forward_acc /= 5.0;
      car.move(steer_acc, forward_acc);
      
      } else {
        car.move(manual_steer_acc, manual_forward_acc);
        car.steering_angle *= 0.98;
        car.forward_vel *= 0.99;
 
      }
      
   }
}

void keyPressed() 
{
  if (key == 's') {
    if (MANUAL_CONTROL_IND < 0) {
      MANUAL_CONTROL_IND = 0;
    } else {
      MANUAL_CONTROL_IND = -1;
    }
  }
  if (key == 'a') {
    MANUAL_CONTROL_IND = -1;
  }
  if (key == 'm') {
    MANUAL_CONTROL_IND = 0;
  }
   if (keyCode == UP) {
      manual_forward_acc += 0.12;
    }
    
    if (keyCode == DOWN) {
      manual_forward_acc -= 0.20;
    }
    
    if (keyCode == RIGHT) {
      manual_steer_acc -= 0.075;
    }
    if (keyCode == LEFT) {
      manual_steer_acc += 0.075;
    }
}



void draw() {
  fill(0, 0, 0, 1);
  rect(0,0,width,height);
  loadPixels();
  
   update();
   
    for (int i = cars.size()-1; i >= 0; i--) { 
    // An ArrayList doesn't know what it is storing so we have to cast the object coming out
    Car car = (Car) cars.get(i);
    
    car.draw();
    }
  
  //saveFrame("highwayr#####.png"); 
}


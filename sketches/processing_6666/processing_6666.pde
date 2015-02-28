

Cloud points;

void setup(){
  size(500, 500, P3D);
  points = new Cloud();
}

void draw(){
  background(0);
  directionalLight(255, 255, 255, 1, 0, -1);
  translate(width/2, height/2,-1500);
  rotateY(frameCount*0.005);
  points.display();
}

class Cloud{
  int num = 8000;
  float speedx = random(-10, 10);
  float speedy = random(-10, 10);
  float speedz = random(-10, 10);
  PVector[] loc = new PVector[num];
  PVector ball = new PVector(random(-300, 300), random(-300, 300), random(-300, 300));
  PVector[] d = new PVector[num];
  PVector[]l=new PVector[num];
  PVector[]crss = new PVector[num];
  PVector[]direction = new PVector[num];
  float []theta = new float[num];

  Cloud(){
    for(int i = 0; i < num; i++){
      loc[i] = new PVector(random(-500, 500), random(-500, 500), random(-500, 500));
    }
  }

  void display(){
    for(int i = 0; i < num; i++){
      pushMatrix();
      direction[i] = PVector.sub(loc[i], ball);
      d[i] = direction[i].get();
      l[i] = new PVector(0, loc[i].y, 0);
      crss[i] = l[i].cross(direction[i]);
      d[i].normalize();
      crss[i].normalize();
      l[i].normalize();
      theta[i] = PVector.angleBetween(l[i], d[i]);
      popMatrix();
    }

    for(int i = 0; i < num; i++){
      pushMatrix();
      translate(loc[i].x, loc[i].y, loc[i].z);
      rotate(theta[i], crss[i].x, crss[i].y, crss[i].z);

      if(loc[i].y > 0){
        beginShape(LINES);
        stroke(10);
        vertex(0, 0, 0);
        stroke(255);
        vertex(0, 250, 0);
        endShape();
      }

      if(loc[i].y < 0){
        beginShape(LINES);
        stroke(255);
        vertex(0, -250, 0);
        stroke(10);
        vertex(0, 0, 0);
        endShape();
      } 
      popMatrix();  
    }
    noStroke();
    fill(255, 0, 0);
    translate(ball.x, ball.y, ball.z);
    sphere(300);
    ball.x+=speedx;
    if(ball.x > 500){
      speedx*=random(-1.1, -0.9);
    }
    if(ball.x < -500){
      speedx*=random(-1.1, -0.9);
    }
    ball.y+=speedy;
    if(ball.y > 500){
      speedy*=random(-1.1, -0.9);
    }
    if(ball.y < -500){
      speedy*=random(-1.1, -0.9);
    }
    ball.z+=speedz;
    if(ball.z > 500){
      speedz*=random(-1.1, -0.9);
    }
    if(ball.z < -500){
      speedz*=random(-1.1, -0.9);
    }
    if(mousePressed == true){
      ball.set(0, 0, 0);
      speedx = random(-10, 10);
      speedy = random(-10, 10);
      speedz = random(-10, 10);
    }
    
  }
}







Orbiter[] orbiter0 = new Orbiter[int(random(2,5))];
Orbiter[] orbiter1 = new Orbiter[int(random(2,5))];
Orbiter[] orbiter2 = new Orbiter[int(random(2,5))];
Orbiter[] orbiter3 = new Orbiter[int(random(2,5))];

void setup() {
  size(860, 480);
  frameRate(10);
  
  for(int i= 0; i < orbiter0.length; i++){
    orbiter0[i] = new Orbiter(0,0,random(width/128, width/8), random(.001, .1));
  }
  
  for(int i= 0; i < orbiter1.length; i++){
    orbiter1[i] = new Orbiter(0,0,random(width/128, width/8), random(.1, 100));
  }
  
  for(int i= 0; i < orbiter2.length; i++){
    orbiter2[i] = new Orbiter(0,0,random(width/128, width/8), random(1, 1000));
  }
  
  for(int i= 0; i < orbiter3.length; i++){
    orbiter3[i] = new Orbiter(0,0,random(width/128, width/8), random(.001, .01));
  }
  
  fill(0);
  rect(0,0,width,height);
  
  strokeWeight(.25);
  
  smooth();
}

void draw() { 
  //background(0);
  //fill(0, 1);
  //rect(0,0,width,height);
  
  pushMatrix();
  translate( width * .25, height * .25);
  for(int i= 0; i < orbiter0.length; i++){
    orbiter0[i].updateOrbit();
  }
  
  for(int i= 0; i < orbiter0.length; i++){
    PVector point0 = (PVector) orbiter0[i].myObj;
    
    for (int c = 0; c < orbiter0.length; c++){
      PVector point1 = (PVector) orbiter0[c].myObj;
      stroke(255,50);
      line(point0.x, point0.y, point1.x, point1.y);
    }
  }
  popMatrix();
  
   pushMatrix();
  translate( width * .25, height * .75);
  for(int i= 0; i < orbiter1.length; i++){
    orbiter1[i].updateOrbit();
  }
  
  for(int i= 0; i < orbiter1.length; i++){
    PVector point2 = (PVector) orbiter1[i].myObj;
    
    for (int c = 0; c < orbiter1.length; c++){
      PVector point3 = (PVector) orbiter1[c].myObj;
      stroke(255,50);
      line(point2.x, point2.y, point3.x, point3.y);
    }
  }
  popMatrix();
  
   pushMatrix();
  translate( width * .75, height *.25 );
  for(int i= 0; i < orbiter2.length; i++){
    orbiter2[i].updateOrbit();
  }
  
  for(int i= 0; i < orbiter2.length; i++){
    PVector point3 = (PVector) orbiter2[i].myObj;
    
    for (int c = 0; c < orbiter2.length; c++){
      PVector point4 = (PVector) orbiter2[c].myObj;
      stroke(255,50);
      line(point3.x, point3.y, point4.x, point4.y);
    }
  }
  popMatrix();
  
  pushMatrix();
  translate( width * .75, height *.75 );
  for(int i= 0; i < orbiter3.length; i++){
    orbiter3[i].updateOrbit();
  }
  
  for(int i= 0; i < orbiter3.length; i++){
    PVector point5 = (PVector) orbiter3[i].myObj;
    
    for (int c = 0; c < orbiter3.length; c++){
      PVector point6 = (PVector) orbiter3[c].myObj;
      stroke(255,50);
      line(point5.x, point5.y, point6.x, point6.y);
    }
  }
  popMatrix();
  
  
}

class Orbiter {
  PVector myObj;
  float myRadius;
  float theta = 0;
  float speed;

  Orbiter(float tempX, float tempY, float tempRadius, float tempSpeed) {
    myObj = new PVector(tempX, tempY);
    myRadius = tempRadius;
    speed = tempSpeed;
  }

  void updateOrbit() {
    theta += speed;

    myObj.x = myRadius * cos( theta );
    myObj.y = myRadius * sin( theta );

    noFill();
    stroke( 255);
    ellipse(0, 0, myRadius*2, myRadius*2);

    noStroke();
    fill( 255 );
    ellipse( myObj.x, myObj.y, 3, 3);
  }
}


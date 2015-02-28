
class FontAgent {

  PVector loc;
  //PVector acc;
  float dia = 1.5;
  float xMove;
  float yMove;
  float theta1;
  float theta2;
  float lifespan = 255;
  float widthSize = 650;
  float heightSize = 700;

  FontAgent(PVector l) {
    loc = l.get();
    // acc = new PVector (0, 0.1);
  }

  void motion() {
    xMove += random (-6, 6);
    yMove += random(-6, 6);
    theta1 = radians(xMove);
    theta2 = radians(yMove);
    
    float newX = loc.x + cos(theta1);
    float newY = loc.y + sin(theta2);
    

    float rand1 = random(0, 1);
    
    if(rand1 > 0.5 ) {
      loc.x += cos(theta1);
    }
    else {
      loc.x -= cos(theta1); 
    }
    
    if(newY < heightSize) {
       loc.y += sin(theta2) + 03;
    }
    else {
       loc.y = heightSize-10;
    }
    
    lifespan -= 1.79;
  }  

  void display() {
    noStroke();
    fill(lifespan);

    ellipse(loc.x, loc.y, dia, dia);
  }
  
  float getLifespan () {
    return lifespan; 
  }
  
  void reset() {
    println("reset");
    lifespan = 255; 
  }
}



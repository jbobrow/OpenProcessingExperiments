
SpaceShip[] ships = new SpaceShip[0]; 
int score = 0; 

void setup() { 
  size(600, 400);
}

void draw() { 
  background(0); 
  fill(255); 
  text("score:" + score, 10,40); 

  if (frameCount % 40 == 0) { 
    SpaceShip ship = new SpaceShip(); 
    ships = (SpaceShip[]) append(ships, ship);
  }

  if (ships.length>10) { 

    ships = (SpaceShip[]) subset(ships, 1);
  }

  for (int i = 0; i<ships.length; i++) { 
    ships[i].update();
  }
}

void mousePressed() { 
  for (int i = 0; i<ships.length; i++) { 
    SpaceShip ship = ships[i]; 

    if ((mouseX>ship.x) && (mouseX<ship.x + ship.w) && (mouseY>ship.y) && (mouseY<ship.y+ship.h)) {
      ship.alive = false;
      score++; 
    }
  }
}


class SpaceShip {
  float x; 
  float y; 
  float w; 
  float h; 
  float velX; 
  float velY; 
  boolean alive; 

  SpaceShip() { 

    y = random(0, height*0.7); 
    w = 50; 
    x = width; 
    h = 20; 
    velX = -4; 
    velY = 0; 
    alive = true;
  }  

  void update() { 
    x+=velX; 
    y+=velY; 
    
    if(alive) { 
      fill(255, 0, 0); 
      stroke(255);   
    } else { 
      fill(128,0,0);  
      noStroke(); 
      velY +=0.3; 
    }
    rect(x, y, w, h);
  }
}

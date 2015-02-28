
ArrayList asteroids;
Ship ship;
StarField starField; 
int level;
float speedLimit;
int asteroid_count;
int hit_count;
float ship_speed;
PFont font;
int level_disp_counter;

void setup(){
  size(1000, 700, P2D);
  stroke(255);
  frameRate(30);
  level = 1;
  speedLimit = level;
  asteroid_count = 5+5*level;
  hit_count = 0;
  ship_speed = 50;
  level_disp_counter = 0;
  shapeMode(CENTER);
  font = createFont("FranklinGothic-Book", 72, true);
  textFont(font);
  textAlign(CENTER, CENTER);
  asteroids = new ArrayList();
  ship = new Ship();
  starField = new StarField(150, 0.1);
  starField.render();  
  //increase asteroid_count per level difficulty
  for (int i = 0; i < asteroid_count; i++)  {
    asteroids.add(new Asteroid());
  }
}

void draw(){
  background(0);
  int count = 0;
  starField.render();
  level_up();
  //text("Hit Count " + int(hit_count/10), 10, 10);
  for (Asteroid a: asteroids)  { 
    a.render();
    if(a.location.x - .75*a.diameter >= ship.x - ship.perimX && a.location.x + .75*a.diameter <= ship.x + ship.perimX){
      if(a.location.y - .75*a.diameter >= ship.y - ship.perimY && a.location.y + .75*a.diameter <= ship.y + ship.perimY){
        hit_count++;
        ship.x -= ship_speed;
        if(a.location.y > ship.y){
          ship.y -= ship_speed;          
        }
        else{
          ship.y += ship_speed;
        }
        continue;
      }
    }
    if(a.location.x > ship.x && count > 0){
      count --;
    }
    if(a.location.x < 0 || a.location.x < ship.x) {
      count ++;
      if(count == asteroid_count){
        level++;
        ship.easing = .1/level;
        level_disp_counter = 0;
        speedLimit = level;
        asteroid_count = 5+5*level;
        asteroids = new ArrayList<Asteroid>();
        for (int i = 0; i < asteroid_count; i ++)  {
          asteroids.add(new Asteroid());
        }
        count = 0;
      }
    }
  }
  ship.render();
}

void keyPressed(){
  if (key == CODED){
 
    if (keyCode == UP && ship.targetY > ship.perimY){
      ship.targetY -= ship_speed;
    }
 
    if (keyCode == DOWN && ship.targetY < height - ship.perimY){
      ship.targetY += ship_speed;
    }
 
    if (keyCode == LEFT){
      ship.targetX -= ship_speed;
    }
 
    if (keyCode == RIGHT){
      ship.targetX += ship_speed;
    }
  }

  if (key == 'y' || key == 'Y' && hit_count > 100){
    level = 1;
    speedLimit = level;
    asteroid_count = 5+5*level;
    hit_count = 0;
    ship_speed = 50;
    ship.easing = .1/level;
    level_disp_counter = 0;
    for (int i = 0; i < asteroid_count; i ++)  {
      asteroids.add(new Asteroid());
    }
  }

  if (key == 'n' || key == 'N' && hit_count > 100){
    exit();
  }
}

void level_up(){
  if (level != 11 && level_disp_counter < 60){
    textSize(level_disp_counter);
    text("LEVEL " + level, .6*width, height/2);
    level_disp_counter++;
  }
  if (level == 11 && level_disp_counter < 120){
    asteroids = new ArrayList<Asteroid>();
    textSize(.5*level_disp_counter);
    text("WOO HOO", width/2, height/2);
    level_disp_counter++;
  }
  if (level == 11 && level_disp_counter >= 120 && level_disp_counter < 240){
    textSize(.25*level_disp_counter);
    text("BET YOU'RE REAL PROUD, EH?", width/2, height/2);
    level_disp_counter++;
  }
  if (level == 11 && level_disp_counter >= 240 && level_disp_counter < 360){
    textSize(.125*level_disp_counter);
    text("DON'T BE.", width/2, height/3);
    text("IT'S A STUPID GAME.", width/2, .6*height);
    level_disp_counter++;
  }
  if (hit_count > 100 && level_disp_counter < 120){
    asteroids = new ArrayList<Asteroid>();
    textSize(.5*level_disp_counter);
    text("EPIC FAILURE", width/2, height/2);
    level_disp_counter++;
  }
  if (hit_count > 100 && level_disp_counter >= 120){
    if(level_disp_counter < 240){
      textSize(.25*level_disp_counter);
    }
    else{
      textSize(60);
    }
    text("PLAY AGAIN?", width/2, height/3);
    text("Y/N", width/2, .6*height);
    level_disp_counter++;
  }
}
class Asteroid  {
  
  PVector location;
  PVector vert1;
  PVector vert2;
  PVector vert3;
  PVector vert4;
  PVector vert5;
  float blah;
  float speed;
  float diameter;
  float a;
  float b;
  
  Asteroid()  {
     location = new PVector(random(width, 1.5*width), random(height));
     speed = random(3*speedLimit/10, speedLimit);
     diameter = random(30, 50);
     blah = random(75, 125);
     a = 0;
     b = random (-0.03, 0.03);
     vert1 = new PVector(0, 0);
     vert2 = new PVector(random(diameter/4, diameter/2), random(-diameter/4, -diameter/8));
     vert3 = new PVector(random(diameter/2, diameter), random(-diameter/8, diameter/2));
     vert4 = new PVector(random(diameter/2, diameter), random(3*diameter/4, diameter));
     vert5 = new PVector(random(-diameter/4, 0), random(diameter/4, diameter/8));
  }
  
  void render()  {
    for (Asteroid other: asteroids) {
      float d = PVector.dist(location, other.location);
      if(d > 0 && d < 1.5*diameter){
        other.b *= -1;
        if(location.y > other.location.y){
          other.location.y -= 1;
        }
        if(location.y < other.location.y){
          other.location.y += 1;
        }
      }
    }
    pushMatrix();
      translate(location.x, location.y);
      rotate(a);
      pushStyle();
        fill(blah);
        beginShape();
        strokeWeight(1);
        stroke(225);
          curveVertex(vert1.x-(diameter/2), vert1.y-(diameter/2));
          curveVertex(vert1.x-(diameter/2), vert1.y-(diameter/2));
          curveVertex(vert2.x-(diameter/2), vert2.y-(diameter/2));
          curveVertex(vert3.x-(diameter/2), vert3.y-(diameter/2));
          curveVertex(vert4.x-(diameter/2), vert4.y-(diameter/2));
          curveVertex(vert5.x-(diameter/2), vert5.y-(diameter/2));  
          curveVertex(vert1.x-(diameter/2), vert1.y-(diameter/2));
          curveVertex(vert1.x-(diameter/2), vert1.y-(diameter/2));
        endShape(CLOSE);
      popStyle();
    popMatrix();
    location.x -= speed;
    a += b;
  }
};


class Ship{
	
	PImage ship;
	float x = width/2;
	float y = height/2;
	//lower the easing number from (.1) to add difficulty.
	float easing = .1/level;
	float targetX = width/2;
	float targetY = height/2;
	float perimX;
	float perimY;

	Ship(){
		this.ship = loadImage("ship4.png");		
		this.perimX = .5*width/5;
		this.perimY = .5*height/5;
	}
	
	void render(){
		pushMatrix();
		// Here's the rocket particles
		pushStyle();
		fill(random(200,250),random(100,200),0);
		noStroke();
		ellipse(x-(random(100))-75,y-(random(100))+10,5,5);
		ellipse(x-(random(100))-75,y-(random(100))+10,5,5);
		ellipse(x-(random(10))-75,y-(random(10))+10,15,15);
		ellipse(x-(random(120))-75,y-(random(120))+10,5,5);
		ellipse(x-(random(50))-75,y-(random(50))+10,10,10);
		//These are the codes for the ship

		x += (targetX-x)*easing+random(-hit_count/2, hit_count/2);
		y += (targetY-y)*easing+random(-hit_count/2, hit_count/2);
		imageMode(CENTER);
		image(ship, x, y, width/5, height/5);
		popStyle();
		popMatrix();
	}
};

class StarField {

	ArrayList<PVector> locs;
	int count;
	float speed;

	StarField(int num, float x){
		count = num;
		speed = x;
		locs = new ArrayList<PVector>();
		for (int i = 0; i < count; i ++){
			locs.add(new PVector(random(width), random(height)));
		}
	}

	void render(){
		pushStyle();
		stroke(255);
		for (PVector l: locs){
			point(l.x, l.y);
			l.x -= speed;
			if(l.x < 0){
				l.x = width;
				l.y = random(height);
			}
		}
		popStyle();
	}
}



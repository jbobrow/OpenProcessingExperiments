
/*
 * Taller ProgramaciÃ³n MDI Veritas
 * Tarea#4
 * Particles Game
 */

/*
 * @author Andres Villalobos
 * @date 3/13/14
 * @version 1.0
 */

particlesSystem system;
//int size = 15;

void setup() {
  size(800, 600);
  smooth();
  textSize(16);
  system = new particlesSystem(15);
}

void draw() {
  background(255);
  system.display();
}

void keyReleased()
{
  if (key == ' ') { // if spacebar is pressed, quit the program  
    system.pause = !system.pause;
  }
  else if (key == 'a') { // if 'a' is pressed, add a particle to the system
    system.addParticle();
  }
  else if (key == 'r') { // if 'r' is pressed, remove a random particle from the system
    system.removeParticle();
  }
  else if (key == 's') { // if 's' is pressed, move the save zone to another random position
    system.newSaveZone();
  }
  else if (key == 'd') { // if 'd' is pressed, move the dark zone to another random position
    system.newDarkZone();
  }
}

void mouseClicked()
{
  system.saveZone.x = mouseX;
  system.saveZone.y = mouseY;
}

class particle {
  PVector position, velocity, acceleration;
  float radius = 40;
  color particleColor = color (0);
  int value = 6;

  particle() {
    position = new PVector(random(radius, width-radius), random(radius, height-radius));
    velocity = new PVector(random(-1, 1), random(-1, 1));
    acceleration = new PVector(random(-0.005, 0.005), random(-0.005, 0.005));
  }

  void update() {
    position.add(velocity);  
    velocity.add(acceleration);
  }

  void display() {
    if (value >= 5) {
      particleColor = color(6, 188, 220);
      radius = 40;
    }
    else if (value >= 3) {
      particleColor = color(81, 81, 81);
      radius = 30;
    }
    else if (value >= 1) {
      particleColor = color(200, 0, 0);
      radius = 20;
    }

    if (position.x < radius || position.x > width-radius) { // handles bounce with horizontal borders
      velocity.x *= -1.0f;
      if (position.x <= 0) {
        position.x = radius;
      }
      if (position.x >= width) {
        position.x = width-radius;
      }
    }

    if (position.y < radius || position.y > height-radius) { // handles bounce with vertical borders
      velocity.y *= -1.0f;
      if (position.y <= 0) {
        position.y = radius;
      }
      if (position.y >= height) {
        position.y = height-radius;
      }
    }

    // draw the particle
    strokeWeight(3);
    stroke(0,200);
    fill(particleColor, 200);    
    ellipse(position.x, position.y, radius, radius); 
    fill(255);
    text(value, position.x - 5, position.y + 5);
  }
}

class particlesSystem {
  ArrayList<particle> system;
  PVector saveZone;
  PVector darkZone;
  int saveZoneRadius = 50;
  int darkZoneRadius = 50;
  boolean pause = false;

  particlesSystem(int size) {
    system = new ArrayList<particle>();
    for (int i = 0; i < size; i++) {
      system.add(new particle());
    }    
    newSaveZone();
    newDarkZone();
  }

  // position the save zone randomly in the canvas
  void newSaveZone() {
    saveZone = new PVector(random(saveZoneRadius, width-saveZoneRadius), random(saveZoneRadius, height-saveZoneRadius));
  }

  // position the dark zone randomly in the canvas
  void newDarkZone() {
    darkZone = new PVector(random(darkZoneRadius, width-darkZoneRadius), random(darkZoneRadius, height-darkZoneRadius));
  }

  //draws an area that make it so that if any particle touches it, its value decreases
  void drawDarkZone() {
    noFill();
    stroke(0);    
    ellipse(darkZone.x, darkZone.y, darkZoneRadius, darkZoneRadius);
    text("-", darkZone.x-3, darkZone.y+3);
  }

  //draws an area that make it so that if any particle touches it, its value increases
  void drawSaveZone() {
    noFill();
    stroke(200, 0, 0);
    ellipse(saveZone.x, saveZone.y, saveZoneRadius, saveZoneRadius);
    text("+", saveZone.x-5, saveZone.y+5);
  }

  //adds a new particle to the system
  void addParticle() {
    system.add(new particle());
  }

  //removes a random particle from the system
  void removeParticle() {
    system.remove((int)random(0, system.size()));
  }

  void display() {
    if (system.size()==0) {     
      fill(100);
      text("NO WINNER", width/2, height/2);
    }
    else if (system.size()==1) {

      system.get(0).display();
      fill(100);
      text("WINNER", width/2, height/2);
    }
    else {
      drawDarkZone();
      drawSaveZone();

      for (int i = 0; i < system.size(); i++) {
        system.get(i).display();

        if (!pause) {
          float saveZonedistance = dist(system.get(i).position.x, system.get(i).position.y, saveZone.x, saveZone.y);
          if ((saveZonedistance < saveZoneRadius) && system.get(i).value < 6) { // if particle touches save zone, increase its radius | there is a max value: 6
            system.get(i).velocity.x *= -1.0f; // bounce
            system.get(i).velocity.y *= -1.0f; // bounce
            system.get(i).value += 1;
          }

          float darkZonedistance = dist(system.get(i).position.x, system.get(i).position.y, darkZone.x, darkZone.y);
          if (darkZonedistance < darkZoneRadius) { // if it touches dark zone then remove it from the system  
            system.get(i).velocity.x *= -1.0f; // bounce
            system.get(i).velocity.y *= -1.0f; // bounce     
            system.get(i).value -= 1; // value decreases
          }    

          // handle bouncing between particles
          for (int j=((i+1)%system.size()); j!=i; j=((j+1)%system.size())) {
            particle _p = system.get(j);
            float distance = dist(system.get(i).position.x, system.get(i).position.y, system.get(j).position.x, system.get(j).position.y);

            if (distance < system.get(i).radius) {
              system.get(i).velocity.x *= -1.0f; // bounce
              system.get(i).velocity.y *= -1.0f; // bounce
              system.get(i).acceleration.add(new PVector(0.005, 0.005)); // acceleration increases
              system.get(i).value -= 1; // value decreases            

              system.get(j).velocity.x *= -1.0f; // bounce
              system.get(j).velocity.y *= -1.0f; // bounce
              system.get(j).acceleration.add(new PVector(0.005, 0.005)); // acceleration increases
              system.get(j).value -= 1; // value decreases
            }
          }

          system.get(i).update();

          if (system.get(i).value <= 0) { // if particle's value is less than or equal to cero then remove it from the system      
            system.remove(i);
          }
        }
      }

      fill(100);
      text("particles: " + system.size(), 20, 20);
    }
  }
}




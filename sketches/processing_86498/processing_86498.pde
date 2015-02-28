
int num = 10; 
int screenSize = 200;

Spring[] springs = new Spring[num]; 


void setup()
{
  size(screenSize, screenSize);
  float radius = screenSize/3; 
  float angle=TWO_PI/(float)num;
  noStroke(); 
  for (int i = 0; i < num; i++) { 
  int sgSize = int(random(15,25));
  int sgShade = 100;
  springs[i] = new Spring((width/2)+radius*sin(angle*i), (height/2)+radius*cos(angle*i), sgSize, sgShade, 0.9, 8.0, 1.0, springs, i); 
  }
}

void draw() 
{
  background(51); 
  for (int i = 0; i < num; i++) { 
    springs[i].update(); 
    springs[i].display(); 
  }    
}

void mousePressed() 
{
  for (int i = 0; i < num; i++) { 
    springs[i].pressed(); 
  } 
}

void mouseReleased() 
{
  for (int i=0; i<num; i++) { 
    springs[i].released(); 
  } 
}

class Spring 
{ 
  // Screen values 
  float xpos, ypos;
  float tempxpos, tempypos; 
  int size = 20; 
  int brightness = 100;
  boolean over = false; 
  boolean move = false; 

  // Spring simulation constants 
  float mass;       // Mass 
  float k = 0.2;    // Spring constant 
  float damp;       // Damping 
  float rest_posx;  // Rest position X 
  float rest_posy;  // Rest position Y 

  // Spring simulation variables 
  //float pos = 20.0; // Position 
  float velx = 0.0;   // X Velocity 
  float vely = 0.0;   // Y Velocity 
  float accel = 0;    // Acceleration 
  float force = 0;    // Force 

  Spring[] friends;
  int me;
  
  // Constructor
  Spring(float x, float y, int s, int b, float d, float m, 
         float k_in, Spring[] others, int id) 
  { 
    xpos = tempxpos = x; 
    ypos = tempypos = y;
    rest_posx = x;
    rest_posy = y;
    size = s;
    brightness = b;
    damp = d; 
    mass = m; 
    k = k_in;
    friends = others;
    me = id; 
  } 

  void update() 
  { 
    if (move) { 
      rest_posy = mouseY; 
      rest_posx = mouseX;
    } 

    force = -k * (tempypos - rest_posy);  // f=-ky 
    accel = force / mass;                 // Set the acceleration, f=ma == a=f/m 
    vely = damp * (vely + accel);         // Set the velocity 
    tempypos = tempypos + vely;           // Updated position 

    force = -k * (tempxpos - rest_posx);  // f=-ky 
    accel = force / mass;                 // Set the acceleration, f=ma == a=f/m 
    velx = damp * (velx + accel);         // Set the velocity 
    tempxpos = tempxpos + velx;           // Updated position 

    
    if ((overEvent() || move) && !otherOver() ) { 
      over = true; 
    } else { 
      over = false; 
    } 
  } 
  
  // Test to see if mouse is over this spring
  boolean overEvent() {
    float disX = tempxpos - mouseX;
    float disY = tempypos - mouseY;
    if (sqrt(sq(disX) + sq(disY)) < size/2 ) {
      return true;
    } else {
      return false;
    }
  }
  
  // Make sure no other springs are active
  boolean otherOver() {
    for (int i=0; i<num; i++) {
      if (i != me) {
        if (friends[i].over == true) {
          return true;
        }
      }
    }
    return false;
  }

  void display() 
  { 
    if (over) { 
      fill(255,100); 
    tempxpos += random(-1, 1);
    tempypos += random(-1, 1);
    size += 5; 
    size -= 5; 
    ellipse(tempxpos, tempypos, size+2, size+2);
     fill(255); 

    } else { 
      fill(brightness); 

    } 
    ellipse(tempxpos, tempypos, size, size);


    fill(51); 
    textAlign(CENTER,CENTER);
    text(me, tempxpos, tempypos);
  } 

  void pressed() 
  { 
    if (over) { 
      move = true; 
    } else { 
      move = false; 
    }  
  } 

  void released() 
  { 
    move = false; 
    rest_posx = xpos;
    rest_posy = ypos;
  } 
}

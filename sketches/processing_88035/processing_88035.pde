
int num = 3; 
Spring[] springs = new Spring[num]; 
int t = 1;
void setup()
{
  size(1000, 900);
  noStroke(); 
  colorMode(HSB);
  springs[0] = new Spring(0, 0,  0, 0.98, 8.0, 0.1, springs, 0); 
  springs[1] = new Spring(500, 350, 120, 0.99, 25.0, 0.03, springs, 1); 
  springs[2] = new Spring(500, 350, 120, 0.99, 15.0, 0.03, springs, 2);   
}

void draw() 
{
  background(255); 
  

     t = t+40;
    if (t>255) {t=1;}
  for (int i = 0; i < num; i++) { 
    springs[1].update(); 
    springs[1].display(); 
  }  
}

void mousePressed() 
{
  for (int i = 0; i < num; i++) { 
    springs[1].pressed(); 
  } 
}

void mouseReleased() 
{
  for (int i=0; i<num; i++) { 
    springs[1].released(); 
  } 
}

class Spring 
{ 
  // Screen values 
  float xpos, ypos;
  float tempxpos, tempypos; 
  int size = 14; 
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
  Spring(float x, float y, int s, float d, float m, 
         float k_in, Spring[] others, int id) 
  { 
    xpos = tempxpos = x; 
    ypos = tempypos = y;
    rest_posx = x;
    rest_posy = y;
    size = s;
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
    
    //320 270
//float k1 = tempxpos + tempypos;
//float k2 = map (k1,590,1000,0,255);

float k1 = dist(500,350,tempxpos,tempypos);
float k2 = map (k1,100,210,0,255);
float k3 = map (k1,20,600,0,50);


    if (over) { 
      fill(255,0,0); 
    } else { 
      fill(t,random(240,255),k2);
    } 
    ellipse(tempxpos, tempypos, size-k1/35,size-k1/35);
  
  



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

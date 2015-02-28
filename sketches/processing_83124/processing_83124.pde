
int num = 3; 
Spring[] springs = new Spring[num]; 

PImage img; 
void setup()
{
  size(800, 750);
   img = loadImage("shuttlecock.jpg");  

  
  
  stroke(#E6FF2C); 
 
 
 fill(#E6FF2C);{
   springs[0] = new Spring(240, 260,  40, 0.98, 8.0, 0.1, springs, 0); 
  

  springs[1] = new Spring(320, 210, 120, 0.95, 9.0, 0.1, springs, 1); 
  springs[2] = new Spring(180, 170, 200, 0.90, 9.9, 0.1, springs, 2);   
}
}

void draw() {
  background(#FFFFFF);

  image(img, 150, 160);
  





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
 
  float xpos, ypos;
  float tempxpos, tempypos; 
  int size = 20; 
  boolean over = false; 
  boolean move = false; 

 
  float mass;      
  float k = 0.2;    
  float damp;       
  float rest_posx;  
  float rest_posy;  
 
 
  float velx = 0.0;  
  float vely = 0.0;  
  float accel = 0;   
  float force = 0;   

  Spring[] friends;
  int me;
  
 
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

    force = -k * (tempypos - rest_posy);  
    accel = force / mass;                 
    vely = damp * (vely + accel);         
    tempypos = tempypos + vely;          

    force = -k * (tempxpos - rest_posx);  
    accel = force / mass;                 
    velx = damp * (velx + accel);         
    tempxpos = tempxpos + velx;          
    
    
    if ((overEvent() || move) && !otherOver() ) { 
      over = true; 
    } else { 
      over = false; 
    } 
  } 
  
  
  boolean overEvent() {
    float disX = tempxpos - mouseX;
    float disY = tempypos - mouseY;
    if (sqrt(sq(disX) + sq(disY)) < size/2 ) {
      return true;
    } else {
      return false;
    }
  }
  
 
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
      fill(153); 
    } else { 
      fill(255); 
    } 
    ellipse(tempxpos, tempypos, size, size);
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





//Follow

public class Follow { 
  
  // Screen values 
  float xpos, ypos;
  float tempxpos, tempypos;  

  // Follow simulation constants 
  float mass;       // Mass 
  float k = 0.2;    // Spring constant 
  float damp;       // Damping 
  float rest_posx = 0;  // Rest position X 
  float rest_posy = 0;  // Rest position Y 

  // Follow simulation variables 
  //float pos = 20.0; // Position 
  float velx = 0.0;   // X Velocity 
  float vely = 0.0;   // Y Velocity 
  float accel = 0;    // Acceleration 
  float force = 0;    // Force 

  
  // Constructor
  Follow(float d, float m, float k_in) { 
    xpos = tempxpos = 0; 
    ypos = tempypos = 0;
    rest_posx = 0;
    rest_posy = 0;
    damp = d; 
    mass = m; 
    k = k_in;
  } 

  void update() { 

    rest_posy = mouseY; //need to create a variable so only the  
    rest_posx = mouseX; // user's organism follows the mouse


    force = -k * (tempypos - rest_posy);  // f=-ky 
    accel = force / mass;                 // Set the acceleration, f=ma == a=f/m 
    vely = damp * (vely + accel);         // Set the velocity 
    tempypos = tempypos + vely;           // Updated position 

    force = -k * (tempxpos - rest_posx);  // f=-ky 
    accel = force / mass;                 // Set the acceleration, f=ma == a=f/m 
    velx = damp * (velx + accel);         // Set the velocity 
    tempxpos = tempxpos + velx;           // Updated position
  } 
 
} 


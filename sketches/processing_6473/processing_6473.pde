
class Vent  { 
  int VENT_WIDTH = 28; 
  int VENT_HEIGHT = 17; 

  float x, y; 
  char state = 'c';    // start cool 

  int max_explodin = 120; 
  int max_warmin = 240; 
  int counter; 

  PImage shaft; 
  PImage fire; 

  PImage[] fire_vec = new PImage[3]; 
  int fire_frame = 0; 
  int last_time = 0; 

  Vent(float x, float y)  { 
    this.x = x; 
    this.y = y; 
  } 

  Vent(float x, float y, PImage shaft, PImage fire)  { 
    this.x = x; 
    this.y = y; 
    this.shaft = shaft; 
    this.fire = fire; 

    fire_vec[0] = loadImage("fire.png"); 
    fire_vec[1] = loadImage("fire2.png"); 
    fire_vec[2] = loadImage("fire3.png"); 
  } 

  Vent(float x, float y, int counter)  { 
    this.x = x; 
    this.y = y; 
    this.counter = counter; 
  } 

  void activate()  { 
    state = 'w'; 
    counter = max_warmin; 
  } 

  int update()  { 
    int returnval = 0; 
    counter--; 

    switch(state)  { 
    case 'c':  // chillin 
      //if(counter==0)  { 
      //  state = 'w'; 
      //  counter = max_warmin; 
      //} 
      stroke(0); 
      fill(0); 
      break; 

    case 'w': // warm 
      if(counter==0)  { 
        state = 'e'; 
        counter = max_explodin; 
      } 
      stroke(0); 
      fill(max_warmin - counter, 0, 0); 
      break; 

    case 'e':  // explode 
      if(counter==0)  { 
        state = 'c'; 
        returnval = 1; 
        //counter = int(random(min_chillin, max_chillin)); 
      } 
      stroke(255, 0, 0); 
      fill(255, 255, 255); 
    } 
    image(shaft, x-15, y-7); 
    ellipse(x, y, VENT_WIDTH, VENT_HEIGHT); 

    if(state == 'e')  { 
      image(fire_vec[fire_frame], x-26, y-57); 
      if(millis() - last_time > 50)  { 
        fire_frame = (fire_frame + 1) % 3; 
        last_time = millis(); 
      } 
    } 

    return returnval;  
  } 
}

//void gir_death(float girx, float giry) {
//  if (dist(x, y, girx, giry) < 50) {
//    have_lost = true;
//  }
//
//}




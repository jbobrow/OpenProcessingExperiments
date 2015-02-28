
class Drop {
  
  float vy;                     //velocity in the y direction
  float ay;                     //acceleration in the y direction
  float px, py;                 //position in x and y coordinates
  float kx;  //??
  float oldx,oldy;
 //??
  //float w,h;                    
  //float d,dx;
  float ky = random (0,10);
  float kBounce,kkx,kSw;
  
  boolean played = false;
  
  AudioPlayer sound;

   
  void update(){
   
    vy += ay;
    py += vy;
  
    if (py > height - 10) {                  //add sound effects
      vy = -(vy / (1 * kBounce));
      if (!played) {
        sound.play(0);
        played = true;
      }
  //    kx = random (-5,5);             //add the fat lines when the drops bounce
    }
     
    if (vy < 1) {
      kx = random (0,1);
    }
  }
  
  void render(){
    stroke (0, py, 255);                //change colour here
    strokeWeight(0.001 + kSw); 
    line (px - kkx - kx, py, px + kkx + kx, py); // ??
  }
   
  void initial() {
    played = false;
    int rn = (int) (random(0, 9) + 1);
    sound = minim.loadFile(rn + ".wav");

    oldy = py = mouseY;
    if (rainLine2 < rainLine1) {    // if rain1 is smaller than rain 2 it does oldx but opposite, otherwise does the usual.
      oldx = px = random(rainLine2, rainLine1);
    } else { 
      oldx = px = random(rainLine1, rainLine2);       //rain drops from
    }
    ay = random (0.2, 0.9);  // how much it rains e.g. 1.5 only rains the top half a little
    kx = 0; // when changing this to a higher number rain starts out stragiht lined 
  }
  
}




int sword_count = 0;
int gemstone_count = 0;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  fill(0);

  for(int i = 0; i < 1000; i++) {
      if(random(100) < 3) {
          sword_count += 1;
      }
      else {
          gemstone_count += 1;
      }
  
  }
 
  textSize(32);
  text("swords: "+sword_count, 10, 30);
  text("gems: "+gemstone_count, 10, 60);
}


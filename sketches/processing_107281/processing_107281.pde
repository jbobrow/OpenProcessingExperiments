
//Passenger sim
//Rules
//Collision Avoidance - avoid head on collision with 
//Separation - values for luggage carrying - differs between airside and landside.
//Cohesion (max velocity within 90%)
//Follow path. Paths created with passenger typolgies. could brake down for each flight - number of business class, percentage that use the lounge, etc
//seek - target if within range - else follow path??
//wall and object avoidance

//passenger typologies
//direct to gate
//minor retail
//dweller - short
//dweller - long


void setup() {  //setup function called initially, only once
  size(600, 600);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),100,255,50);
  
  
}

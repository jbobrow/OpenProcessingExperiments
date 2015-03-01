
//int rect_width = 16;
//int rect_height = 16;
int rect_width = 10;
int rect_height = 10;
int number_of_rings = 15;
//int margins = 3;
 int seed_counter = 0;
 
void setup(){
  background(212,206,193);
//  size(288,575);
  size(400,400);
  stroke(0,0,0,25);
  strokeWeight(1.1);
  noFill();
  randomSeed(seed_counter);

 
 
}
 
void draw(){
  
  
//  noiseSeed(millis());
  int rect_count=1;
 
  for(int ring_number=1;ring_number<number_of_rings;ring_number++){
 
    float ring_circumference = 2 * PI * rect_height * ring_number;
    float rects_per_ring = ring_circumference/rect_width;
    float rotation_increment = radians(360/rects_per_ring);   
    
    // now go through every rect in this ring, note the int cast
    for(int row=1; row<=(int)rects_per_ring + 1; row++) {
      pushMatrix();
 
      // start from the center
      translate(width/2, height/2);
      
      // rotate around center of screen
      rotate(rotation_increment*row);
      
      // shift this rect to its ring position
      translate(rect_height*ring_number, 0);
      
      // calculate random translation offset
      int random_offset = round(random(rect_count)*0.000005*mouseX*pow(rect_count, 1.001));
 
      translate(0, random_offset);
      
      float mouse_y_mapped = map(0.001*pow(rect_count, 1.001), 0, height, 0, 360);
      float theta = radians(random(rect_count)*mouseY*mouse_y_mapped); 
      
      // Rotate by the angle theta
      rotate(theta);
      
      rectMode(CENTER);
      strokeWeight(1);
      rect(0,0,rect_height, rect_width);
//      ellipse(0,0,rect_height, rect_width);
      popMatrix();
      
      rect_count++;
    }
  randomSeed(seed_counter);  // reset seed so next frame looks same
  } 
  fill(212,206,193,20);
  //rect(0,0,width,height);

}
void mouseClicked() {
  if (mouseButton == LEFT) {
    seed_counter++;
    randomSeed(seed_counter);
  } else {
    background(212,206,193);
  }
}


int instance_limit = 32;
int z_level_height = -25;
int ray_limit;
float ray_length = 50;
float angle;

void setup() {
  size(600, 600);
  noFill();
  smooth();
}

void draw() {
  background(255);

  translate(width/2 + ray_length/2, 25);

  for (int instance_count = 3; instance_count <= instance_limit; instance_count++)
  {
    ray_limit = instance_count;
    angle = 360/ instance_count;

    pushMatrix();
    for (int ray_count = 1; ray_count <= ray_limit; ray_count++) {  
      rotate(theta(angle));
      strokeWeight(instance_count);
      stroke(0, 0, 0, 50);
      line(0, 0, ray_length, 0);
      translate(ray_length, 0);
    }
    popMatrix();  
  }
 
}

float theta (float rotation) {
  float conversion = (rotation/360)*TWO_PI;
  return conversion;
}






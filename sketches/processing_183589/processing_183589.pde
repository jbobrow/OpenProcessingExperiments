
// requires a browser capable of 3D
AnimatedCube cube1;
AnimatedCube cube2;
AnimatedCube cube3;
 
void setup() {
  size(640, 360, P3D);
  stroke(255);
  cube1 = new AnimatedCube(50, 15, 0, #B6F0B1);
  cube2 = new AnimatedCube(60, 12, -100, #F0E2B1);
  cube3 = new AnimatedCube(80, 20, -200, #B1CFF0);
}
 
void draw() {
  background(240);  
  
  // camera flies in circles
  float rotation_radius = 299;
  float rotation_angle = frameCount/303.0;
  camera(width/2.0  + rotation_radius*cos(rotation_angle), height/2.0-100, height/2.0 + rotation_radius*sin(rotation_angle), width/2.0, height/2.0, 0, 0, 1, 0);
  
  lights();
  
  cube1.draw();
  cube2.draw();
  cube3.draw();  
}
 
class AnimatedCube {
  float cube_side;      // Cube side length.
  float cube_radius;    // 2D distance from the center of the cube to a corner.
  float num_frames;     // How many frames are needed to complete one rotation.
  int curr_frame = 0;   // The current frame in a virtual timeline. Can go forward and backwards.
  int direction = 1;    // Is the cube moving left or right
  boolean pause = true; // Is the cube paused?
  color cube_color;
  float z_pos;          // Allows having cubes in different positions
  
  AnimatedCube(float cradius, float frames, float zpos, color ccolor) {
    cube_radius = cradius;
    cube_side = sqrt(0.5) * 2 * cube_radius;
    num_frames = frames;
    z_pos = zpos;
    cube_color = ccolor;    
  }
  void draw() {
    if (pause) {
      // If the cube is paused do not update the current frame
      // Un-pause it eventually
      if (random(100) > 98) {
        pause = false;
      }
    } 
    else {
      // Update the current frame (+1 or -1)
      curr_frame += direction;
      // If we have finished a complete rotation...
      if (int(curr_frame % num_frames) == 0) {
        // If we are too far right, start going back
        if (curr_frame > 180) {
          direction = -1;
        }
        // If we are too far left, start going right
        if (curr_frame < 20) {
          direction = 1;
        }
        // Maybe pause after a completed rotation
        if (random(10) > 3) {
          pause = true;
        }
      }
    }
    float rot_percent = (curr_frame % num_frames) / num_frames;
    float center_y = cube_radius * sin(QUARTER_PI + rot_percent * HALF_PI);
    float center_x = cube_radius * cos(QUARTER_PI + rot_percent * HALF_PI); 
    float completed_rotations = curr_frame / num_frames;
    
    pushMatrix();
    translate(cube_side * int(completed_rotations) - center_x, height/2 + 100 - center_y, z_pos);
    rotateZ(completed_rotations * HALF_PI);
    fill(cube_color);
    box(cube_side);
    popMatrix();
  }
}
 

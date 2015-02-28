
//Camera state/properties
PVector cam_pos = new PVector(0, -40, 0);
PVector cam_lookat = new PVector(0, 0, 0);
float cam_yaw = 0f;
float cam_pitch = 0f;
float cam_v = 3f;

//For dragging the mouse
float start_cam_yaw = 0f, start_cam_pitch = 0f;
float start_mouseX = 0f, start_mouseY = 0f;

void moveCamera() {
  if (mousePressed) {
    float dx = mouseX - start_mouseX;
    float dy = mouseY - start_mouseY; 
    cam_yaw = mod(dx/100f + start_cam_yaw, TWO_PI);
    cam_pitch = constrain(dy/100f + start_cam_pitch, -PI/2.001f, PI/2.001f);
  }
  else {
    start_mouseX = mouseX;
    start_mouseY = mouseY;
    start_cam_yaw = cam_yaw;
    start_cam_pitch = cam_pitch;
  }
  //Compute all at once rather than multiple times each (optimization)
  float cos_cam_yaw = cos(cam_yaw);
  float sin_cam_yaw = sin(cam_yaw);
  float cos_cam_pitch = cos(cam_pitch);
  float sin_cam_pitch = sin(cam_pitch);
  float cam_v_cos_cam_yaw = cam_v*cos_cam_yaw;
  float cam_v_sin_cam_yaw = cam_v*sin_cam_yaw;
  
  cam_lookat.set(cos_cam_pitch*cos_cam_yaw, sin_cam_pitch, cos_cam_pitch*sin_cam_yaw);
  
  if (savedUp) {
    cam_pos.x += cam_v_cos_cam_yaw;
    cam_pos.z += cam_v_sin_cam_yaw;
  }
  if (savedDown) {
    cam_pos.x -= cam_v_cos_cam_yaw;
    cam_pos.z -= cam_v_sin_cam_yaw;
  }
  if (savedLeft) {
    cam_pos.x += cam_v_sin_cam_yaw;
    cam_pos.z -= cam_v_cos_cam_yaw;
  }
  if (savedRight) {
    cam_pos.x -= cam_v_sin_cam_yaw;
    cam_pos.z += cam_v_cos_cam_yaw;
  }

  camera(cam_pos.x, cam_pos.y, cam_pos.z, 
  cam_pos.x + cam_lookat.x, cam_pos.y + cam_lookat.y, cam_pos.z + cam_lookat.z, 
  0.0, 1.0, 0.0);
}

//Modulo function that works for a and b < 0
float mod(float a, float b) {
  return a-b*floor(a/b);
}


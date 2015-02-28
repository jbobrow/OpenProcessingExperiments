
import processing.opengl.*;
import auxillary.*;

Grid grid;
Cam cam;

void setup(){
  size(480, 360, OPENGL); 
  grid = new Grid(80, 60);
  cam = new Cam(new Vec3(0, 0, 60), new Vec3(0, 0, 0), new Vec3(0, 1, 0));
  perspective(PI/3.0, width/height, 0.1, 150); 
}

void draw(){
  background(0);
  camera(cam.getEye().x, cam.getEye().y, cam.getEye().z,
  cam.getCenter().x, cam.getCenter().y, cam.getCenter().z,
  cam.getUp().x, cam.getUp().y, cam.getUp().z);

  grid.drawGrid();
}

void mouseDragged(){
  if(keyPressed){
    if(keyCode == ALT){
      float index = (float)(pmouseY - mouseY) * 0.005f;
      cam.zoom(index); 
    }
    if(keyCode == SHIFT){
      float x_index = (float) (pmouseX - mouseX) * 0.05f;
      cam.moveRight(x_index);
      float y_index = (float)(pmouseY - mouseY) * 0.05f;
      cam.moveUp(y_index); 
    }
    if(keyCode == CONTROL){
      float x_index = (float) (pmouseX - mouseX) * 0.05f;
      cam.rotateDir(x_index);
    }
  }
  else{
    if(mousePressed && mouseButton == LEFT){
      float x_index = (float) (pmouseX - mouseX) * 1.0f;
      cam.rotateRight(x_index);
      float y_index = (float) (pmouseY - mouseY) * 1.0f;
      cam.rotateUp(y_index);
    }
  }
}

class Grid{
  Vec3[][] points;
  int w, h;

  Grid(int i, int j){
    w = i; 
    h = j;
    points = new Vec3[j][i];
    initPoints();
  } 

  void initPoints(){
    for(int i = 0; i < w; i++){
      for(int j = 0; j < h; j++){
        points[j][i] = new Vec3(); 
      }
    } 
    formula();
  }

  void drawGrid(){

    stroke(255, 0, 0);    

    for(int i = 0; i < h; i++){
      for(int j = 0; j < w; j++){ 
        if(i != h - 1)
          line(points[i][j].x, points[i][j].y, points[i][j].z, 
          points[i+1][j].x, points[i+1][j].y, points[i+1][j].z);

        if(j != w - 1)
          line(points[i][j].x, points[i][j].y, points[i][j].z, 
          points[i][j+1].x, points[i][j+1].y, points[i][j+1].z);

      }
    }
    noStroke();
  }

  void formula(){
    for(int i = 0; i < w; i++){
      float u = map(i, 0, w - 1, -PI, PI);
      for(int j = 0; j < h; j++){
        float v = map(j, 0, h - 1, -PI, PI);

        float x_val = 2.0f * sin(3.0f * u) / (2.0f + cos(v));
        float y_val = 2.0f * (sin(u) + 2.0f * sin(2.0f * u)) / (2.0f + cos(v + TWO_PI / 3.0f));
        float z_val = (cos(u) - 2.0f * cos(2.0f * u)) * (2.0f + cos(v)) * (2.0f + cos(v + TWO_PI / 3.0f)) / 4.0f;

        points[j][i].setXYZ(x_val, y_val, z_val);
      }
    } 
  }

  void appleFormula(){
    for(int i = 0; i < w; i++){
      float u = map(i, 0, w - 1, 0.0f, TWO_PI);
      for(int j = 0; j < h; j++){
        float v = map(j, 0, h - 1, -PI, PI);

        float x_val = cos(u) * (4.0f + 3.8f * cos(v));
        float y_val = sin(u) * (4.0f + 3.8f * cos(v));
        float z_val = (cos(v) + sin(v) - 1.0f) * (1.0f + sin(v)) * log(1.0f - PI * v / 10.0f) + 7.5f * sin(v);

        points[j][i].setXYZ(x_val, y_val, z_val);
      }
    } 
  }
}


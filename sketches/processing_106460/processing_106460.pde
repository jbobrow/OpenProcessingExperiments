
// drawing + motion + 3D + curve
// Memory Mouse Data, Using Class + 3D.
 
//import processing.opengl.*;
 
drawMotion3D dm3d;
 
void setup() {
  size(640, 480, P3D);
  dm3d = new drawMotion3D(1000, 8.0, 0.75);
  // numbers of line point, change values, depth of z-positions
  noFill();
 
//  textSize(12);
}
 
void draw() {
  background(0);
 
  dm3d.display();
 
//  text("mouse click & drag = draw line\nmouse move = rotate in 3D\n'm' = change to straight/curve\n'SPACE' = re-positioning", 5, 17);
  //  saveFrame("dm3d-#####.png");
}
 
void mousePressed() {
  dm3d.init();
}
 
void mouseDragged() {
  dm3d.keep();
}
 
void mouseReleased() {
  if(dm3d.on == true) dm3d.off();
}
 
void keyPressed() {
  if(key == ' ') {
//    save("dm3d-curve.png");
    if(dm3d.on == false) dm3d.reposition();
  }
  if(key == 'm') {
    dm3d.mode++;
  }
}
class drawMotion3D {
   
  float[][] initposition;
  float[][] position;
  int initpointer;
  int pointer;
  float amount;
  float depth;
  boolean on;
  int mode;
  float initX, initY;
 
  drawMotion3D (int s, float a, float d) {
    initposition = new float[s][3];
    position = new float[s][3];
    initpointer = 0;
    pointer = 0;
    amount = a;
    depth = d;
    on = false;
    mode = 1;
  }
 
  void init() {
    on = true;
    initX = mouseX;
    initY = mouseY;
    if(initpointer > 0) {
      initpointer = 0;
    }
  }
 
  void keep() {
    if(initpointer < position.length) {
      initposition[initpointer][0] = mouseX;
      initposition[initpointer][1] = mouseY;
      initpointer++;
    }
    else {
      off();
    }
  }
 
  void off() {
    
    pointer = initpointer;
    for(int i = 0; i < initpointer; i++) {
      initposition[i][2] = -i*depth + initpointer*depth/2;
    }
    for(int i = 0; i < position.length; i++) {
      position[i][0] = initposition[i][0];
      position[i][1] = initposition[i][1];
      position[i][2] = initposition[i][2];
    }
  }
 
  void reposition() {
    for(int i = 0; i < position.length; i++) {
      position[i][0] = initposition[i][0];
      position[i][1] = initposition[i][1];
      position[i][2] = initposition[i][2];
    }
  }
 
  void display() {
    if(pointer > 0) {
      // After Memory
      pushMatrix();
      translate(width/2, height/2, -dm3d.pointer*dm3d.depth);
 
      float targetX, targetY;
      if(on == false) {
        targetX = mouseX;
        targetY = mouseY;
        stroke(255, 160);
      }
      else {
        targetX = initX;
        targetY = initY;
        stroke(120, 160);
      }
 
      if(targetX > width/2) rotateY(map(targetX, width/2, width, 0, PI));
      else if(targetX < width/2) rotateY(map(targetX, 0, width/2, -PI, 0));
 
      if(targetY > height/2) rotateX(map(targetY, height/2, height, 0, PI));
      else if(targetY < height/2) rotateX(map(targetY, 0, height/2, -PI, 0));
 
 
      if(mode % 2 == 0) {
        for(int i = 0; i < pointer - 1; i++) {
          position[i][0] += random(-amount, amount);
          position[i][1] += random(-amount, amount);
          float zpos = -i*depth + pointer*depth/2;
          line(position[i][0] - width/2,   position[i][1] - height/2,   zpos,
          position[i+1][0] - width/2, position[i+1][1] - height/2, zpos-depth);
        }
      }
      else {
        beginShape();
 
        position[0][0] += random(-amount, amount);
        position[0][1] += random(-amount, amount);
        position[0][2] += random(-amount, amount);
        vertex(position[0][0] - width/2, position[0][1] - height/2, position[0][2]);
 
        position[pointer - 1][0] += random(-amount, amount);
        position[pointer - 1][1] += random(-amount, amount);
        position[pointer - 1][2] += random(-amount, amount);
 
        for(int i = 1; i < pointer - 1; i++) {
          position[i][0] += random(-amount, amount);
          position[i][1] += random(-amount, amount);
          position[i][2] += random(-amount, amount);
          int k;
          if((i % 2) == 0) k = -1;
          else k = 1;
          float x1 = position[i][0] - width/2;
          float y1 = position[i][1] - height/2;
          float z1 = position[i][2];
          float x2 = position[i+1][0] - width/2;
          float y2 = position[i+1][1] - height/2;
          float z2 = position[i+1][2];
          float d = dist(x1, y1, z1, x2, y2, z2)*0.1;
          float cx1 = x1 + k*random(amount*0.2)*d;
          float cy1 = y1 + k*d;
          float cz1 = z1;
          float cx2 = x2 + k*random(amount*0.2)*d;
          float cy2 = y2 + k*d;
          float cz2 = z2;
 
          bezierVertex(cx1, cy1, cz1, cx2, cy2, cz2, x2, y2, z2);
        }
        endShape();
      }
      popMatrix();
    }
 
    if( true) {
      // During Memorize
      stroke(255, 200);
      for(int i = 0; i < initpointer - 1; i++) {
        line(initposition[i][0], initposition[i][1], initposition[i+1][0], initposition[i+1][1]);
      }
    }
  }
}


//Number of Recursions.
int n = 1;
//Zoom-scale.
float sc = 1.8;
//Amount radius is multiplied by every recursion.
float p = 0.5;
//Amount distance between boxes-spheres is multiplied by every recursion.
float ln = 0.5;
//Frame thingy
float fram = 0;
//If mouse was pressed in previous frame
boolean pmp;
//If button was pressed in previous frame.
boolean pbp;
//Sphere-Cube toggle
boolean spheres;
//Transparency toggle.
boolean transparent;
//Lights toggle.
boolean lightson = true;
//Setup.
void setup() {
  //Put P3D into size() to allow 3D objects.
  size(800, 800, P3D);
  background(0);
  //Allow rainbow colors.
  colorMode(HSB);
}
void draw() {
  background(0);
  //Put lights into the simulation.
  if(lightson == true) {
    lights();
  }else{
    noLights();
  }
  //The number of iterations is increased every time the Left mouse button is pressed, and decreased every time the right mouse button is pressed. "pmp" is just to stop superfast iteration adding.
  if(mousePressed&&mouseButton==LEFT) {
    //Don't want it to go too high.
    if(n < 6) {
      if(pmp == false) {
        n++;
      }
    }
  }
    if(mousePressed&&mouseButton==RIGHT) {
      //Don't want it to go too low.
      if(n > 1) {
        if(pmp == false) {
          n -= 1;
        }
      }
    }
  if(mousePressed) {
    pmp = true;
  }else{
    pmp = false;
  }
  //Key controls
  if(keyPressed) {
    //All of the nontoggles.
    if(key == 'r') {
      n = 1;
      p = 0.5;
      ln = 0.5;
      sc = 1.8;
      spheres = false;
      lightson = true;
      transparent = false;
    }else if(key == 'a') {
      p += 0.03;
    }else if(key == 'd') {
      p -= 0.03;
    }else if(key == 'w') {
      ln += 0.03;
    }else if(key == 's') {
      ln -= 0.03;
    }else if(key == 'z') {
      sc += 0.05;
    }else if(key == 'x') {
      sc -= 0.05;
    }
    //All of the toggles.
    if(pbp != true) {
      if(keyPressed&&key == 'b') {
        spheres = !spheres;
      }
      if(keyPressed&&key == 't') {
        transparent = !transparent;
      }
      if(keyPressed&&key == 'l') {
        lightson = !lightson;
      }
    }
    pbp = true;    
  }else{
    pbp = false;
  }
  //Camera controls observed on OpenProcessing bez_patch sketch.
  scale(sc);
  translate(width/2/sc, height/2/sc);
  rotateY(map(mouseX,0,width,-PI,PI)+fram); //Rotation value is added on.
  rotateX(map(mouseY,0,height,-PI,PI)+fram); //Rotation value is added on.
  //Call recrusive sphere function.
  DrawRecrusiveSphere(0, 0, 0, 100, n, 0);
  //P means picture!
  if(keyPressed&&key=='p') {
    saveFrame("output.png");
  }
  //Change the rotation value (also the frames passed / 100) by 0.01.
  fram += 0.01;
}
void DrawRecrusiveSphere(float x, float y, float z, float r, int num, int me) {
  //Inside the function...
  //Save current translation and rotation.
  pushMatrix();
  //Wireframe-Fill stuff.
  if(keyPressed&&key=='f') {
    noFill();
    //Set rainbow colors.
    stroke(num*20, 255, 255);
  }else{
    //Transparency boolean added in.
    if(transparent==true) {
      fill(num*20, 255, 255, 120);
    }else{
      fill(num*20, 255, 255);
    }
    noStroke();
  }
  //Shift the 3D grid to the sphere coordinates
  translate(x, y, z);
  //Make the sphere/cube(depends on the sphere boolean value).
  if(spheres == true) {
    //Sets smaller spheres to smaller detail, based on 20-2^generaion (this could also be based on the radius, but then you have to factor in the zoom level).
    sphereDetail(20-int(pow(2, me)));
    sphere(r);
  }else{
    box(r, r, r);
  }  
  //Return the grid to it's previous state.
  popMatrix();
  //Don't want to repeat the process too many times, so we put in the "if > 1".
  if(num > 1) {
    //Do the recursive sphere function (this being the recursive part) 6 more times, with centers placed in 6 different directions.
    //x+
    DrawRecrusiveSphere(x + r*ln, y, z, r*p, num-1, me+1);
    //x-
    DrawRecrusiveSphere(x - r*ln, y, z, r*p, num-1, me+1);
    //y+
    DrawRecrusiveSphere(x, y + r*ln, z, r*p, num-1, me+1);
    //y-
    DrawRecrusiveSphere(x, y - r*ln, z, r*p, num-1, me+1);
    //z+
    DrawRecrusiveSphere(x, y, z + r*ln, r*p, num-1, me+1);
    //z-
    DrawRecrusiveSphere(x, y, z - r*ln, r*p, num-1, me+1);
  }
}


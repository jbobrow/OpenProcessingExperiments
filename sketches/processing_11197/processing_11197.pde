
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/11197*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
/*Disco Hall
 created by rebirth
 
 Interface:
 click to create a new disco (does not change outline toggle)
 o - toggle outline
 i - toggle irregular quads
 s - creates new shapes
 p - randomizes the rotation speeds
 m - cycles through color modes (two tone, alternating, hardlight, softlight)
 c - randomizes the colors
 left and right arrows - change the alpha of the rays (only has an affect in hardlight and softlight modes)
 a - toggle smooth. turn it off if the program is running too slowly on your system
 
 Ideas for future expansion: 
 ray size control
 irregular ellipses
 polygons other than quads
 more color modes
 */

PVector center;
static int center_dev = 10;
static float radius_change_percent_max = 10;
static float radius_change_percent_min = 2;
static int color_mode_max = 4;
static int ray_min = 3;
static int ray_max = 15;
static float ray_rotation_speed = .15;
static float quad_rotation_speed = .05;
float radius_change_max;
float radius_change_min;
int radius;
color C1;
color color_1; 
color color_2;
ArrayList circles = new ArrayList();
ArrayList quads = new ArrayList();
ArrayList rays = new ArrayList();

int [] modes = {
  HARD_LIGHT, SOFT_LIGHT
};
int bMode = 0;
int color_mode = 0;
boolean smoothOn = true;

//picture properties
int ray_count;
float ray_size;
float shape_radius;
int shape_count;
boolean outline;
float ray_rotation;
ArrayList quad_rotation = new ArrayList();
color[] shape_colors;
color[] ray_colors;
boolean irregular = false;


void setup() {
  ellipseMode(RADIUS);
  colorMode(HSB);
  size(1000, 1000);
  radius_change_max = height / 100 * radius_change_percent_max;
  radius_change_min = height / 100 * radius_change_percent_min;
  radius = height * 3;
  shape_colors = new color[35];
  ray_colors = new color[ray_max];

  background(255);
  smooth();
  frameRate(30);

  outline=false;
  setupShapes(false, 1);
}

void draw() {

  //draw the shapes
  noStroke();

  //color from the outside in (to use arc)

  for(int i = shape_count; i > 0; i--) {
    C1 = shape_colors[i - 1];
    //quad
    if (i % 2 == 0) {
      //go through each ray
      for(int i2 = 0; i2 < ray_count * 2; i2++) {
        float ray1 = (Float) rays.get(i2);
        float ray2;
        //get the next ray, wrapping around if it's the last one
        if (i2 < ray_count * 2 - 1)
          ray2 = (Float) rays.get(i2 + 1);
        else
          ray2 = (Float) rays.get(0);
        //see if line intersects
        ArrayList quadri = (ArrayList) quads.get(i / 2 - 1);
        for(int i3 = 0; i3 < 4; i3++) {
          //get the current vertex and the next one
          PVector p1 = (PVector) quadri.get(i3);
          PVector p2 = (PVector) quadri.get((i3 + 1) % 4);
          //this side of the quad intersects this ray
          PVector intersection1 = segIntersection(0, 0, cos(ray1) * height * 2, sin(ray1) * height * 2, p1.x, p1.y, p2.x, p2.y);
          if (intersection1 != null) {
            switch(color_mode) {
              //ray light color modes
            case 0: 
            case 1:
              if ((i2) % 2 == 0) {
                fill(C1);
              } 
              else {
                fill(blendColor(C1, ray_colors[(i2 - 1) / 2], modes[bMode]));
              }
              break;
              //black and color
            case 2:
              if ((i2) % 2 == 0) {
                fill(C1);
              } 
              else {
                fill(0);
              }
              break;
            case 3:
              if ((i2) % 2 == 0) {
                fill(color_1);
              } 
              else {
                fill(color_2);
              }
              break;
            }

            //if the next ray also intersects this side, fill between the 2 rays
            PVector intersection2 = segIntersection(0, 0, cos(ray2) * height * 2, sin(ray2) * height * 2, p1.x, p1.y, p2.x, p2.y);
            if (intersection2 != null) {
              beginShape();
              vertex(intersection1.x + center.x, intersection1.y + center.y);
              vertex(center.x, center.y);
              vertex(intersection2.x + center.x, intersection2.y + center.y);
              endShape();
            }
            //if it doesn't intersect, find the intersection with the next side and fill from ray to corner to ray
            else {
              //get the next vertex
              PVector p3 =(PVector) quadri.get((i3 + 2) % 4);
              //find the intersection with the next side
              intersection2 = segIntersection(0, 0, cos(ray2) * height * 2, sin(ray2) * height * 2, p2.x, p2.y, p3.x, p3.y);
              if (intersection2 != null) {
                beginShape();
                vertex(intersection1.x + center.x, intersection1.y + center.y);
                vertex(p2.x + center.x, p2.y + center.y);
                vertex(intersection2.x + center.x, intersection2.y + center.y);
                vertex(center.x, center.y);
                endShape();
              }
              //if it doesn't intersect this line, it must intersect the next line (assuming ray_min > 3)
              else {
                PVector p4 =(PVector) quadri.get((i3 + 3) % 4);
                intersection2 = segIntersection(0, 0, cos(ray2) * height * 2, sin(ray2) * height * 2, p3.x, p3.y, p4.x, p4.y);
                if (intersection2 != null) {
                  beginShape();
                  vertex(intersection1.x + center.x, intersection1.y + center.y);
                  vertex(p2.x + center.x, p2.y + center.y);
                  vertex(p3.x + center.x, p3.y + center.y);
                  vertex(intersection2.x + center.x, intersection2.y + center.y);
                  vertex(center.x, center.y);
                  endShape();
                }
                else {
                  if (i != shape_count) {//the last shape does not need to intersect the rays
                    println("error");
                    println("i: " + i);
                  }
                }
              }
            }
            break;
          }
        }
      }
    }
    //circle
    else {
      float rad = (Float) circles.get((i - 1) / 2); 

      //go through each ray and draw arcs betweem them at the radius
      for(int i2 = 0; i2 < ray_count * 2 - 1; i2++) {

        switch (color_mode) {
          //ray light color modes
        case 0:
        case 1:
          if (i2 % 2 == 0) {
            fill(C1);
          }
          else {
            fill(blendColor(C1, ray_colors[(i2 - 1) / 2], modes[bMode]));
          }
          break;
        case 2:
          if ((i2) % 2 == 0) {
            fill(0);
          } 
          else {
            fill(C1);
          }
          break;
        case 3:
          if ((i2) % 2 == 0) {
            fill(color_2);
          } 
          else {
            fill(color_1);
          }
          break;
        }

        float ray1 = (Float) rays.get(i2);
        float ray2 = (Float) rays.get(i2 + 1);
        arc(center.x, center.y, rad, rad, ray1, ray2);
      }

      //the last segment
      float ray1 = (Float) rays.get(0);
      float ray2 = (Float) rays.get(ray_count * 2 - 1);
      switch (color_mode) {
      case 0:
      case 1:
        fill(blendColor(C1, ray_colors[(ray_count - 1) / 2], modes[bMode]));
        break;
      case 2:
        fill(C1);
        break;
      case 3:
        fill(color_1);
      }
      arc(center.x, center.y, rad, rad, ray2, ray1 + 2 * PI);
    }
  }

  //outline the shapes
  if (outline) {
    //circles
    noFill();
    stroke(255);
    float rad;
    for(int i = 0; i < circles.size(); i++) {
      rad = (Float) circles.get(i);
      ellipse(center.x, center.y, rad, rad);
    }

    //quads
    for(int i = 0; i < quads.size(); i++) {
      PVector p;
      ArrayList quadri = (ArrayList) quads.get(i);
      beginShape();
      for(int i2 = 0; i2 < 4; i2++) {
        p = (PVector) quadri.get(i2);
        vertex(p.x + center.x, p.y + center.y);
      }
      endShape(CLOSE);
    }

    //rays
    float angle;
    for(int i=0; i < ray_count * 2; i++) {
      angle = (Float) rays.get(i);
      line(center.x, center.y, center.x + cos(angle) * radius, center.y + sin(angle) * radius);
    }
  }

  cycle();
}

void cycle() {
  //ray rotation
  ArrayList rays2 = new ArrayList();
  for(int i = 0; i < rays.size(); i++) {
    rays2.add((Float) rays.get(i) + ray_rotation);
  }
  rays = rays2;

  //quad rotation
  ArrayList quads2 = new ArrayList();
  ArrayList quadri;
  ArrayList quadri2;
  PVector p;
  //go through each quad
  for(int i = 0; i < quads.size(); i++) {
    quadri2 = new ArrayList();
    quadri = (ArrayList) quads.get(i);
    //rotate each point and store it in a new quad
    for(int i2 = 0; i2 < 4; i2++) {
      p = (PVector) quadri.get(i2);
      quadri2.add(rotatePoint(p.x, p.y, (Float) quad_rotation.get(i) ) );
    }
    //add the quad to the quad list
    quads2.add(quadri2);
  }
  //copy it to the original
  quads = quads2;
}

//create the shapes.  if shapes_only, don't assign new colors or speeds unless needed
//new_center: 0 - no new center; 1 - random position; 2 - 
void setupShapes(boolean shapes_only, int new_center) {

  //new center
  switch (new_center) {
  case 1:
    center = new PVector(random(height), random(width));
    break;
  case 2:
    center = new PVector(mouseX, mouseY); 
    break;
  }

  //new ray size
  ray_count = int(random(ray_min, ray_max));
  float ray_per = random(10, 90) / 100;
  ray_size = 2.0 * PI / (float)(ray_count) * ray_per;

  shape_radius = random(radius_change_min, radius_change_max);

  if (!shapes_only) {
    color_mode = int(random(color_mode_max));
    color_1 = color(random(255),random(255),random(255));
    color_2 = color(random(255),random(255),random(255));
  }

  //store the shapes
  shape_count = 0;
  circles.clear();
  quads.clear();
  rays.clear();

  while(shape_radius < height * 1.5) {

    //circle
    if (shape_count % 2 == 0) {
      shape_radius += random(radius_change_min, radius_change_max);
      circles.add(shape_radius);
    }
    //quadrilateral
    else {
      ArrayList quadri = new ArrayList();
      //wacky quads
      if (irregular) {
        ArrayList angles = new ArrayList();
        float shape_angle = 0;
        //to create a wacky quad: place the vertexes along the circle randomly
        for(int i=0; i<4; i++) {
          shape_angle += 3 *(PI / 8) + random(PI / 4); //each angle should be a quarter rotation away, but with deviance to create wacky shapes
          angles.add(shape_angle); //store the angle for later use
        }
        float biggest_angle = TWO_PI - (Float) angles.get(3) + (Float) angles.get(0); //find the first angle
        //find the biggest angle
        for(int i=1; i<4; i++) {
          if ( ((Float) angles.get(i) - (Float) angles.get(i-1)) > biggest_angle) {
            biggest_angle = (Float) angles.get(i) - (Float) angles.get(i-1);
          }
        }
        shape_radius = shape_radius / sqrt(1 - sin(biggest_angle / 2) * sin(biggest_angle / 2)) + random(radius_change_min, radius_change_max);
        for(int i=0; i < 4; i++) {
          quadri.add(new PVector(cos((Float) angles.get(i)) * shape_radius, sin((Float) angles.get(i)) * shape_radius));
        }
      }
      //squares
      else {
        shape_radius = sqrt(2) * shape_radius + random(radius_change_min, radius_change_max);
        float shape_angle = random(PI * 2);
        for(int i2 = 0; i2 < 4; i2++) {
          quadri.add(new PVector(cos(shape_angle) * shape_radius, sin(shape_angle) * shape_radius));
          //wacky quads
          shape_angle += PI / 2;
        }
      }
      quads.add(quadri);
      if(!shapes_only || quad_rotation.size() <= (shape_count - 1)/ 2) {
        quad_rotation.add(random(quad_rotation_speed) - quad_rotation_speed/2);
      }
    }

    //println("shape_count: " + shape_count);
    shape_count++;
  }

  //fill in all shape_colors, even if we won't use them
  if(!shapes_only) {
    for(int i = 0; i < shape_colors.length; i++) {
      shape_colors[i] = color(random(255), random(122, 255), random(50, 255));
    }
  }

  //store the rays
  float angle = 2 * PI / ray_count * random(1);

  for(int i=0; i < ray_count; i++) {
    rays.add(angle);
    rays.add(angle + ray_size);
    stroke(255);
    angle += 2 * PI / ray_count;
  }

  //fill in all ray_colors, even if we won't use them
  if(!shapes_only) {
    for(int i = 0; i < ray_colors.length; i++) {
      ray_colors[i] = color(random(255), 255, 255, 122);
    }
  }

  if (!shapes_only) {
    ray_rotation = random(ray_rotation_speed) - ray_rotation_speed/2;
  }

  //println("X shape_count: " + shape_count);
}


// Line Segment Intersection
PVector segIntersection(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4) {
  float bx = x2 - x1;
  float by = y2 - y1;
  float dx = x4 - x3;
  float dy = y4 - y3;
  float b_dot_d_perp = bx * dy - by * dx;
  if(b_dot_d_perp == 0) return null;
  float cx = x3 - x1;
  float cy = y3 - y1;
  float t = (cx * dy - cy * dx) / b_dot_d_perp;
  if(t < 0 || t > 1) return null;
  float u = (cx * by - cy * bx) / b_dot_d_perp;
  if(u < 0 || u > 1) return null;
  return new PVector(x1+t*bx, y1+t*by);
}


// pass a PVector and an angle of rotation in radians, returns the rotated PVector
PVector rotatePoint(float x, float y, float angle) {
  PVector rotatedPoint = new PVector();
  rotatedPoint.x = cos(angle) * x - sin(angle) * y;
  rotatedPoint.y = cos(angle) * y + sin(angle) * x;
  return rotatedPoint;
}

//assign new random colors
void newColors() {
  //two color mode
  color_1 = color(random(255),random(255),random(255));
  color_2 = color(random(255),random(255),random(255));

  //rays
  for(int i=0; i < ray_count; i++) {
    ray_colors[i] = color(random(255), 255, 255, 122);
  }

  //shapes
  for(int i=0; i < shape_count; i++) {
    shape_colors[i] = color(random(255), random(122, 255), random(50, 255));
  }
}

//assign new random speeds
void newSpeeds() {
  //rays
  ray_rotation = random(ray_rotation_speed) - ray_rotation_speed/2;
  //shapes
  for(int i=0; i < quad_rotation.size(); i++) {
    quad_rotation.set(i, random(quad_rotation_speed) - quad_rotation_speed/2);
  }
}

//keyboard input
void keyPressed() {
  switch (key) {
  case 'o': 
  case 'O':
    outline = !outline;
    break;
  case 'a': 
  case 'A':
    smoothOn = !smoothOn;
    if (smoothOn)
      noSmooth();
    else
      smooth();  
    break;
  case 'm': 
  case 'M':
    color_mode++;
    if(color_mode >= color_mode_max)
      color_mode = 0;
    //println("color_mode: " + color_mode);
    switch (color_mode) {
    case 0:
      bMode = 0;
      color temp = 0;
      for(int i=0; i < ray_count; i++) {
        temp = (color) ray_colors[i];
        ray_colors[i] = color(hue(temp), saturation(temp), brightness(temp), 122);
      }
      println("alpha: " + alpha(ray_colors[0]));
      break;
    case 1:
      bMode = 1;
      temp = 0;
      for(int i=0; i < ray_count; i++) {
        temp = (color) ray_colors[i];
        ray_colors[i] = color(hue(temp), saturation(temp), brightness(temp), 160);
      }
      println("alpha: " + alpha(ray_colors[0]));
      break;
    case 2:
      temp = 0;
      for(int i=0; i < ray_count; i++) {
        temp = (color) ray_colors[i];
        ray_colors[i] = color(hue(temp), saturation(temp), brightness(temp), 255);
      }
      println("alpha: " + alpha(ray_colors[0]));
      break;
    case 3:
      color_1 = color(random(255),random(255),random(255));
      color_2 = color(random(255),random(255),random(255));
      break;
    }
    break;
  case 'c':
  case 'C':
    newColors();
    break;
  case 'p':
  case 'P':
    newSpeeds();
    break;
  case 's':
  case 'S':
    setupShapes(true, 0);
    break;
  case 'i':
  case 'I':
    irregular = !irregular;
    setupShapes(true, 0);
    break;
  }
  if (key == CODED) {
    if (keyCode == RIGHT) {
      color temp = 0;
      for(int i=0; i < ray_count; i++) {
        temp = (color) ray_colors[i];
        ray_colors[i] = color(hue(temp), saturation(temp), brightness(temp), alpha(temp) + 10);
      }
      println("alpha: " + alpha(temp));
    }
  }
  if (keyCode == LEFT) {
    color temp = 0;
    for(int i=0; i < ray_count; i++) {
      temp = ray_colors[i];
      ray_colors[i] = color(hue(temp), saturation(temp), brightness(temp), alpha(temp) - 10);
    }
    println("alpha: " + alpha(temp));
  }
}

//click to create a new disco!
void mousePressed() {
  irregular = (random(1) > .5);
  setupShapes(false, 2);
}




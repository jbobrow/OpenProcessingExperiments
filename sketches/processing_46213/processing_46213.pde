
//Author: Dulce Andino 
 
//Purpose: Assignment:Spring 
 
//Concept: SPRING CONCEPT 
 
//Reference:  Exercise Provided in class (Pearson's) 
//import processing.opengl.*; 
 
 
 
void setup() { 
 
  size(500, 500, P3D); 
 
  background(255); 
 
  stroke(0);
} 
 
void pelota1() { 
 
 
 
  int radius = 90; 
 
  translate(width/3, height/3, 0); 
 
  rotateY(frameCount * 0.01); 
 
  rotateX(frameCount * 0.01); 
 
  float s = 0; 
 
  float t = 0; 
 
  float lastx = 0; 
 
  float lasty = 0; 
 
  float lastz = 0; 
 
  while (t < 180) { 
 
    s += 18; 
 
    t += 1; 
 
    float radianS = radians(s); 
 
    float radianT = radians(t); 
 
    float thisx = 2 + (-radius*cos(radianS)*sin(radianT)); 
 
    float thisy = 2 + (-radius*sin(radianS)*sin(radianT)); 
 
    float thisz = 5 + (-radius*cos(radianT)); 
 
    if (lastx != 0) { 
 
      stroke(255,243,0, 50); 
 
      strokeWeight(4); 
 
      line(thisx, thisz, thisy, lasty, lastx, lastz);
    } 
 
    lastx = thisx; 
 
    lasty = thisy; 
 
    lastz = thisz;
  }
}   
 
 
 
void pelota2() { 
  int radius = 200; 
 
  translate(width/4, height/6, 0); 
 
  rotateY(frameCount * 0.01); 
 
  rotateX(frameCount * 0.01); 
 
  float s = 1; 
 
  float t = 1; 
 
  float lastx = 0; 
 
  float lasty = 0; 
 
  float lastz = 0; 
 
  while (t < 180) { 
 
    s += 18; 
 
    t += 1; 
 
    float radianS = radians(s); 
 
    float radianT = radians(t); 
 
    float thisx = 0 + (radius*cos(radianS)*sin(radianT)); 
 
    float thisy = 0 + (radius*sin(radianS)*sin(radianT)); 
 
    float thisz = 0 + (radius*cos(radianT)); 
 
    if (lastx != 0) { 
 
      stroke(255, 0, 119, 90); 
 
      strokeWeight(7); 
 
      line(thisx, thisz, thisy, lasty, lastx, lastz);
    } 
 
    lastx = thisx; 
 
    lasty = thisy; 
 
    lastz = thisz;
  }
}  
 
 
 
void grama1() { 
 
  int radius = 800; 
 
  translate(height/3, width/2, 0); 
 
  rotateY(frameCount * 0.01); 
 
  rotateX(frameCount * 0.01); 
 
  float s = 0; 
 
  float t = 0; 
 
  float lastx = 5; 
 
  float lasty = 5; 
 
  float lastz = 5; 
 
  while (t < 180) { 
 
    s += 18; 
 
    t += 1; 
 
    float radianS = radians(s); 
 
    float radianT = radians(t); 
 
    float thisx = 1 + (-radius*cos(radianS)*sin(radianT)); 
 
    float thisy = 1 + (-radius*sin(radianS)*sin(radianT)); 
 
    float thisz = 1 + (-radius*cos(radianT)); 
 
    if (lastx != 0) { 
 
      stroke(152, 255, 0, 100); 
 
      strokeWeight(3); 
 
      line(thisx, thisz, thisy, lastz, lasty, lastx);
    } 
 
    lastx = thisx; 
 
    lasty = thisy; 
 
    lastz = thisz;
  }
}  
 
 
 
 
 
 
 
void grama2() { 
 
  int radius = 900; 
 
  translate(width/3, height/3, 0); 
 
  rotateY(frameCount * 0.01); 
 
  rotateX(frameCount * 0.01); 
 
  float s = 0; 
 
  float t = 0; 
 
  float lastx = 0; 
 
  float lasty = 0; 
 
  float lastz = 0; 
 
  while (t < 180) { 
 
    s += 18; 
 
    t += 1; 
 
    float radianS = radians(s); 
 
    float radianT = radians(t); 
 
    float thisx = 10 + (-radius*cos(radianS)*sin(radianT)); 
 
    float thisy = 10+ (-radius*sin(radianS)*sin(radianT)); 
 
    float thisz = 10 + (-radius*cos(radianT)); 
 
    if (lastx != 0) { 
 
      stroke(83, 116, 12, 50); 
 
      strokeWeight(5); 
 
      line(thisx, thisz, thisy, lasty, lastx, lastz);
    } 
 
    lastx = thisx; 
 
    lasty = thisy; 
 
    lastz = thisz;
  }
}   
 
 
 
 
 
void draw() { 
 
  background(255); 
 
  pelota1(); 
 
  grama1(); 
 
  pelota2(); 
 
  grama2();
}



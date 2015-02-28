

  int N = 20;
  Petal[] p = new Petal[N];
  Petal[] p2 = new Petal[N];
  float DISTANCE;

void setup() {
    size (550, 350);
    for (int i = 0; i < N; i++) {
      p[i] = new Petal((2*PI*i)/N+3);
      p2[i] = new Petal((2*PI*i)/N);
    }
  }
  
 void draw() {
   smooth();
   background(255);
    float DISTANCE = abs(dist(mouseX,mouseY,width/2,height/2));                 
    for (int i = 0; i < N; i++) {
      if (DISTANCE <= 200) {
        p[i].collapse();
        p2[i].collapset();
      }
      if (DISTANCE > 20 && p[i].expanded == false && p2[i].expanded == false) {
        p[i].expande();
        p2[i].expande();
      }
      if (p[i].spin == true && p2[i].spin == true) {
        p[i].spin();
        p2[i].spin();
      }
        p[i].display();
        p2[i].display();
        p[i].flutter();
        p2[i].flutter();
    }
}


class Petal {
  float x, y, r, s, k, z, g, ga;
  float t1, t2, t3, t4, t5, t6, t7, t8, t9, t10, t11, t12;
  float easingR, easingeR;
  float collapsedR, collapsedRt;
  float expandedR;
  boolean expanded = true;
  boolean spin = true;

  Petal (float rotation) {
    r = rotation;
    expandedR = rotation;
    ga = 0;
    collapsedR = 1.2;
    collapsedRt = 4.2;
    
  }

  void display () {
    pushMatrix();
    ellipse (width/2, height/2, t1*g, t1*g);
    popMatrix();
    pushMatrix();
    translate (width/2, height/2);
    beginShape();
    vertex (19,38);
    vertex (t8, t9);
    bezierVertex (114, -8, 146, -9, 167, 9);
    bezierVertex (183, 23, 190, 40, 190, 61);  
    bezierVertex (190, 83, 182, 102, 166, 121);
    bezierVertex (153, 136, 139, 146, 124, 150);
    bezierVertex (111, 154, t4, t5, t4, t5);
    vertex (t2, t3); 
    bezierVertex (124, 245, 183, 227, 228, 176);
    bezierVertex (261, 138, 277, 97, t11, t12);
    bezierVertex (277, 7, 260, -29, t6, t7);
    bezierVertex (178, -100, 114, -103, 35, -65);
    vertex (-19,-38);
    vertex (19, 38);
    rotate (r);
    scale(g);
    endShape ();
    popMatrix();
  }

  void spin () {
      if (r >= 10*PI) {
        r = 0;
      }
      else {
        r += s;
      }
  }
  
  void expande () {
    r += (expandedR - r) * easingeR;
    if (z >= 200) {
      r = expandedR;
      spin = true;
      expanded = true;
    }
  }

  void collapse () {
    r += (collapsedR - r) * easingR;
    expanded = false;
    spin = false;
  }
  
  void collapset () {
    r += (collapsedRt - r) * easingR;
    expanded = false;
    spin = false;
  }



  void flutter () {
    s = map(z, 190, 400, 0.001, 0.06);
    z = abs(dist(mouseX,mouseY,width/2,height/2));
    k = map(z,100,width/2,0,10);
    easingR = (map(z,0,400,0.3, 0.001));
    easingeR = (map(z,20,200,0.01,1));
    ga += 5; //pulse
    float angg = radians(ga); //pulse
    g = (map(z,0,width/2,0.5,1.5)) + (map(z,0,width/2,0.02,0.1) * cos(angg)); //pulse
    t10 = map(z, 20, 400, random(0,10), 36);
    if (z >= 20) {
      t2 = 50 - t10*cos(angg);
      t3 = 231 - t10*cos(angg);
      t4 = 65 - t10*cos(angg);
      t5 = 149 - t10*sin(angg);
      t6 = 227 - t10*cos(angg);
      t7 = -58 + t10*sin(angg);
      t8 = 73 + t10*sin(angg);
      t9 = 12 + t10*sin(angg);
      t11 = 277 + t10*cos(angg);
      t12 = 52 + t10*cos(angg);
    }
    else {
      t2 = 50;
      t3 = 231;
      t4 = 65;
      t5 = 149;
      t6 = 227;
      t7 = -58;
      t8 = 73;
      t9 = 12;
      t11 = 277;
      t12 = 52;
    } 
      t1 = 85;
    if (mousePressed == true) {
      fill(0,0,0,0);
      stroke (20);
      strokeWeight (0.5);
    }
    else {
    fill (k,0,0,map(z,0,width/2,50,20));
    noStroke();
    }
 }
 
 
 
}







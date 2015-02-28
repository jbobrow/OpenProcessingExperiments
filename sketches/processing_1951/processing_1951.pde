
PFont Andale;
int num;
ArrayList v_datas;
int ppp;
float ppp_dist;
int Action;

void setup() {
  size(800, 600);
  //noLoop();
  smooth();
  Andale = loadFont("AndaleMono-15.vlw");
  textFont(Andale, 15);
  strokeWeight(3);

  num = 2;

  v_datas = new ArrayList();

  for (int i = 0; i < num; i++) {
    v_datas.add(new Vertex_data(20+random(width-40),60+random(height-80), i));
  }

}
// ****************************************************************************
void draw() {
  
  background(30);
  
  ppp_dist= 10000;
  for (int i = 0; i < num; i++) {
    Vertex_data v_d = (Vertex_data) v_datas.get(i);
    v_d.check(dist(mouseX, mouseY, v_d.x, v_d.y));
  }
  
  textAlign(CENTER);
  for (int i = 0; i < num; i++) {
    Vertex_data v_d = (Vertex_data) v_datas.get(i);
    v_d.display();
  }
  
  textAlign(LEFT);
  text("the nearest point from the cursor: n°"+ ppp, 5, 15);
  textAlign(RIGHT);
  text("frameRate = "+ nf(frameRate,2,2), 795, 15);
  text("for "+ num +" points", 795, 35);
  
  if(keyPressed) {
    if (key == '+') {
      v_datas.add(new Vertex_data(20+random(width-40),60+random(height-80), num++));
    }
    else if (key == '-' && num > 2) {
      v_datas.remove(num-1);
      num--;
    }
  }
}
// ****************************************************************************
void mousePressed() {
  Action = 1;
}
void mouseReleased() {
  Action = 0;
}
void mouseDragged() {
  Action = 2;
}
// ****************************************************************************
class Vertex_data {

  float   x;
  float   y;
  int    id; 

  Vertex_data(float temp_x, float temp_y, int temp_id) {
    x  = temp_x;
    y  = temp_y;
    id = temp_id;
  }

  void check(float dist_check) {
    if (dist_check < ppp_dist) {
      ppp_dist = dist_check;
      ppp = id;
    }
  }

  void display() {
    noStroke();
    if (id == ppp) {
      if (Action != 0) {
        textAlign(LEFT);
        text("distance between this point and the cursor: "+ nf(ppp_dist,3,3) +" pixels", 5, 35);
        textAlign(CENTER);
        stroke(150);
        line(mouseX, mouseY, x, y);
        noStroke();
      }
      fill(150);
    } 
    else {
      fill(60);
    }
    ellipse(x, y, 30,30);
    fill(255);
    text(id,x,y+6);
  }
}  


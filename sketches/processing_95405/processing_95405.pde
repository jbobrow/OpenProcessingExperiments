
class Epilipse {
  float x;
  float y;
  float time;
  color col;
  
  Epilipse () {
    x = random(width);
    y = random(height);
    time = 0;
    col = color(random(255), random(255), random(255));
  }
  
  Epilipse(float fx, float fy) {
    x = fx;
    y = fy;
    time = 0;
    col = color(random(255), random(255), random(255));
  }
  
  Epilipse (color colo) {
    x = random(width);
    y = random(height);
    time = 0;
    col = colo;
  }
  
  void go () {
    x += random(-1, 1);
    y += random(-1, 1);
    time += random(0, 1);
    fill(col);
  }

  void plot() {
    ellipse (x, y, 20, 20);
  }
}

Epilipse grzegorz;
Epilipse aldona;
Epilipse fiona;

Epilipse[] e;

int doom = 1000;
float r;
float g;
float b;


void setup () {
  size(400, 400);
  e = new Epilipse[20];
  for( int i = 0; i < e.length; i++) {
    e[i] = new Epilipse();
  }
}

void draw () {
  background(255);
  for( int i = 0; i < e.length; i++) {
        if(e[i].time >= doom) {
      continue;
    }
    /*fill(map(i, 0, e.length, 0, 255),
         map(i, 0, e.length, 255, 0),
         255); */
    e[i].go();
    e[i].plot();

    for(int j = 0; j< e.length; j++) {
      if((dist(e[i].x, e[i].y, e[j].x, e[j].y))<=10 && i!=j){
                if(e[j].time >= doom) {
          continue;
        }
        
        r = (red(e[i].col) + red(e[j].col) / 2);
        g = (green(e[i].col) + green(e[j].col) / 2);
        b = (blue(e[i].col) + blue(e[j].col) / 2);
        
        e = (Epilipse[]) append(e, new Epilipse(color(r,g,b)));
        
        e[i].time =+ doom/3;
        
        e[i].x -= e[j].x - e[i].x;
        e[i].y -= e[j].y - e[i].y;
        
        e[j].x += e[j].x - e[i].x;
        e[j].y += e[j].y - e[i].y;
      }
    }
  }
}

void mousePressed () {
  e = (Epilipse[]) append(e, new Epilipse(mouseX, mouseY));
}

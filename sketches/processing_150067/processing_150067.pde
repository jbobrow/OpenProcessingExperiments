

int i = 0; // limita pentru reiterarea pasului in aceeasi directie 
int x = 0;
int y = 0;
int z = -400;
int step = 10;
int event = 0;
int rangeToCheck = 0;
int count = 0;
Cube [] cubes = new Cube [10000];
int zoom = 0;
int leftRight = width/2;
int upDown = height/2;




void setup() {
  size(900, 450, P3D);
  frameRate(10);
  cubes[count] = new Cube(x,y,z);
}


void draw() {
  background(200);
  translate(leftRight, upDown, zoom);
  tree();
  for (int i = 0; i < count; i++) {
    cubes[i].render();
  }
  if (count > cubes.length-2) {
    noLoop();
  }
}

void mousePressed() {
  //saveFrame( "cadre####.jpg");
}

void keyPressed() {
  if(key == '-') zoom-=50;
  if(key == '=') zoom +=50;
  if (key == 'l') leftRight+=50;
  if(key == 'r') leftRight-=50;
  if(key== 'u') upDown -=50;
  if(key == 'd') upDown +=50;
}

void mouseWheel(MouseEvent event) {
  zoom += event.getCount()*-10;
}





class Cube {
  int x, y, z;
  float alpha = 255;


  Cube(int x_, int y_, int z_) {
    x = x_;
    y = y_;
    z = z_;
  }

  void render() {
      pushMatrix();
      translate(x, y, z);
      //alpha = map(z, 300, -700, 255, 0);
      //alpha = constrain(alpha, 0, 255);
      fill(#3E7183, alpha);
      stroke(10, alpha);
      box(step); 
      popMatrix();
  }
}

void dice() {
  if (i == 0) {
    event = (int) random(6);
  }
  if (event == 0) {
    x+=step;
  } 
  else if (event == 1) {
    x-=step;
  } 
  else if (event == 2) {
    y+=step;
  } 
  else if (event == 3) { 
    y-=step;
  } 
  else if (event == 4) {
    z+=step;
  } 
  else { // event == 5...
    z-=step;
  }
  i++;
  if (i == 10) {
    i = 0;
  }
}

boolean selfIntersect = false;
void tree() {
  dice();
  for (int i = count - rangeToCheck; i < count; i++) {
    if (x == cubes[i].x && y == cubes[i].y && z == cubes[i].z) {
      selfIntersect = true;
    }
  }
  if (!selfIntersect) {
    cubes[count] = new Cube(x, y, z);
    count+=1;
    if (rangeToCheck <10) {
      rangeToCheck+=1;
    }
  }
  else {
    selfIntersect = false;
    try {
      x = cubes[count-1].x;
      y = cubes[count-1].y;
      z = cubes[count-1].z;
      tree();
    }
    catch (Exception e) {
      print("Hey, that's not a valid index");
    }
  }
}




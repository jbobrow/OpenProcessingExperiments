
Object[] array;
int num=2;
parent.document.getElementById("appletAjaxContainer").setAttribute("style", "background-color:transparent; border:0px;");

void setup () {
  size(512, 512);
  colorMode(HSB);
  smooth();
  noStroke();
  frameRate(30);

  array = new Object[512];
  for (int i=0;i<num;i++) {
    array[i]=new Object(random(1, 512), random(1, 512), random(8, 32));
  }
}

void draw() {
  externals.context.clearRect(0,0,width,height);
  for (int i=0;i<num;i++) {
    array[i].move();
  }
  for (int k=0;k<num;k++) {
    for (int j=0;j<num;j++) {
      if (k!=j) {
        array[k].gravitate(array[j].x, array[j].y, array[j].m);
      }
    }
  }
  //print(" "+array[1].xvel);
}

void mouseClicked(){
  array[num]=new Object(mouseX, mouseY, random(8, 32));  
  num+=1;
}

class Object {
  float x, y, m, xvel, yvel, dir;

  Object(float tempX, float tempY, float tempM) {
    x = tempX;
    y = tempY;
    m = tempM;
    xvel = 0;
    yvel = 0;
    dir = 0;
  } 

  void gravitate(float extx, float exty, float extm) {
    if (dist(x, y, extx, exty)>32) {
      xvel+=16*cos(atan2(exty-y, extx-x))*extm/sq(dist(x, y, extx, exty));
      yvel+=16*sin(atan2(exty-y, extx-x))*extm/sq(dist(x, y, extx, exty));
    }
  }

  void move() {
    x+=xvel;
    y+=yvel;
    if (x<0||x>512) {
      xvel*=-1;
    }
    if (y<0||y>512) {
      yvel*=-1;
    }
    fill(256-4*m);
    ellipse(x, y, m, m);
  }
}






int numballs = 41, magnet = 0;
float friction = .999f;
// rad = 30
float maxSpeed = 15;
float clusterRad = 1.1f, clusterMult = 1.0f;//Play with these values to get grouping/clustering


Ball[] tableballs = new Ball[numballs];


void setup() {

  // size(screen.width,screen.height);
  size (700,700);

  ellipseMode(CENTER);

  MySetup() ; 

}

void MySetup() {

  float x = 0, n = 0;
  tableballs[0] = new Ball();

  tableballs[0].cx = 0.9f * width;// '0 is cueball
  tableballs[0].cy = height / 2;

  x = (int)(random(1) * 0.5f * width);

  if(x<=1){
    x=1;
  }

  for (int i=1; i<numballs; i++) {
    tableballs[i] = new Ball();

    tableballs[i].cx = x;
    tableballs[i].cy = (.5f * tableballs[0].cy) + (n * (tableballs[i].rad * 2)) + 0;
    n++;

    if (tableballs[i].cy > 500) {
      n = 0;
      x = x + tableballs[i].rad*1.3;
    }
  }
}

void keyPressed() {
  if (key == 'm') {
    magnet = 1;
  }
}

void keyReleased() {
  if (key == 'w') {
    clusterRad += 0.1f;
    println(clusterRad);
  } 
  else if (key == 's') {
    clusterRad -= 0.1f;
    println(clusterRad);
  } 
  else if (key == 'm') {
    magnet = 0;
  }
  else if (key == 'n') {
    MySetup() ; 
  }
}


/*
void mouseClicked() {
 float R = 0, ang = 0;
 
 R = dist(mouseX, mouseY, tableballs[0].cx, tableballs[0].cy);
 
 if (R > maxSpeed) {
 R = maxSpeed;
 }
 
 ang = atan2((mouseY - tableballs[0].cy), (mouseX - tableballs[0].cx));
 
 tableballs[0].vx = R * cos(ang);
 tableballs[0].vy = R * sin(ang);
 
 }
 */

void draw() {

  background(127);

  float ColDist = 0, ang = 0, R = 0, dx = 0, dy = 0;

  for (int i=0; i<numballs; i++) {
    tableballs[i].cx = tableballs[i].cx + tableballs[i].vx;
    tableballs[i].cy = tableballs[i].cy + tableballs[i].vy;
    tableballs[i].vx = tableballs[i].vx * friction;
    tableballs[i].vy = tableballs[i].vy * friction;

    if (tableballs[i].cx < tableballs[i].rad) {
      tableballs[i].vx = -tableballs[i].vx;
      tableballs[i].cx = tableballs[i].rad;
    } 
    else if (tableballs[i].cx > (width - 1 - tableballs[i].rad)) {
      tableballs[i].vx = -tableballs[i].vx;
      tableballs[i].cx = width - 1 - tableballs[i].rad;
    }

    if (tableballs[i].cy < tableballs[i].rad) {
      tableballs[i].vy = -tableballs[i].vy;
      tableballs[i].cy = tableballs[i].rad;
    } 
    else if (tableballs[i].cy > (height - 1 - tableballs[i].rad)) {
      tableballs[i].vy = -tableballs[i].vy;
      tableballs[i].cy = height - 1 - tableballs[i].rad;
    }


    for (int j=0; j<numballs; j++) {

      ColDist = dist(tableballs[j].cx, tableballs[j].cy, tableballs[i].cx, tableballs[i].cy);

      if ( (ColDist <= (clusterMult * tableballs[i].rad)) && (i != j) ) {

        ang = atan2((tableballs[j].cy - tableballs[i].cy), (tableballs[j].cx - tableballs[i].cx));


        //if a ball is on or inside the other, push it to just outside
        dx = -clusterRad * tableballs[i].rad * cos(ang);
        dy = -clusterRad * tableballs[i].rad * sin(ang);
        tableballs[i].cx = dx + tableballs[j].cx;
        tableballs[i].cy = dy + tableballs[j].cy;

        //Get the reflection angle
        if (ang > (2 * PI)) {
          ang = (2 * PI) - ang;
        } 
        else if (ang < 0) {
          ang = ang + (2 * PI);
        }

        R = dist(0, 0, tableballs[i].vx, tableballs[i].vy);


        dx = R * cos(ang);
        dy = R * sin(ang);

        //Put the velocity of the 'attacking' ball into the target
        tableballs[j].vx = dx;
        tableballs[j].vy = dy;



        //'Decrease velocity from the attacker
        tableballs[i].vx = 0.2f * tableballs[i].vx;
        tableballs[i].vy = 0.2f * tableballs[i].vy;

        if (magnet == 1) {

          //'Goto first ball
          if (tableballs[0].cx < tableballs[i].cx) {
            tableballs[i].vx = tableballs[i].vx - 1.0f;
          } 
          else if (tableballs[0].cx > tableballs[i].cx) {
            tableballs[i].vx = tableballs[i].vx + 1.0f;
          }
          if (tableballs[0].cy < tableballs[i].cy) {
            tableballs[i].vy = tableballs[i].vy - 1.0f;
          } 
          else if (tableballs[0].cy > tableballs[i].cy) {
            tableballs[i].vy = tableballs[i].vy + 1.0f;
          }

        }

        // tableballs[i].rad = random(20,60);
        tableballs[i].color1 = color (random (0,255),random (0,255),random (0,255));

      }

    }


    if (i == 0) {
      fill(255);
    } 
    else if (i == (numballs - 1)) {
      fill(0,255,0);
    } 
    else {
      fill( tableballs[i].color1 );
    }

    noStroke();
    ellipse(tableballs[i].cx, tableballs[i].cy, 
    tableballs[i].rad, 
    tableballs[i].rad);

  }

  stroke(0,255,0);
  // line(tableballs[0].cx, tableballs[0].cy, mouseX, mouseY);

  if (random (999) > 900) {
    mouseClickedFAKE(); 
  }

}


void mouseClickedFAKE() {
  float R = 0, ang = 0;

  float xWert= random(0,width); 
  float yWert= random(0,height);

  R = dist(  xWert, yWert  , tableballs[0].cx, tableballs[0].cy);

  if (R > maxSpeed) {
    R = maxSpeed;
  }

  ang = atan2((yWert - tableballs[0].cy), (xWert - tableballs[0].cx));

  tableballs[0].vx = R * cos(ang);
  tableballs[0].vy = R * sin(ang);

}


class Ball {
  float cx = 0, cy = 0, vx = 0, vy = 0;
  float rad = 40; 
  color color1= color (random (0,255),random (0,255),random (0,255));
}











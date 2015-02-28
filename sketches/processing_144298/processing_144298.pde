
/////////////////////////// 
//                       //
//   -~=Manoylov AC=~-   //
//                       //
///////////////////////////
//
// Don't use without permission
//
// Based on:
// #510 Mad tiler 
// http://geometrydaily.tumblr.com/post/58788031158/510-mad-tiler
//
// Controls:
// mouseClick - new random composition 
// 
// keys:
// UP   - tileSize + 2
// DOWN - tileSize - 2
//
/////////////////////////////////////////////////

int sz = 700;

int startPos = sz/100*15;
int endPos = sz - startPos;

int wdrect = sz/25;
float hgrect = wdrect*1.75;

float gip = sqrt((wdrect*wdrect)+(hgrect*hgrect));
float vrStep = hgrect/2;
float hrStep = gip+wdrect;


int [] ang = {
  0, 60, 120
};

void setup() {
  size (sz, sz);
  background(240);
  noLoop();
}

void draw() {

  background(240);
  fill(#21708a);
  noStroke();

  int ch = 0;
  for (int y = startPos; y<endPos ;y+=vrStep) {

    for (int x = startPos; x<=endPos ;x+=hrStep) {
      if (ch%2==0) {
        block(x, y);
      }
      else if (x+hrStep/2<=endPos) {
        block(x+hrStep/2, y);
      }
    }
    ch++;
  }

  for (int i = 0; i<width-1; i+=2) {
    for (int j = 0; j<height-1; j+=2) {
      fill(random(235-40, 235+30), 25);
      rect(i, j, 2, 2);
    }
  }
  
     for (int i = 0; i<30; i++) {
     fill(random(130, 215), random(100, 170));
     rect(random(0, width-2), random(0, height-2), random(1, 3), random(1, 3));
  }
}


void block(float x, int y) {
  pushMatrix();
  rectMode(CENTER);
  translate(x, y);

  rotate(radians(ang[(int)random(ang.length)]));
  rect(0, 0, wdrect, hgrect+1);  
  popMatrix();
}

void mouseClicked() {
  redraw();
}


void keyPressed( ) {
  if (keyCode == DOWN) {
    wdrect-=2;
  }

  if (keyCode == UP) {
    wdrect+=2;
  }


  wdrect = constrain(wdrect, 5, width/15);

  hgrect = wdrect*1.75;
  gip = sqrt((wdrect*wdrect)+(hgrect*hgrect));
  vrStep = hgrect/2;
  hrStep = gip+wdrect;

  redraw();
}


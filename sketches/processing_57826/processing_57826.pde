
// Created by Derek Chen
// ARCH 2503 Digital Media, Department of Architecture, Cornell AAP

int n = 0; //number of bridge segments
int l = 0 ; //light counter
int ly = 1;

void setup() {
  size(1000, 450);
  background(255);
  fill(0);
  strokeWeight(1);
  smooth();
}

void draw() {
  float x = mouseX;
  float y = mouseY;
  float w = x - (100+24*(n+1)); //width
  float h = y - 10; //height

  stroke(255);
  fill(255);
  rect(100+24*(n+1), 10, width, height);
  rect(0, 72, width, height);

  if (x<100+24*(n+1)||y<10) {
  }
  else {
    //mass
    strokeWeight(1);
    fill(x/3, y/4, 25);
    quad(100+24*(n+1), 10, x, 10, x, y, 100+24*(n+1), y);

    //interior openings
    fill(255);
    rect(100+24*(n+1)+w/8, 20, w/2, h/3);
    pushMatrix();
    for (int j=0;j<4;j++) {
      fill(j*70, l+25*j, 255, 255-l);
      rect(100+24*(n+1)+5*w/8, 20, w/7, (h-20)/4);
      translate(0, h/4);
    }
    popMatrix();
  }

  //draw site
  if (x>=124&&y>=70) {
    fill(x/4, y/2, 100);
    stroke(0, 0);
    rect(0, 70, 124, height);
    quad(124, 70, 100+24*(n+1), y, 100+24*(n+1), 500, 124, 500);
    rect(100+24*(n+1), y, width, height);
  }

  if (l<255&&ly==1) l++;
  else l--;

  if (l==255||l==0) ly*=-1;
}

void mousePressed() {
  float x = mouseX;
  float y = mouseY;

  background(255);
  fill(255);
  pushMatrix();
  stroke(0);

  //add segment if click is to right of last segment
  //remove if to left
  translate(0, 20);
  if (mouseX >= (n*24+100)) n++;
  else n--;

  //redraw canvas with correct number of bridge segments
  for (int i=1;i<=n;i++) {
    strokeWeight(2);
    rect(100+24*i, 10, 24, 40);

    strokeWeight(1);
    if (i%2==1) line(100+24*i, 50, 100+24*(i+1), 10);
    else line(100+24*i, 10, 100+24*(i+1), 50);
  }

  popMatrix();
}



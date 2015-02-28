
// Created by Sarah Oh
// ARCH 2503 Digital Media, Department of Architecture, Cornell AAP
// Lovell Health House by Richard Neutra

int widtha = int(random(1, 30));

int a=0;
int h=0;
int b=2;
int e=458;
int f=59;
int g=59;

int c=0;
int i=686;
int d=684;
int j=684;
int k=684;
int l=741;

int m=0;
int n=0;
int o=2;
int p=widtha*24+2;
int q=widtha*3+2;
int r=widtha*3+2;

int s=684;
int t=684;


float clickX = 260;
float clickY = 330;

void setup() {
  background(255);
  size(1367, 520);
  smooth();
  stroke(0, 0, 0, 50);
}

void draw() {

  /////////////////////////TOP LEFT

  if (a<688) {

    strokeWeight(2);
    stroke(0, 50);
    line(a, 0, a, 260);
    a+=57;
  }

  if (mouseX>0 && mouseY>0 && mouseX<680 && mouseY<260) {

    if (h<680) {
      strokeWeight(1);
      stroke(0);
      line(h, 0, h, 260);
      h+=19;
    }
  }
  if (mousePressed) {
    clickX = mouseX;
    clickY = mouseY;
    if (mouseX>0 && mouseY>0 && mouseX<680 && mouseY<260) {
      if (b<680) {
        fill(0, 50);
        noStroke();
        rect(b, 30, 17, 36);
        b+=19;
      }
      if (e<680) {
        fill(0, 50);
        noStroke();
        rect(e, 68, 17, 36);
        rect(e, 106, 17, 36);
        e+=19;
      }
      if (f<560) {
        fill(0, 50);
        noStroke();
        rect(f, 144, 17, 36);
        f+=19;
      }
      if (g<560) {
        fill(0, 50);
        noStroke();
        rect(g, 182, 54, 36);
        g+=57;
      }
    }
  }

  ////////////////////////TOP RIGHT

  float aWidth = random(5, 30);
  if (mouseX>680) {
    if (c<1360) {
      strokeWeight(2);
      stroke(0, 0, 102, 150);
      line(c+684, 0, c+684, 260);
      c+=aWidth*3;
    }
  } 

  if (mouseX>690 && mouseY>0 && mouseX<1360 && mouseY<260) {

    if (i<1360) {
      strokeWeight(1);
      stroke(0, 0, 102, 50);
      line(i, 0, i, 260);
      i+=aWidth;
    }
  }

  if (mousePressed) {
    clickX = mouseX;
    clickY = mouseY;
    if (mouseX>680 && mouseY>0 && mouseX<1360 && mouseY<260) {
      if (d<1365) {
        fill(0, 0, 102, 150);
        noStroke();
        rect(d+aWidth, 30, aWidth-1, 36);
        d+=aWidth+1;
      }
      if (j<1360) {
        fill(0, 0, 102, 150);
        noStroke();
        rect(j+aWidth*4, 68, aWidth, 36);
        rect(j+aWidth*5, 106, aWidth, 36);
        j+=aWidth+1;
      }
      if (k<1240) {
        fill(0, 0, 102, 150);
        noStroke();
        rect(k+aWidth, 144, 17, 36);
        k+=aWidth+1;
      }
      if (l<1240) {
        fill(0, 0, 102, 150);
        noStroke();
        rect(l+aWidth/4, 182, aWidth+1, 36);
        l+=aWidth+1;
      }
    }
  } 

  ///////////BOTTOM LEFT

  if (mouseX>0 && mouseY>260 && mouseX<680 && mouseY<520) {
    if (m<684) {
      strokeWeight(2);
      stroke(255, 255, 102, 200);
      line(m, 260, m, 520);
      m += widtha*3;
    }

    if (n<684) {
      strokeWeight(1);
      stroke(255, 255, 102, 150);
      line(n, 260, n, 520);
      n += widtha;
    }
  }

  if (mousePressed) {
    clickX = mouseX;
    clickY = mouseY;
    if (mouseX>0 && mouseY>260 && mouseX<680 && mouseY<520) {
      if (o<684) {
        fill(255, 255, 102, 200);
        noStroke();
        rect(o, 290, widtha-1, 36);
        o+=widtha;
      }
      if (p<684) {
        fill(255, 255, 102, 200);
        noStroke();
        rect(p, 328, widtha-1, 36);
        rect(p, 366, widtha-1, 36);
        p+=widtha;
      }
      if (q<684) {
        fill(255, 255, 102, 200);
        noStroke();
        rect(q, 404, widtha-1, 36);
        q+=widtha;
      }
      if (r<684) { 
        fill(255, 255, 102, 200);
        noStroke();
        rect(r, 442, widtha*3-1, 36);
        r+=widtha*3;
      }
    }
  } 

  ///////////////////////BOTTOM RIGHT

  if (mouseY>260 && mouseX>580) {
    if (s<1360) {
      strokeWeight(2);
      stroke(51, 153, 255, 200);
      line(s, 260, s, 520);
      s += 57;
    }
    if (t<1360) {
      strokeWeight(1);
      stroke(51, 153, 255, 200);
      line(t, 260, t, 520);
      t+=19;
    }
  }  

  float aHeight = random(17, 80);
  if (mousePressed) {
    clickX = mouseX;
    clickY = mouseY;
    if (mouseX>680 && mouseY>290 && mouseX<1360 && mouseY<326) { 
      fill(51, 153, 255, 200);
      noStroke();
      rect(random(680, 1360), 290, 17, 36);
    }
    if (mouseX>1142 && mouseY>328 && mouseX<1360 && mouseY<364) {
      fill(51, 153, 255, 200);
      noStroke();
      rect(random(1142, 1360), 328, 17, 36);
    } 
    if (mouseX<1142 && mouseY>366 && mouseX<1360 && mouseY<402) {
      fill(51, 153, 255, 200);
      noStroke();
      rect(random(1142, 1360), 366, 17, 36);
    }
    if (mouseX<739 && mouseY>404 && mouseX<1240 && mouseY<440) {
      fill(51, 153, 255, 200);
      noStroke();
      rect(random(739, 1240), 404, 17, 36);
    }
    if (mouseX<739 && mouseY>442 && mouseX<1240 && mouseY<478) {
      fill(51, 153, 255, 200);
      noStroke();
      rect(random(739, 1240), 442, 54, 36);
    }
  }
}



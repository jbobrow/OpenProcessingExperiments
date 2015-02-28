
Pattern A,B,C,D,E,F;
PFont font;
int FONT_SIZE = 24;
void setup() {
  size(480, 320);
  
  colorMode(HSB);
  font = createFont("Helvetica", FONT_SIZE);
  textFont(font);
  dataSetup();
}

void dataSetup() {
  A = randomPattern();
  B = randomPattern();
  C = randomPattern();
  D = randomPattern();
  E = randomPattern();
  F = randomPattern();
  drawn = false;
}

boolean drawn = false;

// TODO: could optimize by finding the period and creating a lookup table
void draw() {
  if(drawn) return;
  loadPixels();
  
  int i = 0;
  int rowlength = width/2;
  int collength = height/2;
  int rowinc = width;
  float hueMult = 255/8;
  int p1 = 0, p2 = 1, p3 = width, p4 = width+1;
  for(int c = 0; c < collength; c++) {
    for(int r = 0; r < rowlength; r++) {
      int hue,sat,val;
      
      int h1 = (i%A.mod > A.threshold) ? 1 : 0;
      int h2 = (i%B.mod > B.threshold) ? 2 : 0;
      int h3 = (i%C.mod > C.threshold) ? 4 : 0;
      
      hue = int((h1+h2+h3)*hueMult);
      
      if(i%D.mod > D.threshold) {
        sat = 64;
      } else {
        sat = 192;
      }
      if((i%E.mod > E.threshold) ^ (i%F.mod > F.threshold)) {
        val = 64;
      } else {
        val = 192;
      }
      i++;
      pixels[p1] = pixels[p2] = pixels[p3] = pixels[p4] = color(hue,sat,val);
      p1 += 2; p2 += 2; p3 += 2; p4 += 2;
    }
    p1 += rowinc; p2 += rowinc; p3 += rowinc; p4 += rowinc;
  }
  updatePixels();
  
  // draw a little interface that
  if(mousePressed) {
    float halfHeight = height/2.0;
    float sixthWidth = width/6.0;
    
    textAlign(CENTER, CENTER);
    String sector1 = "n%"+A.mod+" < "+A.threshold+"\n"+"n % "+B.mod+" < "+B.threshold;
    String sector2 = "n%"+C.mod+" < "+C.threshold+"\n"+"n % "+D.mod+" < "+D.threshold;
    String sector3 = "n%"+E.mod+" < "+E.threshold+"\n"+"n % "+F.mod+" < "+F.threshold;
    
    int xpadding = 16, ypadding = 16;
    rectMode(CENTER);
    fill(0, 0, 0, 200); // hsb translucent black
    rect(sixthWidth, halfHeight, textWidth(sector1) + xpadding, FONT_SIZE*2+ypadding);
    rect(width/2, halfHeight, textWidth(sector2) + xpadding, FONT_SIZE*2+ypadding);
    rect(width-sixthWidth, halfHeight, textWidth(sector3) + xpadding, FONT_SIZE*2+ypadding);

    noStroke();
    fill(255);
    text(sector1, sixthWidth, halfHeight);
    text(sector2, width/2, halfHeight);
    text(sector3, width-sixthWidth, halfHeight);
  }
  
  drawn = true;
}

int sector;
void mousePressed() {
  if(mouseX < width/3) {
    sector = 1;
  } else if(mouseX < width*2/3) {
    sector = 2;
  } else {
    sector = 3;
  }
}

void mouseReleased() {
  drawn = false;
}

int pdx,pdy;
final int mouseInsensitivity = 3;
void mouseDragged() {
  int dx = mouseX-pmouseX+pdx;
  int dy = mouseY-pmouseY+pdy;
  // save the remainder
  pdx = dx%mouseInsensitivity;
  pdy = dy%mouseInsensitivity;
  
  dx = dx/mouseInsensitivity;
  dy = dy/mouseInsensitivity;
  if(sector == 1) {
    A.add(dx);
    B.add(dy);
  } else if(sector == 2) {
    C.add(dx);
    D.add(dy);
  } else {
    E.add(dx);
    F.add(dy);
  }
  drawn = false;
}

void keyPressed() {
  if(key == ' ') {
    dataSetup();
  }
}

Pattern randomPattern() {
  int mod = int(random(5, 60));
  return new Pattern(int(random(1, mod)), mod);
}

public class Pattern {
  public int threshold, mod;

  Pattern(int threshold, int mod) {
    this.threshold = threshold;
    this.mod = mod;
  }
    
  void add(int n) {
   if(n > 0) {
    while(n > 0) {
      incr();
      n--;
    }
  } else if(n < 0) {
    while(n < 0) {
      decr();
      n++;
    }
  }

  }
  void incr() {
    if(threshold < mod-1) {
      threshold++;
    } else {
      mod++;
      threshold = 1;
    }
  }
  void decr() {
    if(threshold == 1) {
      if(mod > 2) {
        mod--;
        threshold = mod-1;
      } // else, no change, we've hit the lower limit
    } else {
      threshold--;
    }
  }
}




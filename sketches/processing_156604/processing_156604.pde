
int n, iB, iR, oR;

void setup() {  //setup function called initially, only once
  size(800, 800);
  background(255);  //set background white
  n = 50;
  strokeCap(SQUARE);
  iB = 40;
  iR = 200;
  oR = 350;
}

void draw() {
    background(255);
    for (int i = 0; i < n; i++) {
        float t = (i/n)*TWO_PI+millis()/2000;
        int l = iB+(sin(3*(t+(millis()/4000)))+1)*(iR/2);
    
        int x1 = (width/2)+sin(t)*oR;
        int y1 = (height/2)+cos(t)*oR;
        int x2 = (width/2)+sin(t+QUARTER_PI/4)*l;
        int y2 = (height/2)+cos(t+QUARTER_PI/4)*l;
        
        int f = (i/n)*TWO_PI;
     
        int r = sin(f + 0) * 127 + 128;
        int g = sin(f + 2) * 127 + 128;
        int b = sin(f + 4) * 127 + 128;
        
        strokeWeight((l/(iR+iB))*10);
        stroke(r, g, b);
        line(x1, y1, x2, y2);
    }
    
}

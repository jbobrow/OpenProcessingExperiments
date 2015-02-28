
PFrame f;
secondApplet s;
color col;
int segs = 12;
int steps = 6;
float rotAdjust = TWO_PI / segs / 2;
float rad;
float segWidth;
float interval = TWO_PI / segs;


void setup() {
  size(400, 400);
  PFrame f = new PFrame();
  // make the diameter 90% of the sketch area
  rad = min(s.width, s.height) * 0.45;
  segWidth = rad / steps;
  s.ellipseMode(RADIUS);
  s.noStroke();
 s.smooth();
   s.background(0);
   for (int j = 0; j < steps; j++) {
    color[] cols = { color(255-(255/steps)*j, 255-(255/steps)*j, 0),color(255-(255/steps)*j, (255/1.5)-((255/1.5)/steps)*j, 0), 
      color(255-(255/steps)*j, (255/2)-((255/2)/steps)*j, 0),color(255-(255/steps)*j, (255/2.5)-((255/2.5)/steps)*j, 0), 
      color(255-(255/steps)*j, 0, 0),color(255-(255/steps)*j, 0, (255/2)-((255/2)/steps)*j), 
      color(255-(255/steps)*j, 0, 255-(255/steps)*j),color((255/2)-((255/2)/steps)*j, 0, 255-(255/steps)*j), 
      color(0, 0, 255-(255/steps)*j),color(0, 255-(255/steps)*j, (255/2.5)-((255/2.5)/steps)*j), 
      color(0, 255-(255/steps)*j, 0),color((255/2)-((255/2)/steps)*j, 255-(255/steps)*j, 0) };
      
    for (int i = 0; i < segs; i++) {
      color a=cols[i];
      s.fill(red(a),green(a),blue(a));
      s.arc(s.width/2, s.height/2, rad, rad,interval*i+rotAdjust, interval*(i+1)+rotAdjust);
      s.redraw();
    }
    rad -= segWidth;
  }
   
}

void draw() {
  //col=color(0,0,0);
  background(col);
   fill(255);
   rect(10,10,frameCount,10);
   if(s.mousePressed){
     color c;
     col=s.get(s.mouseX,s.mouseY);
     println(s.mouseX+","+blue(col));
   }
}


public class PFrame extends Frame {
    public PFrame() {
        setBounds(50,50,200,200);
        s = new secondApplet();
        add(s);
        s.init();
        show();
    }
}
  




// "Light blue and the same red with purple makes a change. It shows that there is no
//  mistake. Any pink shows that and very likely it is reasonable. Very likely there should
//  not be a finer fancy present. Some increase means a calamity and this is the best
//  preparation for three and more being together. A little calm is so ordinary and in any
//  case there is sweetness and some of that."
// [Gertrude Stein, Tender Buttons]


FloatList coordinates;
float segLength = 10;
boolean help;
ArrayList<Cob> cobs;
Cob cob;
color c;
int h,s,p;
int n = 32;
boolean started, released;
color white;
float rr;
int dim = 600;
float m;
PrintWriter output;

void setup() {
  size(808,606);
  colorMode(HSB,360,100,100);
  white = #fafff0;
  background(white);
  noStroke();
  p=48;
  rr=106;
  h = (int) random(255);
  s = (int) random(255);
  smooth();
  cobs = new ArrayList<Cob>();
  float x,y;
  for (int i=0;i<4;i++) {
    for (int j=0;j<5;j++) {
      x = p+.5*rr+2*j*(p+.5*rr);
      y = p+.5*rr+2*i*(p+.5*rr);
      cob = new Cob(x,y,rr,color(random(360),random(39,100),random(14,85)));
      cobs.add(cob);
      cob.display();
      ellipse(x,y,30,30);
    } 
  }
}
 
void draw() {
  if (help) {
    background(0);
    showHelp();
  }
  else {
   //background(0,0,93.3);
    background(white);
    for (int i=0;i<cobs.size();i++) {
      cobs.get(i).display();
    } 
  }
}

void showHelp() {
    fill(255,255,255); 
    text("HELP:",60,60);    
    text("click on button to change color randomly",60,90); 
    text("KEYS:",60,120);
    text("h: help",90,150);
    text("s: save current drawing (to tenderbuttons<..>.jpg",90,180);
    text("p: save current drawing (to tenderbuttons<..>.jpg, palette to tenderbuttons_palette<..>.jpg",90,210);
    text("<space>: generate new drawing",90,240);
    text("Press <space> to return to drawing",60,300);
}

void mousePressed() {
 for (int i=0;i<cobs.size();i++) {
      cob = cobs.get(i);
      if (cob.isClicked(mouseX,mouseY)) {
        cob.changeColor();
      }
 }
}

void mouseReleased() {

}

// Cob stands for "Colored OBject"
class Cob {
  PVector center = new PVector();
  float r;
  color col;
  
  Cob(float cX, float cY, float r, color col) {
    this.center.x = cX;
    this.center.y = cY;
    this.r = r;
    this.col = col;
  }
 
  void changeColor() {
    this.col = color(random(360),random(100),random(100));
  }
  
  void display() {
    fill(col);
    ellipse(center.x,center.y,r,r);
  }
  
  boolean isClicked(float cX, float cY) {
    boolean result;
    result = sqrt(pow(cX-this.center.x,2)+pow(cY-this.center.y,2))<=this.r ? true: false;
    return result;
  }
}

void keyPressed() {
  switch(key) {
  case ' ': 
    if (help) {
      help = false;
    }
    else {
      setup();  
    }
    break;
  case 'h': 
    help = true;
    break;
  case 's':
    m = millis();
    save("tenderbuttons"+str(m)+".jpg");
    break;
  case 'p':
    m = millis();
    output = createWriter("tenderbuttons_palette"+str(m)+".txt"); 
     for (int i=0;i<cobs.size();i++) {
      cob = cobs.get(i);
      output.println("("+str(cob.center.x)+","+str(cob.center.y)+") HSB: " + 
                     str(hue(cob.col)) + "|" + str(saturation(cob.col)) + 
                     "|" + str(brightness(cob.col))  );
     }
    output.flush();  // Writes the remaining data to the file
    output.close();  // Finishes the file
    save("tenderbuttons"+str(m)+".jpg");
    break;
  default:
    println("unknown key");   // Does not execute
    break;
  }
}

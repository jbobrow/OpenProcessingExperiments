
HScrollbar hsSXr, hsSXg, hsSXb, hsDXr, hsDXg, hsDXb, hsr, hsg, hsb;

float r;
float g;
float b;

float sfondoSXr;
float sfondoSXg;
float sfondoSXb;

float sfondoDXr;
float sfondoDXg;
float sfondoDXb;


void setup() {
  size(800, 800);
  colorMode(HSB);
  background(200);
  noStroke();
  
  r=random(255);
  g=random(255);
  b=random(255);
  

  hsSXr = new HScrollbar(0, 640, 265, 10, 1);
  hsSXg = new HScrollbar(0, 670, 265, 10, 1);
  hsSXb = new HScrollbar(0, 700, 265, 10, 1);
  
  hsDXr = new HScrollbar(width/2, 640, 265, 10, 1);
  hsDXg = new HScrollbar(width/2, 670, 265, 10, 1);
  hsDXb = new HScrollbar(width/2, 700, 265, 10, 1);
  
  hsr = new HScrollbar(268, 495, 265, 10, 1);
  hsg = new HScrollbar(268, 525, 265, 10, 1);
  hsb = new HScrollbar(268, 555, 265, 10, 1);

}

void draw() {


    noStroke();
    
    sfondoSXr=hsSXr.getPos();
    sfondoSXg=hsSXg.getPos();
    sfondoSXb=hsSXb.getPos();
    
    sfondoDXr=hsDXr.getPos()-width/2;
    sfondoDXg=hsDXg.getPos()-width/2;
    sfondoDXb=hsDXb.getPos()-width/2;
    
    r=hsr.getPos()-268;
    g=hsg.getPos()-268;
    b=hsb.getPos()-268;
    

  hsSXr.update();
  hsSXg.update();
  hsSXb.update();
  hsSXr.display();
  hsSXg.display();
  hsSXb.display();
  
  hsDXr.update();
  hsDXg.update();
  hsDXb.update();
  hsDXr.display();
  hsDXg.display();
  hsDXb.display();
  
  hsr.update();
  hsg.update();
  hsb.update();
  hsr.display();
  hsg.display();
  hsb.display();
  
  //rettangoli grandi
  fill(sfondoSXr,sfondoSXg,sfondoSXb);
  rect(0, 0, 400, 400);
  fill(sfondoDXr,sfondoDXg,sfondoDXb);
  rect(400, 0, 400, 400);
  
  //rettangoli piccoli
  fill(r,g,b);
  rect(175, 175, 50, 50);
  rect(575, 175, 50, 50);
  
  //sfondo valori HSB
  fill(255);
  
  rect(540,500,80,-10);
  rect(540,530,80,-10);
  rect(540,560,80,-10);
  
  rect(670,645,80,-10);
  rect(670,675,80,-10);
  rect(670,705,80,-10);
  
  rect(270,645,80,-10);
  rect(270,675,80,-10);
  rect(270,705,80,-10);
  
  //sfondo valori RGB
  fill(200);
  
  rect(270,490,150,-20);
  rect(400,630,150,-20);
  rect(0,630,150,-20);
  
  //sfondo valori ∆
  rect(400,760,200,-20);  
  rect(0,760,200,-20);  
  rect(0,780,200,-20);  
  rect(400,780,200,-20);  
  
  //riferimento
  stroke(0);
  noFill();
  rect(540,480,40,-40); 
  rect(580,480,40,-40); 
  fill(0);
  rect(555,465,10,-10); 
  rect(595,465,10,-10); 
  
  rect(270,625,40,-40); 
  noFill();
  rect(310,625,40,-40); 
  fill(200);
  rect(285,610,10,-10); 
  rect(325,610,10,-10); 
  
  rect(270+width/2,625,40,-40); 
  fill(0);
  rect(310+width/2,625,40,-40); 
  fill(200);
  rect(285+width/2,610,10,-10); 
  rect(325+width/2,610,10,-10); 
  noFill();


  noStroke();
  fill(0);
  text("hue  "+sfondoDXr, 670, 645);
  text("sat  "+sfondoDXg, 670, 675);
  text("bri  "+sfondoDXb, 670, 705);
  
  text("hue  "+sfondoSXr, 270, 645);
  text("sat  "+sfondoSXg, 270, 675);
  text("bri  "+sfondoSXb, 270, 705);
  
  text("hue  "+r, 540, 500);
  text("sat  "+g, 540, 530);
  text("bri  "+b, 540, 560);
  
  color piccoli=get(180,180);
  color SX=get(10,10);
  color DX=get(410,10);
  
  
  text("r  "+ (int)red(piccoli) + "   g  " + (int)green(piccoli) + "   b  " + (int)blue(piccoli), 270, 480);
  
  text("r  "+ (int)red(DX) + "   g  " + (int)green(DX) + "   b  " + (int)blue(DX), 400, 625);
 
  text("r  "+ (int)red(SX) + "   g  " + (int)green(SX) + "   b  " + (int)blue(SX), 0, 625);
  
  text("∆ RGB   "+ abs((int)red(DX)-(int)red(piccoli)) +"  "+ abs((int)green(DX)-(int)green(piccoli)) +"  "+ abs((int)blue(DX)-(int)blue(piccoli)), 400, 750);
  
  text("∆ RGB   "+ abs((int)red(SX)-(int)red(piccoli)) +"  "+ abs((int)green(SX)-(int)green(piccoli)) +"  "+ abs((int)blue(SX)-(int)blue(piccoli)), 0, 750);
  
  text("∆ HSB   "+ abs((int)hue(SX)-(int)hue(piccoli)) +"  "+ abs((int)saturation(SX)-(int)saturation(piccoli)) +"  "+ abs((int)brightness(SX)-(int)brightness(piccoli)), 0, 780);
  
  text("∆ HSB   "+ abs((int)hue(DX)-(int)hue(piccoli)) +"  "+ abs((int)saturation(DX)-(int)saturation(piccoli)) +"  "+ abs((int)brightness(DX)-(int)brightness(piccoli)), 400, 780);

 

}


class HScrollbar
{
  int swidth, sheight;    // width and height of bar
  int xpos, ypos;         // x and y position of bar
  float spos, newspos;    // x position of slider
  int sposMin, sposMax;   // max and min values of slider
  int loose;              // how loose/heavy
  boolean over;           // is the mouse over the slider?
  boolean locked;
  float ratio;

  HScrollbar (int xp, int yp, int sw, int sh, int l) {
    swidth = sw;
    sheight = sh;
    int widthtoheight = sw - sh;
    ratio = (float)sw / (float)widthtoheight;
    xpos = xp;
    ypos = yp-sheight/2;
    spos = xpos + (int) random(swidth) - sheight/2;
    newspos = spos;
    sposMin = xpos;
    sposMax = xpos + swidth - sheight;
    loose = l;
  }

  void update() {
    if(over()) {
      over = true;
    } else {
      over = false;
    }
    if(mousePressed && over) {
      locked = true;
    }
    if(!mousePressed) {
      locked = false;
    }
    if(locked) {
      newspos = constrain(mouseX-sheight/2, sposMin, sposMax);
    }
    if(abs(newspos - spos) > 1) {
      spos = spos + (newspos-spos)/loose;
    }
  }

  int constrain(int val, int minv, int maxv) {
    return min(max(val, minv), maxv);
  }

  boolean over() {
    if(mouseX > xpos && mouseX < xpos+swidth &&
    mouseY > ypos && mouseY < ypos+sheight) {
      return true;
    } else {
      return false;
    }
  }

  void display() {
    fill(255);
    rect(xpos, ypos, swidth, sheight);
    if(over || locked) {
      fill(153, 102, 0);
    } else {
      fill(102, 102, 102);
    }
    rect(spos, ypos, sheight, sheight);
  }

  float getPos() {
    // Convert spos to be values between
    // 0 and the total width of the scrollbar
    return spos ;
  }
}





int mouseClicks = 0;
PFont myFont;

void setup() {
  size (800,800);
  colorMode (HSB, 100);
  background (20, 0, 15);
  smooth ();
  noStroke();
}

void draw () {
  

  textSet();

  if (mouseClicks == 0) {
    background (20,0,15);
    textAlign (CENTER); 
    text ("(click your mouse to guide you through)", 400,400);
  } 
  else if (mouseClicks == 1) {
    background (20,0,15);
    text ("now the mind is clear as a", 400, 400);
  } 
  else if (mouseClicks == 2) {
    background (55, 20, 60);
    fill (0, 0, 30, 20);
    text ("cloudless sky", 400, 400);
  }
  else if (mouseClicks == 3) {
    background (20,0,15);
    fill (0, 0, 100);  
    text ("Time then to make a", 400, 400);
  }
  else if (mouseClicks == 4) {
    background (42, 20, 40);
    fill (42, 20, 70);
    text ("home in the wilderness.", 400, 400);
    stroke (42,20,70);
    strokeWeight (4);
    line(100,800,100,400);
    line(150,800,150,600);
    line(225,800,225,300);
    line(260,800,260,500);
    line(300,800,300,350);
    line(400,800,400,630);
    line(420,800,420,600);
    line(450,800,450,200);
    line(490,800,490,530);
    line(510,800,510,450);
    line(600,800,600,350);
    line(630,800,630,400);
    line(750,800,750,700);
    
     line(70,800,70,300);
    line(110,800,110,500);
    line(200,800,200,280);
    line(230,800,230,410);
    
  }
  else if (mouseClicks == 5) {
    fill (0,0,100);
    noStroke();
    background(20,0,15);
    text ("What have I done but", 400, 400);
  }
  else if (mouseClicks == 6) {
    myFont = createFont("Futura-Medium",70);
    textFont(myFont);
    fill (0,0,100,20);
    text ("wander", mouseX, mouseY);
    myFont = createFont("Futura-Medium",40);
    textFont(myFont);
    fill (0,0,100);
    text ("with my eyes in the trees? So I", 400, 500);
  }
  else if (mouseClicks == 7) {
    smooth();
    background (20,0,15);
    textAlign (LEFT);
    text ("will build:", 100, 100);
  }
  else if (mouseClicks == 8) {
    text ("wife,", 200, 150);
    
  }
  else if (mouseClicks == 9) {
    text ("family,", 200, 200);
  }
  else if (mouseClicks == 10) {
    text ("and seek for neighbors", 200, 250);
  } else {
    mouseClicks = 0;
  }
}

void keyPressed () {
  save ("drawing.jpg");
}

void mousePressed() {
  mouseClicks ++;
}

void textSet() {
  myFont = createFont("Futura-Medium",40);
  textFont(myFont);
}



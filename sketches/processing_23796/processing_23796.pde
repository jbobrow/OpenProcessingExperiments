
//Mouse movement along X and Y
// press S to save PNG.


PFont font,fontb;
PImage bg;
String z = "zzzzzz I want to dreaming Sleep SLEEP tired NO AHH DREAM MY SLEEP GO AWAY";
char [] letter = new char [z.length()];
String [] word = splitTokens(z);
int x=350,y=240,around =0,glow=0,gm=0,rx = 0,ry=400;

void setup() {
  size(723,480);
  bg=loadImage("1.jpg"); 
  background(bg);
  smooth();
  frameRate(50);
  font = createFont("Helvetica",19);
  fontb = createFont("Helvetica-Bold",10);

  for(int i=0; i<z.length()-1;i++) {
    letter [i] = z.charAt(i);
  }
}

void draw() {

  //eyes
  fill(0,5);
  noStroke();

  if(mouseY<300 && mouseY>=5) {  //eye closing
    background(bg);
    for(int i=0;i<240;i++) { //drawing 'eye lids'
      rect(0,mouseY-height,width,i+240);
      rect(0,height-mouseY+i,width,240-i+240);
    }
    glow=0; 
    gm=0;
    //determine random location for the text "{r.e.m}" next time it appears
    rx = (int)random(width);
    ry = (int)random(250,480);
  }
  else if(mouseY<5) {  //good morning
    background(bg);
    fill(255,gm);
    textFont(fontb,60);
    text("GOOD MORNING",50,340);
    if(gm<200)gm++;
  }
  else { //going into REM
    gm=0;
    fill(0,480-mouseY);
    rect(0,0,width,height);
    fill(glow);
    textFont(font,10);
    text("{R.E.M}", rx,ry);
    if(glow<255)glow++;
  }

  //atrings moving
  around = mouseY/2;
  fill(255);
  for(int a=0;a<mouseY/10-16;a++) {
    x=width/2+(int)random(-around,around);
    y=220;
    textFont(font,(int)random(1,10));
    if(x-mouseX<5 && mouseX-x<5)textFont(font,80);
    text(word[(int)random(word.length-1)],x,y);
  }
}


void keyReleased() {
 // if (key == 's' || key == 'S') saveFrame("Awake"+"_##.png");
}



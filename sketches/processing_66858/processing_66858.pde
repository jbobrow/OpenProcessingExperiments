
/*
Creator:Jerry(Lichen Huang)
A new Victory Ceremony for the 30th Olympic games in London.
IEDA9204 Time-based Media Lab */
PFont myFont;
PImage img;
float _angle =0.0;
int actRandomSeed = 0;
int count = 100;
int pSecond = second();
int factor = 0;
float faderX = 0;
float rad = 0;
boolean animate = false;
float angle = radians(360/float(count));
PFont font;
color c = color( 0, 130, 164 );
int a = 0;

void setup(){
  size(800,600,P3D);
  background(255);
  img = loadImage("images.png");
  smooth();
    frameRate(40);
strokeWeight(5);
  noStroke();
    font = loadFont("NanumGothicBold-48.vlw");

  myFont = loadFont("CooperBlackStd-48.vlw");
 // myFont2 = createFont("Noteworthy-Light-48", 32);
  textFont(myFont,40);
  fill(#D3251C);
  text("Victory Ceremony",10,520);
  textAlign(CENTER,BOTTOM);

}

void draw() {
  imageMode(CORNERS);
  image(img,width/2,5*height/8);
  rings();
    // text02();
  noStroke();
  randomSeed(5);
  checkSignalForAnimation();
  generateAnimationFader();
  drawSmallEllipses();
  drawLargeEllipse();  
  displaySeconds();
  draw1();
}

void rings(){
noFill();
stroke(227,193,55);
arc(640, 520, 50, 50, PI+QUARTER_PI, PI+HALF_PI);
stroke(55,79,227);
arc(610, 490, 50, 50, 0, 4*HALF_PI);//blue
stroke(227,193,55);
arc(640, 520, 50, 50, 0, PI+QUARTER_PI);
stroke(227,193,55);
arc(640, 520, 50, 50, PI+3*QUARTER_PI, 2*PI);
stroke(0,255,0);
arc(700, 520, 50, 50,PI+QUARTER_PI, PI+HALF_PI);
stroke(0);
arc(670, 490, 50, 50, 0, 4*HALF_PI);  //black
stroke(0,255,0);
arc(700, 520, 50, 50,0,PI+QUARTER_PI);
stroke(227,193,55);
arc(640, 520, 50, 50, PI+HALF_PI, PI+3*QUARTER_PI);
stroke(0,255,0);
arc(700, 520, 50, 50,PI+3*QUARTER_PI,2*PI);
stroke(255,0,0);
arc(730, 490, 50, 50, 0, 4*HALF_PI); //red
stroke(0,255,0);
arc(700, 520, 50, 50,PI+HALF_PI,PI+3*QUARTER_PI);
}

void draw1(){
  pushMatrix();
  translate(mouseX, mouseY);
  rotate(angle);
  fill(#ED3026);
  textSize(16);
  text("London", width/50, height/50);
  angle += 0.01;
  popMatrix();
  translate(mouseX, mouseY);
  rotate(angle);
  fill(#FCA117);
  textSize(12);
  text("2012", width/20, height/20);
  angle -= 0.5;
}


/*  
- taktsignal holen
- factor bestimmen
- animation starten
*/
void checkSignalForAnimation() { 
  if(second() != pSecond) {
    if(second()%2 == 0) // even
      factor = 1;
    else
      factor = -1;    
    // animation starten
    animate = true;
  }
  pSecond = second();
}

/*
fader für die animation generieren
*/
void generateAnimationFader() {
  // wenn animation gestartet
  if(animate) { 
    if( factor == 1 )
      rad += (HALF_PI-rad)*0.2;
    else
      rad -= rad*0.1;
    if( rad < 0 || rad > HALF_PI )
      animate = false;    
    // minimal, maximal werte berücksichtigen
    rad = constrain( rad, 0, HALF_PI );
  }
  
  // rad (0 bis half_pi) ind faderX (0 bis 1) übersetzen
  faderX = sin(rad);
}

void drawSmallEllipses() {
  fill(c);
  for (int i=0; i<count; i++) {
    // positions
    float randomX = random(0,width/2);  
    float randomY = random(0,height/2);
    float circleX = width/4 + cos(angle*i)*10;
    float circleY = height/4 + sin(angle*i)*10;
    
    /*
    lerp übersetzt den faderX-wert in einen
    wert zwischen randomX/Y und circleX/Y
    0 = randomX/Y
    1 = circleX/Y
    */
    float x = lerp( randomX, circleX, faderX );
    float y = lerp( randomY, circleY, faderX );

    ellipse(x,y,5,5);
  }
}

/*
großen kreis anzeigen
*/
void drawLargeEllipse() {
  fill(0,230);
  ellipse(250,248,lerp(0,125,faderX),lerp(0,125,faderX));
}

/*
uhrzeit darstellen
*/
void displaySeconds() {
  a = int(lerp(0,255,faderX));
  fill(255,a);
  String h = "";
  String s = "";
  if(hour() < 10) h = "0";
  if(second() < 10) s = "0";
  text(h+hour()+":"+minute()+":"+s+second(), 250, 254);
}



/**
 *       by kof 2011 copyleft
 */

String name =  "poe.jpg";
String signature = "-- Edgar Allan Poe";
PImage img;
String[] txt;

int sel  =0;
int t = 0, p = 0;
boolean fadeIn = true;
boolean fadeOut;
boolean pause = true;

int pauseLen = 450;

int step = 7;
PGraphics steps[];


void setup() {

  size(307, 384, P2D);
  
  noiseSeed(19);

  noSmooth();

  txt = loadStrings("quotes.txt");

  img = loadImage(name);

  steps = new PGraphics[step];

  textFont(loadFont("SempliceRegular-8.vlw"));
  textMode(SCREEN);
  textAlign(CENTER);

  for (int i =0  ; i < steps.length;i++) {
    steps[i] = createGraphics(width, height, P2D);
    steps[i].beginDraw();


    steps[i].tint(i%2==0?#FFCCCC:#CCFFAA, 200);
    steps[i].image(img, 0, 0, width, height);

    for (int q = 0;q<width*height;q++) {
      steps[i].stroke(random(55), random(40));
      steps[i].point((int)(q%width), (int)q/width);
    }

    steps[i].stroke(0);
    steps[i].noFill();
    steps[i].strokeWeight(20);
    steps[i].rect(0, 0, width, height);

    if (i>0)
      steps[i].filter(BLUR, (pow(i, 1.4)));
    steps[i].endDraw();
  }
  
  background(0);
}


void draw() {

  for (int i =0  ; i < steps.length;i++) {
    tint(255, noise((frameCount+i)/30.0)*255);

    image(steps[i], (noise((frameCount+i^i)/20.0)-0.5)*10.0, random(-2, 2), width, height);
  }

  noTint();

  if (t%(txt[sel].length()*8)==0) {
    t= 0;

    sel++;

    if (sel>=txt.length)
      sel = 0;

    fadeIn = true;
     
  }

  if (!pause) {


    t++;

    if (fadeIn) {
      fill(255, constrain(t*2, 0, 255));
      if ((t*2)>=255)
        fadeIn = false;
    }
    else if (txt[sel].length()*8-t<255) {
      fill(255, txt[sel].length()*8-t);
      if(txt[sel].length()*8-t==0)
      pause = true;
    }
    else {
      fill(255);
    }
    text("\""+txt[sel]+"\"", 10, height - 80, width-20, 130);
   
    text(signature, width/2, height-15);
  }
  else {
    p++;
    
    if (p>=pauseLen) {
      println(p);
      t=0;
      p=0;
      pause = false;
    }
  }
}




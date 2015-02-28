
/*
*  EuroStat data
*  Absolvents per Population
*  by kof 2012
*/


PShape s;
String data[];

float minval = 10000, maxval = -10000;


String years[] = {
  "2001", "2002", "2003", "2004", "2005", "2006", "2007", "2008", "2009", "2010"
};

int ySel = 9;

color c1 = color(255, 0, 0);
color c2 = color(0,255,12);


// codenames
String names[] = {
  "be", "bg", "cz", "dk", "de", 
  "ee", "ie", "gr", "es", "fr", 
  "it", "cy", "lv", "lt", "lu", 
  "hu", "mt", "nl", "at", "pl", 
  "pt", "ro", "si", "sk", "fi", 
  "se", "gb", "is", "no", "ch", 
  "hr", "mk", "tr"
};

String realNames[] = {
  "Belgium", "Bulgaria", "Czech Republic", "Denmark", "Germany (including  former GDR from 1991)", 
  "Estonia", "Ireland", "Greece", "Spain", "France", 
  "Italy", "Cyprus", "Latvia", "Lithuania", "Luxembourg", 
  "Hungary", "Malta", "Netherlands", "Austria", "Poland", 
  "Portugal", "Romania", "Slovenia", "Slovakia", "Finland", 
  "Sweden", "United Kingdom", "Iceland", "Norway", "Switzerland", 
  "Croatia", "Former Yugoslav Republic of Macedonia, the", "Turkey"
};

float vals[][] = new float[years.length][names.length];
float smoothVals[] = new float[names.length];

PFont font;

PGraphics countries[] = new PGraphics[names.length];
PGraphics blurred[] = new PGraphics[names.length];


int top[] = new int[countries.length];
int bottom[] = new int[countries.length];
int left[] = new int[countries.length];
int right[] = new int[countries.length];
int ws[] = new int[countries.length];
int hs[] = new int[countries.length];

void setup() {

  size(660, 600, P2D);

  data = loadStrings("edat_lfse_07_1_Data.csv");

  for (int i = 0;i<data.length;i++) {
    String tmp[] = splitTokens(data[i], "\"");
    String coCode = tmp[2];
    String year = tmp[0];
    float val = parseFloat(tmp[8]);



    for (int ye = 0;ye<years.length;ye++) {
      for (int q = 0;q<realNames.length;q++) {
        if (coCode.equals(realNames[q])&&year.equals(years[ye])) {
          smoothVals[q] = vals[ye][q] = val;
          println(coCode+": "+val);
          minval = min(val, minval);
          maxval = max(val, maxval);
        }
      }
    }
  }

  s = loadShape("europe2.svg");
  s.disableStyle();
  smooth();
  //shapeMode(CENTER);
  //imageMode(CENTER);

  font = loadFont("53Seed-8.vlw");
  textFont(font);
  textMode(SCREEN);
  textAlign(CENTER);


  for (int i = 0 ; i< countries.length;i++) {
    countries[i] = createGraphics((int)s.width, (int)s.height, JAVA2D);
    countries[i].beginDraw();
    countries[i].fill(255);
    countries[i].shape(s.getChild(names[i]), 0, 0);
    countries[i].endDraw();



    // fastblur(countries[i], 5);

    countries[i].loadPixels();

    bottom[i] = -10000;
    right[i] = -10000;
    top[i] = 10000;
    left[i] = 10000;


    // bounding box detection loop
    for (int y = 0;y<countries[i].height;y++) {
      for (int x = 0;x<countries[i].width;x++) {
        if (countries[i].pixels[y*countries[i].width+x]!=0) {
          top[i] = min(top[i], y);
          bottom[i] = max(bottom[i], y);
          left[i] = min(left[i], x);
          right[i] = max(right[i], x);
        }
      }
    }

    ws[i] = abs(right[i]-left[i]);
    hs[i] = abs(bottom[i]-top[i]);
  }



  for (int i = 0 ; i< countries.length;i++) {
    // vals[i] = random(0.0, 1.0);
    countries[i] = createGraphics(ws[i], hs[i], JAVA2D);
    blurred[i] = createGraphics(ws[i]+20, hs[i]+20, JAVA2D);

    countries[i].beginDraw();
    countries[i].smooth();
    countries[i].fill(255);
    countries[i].noStroke();
    countries[i].shape(s.getChild(names[i]), -left[i], -top[i]);
    countries[i].endDraw();

    blurred[i].beginDraw();
    blurred[i].smooth();
    blurred[i].fill(255);
    blurred[i].noStroke();
    blurred[i].shape(s.getChild(names[i]), -left[i]+10, -top[i]+10);
    blurred[i].endDraw();
    blurred[i].filter(BLUR, 2.5);
  }


  background(255);
}

void draw() {

  background(0);
  noStroke();
  fill(0);
  //translate(s.width/2.5, -100);
  //rotate((frameCount/33.0)*30.);
  //strokeWeight(20);
  float f = noise(frameCount/100.)*255.;



  boolean hasSome = false;

  for (int i = 0 ; i< countries.length;i++) {
    float d = constrain(map(dist(mouseX, mouseY, ws[i]/2+left[i], hs[i]/2+top[i]),0,400,1,0),0,1) ;

    tint(127, d*200+5);
    image(blurred[i], left[i]-10, top[i]-10);

    tint(lerpColor(c1, c2, map(vals[ySel][i], minval, maxval, 0, 1)), d*250.0+15);

    if (mouseX>left[i]&&mouseX<right[i]&&mouseY<bottom[i]&&mouseY>top[i]) {
      tint(lerpColor(c1, c2, map(vals[ySel][i], minval, maxval, 0, 1)));
      hasSome = true;
    }
    else {
      hasSome = false;
    }

    image(countries[i], left[i], top[i]);
  }



  textAlign(CENTER);
  for (int i = 0 ; i< countries.length;i++) {
    float d = dist(mouseX, mouseY, ws[i]/2+left[i], hs[i]/2+top[i])/30.0;
    stroke(255, 255-d*100.0);
    fill(255, 255-d*100.0+10);

    text(realNames[i]+"\n"+vals[ySel][i]+"%", ws[i]/2+left[i], hs[i]/2+top[i]-d*2);
    line(ws[i]/2+left[i], hs[i]/2+top[i], ws[i]/2+left[i], hs[i]/2+top[i]-d*2);
  }
  
  textAlign(RIGHT);
  fill(255);
  text("The share of the population who have successfully completed university @ country\ndata from EuroStat\nyear: "+years[ySel],
  width-20,20);
  
}

void keyPressed(){
 if(keyCode==RIGHT){
  ySel++;
  ySel = ySel%years.length;
 }else if(keyCode==LEFT){
  ySel--;
  ySel = (ySel+years.length)%years.length;
 } 
}

void mousePressed(){
  if(mouseButton==LEFT){
  ySel++;
  ySel = ySel%years.length;
 }else if(mouseButton==RIGHT){
  ySel--;
  ySel = (ySel+years.length)%years.length;
 }
  
}



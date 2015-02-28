
float fade =15;
float xpos=0;
float backx=250;
float limitleft=0;
float limitright=250;
color linestroke = color(random(200,255),random(255),random(0,50));
float x=0;
float y=0;
boolean drawstuff=true;
float strokesize=1;
float r=0;
float g=0;

float a=0;
float posx=0;
float posy=0;
float sizex=50;
float b=200;

void setup() {
  size(250,250);
  background(0);
  frameRate(24);
}

void draw() {
  stroke(0,fade);
  fill(0,fade);
  rect(0,0,width,height);

  if (backx!=xpos) {
    backx--;
    stroke(linestroke);
    line (backx,0,backx,250);
    println(xpos+","+backx);
  }
  if(backx!=xpos) {
    stroke(linestroke);
    line (xpos,0,xpos,250);
    xpos++;
    println(xpos +","+backx);

    if (backx==xpos) {
      backx--;
      xpos++;
    }
    if (xpos==limitright) {
      xpos=0;
      linestroke = color(random(200,255),random(255),random(0,50));
    }
    if (backx==limitleft) {
      backx=250;
      linestroke = color(random(200,255),random(255),random(0,50));
    }
  }
  for (int i=0; i<250; i++) {
    strokeWeight(strokesize);
    stroke(r,g,b,a);
    point(x,y);

    x++;
    y=random(0,50);

    r=random(255);
    g=random(255);
    b=random(255);
    a=random(255);

  }

  x=0;
  strokesize*=2.5;
  for (int i=0; i<250; i++) {
    strokeWeight(strokesize);
    stroke(r,g,b,a);
    point(x,y);

    x++;
    y=random(50,100);
    r=random(255);
    g=random(255);
    b=random(255);
    a=random(255);

  }
  x=0;
  strokesize*=2;
  for (int i=0; i<250; i++) {
    strokeWeight(strokesize);
    stroke(r,g,b,a);
    point(x,y);

    x++;
    y=random(100,150);
    r=random(255);
    g=random(255);
    b=random(255);
    a=random(255);

  }
  x=0;
  strokesize*=2;
  for (int i=0; i<250; i++) {
    strokeWeight(strokesize);
    stroke(r,g,b,a);
    point(x,y);

    x++;
    y=random(150,200);
    r=random(255);
    g=random(255);
    b=random(255);
    a=random(255);


  }
  x=0;
  strokesize*=1.5;
  for (int i=0; i<250; i++) {
    strokeWeight(strokesize);
    stroke(r,g,b,a);
    point(x,y);

    x++;
    y=random(200,250);
    r=random(255);
    g=random(255);
    b=random(255);
    a=random(255);
  }

  drawstuff=false;
  if (keyPressed){
    if (key=='b'||key=='B'){
      fill(0,0,b);
      rect(posx,posy,sizex,sizex);
      posx+=sizex;
      b++;
      if (posx>250) {
        posx=0;
        posy+=sizex;
      }

      if (posy>250) {
        posy=0;
        posx=0;
      }
      if (b>250) {
        b=200;
      } 
    }
  }
  if (keyPressed){
    if (key=='g'||key=='G'){
      fill(0,b,0);
      rect(posx,posy,sizex,sizex);
      posx+=sizex;
      b++;
      if (posx>250) {
        posx=0;
        posy+=sizex;
      }

      if (posy>250) {
        posy=0;
        posx=0;
      }
      if (b>250) {
        b=200;
      } 
    }
  }
  if (keyPressed){
    if (key=='r' ||key=='R'){
      fill(b,0,0);
      rect(posx,posy,sizex,sizex);
      posx+=sizex;
      b++;
      if (posx>250) {
        posx=0;
        posy+=sizex;
      }

      if (posy>250) {
        posy=0;
        posx=0;
      }
      if (b>250) {
        b=200;
      } 
    }
  }
}





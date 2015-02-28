
float fade =15;
float xpos=0;
float backx=250;
float limitleft=0;
float limitright=250;
color linestroke = color(random(200,255),random(255),random(0,50));

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
}



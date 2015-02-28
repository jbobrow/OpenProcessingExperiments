
//mad bear body
PShape left;
PShape right;
PShape body;
float x;
PShape s2;
PShape normalhead;
PShape smoke;

//happy bear body
PShape s;
PShape happy;

//objects
PImage icecream;
float inc = 0.0;
//bg
PImage sunnybg;
PImage nightbg;
PImage rainbg;
PImage snowbg;

// properties
color mad = color (244, 42, 90, 255);
float m = 200;
color polar = color(247, 245, 242);
float angle = 0.0;
float speed = 0.01;
boolean vector = false;



void setup(){
    size(480,320);
  strokeWeight(3);
  strokeCap(ROUND);
  smooth();

  
  rainbg = loadImage("rainbg.gif");
  snowbg = loadImage("snowbg.gif");
  sunnybg = loadImage("sunnybg.gif");
  nightbg = loadImage("nightbg.gif");
  
  //body parts
  left = loadShape("leftarm.svg");
  right = loadShape("rightarm.svg");
  normalhead = loadShape("normalhead.svg");
  body = loadShape("body.svg");
    s2 = loadShape("eyesnose2.svg");
     s = loadShape("eyesnose.svg");
  body = loadShape("body.svg");
      smoke = loadShape("smoke.svg");
  happy = loadShape("happy.svg");
    
    icecream = loadImage("icecreamgreen.png");
    
    
}

void draw(){
  if(dist(170, 160, mouseX, mouseY)<60) {
   
        background(sunnybg);
        drawSunny();
        pushMatrix();
          scale(.80);
          translate(85, 100);
           
        //normal bear
        strokeWeight(3);
        stroke(0);
        fill(polar);
                //swinging arms
          pushMatrix();
          translate(115, 172);
          x += .10;
          rotate(PI*.75*abs(sin(x)));
          shape(left,-50,0); 
          popMatrix();
          pushMatrix();
          translate(180, 206);
           x += .04;
          rotate(PI*-.60*abs(sin(x)));
          shape(right);
          popMatrix();
          
        normalhead.disableStyle();
        shape(normalhead, 0, 0);
        shape(s, 0, 0);
        shape(body, 0, 0);
        popMatrix();
  }
  else {

int s = second();
  if(s < 20){
  background(rainbg);
  drawRain();
  } else if(s >= 20 && s < 40){
    background(snowbg);
    drawSnow();
  } else if(s >= 40 && s <= 60){
    background(nightbg);
    drawNight();
  } 



  pushMatrix();
  scale(.70);
  translate(100, 150);
  
  
  //rotating arms
  pushMatrix();
    translate(115, 172);
    x += .04;
    rotate(PI*.75*abs(sin(x)));
    shape(left,-50,0); 
  popMatrix();
  pushMatrix();
      translate(180, 206);
    x += .04;
    rotate(PI*-.60*abs(sin(x)));
    shape(right);
    popMatrix();

    //changing mad color
    if(m<255){
     m = m+1; 
     mad = color (244, 42, 90, m);
    }
    fill(mad);
    strokeWeight(3);
    stroke(0);
    normalhead.disableStyle();
    shape(normalhead, 0, (sin(angle + PI) * 5));
    shape(smoke, 0, 0);
      
    // jiggling body
      angle = angle + speed;
      shape(body, 0, (sin(angle + PI) * 5));
      shape(s2, 0, (sin(angle + PI) * 5));
    
      
  //grass
   inc += 0.05;
  float angle = sin(inc) / 30.0 + sin(inc * 1.2) / 40.0;
  tail(18, 4, angle / 1.3);
  tail(33, 5, angle);
  tail(44, 7, angle / 1.3);
  tail(62, 5, angle);
  tail(88, 7, angle*2);
  tail(100, 4, angle / 1.3);
  tail(200, 5, angle);
  tail(220, 7, angle / 1.3);
  tail(230, 5, angle);
  tail(235, 7, angle*2);
  tail(276, 4, angle / 1.3);
  tail(288, 5, angle);
  tail(300, 7, angle / 1.3);
  tail(320, 5, angle);
  tail(367, 7, angle*2);
  popMatrix();
  
  image(icecream, mouseX, mouseY); 
  }
}


void drawRain(){
    float x = random(width);
    float y = random(height);
  strokeWeight(2);
  line(x, y, x+3, y+5);

}

void drawSunny(){
      fill(255, 238, 95, 150);
      circlePhase(0.0);
      circlePhase(QUARTER_PI);
      circlePhase(HALF_PI);
      angle += speed;
}

void drawNight(){
      fill(251, 255, 147);
      circlePhase(5.0);
      circlePhase(HALF_PI);
      circlePhase(PI);
      angle += speed;
}

void drawSnow(){
  float x = random(width);
  float y = random(height);
  fill(217, 228, 237, 240);
  noStroke();
  y = y + 1;
  ellipse(x, y, 20, 20);
}


void circlePhase(float phase){
  noStroke();
  float diameter = 118 + (sin(angle+phase)*30);
        ellipse(360, 80, diameter, diameter-3);
}


void tail(int x, int units, float angle) {
  pushMatrix();
  stroke(115, 70, 255, 200);
  translate(x, 306);
  for (int i = units; i > 0; i--) {
    strokeWeight(i);
    line(0, 0, 0, -8);
    translate(0, -8);
    rotate(angle);
  }
  popMatrix();
}

void mouseClicked() {

  if(dist(170, 160, mouseX, mouseY)<60 && vector == false) { //change distance
     //normal bear
        background(sunnybg);
        scale(.80);
        translate(85, 100);
        strokeWeight(3);
        stroke(0);
        shape(normalhead, 0, 0);
        shape(happy, 0, 0);
        shape(s, 0, 0);
        shape(left, 50, 176); 
        shape(body, 0, 0);
        shape(right, 160, 176); 
noLoop();

  } 

}


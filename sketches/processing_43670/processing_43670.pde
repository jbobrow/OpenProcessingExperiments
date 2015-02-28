
int solarnum=10;
float []px=new float[solarnum];
float []py=new float[solarnum];
float []angle=new float[solarnum];

float radius=100;
float frequency=2;
float frequency2=2;
float x, x2;
PFont myFont;
void setup() {
  size(600, 600);
  smooth();
  myFont = createFont("Verdana-12.vlw", 11);
  textFont(myFont);
}

void draw() {
  fill(0, 30);
  //rect(0, 0, width, height);
  background(0);

  noStroke();
  for (int i=0;i<solarnum;i++) {
    fill(200+i*2, 200, 10, 100);
    ellipse(width/2, height/2, 40+i*3, 40+i*3);
  }
  stroke(52);
  // strokeWeight(2);
  noFill();
  ellipse(width/2, height/2, 100, 100);

  ellipse(width/2, height/2, 150, 150);
  ellipse(width/2, height/2, 200, 200);
  ellipse(width/2, height/2, 250, 250);
  ellipse(width/2, height/2, 300, 300);
  ellipse(width/2, height/2, 350, 350);
  ellipse(width/2, height/2, 400, 400);
  ellipse(width/2, height/2, 450, 450);
  ellipse(width/2, height/2, 500, 500*.875);
  //translate(width/2, height/2);
  noStroke();

  for (int i=1;i<solarnum;i++) {
    //angle[0] -= 0;
    // speed is according to orbit velocitr I double it for a better simulation look. 
    angle[1] -= 2*0.0479;
    angle[2] -= 2*0.035;
    angle[3] -= 2*0.0298;
    angle[4] -= 2*0.0241;
    angle[5] -= 2*0.0131;
    angle[6] -= 2*0.00964;
    angle[7] -= 2*0.00681;
    angle[8] -= 2*0.00543;
    angle[9] -= 2*0.00474;
    if (i==1) {
      px[i] = width/2 + cos(radians(angle[i]))*(50*(i+2)/2);
      py[i]=height/2+sin(radians(angle[i]))*(50*(i+2)/2);
    }
    if (i==9) {
      px[i] = width/2 + cos(radians(angle[i]))*(50*(i+2)/2);
      py[i]=height/2+(sin(radians(angle[i]))*(50*(i+2)/2));
    }
    px[i] = width/2 + cos(radians(angle[i]))*(50*(i+1)/2);
    py[i]=height/2+sin(radians(angle[i]))*(50*(i+1)/2);
  }
  // ellipse(width/2+50, height/2, 10, 10);
  //ellipse(width/8)
  // px = width/2 + cos(radians(angle))*(150/2);
  // py=height/2+sin(radians(angle))*(150/2);
  ellipseMode(CENTER);
  // mercury
  fill(200, 105, 155, 188);
  ellipse(px[1], py[1], 10, 10);
  //venus
  fill(255, 127, 0, 188);
  ellipse(px[2], py[2], 13, 13);
  //earth
  fill(30, 144, 255, 188);
  ellipse(px[3], py[3], 20, 20);
  fill(0, 200, 0, 140);
  ellipse(px[3]-7, py[3]+3, 2, 2 );
  rect(px[3]-3, py[3]+2, 5, 5);
  ellipse(px[3]-5, py[3]+2, 5, 5);
  ellipse(px[3]+5, py[3]+2, 3, 3);
  ellipse(px[3]-4, py[3]-4, 3, 3);
  ellipse(px[3]+5, py[3]-2, 5, 5);
  ellipse(px[3]-7, py[3]+5, 3, 3);
  ellipse(px[3]-5, py[3]+7, 4, 4);
  ellipse(px[3]+5, py[3]-4, 3, 3);
  ellipse(px[3]-5, py[3]+2, 6, 6);
  //mars
  fill(205, 92, 92, 188);
  ellipse(px[4], py[4], 17, 17);
  //Jupitar
  fill(238, 121, 66, 188);
  ellipse(px[5], py[5], 40, 40);
  //Saturn
  fill(218, 161, 32, 188);
  ellipse(px[6], py[6], 33, 33);
  noFill();
  stroke(255, 102, 0);
  //line(px[6]-16, py[6]-6, px[6]-32, py[6]+12);
  // line(px[6]+32, py[6]+12,px[6]+16, py[6]-6 );
  stroke(218, 161, 32);
  strokeWeight(2);
  bezier(px[6]-16, py[6]-6, px[6]-32, py[6]+12, px[6]+32, py[6]+12, px[6]+16, py[6]-6);
  noStroke();
  //Urans
  fill(176, 226, 255, 188);
  ellipse(px[7], py[7], 40, 40);
  //Naptune
  fill(0, 104, 139, 188);
  ellipse(px[8], py[8], 20, 20);
  //Pluto
  fill(0, 238, 238, 188);
  ellipse(px[9], py[9]*.875+36.5, 5, 5);

  //texture
  fill(255);
  text("SOLAR SYSTEM", width/2-70, 40);
  text("Mercury", px[1]-10, py[1]+20);
  text("Venus", px[2]-10, py[2]+20);
  text("Earth", px[3]-10, py[3]+20);
  text("Mars", px[4]-10, py[4]+20);
  text("Jupitar", px[5]-10, py[5]+30);
  text("Saturn", px[6]-10, py[6]+25);
  text("Uranus", px[7]-10, py[7]+25);
  text("Naptune", px[8]-10, py[8]+20);
  text("Pluto", px[9]-10, py[9]*.875+36.5+16);
  //line(width/2, height/2, px[i], py[i]);

  //x+=1;
}



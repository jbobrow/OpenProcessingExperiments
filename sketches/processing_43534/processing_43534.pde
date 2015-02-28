
/* 
 Daniel C. Young
 Fuzzball #2
 10/22/2011
 */

float easing=0.8;
float easeX=0.0;

void setup(){
  size(800, 800);
  smooth();
  colorMode(HSB, 100);
}

void draw(){
  fill(15,30);
  noStroke();
  rect(0,0,width,height);
  
  // replace mouseX with eased value
  easeX += (mouseX-easeX) * easing;
  
  for (int i=0;i<30;i++) {
    // map size, noise, and hue to mouseX
    float syz = map(easeX,0,width,0,250);
    float nyz = map(easeX,0,width,0,10);
    float clr = map(easeX,0,width,1,6.5);
    drawSpiral(i*syz, i*0.2, nyz+i, clr*i);
  }
  
  float mx = map(mouseX,2,width-2,100,0);
  drawLogo(220,230,mx);
}

void drawSpiral(float _endAng, float _angStep, float _noise, float _hue) {
  float px,py,x,y;
  float seed = random(10);  // initial radius
  px=py = 0.0;

  pushMatrix();
  translate(width/2, height/2);
  for (float ang=0; ang<_endAng; ang+=_angStep) {
    // adjust for different results
    _noise += 0.5;  
    seed += 0.2;

    // apply offset to initial radius
    float rad = seed + (noise(_noise)*100) - 50;

    x = rad*cos(radians(ang));
    y = rad*sin(radians(ang));

    // avoid drawing the first time
    if (px != 0.0) {
      stroke(_hue,200,200,60);
      strokeWeight(0.25);
      line(px, py, x, y);
    }

    px = x;
    py = y;
  }
  popMatrix();
}

void drawLogo(int x, int y,float off){
  strokeWeight(50);
  translate(x,y);
  scale(0.8);
  
  float x1 = x-off*4;
  float y1 = y-off*2;
  stroke(99,70);
  line(x1-150,y1-245,x1-200,y1+15);
  
  float x2 = x-off*8;
  float y2 = y;
  stroke(98,70);
  line(x2-200,y2+15,x2-130,y2+80);
  
  float x3 = x-off*3;
  float y3 = y+off*5;
  stroke(97,70);
  line(x3-130,y3+80,x3-145,y3+185);

  float x4 = x;
  float y4 = y-off*4.5;
  stroke(99,70);
  line(x4+5,y4-245,x4+30,y4-125);
  
  float x5 = x+off*6;
  float y5 = y-off*5;
  stroke(98,70);
  line(x5+30,y5-125,x5-25,y5-50);
  
  float x6 = x;
  float y6 = y+off*6.5;
  stroke(97,70);
  line(x6-25,y6-50,x6,y6+185);
  
  float x7 = x+off*8;
  float y7 = y-off*1.5;
  stroke(99,70);
  line(x7+145,y7-245,x7+140,y7-70);
  
  float x8 = x+off*7;
  float y8 = y+off*1.5;
  stroke(98,70);
  line(x8+140,y8-70,x8+185,y8+15);
  
  float x9 = x+off*4;
  float y9 = y+off*7;
  stroke(97,70);
  line(x9+185,y9+15,x9+145,y9+185);
}


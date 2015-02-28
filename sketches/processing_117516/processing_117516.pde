
// Wiggle Lines
// line's gradient colors
// lin wenyu  N76014118

void setup() {
  size(500, 500);
  noLoop();
  background(255);
}

void draw() {
  /*
  background(255);
   strokeWeight(5);
   stroke(0, 30);
   line(20, 50, 480, 50);
   */

  //stroke(20, 50, 70); 
  int step = 10; 
  float nlevel = 0.5;
  float clevel=.2;
  float lastx = -999; 
  float lasty = -999; 

  float cnoise= random(10);
  float ynoise = random(10);

  float y; 
  int border = 20; 
  
      float c1=random(255);
    float c2=random(255);
    float c3=random(255);

  stroke(0, 50);
  strokeWeight(5);//
  line(0, 250, 500, 250);

  for (int x=border; x<=width-border; x+=step) { 
    strokeWeight(5);
    //float c1=random(255);
    //float c2=random(255);
    //float c3=random(255);
    //float color=c1,c2,c3;
    float yy = noise(x*0.009);
    float c11=c1*yy;
    float c21=c2*yy;
    float c31=c3*yy;

    stroke(c11,c21,c31);

    float nn = noise(ynoise);
    float xx = nn*80;

    y = 250+ xx;

    //println("ynoise:"+noise(ynoise)+",nn:"+nn+",xx:"+xx+",y:"+y);

    if (lastx > -999) { 
      line(x, y, lastx, lasty);
    } 
    lastx = x; 
    lasty = y;
    ynoise += nlevel;
    cnoise += clevel;
  }
}




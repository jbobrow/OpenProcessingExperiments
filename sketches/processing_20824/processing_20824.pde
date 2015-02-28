
int halfW, halfH;
int r = 130; //radius
float angle = 0;

void setup() {
  size(600,400);
  smooth();
  halfW = width/2;
  halfH = height/2;
}

void draw() {
  //reset display
  background(255);
  textAlign(CENTER, CENTER);
  textSize(8);
  pushMatrix();
  translate(halfW+70, halfH);
  
  drawDial();
  
  //draw circling dot
  fill(0,128,0);
  angle += .5;
  if (angle>=360) angle -= 360;
  float ca = cos(radians(angle));
  float sa = sin(radians(angle));
  stroke(0,128,0);
  ellipse(ca*r, sa*r, 8, 8);
  line(0,0, ca*r, sa*r);
  
  //draw calculations
  popMatrix();  
  textSize(11);
  fill(0,128,0);
  int l=1;
  text("radius = "+r, 10, 15*l++); l++;
  text("angle = "+int(angle)+"°", 10, 15*l++);
  text("radians = angle * PI / 180 = "+nf(radians(angle),1,2), 10, 15*l++); l++;
  text("cos(radians) = "+nfc(ca,2), 10, 15*l++);
  text("sin(radians) = "+nfc(sa,2), 10, 15*l++); l++;
  text("x = cos(radians) * radius = "+int(ca*r), 10, 15*l++);
  text("y = sin(radians) * radius = "+int(sa*r), 10, 15*l++);
}

void drawDial() {
  //draw origin and circle
  stroke(0);
  strokeWeight(.5);
  noFill();
  line(-50,0, 50,0);
  line(0,-50, 0,50);
  ellipse(0,0, 10,10);
  strokeWeight(1);
  ellipse(0,0, r*2,r*2);
  
  //draw degrees
  fill(64,64,128);
  strokeWeight(1);
  for (int deg=0; deg<360; deg+=2) {
    float cd = cos(radians(deg));
    float sd = sin(radians(deg));
    if(deg%10 == 0) {
      strokeWeight(.5);
      line(cd*(r-20), sd*(r-20), cd*r, sd*r);
      text(deg, cd * (r-30), sd * (r-30));
    } else {
      strokeWeight(.25);
      line(cd*(r-10), sd*(r-10), cd*r, sd*r);
    }
  }
  
  //draw radians
  for (float rad=0; rad<2*PI; rad+=0.025) {
    float cr = cos(rad);
    float sr = sin(rad);
    if(round(rad*100)%10 == 0) {
      strokeWeight(.5);
      line(cr*r, sr*r, cr*(r+20), sr*(r+20));
      text(nf(rad,1,1), cr * (r+30), sr * (r+30));
    } else {
      strokeWeight(.25);
      line(cr*(r+10), sr*(r+10), cr*r, sr*r);
    }
  }
  
  //draw pi fractions
  float f = 0.0;
  int m = 0;
  float d = 0.0;
  for (int i=0; i<12; i++) {
    float ci = cos(i*PI/6);
    float si = sin(i*PI/6);
    f = (float)i/6;
    strokeWeight(.5);
    line(ci*(r+40), si*(r+40), ci*(r+50), si*(r+50));
    m=0;
    if (f*10%10 != 0) {
      for (m = 1; m<12; m++) {
        d = m/f;
        if (d*10%10 == 0) break;
      }
    }
    switch (m) {
      case 0:
        if(f==0) text("0 & 2π", ci*(r+70), si*(r+60));
        else text("π", ci*(r+60), si*(r+60)); 
        break;
      case 1: text("π/"+int(d), ci*(r+60), si*(r+60)); break;
      default: text(m+"π/"+int(d), ci*(r+70), si*(r+60)); break;
    } 
  }
  
  //add lables
  textSize(11);  
  text("Degrees",0, 70);
  textAlign(LEFT,CENTER);
  text("Radians",170, 45);
}




color col1, col2, col3, col4, col5, col6, col7, col8, col9;
float mx, my, deltapx, deltapy, j;
float r1, r2, r3, r4, r5, r6;
float deg1;
float turnTable =0;
void setup()
{
  size(700, 1100, P3D);
  smooth();
  frameRate(30);
  //initial variable for m
  mx=width/2;
  my=height/2;
  deltapx=0;
  deltapy=0;
  j=0.1;
  //colors
  col1=color(232, 130, 111, 60); //color-background
  col2=color(84, 199, 184);//color-characterbody
  col3=color(232, 196, 154);//color-characterface
  col4=color(0);//color-charactereye&mouth
  col5=color(255, 108, 126);//color-characternose
  col6=color(232, 195, 35);//color-characterspec....maybe?
  col7=color(191, 242, 228);//color-characterarm
  col8=color(255, 108, 126);//color-characterleg
  col9=color(255, 152, 99);//color-feet

  r1=200;//bodyradius
  r2=50;//faceradius
  r3=3;//eyeradius
  r4=25;//armradius
  r5=30;//legradius
  r6=40;//feetradius
}

void draw()
{
  background(col1);
  noStroke();
  // lights();
  PVector cart = new PVector();

  translate(mx, my);
  rotateY(radians(turnTable++));//map(mouseX, 0, width, radians(-180), radians(180)));

  drawBody(cart);

  drawLegs(cart);
  drawFeet(cart);
}

void drawBody(PVector cart) {
  pushMatrix();
  rotateX(radians(-90));
  rotateZ(radians(-90));

  PVector pHead = new PVector();
  for (float latitudeb = 90; latitudeb<180.0; latitudeb+=10) {
    beginShape(QUAD_STRIP);
    for (float longitudeb=0; longitudeb<=360; longitudeb+=10) {
      drawmb(r1, latitudeb, longitudeb, cart);
      vertex(cart.x, cart.y, cart.z);
      if (longitudeb == 0 && latitudeb == 150) {

        pHead = new PVector(cart.x, cart.y, cart.z);
        println(pHead);
      } 
      drawmb(r1, latitudeb+10.0, longitudeb, cart);
      vertex(cart.x, cart.y, cart.z);
    }
    endShape();
  }
  drawHead(cart, pHead);
  drawArms(cart);

  popMatrix();
}


void drawHead(PVector cart, PVector pHead) {


  pushMatrix();
  translate(pHead.x, pHead.y, pHead.z);
  translate(0, 0, 50);
  rotateZ(radians(map(mouseX, 0, width, -40, 40)));
  rotateX(radians(-90));
  rotateY(radians(-90));
  // println(mouseX+","+mouseY);

  for (float latitudef = 30; latitudef<180.0; latitudef+=10) {
    beginShape(QUAD_STRIP);
    for (float longitudef=0; longitudef<=360; longitudef+=10) {
      if (latitudef >=70 && latitudef< 140 + mouseY || longitudef <180 ) fill(col3);
      else fill(232, 100, 81);
      drawmf(r2, latitudef, longitudef, cart);
      vertex(cart.x, cart.y, cart.z);

      drawmf(r2, latitudef+10.0, longitudef, cart);
      vertex(cart.x, cart.y, cart.z);
    }
    endShape();
  }

  rotateX(radians(-180));
  translate(0, 150, 150);
  drawNose(cart);
  translate(0, 0, -10);
  drawEyes(cart);
  popMatrix();
}

void drawEyes(PVector cart) {
  pushMatrix();
  translate(-18, -161, -95);
  rotateX(radians(-160));
  // println(mouseX+","+mouseY);
  for (float latitudee = 90; latitudee<180.0; latitudee+=10) {
    beginShape(QUAD_STRIP);
    for (float longitudee=0; longitudee<=360; longitudee+=10) {
      drawme(r3, latitudee, longitudee, cart);
      vertex(cart.x, cart.y, cart.z);
      drawme(r3, latitudee+10.0, longitudee, cart);
      vertex(cart.x, cart.y, cart.z);
    }
    endShape();
  }
  popMatrix();

  pushMatrix();
  translate(18, -161, -95);
  rotateX(radians(-160));
  // println(mouseX+","+mouseY);
  for (float latitudee = 90; latitudee<180.0; latitudee+=10) {
    beginShape(QUAD_STRIP);
    for (float longitudee=0; longitudee<=360; longitudee+=10) {
      drawme(r3, latitudee, longitudee, cart);
      vertex(cart.x, cart.y, cart.z);
      drawme(r3, latitudee+10.0, longitudee, cart);
      vertex(cart.x, cart.y, cart.z);
    }
    endShape();
  }
  popMatrix();
}

void drawNose(PVector cart) {
  pushMatrix();
  translate(0, -153, -100);
  rotateX(radians(-160));
  // println(mouseX+","+mouseY);
  for (float latituden = 90; latituden<180.0; latituden+=10) {
    beginShape(QUAD_STRIP);
    for (float longituden=0; longituden<=360; longituden+=10) {
      drawmn(r3, latituden, longituden, cart);
      vertex(cart.x, cart.y, cart.z);
      drawmn(r3, latituden+10.0, longituden, cart);
      vertex(cart.x, cart.y, cart.z);
    }
    endShape();
  }
  popMatrix();
}


void drawArms(PVector cart) {
  pushMatrix();
  rotateZ(radians(90));
  translate(0, 0, -120);
  pushMatrix();
  translate(-70, -70, 70);
  rotateX(radians(150));
  rotateY(radians(-80));
  rotateZ(radians(130));

  // println(mouseX+","+mouseY);
  for (float latitudea = 90; latitudea<180.0; latitudea+=10) {
    beginShape(QUAD_STRIP);
    for (float longitudea=0; longitudea<=360; longitudea+=10) {
      drawma(r4, latitudea, longitudea, cart);
      vertex(cart.x, cart.y, cart.z);
      drawma(r4, latitudea+10.0, longitudea, cart);
      vertex(cart.x, cart.y, cart.z);
    }
    endShape();
  }
  popMatrix();

  pushMatrix();
  translate(70, -70, 70);
  rotateX(radians(150));
  rotateY(radians(80));
  rotateZ(radians(130));
  // println(mouseX+","+mouseY);
  for (float latitudea = 90; latitudea<180.0; latitudea+=10) {
    beginShape(QUAD_STRIP);
    for (float longitudea=0; longitudea<=360; longitudea+=10) {
      drawma(r4, latitudea, longitudea, cart);
      vertex(cart.x, cart.y, cart.z);
      drawma(r4, latitudea+10.0, longitudea, cart);
      vertex(cart.x, cart.y, cart.z);
    }
    endShape();
  }
  popMatrix();
  popMatrix();
}

void drawLegs(PVector cart) {
  pushMatrix();
  translate(-40, -20, 0);
  rotateX(radians(90));
  rotateZ(radians(100));
  // println(mouseX+","+mouseY);
  for (float latitudel = 90; latitudel<180.0; latitudel+=10) {
    beginShape(QUAD_STRIP);
    for (float longitudel=0; longitudel<=360; longitudel+=10) {
      drawml(r5, latitudel, longitudel, cart);
      vertex(cart.x, cart.y, cart.z);
      drawml(r5, latitudel+10.0, longitudel, cart);
      vertex(cart.x, cart.y, cart.z);
    }
    endShape();
  }
  popMatrix();

  pushMatrix();
  translate(30, -20, 0);
  rotateX(radians(90));
  rotateZ(radians(100));
  //rotateY(radians(mouseX));
 
  //println(mouseX);
  // println(mouseX+","+mouseY);
  for (float latitudel = 90; latitudel<180.0; latitudel+=10) {
    beginShape(QUAD_STRIP);

    for (float longitudel=0; longitudel<=360; longitudel+=10) {
      drawml(r5, latitudel, longitudel, cart);
      vertex(cart.x, cart.y, cart.z);
      drawml(r5, latitudel+10.0, longitudel, cart);
      vertex(cart.x, cart.y, cart.z);
    }
    endShape();
  }
  popMatrix();
}

void drawFeet(PVector cart) {
  pushMatrix();
  translate(-40, 100, 0);
  rotateX(radians(270));
  rotateZ(radians(100));
  // println(mouseX+","+mouseY);
  for (float latitudeft = 90; latitudeft<180.0; latitudeft+=10) {
    beginShape(QUAD_STRIP);
    for (float longitudeft=90; longitudeft<=270; longitudeft+=10) {
      drawmft(r6, latitudeft, longitudeft, cart);
      vertex(cart.x, cart.y, cart.z);
      drawmft(r6, latitudeft+10.0, longitudeft, cart);
      vertex(cart.x, cart.y, cart.z);
    }
    endShape();
  }
  popMatrix();

  pushMatrix();
  translate(30, 100, 0);
  rotateX(radians(270));
  rotateZ(radians(100));
  // println(mouseX+","+mouseY);
  for (float latitudeft = 90; latitudeft<180.0; latitudeft+=10) {
    beginShape(QUAD_STRIP);
    for (float longitudeft=90; longitudeft<=270; longitudeft+=10) {
      drawmft(r6, latitudeft, longitudeft, cart);
      vertex(cart.x, cart.y, cart.z);
      drawmft(r6, latitudeft+10.0, longitudeft, cart);
      vertex(cart.x, cart.y, cart.z);
    }
    endShape();
  }
  popMatrix();
}
void drawma(float r4, float latitudea, float longitudea, PVector cartesiana) { 

  float laa=radians(latitudea);
  float loa=radians(longitudea);
  cartesiana.x=0.9/2*r5*sin(laa)*cos(loa);
  cartesiana.y=0.9/2*r5*sin(laa)*sin(loa);
  cartesiana.z=3.53/2*r5*cos(laa);
  fill(col7);
}
void drawmb(float r1, float latitudeb, float longitudeb, PVector cartesianb) { 
  float temp = map(mouseX*mouseX,0,width*width, -width/6 , width/6) * map(latitudeb, 90,180, 0, 1) ;
  float lab=radians(latitudeb);
  float lob=radians(longitudeb);
  cartesianb.x=0.9/2*r1*sin(lab)*cos(lob);
  cartesianb.y=1.3/2*r1*sin(lab)*sin(lob)+temp;
  cartesianb.z=2.3/2*r1*cos(lab);
  fill(col2);
}


void drawme(float r3, float latitudee, float longitudee, PVector cartesiane)
{
   float lae=radians(latitudee);
  float loe=radians(longitudee);
  cartesiane.x=r3*sin(lae)*cos(loe);
  cartesiane.y=r3*sin(lae)*sin(loe);
  cartesiane.z=r3*cos(lae);
  fill(col4);
}
void drawmf(float r2, float latitudef, float longitudef, PVector cartesianf) {
  float laf=radians(latitudef);
  float lof=radians(longitudef);
  cartesianf.x=r2*sin(laf)*cos(lof);
  cartesianf.y=r2*sin(laf)*sin(lof);
  cartesianf.z=r2*cos(laf);
  //fill(col3);
}

void drawmft(float r6, float latitudeft, float longitudeft, PVector cartesianft) { 

  float laft=radians(latitudeft);
  float loft=radians(longitudeft);
  cartesianft.x=1.2*r6*sin(laft)*cos(loft);
  cartesianft.y=0.8*r6*sin(laft)*sin(loft);
  cartesianft.z=r6*cos(laft);
  fill(col9);
}

void drawml(float r5, float latitudel, float longitudel, PVector cartesianl) { 

  float lal=radians(latitudel);
  float lol=radians(longitudel);
  cartesianl.x=0.9/2*r5*sin(lal)*cos(lol);
  cartesianl.y=0.9/2*r5*sin(lal)*sin(lol);
  cartesianl.z=8/2*r5*cos(lal);
  fill(col6);
}

void drawmn(float r3, float latituden, float longituden, PVector cartesiann)
{
   float lan=radians(latituden);
  float lon=radians(longituden);
  cartesiann.x=r3*sin(lan)*cos(lon);
  cartesiann.y=r3*sin(lan)*sin(lon);
  cartesiann.z=r3*cos(lan);
  fill(col5);
}

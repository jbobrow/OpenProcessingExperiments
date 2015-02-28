
PImage pocket, compassparts, ssomethingsharp, spointmenorth, sdroppedcork, slearningkid, sneedwater, spieceofwinework, snewitem, sprettybarn, shome, sfork, sinventorys, sbarnsleep, sharppoke, whereami, man, compassfinished, waterdrip, foamcupcompass, cork, faucet, foamcup, magnet, pin, beanieback, barnsleep, hay, eyes, scene1, scene2, scene3, scene4, scene5, scene6, scene7, scene8, scene9, scene10, scene11, longgrass, rf, lf, rl, ll, grass, grass2, shand;
int scene = 1;
float rx = random(650);
float ry = random(450);
float rx2 = random(650);
float ry2 = random(400);
boolean pMousePressed = false;
int t=0;
int needletime=0;
int filltime=0;
int watchcompass=0;
int goinghome=0;
boolean barnyet=false;
boolean faucetyet=false;
float a=1;


boolean pinGet=false;
boolean cupGet=false;
boolean magnetGet=false;
boolean corkGet=false;
boolean compassGet=false;
boolean newItem=false;

float walkx;
float walky;
float shrink;

float bottomi= 575;
float topi=525;
float lefti=625;
float righti=674;

float topa=283;
float bottoma=317;
float leftlarrow=3;
float rightlarrow=47;
float leftrarrow=653;
float rightrarrow=697;

float topf=95;
float bottomf=143;
float leftf=600;
float rightf=628;

float topc=317;
float bottomc=338;
float leftc=93;
float rightc=126;

float leftm=1;
float rightm=487;
float topm=475;
float bottomm=497;


float drip=200;
float handmovex=400;
float handmovey=500;

float easing= 0.2;

void setup() {
  size(700, 600);
  smooth();
  scene1 = loadImage("sleepingNEWSTYLE.jpg");
  scene2 = loadImage("handsNEWSTYLE.jpg");
  scene3 = loadImage("genericgrass.jpg");
  scene4 = loadImage("aforkintheroadnewSTYLE.jpg");
  scene5 = loadImage("barnsleep.jpg");
  pocket = loadImage("pocket.png");
  scene7 = loadImage("righttrees.jpg");
  scene8 = loadImage("lefttrees.jpg");
  scene9 = loadImage("fillcup.jpg");
  scene10=loadImage("compassfinished.png");

  rl = loadImage("rightleg.png");
  ll = loadImage("leftleg.png");
  rf = loadImage("rightfoot.png");
  lf = loadImage("leftfoot.png");
  longgrass = loadImage("longgrass.jpg");
  grass = loadImage("grass.png");
  grass2 = loadImage("grass2.png");
  eyes = loadImage("eyes.png");
  shand = loadImage("searchinghand.png");
  hay = loadImage("hay2.png");
  beanieback = loadImage("beanieback.png");
  cork=loadImage("cork.png");
  foamcup=loadImage("foamcup.png");
  faucet=loadImage("faucet.png");
  magnet=loadImage("magnet.png");
  pin=loadImage("safetypin.png");
  waterdrip=loadImage("waterdrip.png");
  foamcupcompass=loadImage("foamcupcompass.png");
  man=loadImage("man2.png");
  whereami=loadImage("whereami.png");
  sfork=loadImage("sfork.png");
  sharppoke=loadImage("sharppoke.png");
  sbarnsleep=loadImage("sbarnsleep.png");
  sinventorys=loadImage("sinventorys.png");
  shome=loadImage("shome.png");
  sprettybarn=loadImage("sprettybarn.png");
  snewitem=loadImage("snewitem.png");
  spieceofwinework=loadImage("spieceofwinework.png");
  sdroppedcork=loadImage("sdroppedcork.png");
  sneedwater=loadImage("sneedwater.png");
  slearningkid=loadImage("slearningkid.png");
  spointmenorth=loadImage("spointmenorth.png");
  ssomethingsharp=loadImage("ssomethingsharp.png");
  compassparts=loadImage("compassparts.png");
  println(rx);
  println(ry);
  t = millis();
}





void draw() {
  println(mouseX + "," + mouseY);

  //scene 1
  if (scene == 1)
  {
    fill (255, 80);
    imageMode(CORNERS);
    image(scene1, 0, 0);
    stroke(255);
    fill(0);
    rect(-10, 500, width+10, 100);

    if (millis()> t +2000) {

      image(eyes, 0, 0);
      image(whereami, 0, 500);
    }



    if (mousePressed==true && pMousePressed==false&&millis()>t+4000) {
      color tmp1 = get(mouseX, mouseY);
      if (blue(tmp1) < 20&&green(tmp1)<20) {
        scene = 2;
      }
    }

    if (compassGet==true && millis()>= goinghome+10000)
    {
      fill(0);
      quad(0, 0, width, 0, width, height, 0, height);
      noLoop();
    }
  }


  //scene 2 Inventory
  else if (scene == 2)

  {
    cursor(ARROW);
    imageMode(CORNER);
    image(scene2, 0, 0);

    stroke(255);
    fill(0);
    rect(-10, 500, width+10, 100);

    color tmp = get(mouseX, mouseY);
    if (mousePressed==true && pMousePressed==false&&corkGet==false) {
      scene = 3;
    }

    else if (mousePressed==true && pMousePressed==false&&corkGet==true) {
      scene=4;
      newItem=false;
    }

    image(cork, 300, 265, 60, 40);


    //INVENTORY
    if (magnetGet==true)
    {
      image(magnet, 235, 276, 60, 80);
    }

    if (cupGet==true)
    {
      image(foamcup, 344, 104, 80, 130);
    }

    if (pinGet==true)
    {
      image(pin, 387, 300, 66, 56);
    }
    if (newItem==false&&corkGet==true) {
      if (pinGet==false||cupGet==false|| magnetGet==false)
      {
        imageMode(CORNERS);
        image(sinventorys, 0, 500);
      }
    }

    if (newItem==false) {
      if (corkGet==false)
      {
        imageMode(CORNERS);
        image(spieceofwinework, 0, 500);
      }
    }

    if (newItem==true)
    {
      if (pinGet==false||cupGet==false|| magnetGet==false)
      {
        imageMode(CORNERS);
        image(snewitem, 0, 500);
      }
    }

    if (pinGet==true&&cupGet==true&& magnetGet==true&&corkGet==true)
    {
      imageMode(CORNERS);
      image(sneedwater, 0, 500);
    }
  }


  //scene 3 find lost items in grass
  else if (scene == 3)
  {
    //background
    noTint();
    imageMode(CORNER);
    image(scene3, 0, 0);

    if (mouseY>500) {
      cursor(ARROW);
    }
    //object to find
    imageMode(CENTER);
    image(cork, rx, ry, 100, 75);

    for (int x=-100; x<=width+100; x+=50)
    {
      for (int y=-100; y<=height+100; y+=50)
      {
        //grass
        pushMatrix();
        stroke(0, 20);
        float diameter = dist(mouseX, mouseY, x, y) / 3.3;
        image(grass2, x, y, diameter, diameter); 
        popMatrix();

        pushMatrix();        
        translate(x, y);
        float a = atan2(mouseY-y, mouseX-x); 
        rotate(a);                          
        image(grass, 0, 0);      
        popMatrix();
      }
    }
    //hand cursor
    pushMatrix();
    imageMode(CENTER);
    tint(255, 70);
    image(shand, mouseX, mouseY, 120, 100);
    popMatrix();
    float d = dist(rx, ry, mouseX, mouseY);
    noCursor();
    noTint();
    //trigger next scene
    if (d<100 && mousePressed==true && pMousePressed==false ) {
      scene = 2;
      corkGet=true;
    }


    stroke(255);
    fill(0);
    rect(-10, 500, width+10, 100);
    //pocket
    imageMode(CENTER);
    //tint
    image(pocket, width-50, height-50, 50, 50);

    if (mouseX > lefti && mouseX < righti && mouseY > topi && mouseY < bottomi) {

      quad (lefti, topi, righti, topi, righti, bottomi, lefti, bottomi);
      if (mousePressed)
      {
        scene = 2;
      }
    }

    imageMode(CORNERS);
    image(sdroppedcork, 0, 500);
  }

  //fork in the road
  else if (scene == 4)
  { 


    cursor(ARROW);
    imageMode(CORNER);
    noTint();

    image(beanieback, width/2-38, height-330, 90, 80);

    float d = dist(width/2, height/2, mouseX, mouseY);


    imageMode(CORNERS);
    image(scene4, 0, 0);

    //man image
    imageMode(CENTER); 
    if (compassGet==true)
    {
      walkx +=0.6;
      walky -=1;
      shrink +=1.1;
    }
    image(man, width/2+walkx, height+60+walky, 600-shrink, 600-shrink);

    stroke(255);
    fill(0);
    rect(-10, 500, width+10, 100);

    //right arrow
    pushMatrix();
    fill(255);
    strokeWeight(1);
    translate(width-25, height/2);
    line(-20, 0, 20, 0);
    line(10, -14, 20, 0);
    line(10, 14, 20, 0);
    popMatrix();
    strokeWeight(1);

    //left arrow
    pushMatrix();
    fill(255);
    strokeWeight(1);
    translate(25, height/2);
    line(-20, 0, 20, 0);
    line(-10, -14, -20, 0);
    line(-10, 14, -20, 0);
    popMatrix();

    //boxes around arrows
    //left arrow
    if (mouseX > leftlarrow && mouseX < rightlarrow && mouseY > topa && mouseY < bottoma&&compassGet==false) {
      noFill();
      quad (leftlarrow, topa, rightlarrow, topa, rightlarrow, bottoma, leftlarrow, bottoma);
      if (mousePressed==true&& pMousePressed==false)
      {
        scene=8;
      }
    }

    //right arrow
    if (mouseX > leftrarrow && mouseX < rightrarrow && mouseY > topa && mouseY < bottoma&&compassGet==false) {
      noFill();
      quad (leftrarrow, topa, rightrarrow, topa, rightrarrow, bottoma, leftrarrow, bottoma);
      if (mousePressed==true&& pMousePressed==false)
      {
        scene=7;
      }
    }

    //pocket
    imageMode(CENTER);
    fill(100, 30);
    image(pocket, width-50, height-50, 50, 50);
    if (mouseX > lefti && mouseX < righti && mouseY > topi && mouseY < bottomi) {

      quad (lefti, topi, righti, topi, righti, bottomi, lefti, bottomi);
      if (mousePressed&& pMousePressed==false)
      {
        scene = 2;
      }
    }

    if (compassGet==true && millis()>= goinghome+7000)
    {
      scene=1;
    }

    if (compassGet==false&& d>150) {  
      imageMode(CORNERS);  
      image(sfork, 0, 500);
    }
    if (compassGet==true) {  
      imageMode(CORNERS);  
      image(shome, 0, 500);
    }
    if (d <150&&compassGet==false)
    {
      imageMode(CORNERS);
      image(sprettybarn, 0, 500);
      if (mousePressed&& pMousePressed==false)
      {
        scene = 5;
        needletime=millis();
      }
    }
  }



  //sleep in barn
  else if (scene == 5)
  {
    imageMode(CORNER);
    image(scene5, 0, 0);
    fill(0);
    rect(-10, 500, width+10, 100);

    float d = dist(width/2, height/2, mouseX, mouseY);
    barnyet = true;


    if (millis() >= needletime+4999 &&pinGet==false)
    {
      scene=6;
    }

    if (millis()>= needletime +3000) {

      image(eyes, 0, 0);
    }

    if (mousePressed==true && pMousePressed==false&& millis()>=needletime+3400&&pinGet==true) {
      color tmp2= get(mouseX, mouseY);
      if (blue(tmp2) < 20&&green(tmp2)<20) {
        scene = 4;
        mousePressed=false;
      }
    }
    stroke(255);
    fill(0);
    rect(-10, 500, width+10, 100);
    //pocket
    fill(100, 30);
    imageMode(CENTER);
    image(pocket, width-50, height-50, 50, 50);
    if (mouseX > lefti && mouseX < righti && mouseY > topi && mouseY < bottomi) {

      quad (lefti, topi, righti, topi, righti, bottomi, lefti, bottomi);
      if (mousePressed==true&& pMousePressed==false)
      {
        scene = 2;
      }
    }

    image(faucet, 613, 117, 26, 48);

    if (mouseX > leftf && mouseX < rightf && mouseY > topf && mouseY < bottomf) {
      if (mousePressed&&pinGet==true&&cupGet==true&&magnetGet==true&&corkGet==true )
      {
        scene = 9;
        filltime=millis();
      }
    }
    if (millis() <= needletime+3000)
    {
      imageMode(CORNERS);
      image(sbarnsleep, 0, 500);
    }
    if (millis() >= needletime+3000 &&pinGet==false)
    {
      imageMode(CORNERS);
      image(sharppoke, 0, 500);
    }
  }

  //needle in the hay
  else if (scene == 6)
  {
    //background
    noTint();
    imageMode(CORNER);
    image(scene3, 0, 0);

    //object to find
    image(pin, rx2, ry2, 175, 125);

    for (int x=-100; x<=width+100; x+=90)
    {
      for (int y=-100; y<=height+100; y+=90)
      {
        //grass
        pushMatrix();
        stroke(0, 20);
        float diameter = dist(mouseX, mouseY, x, y) / 3.3;
        image(hay, x, y, diameter, diameter); 
        popMatrix();

        pushMatrix();        
        translate(x, y);
        float a = atan2(mouseY-y, mouseX-x); 
        rotate(a);                          
        image(hay, 0, 0);      
        popMatrix();
      }
    }
    //hand cursor
    pushMatrix();
    imageMode(CENTER);
    tint(255, 70);
    image(shand, mouseX, mouseY, 120, 100);
    popMatrix();
    float d = dist(rx2, ry2, mouseX, mouseY);
    noCursor();
    noTint();
    //trigger next scene
    if (d<120 && mousePressed==true && pMousePressed==false ) {
      scene = 2;
      pinGet=true;
      newItem=true;
    }


    stroke(255);
    fill(0);
    rect(-10, 500, width+10, 100);
    //pocket
    imageMode(CENTER);
    image(pocket, width-50, height-50, 50, 50);

    //tint
    fill(100, 30);
    rect(0, 0, width, height);
    if (mouseX > lefti && mouseX < righti && mouseY > topi && mouseY < bottomi) {

      quad (lefti, topi, righti, topi, righti, bottomi, lefti, bottomi);
      if (mousePressed&& pMousePressed==false)
      {
        scene = 2;
      }
    }
    imageMode(CORNERS);
    image(ssomethingsharp, 0, 500);
  }

  //righttrees
  else if (scene == 7)
  {

    //boxes around arrows
    //left arrow

    imageMode(CORNERS);
    image(scene7, 0, 0);


    stroke(255);
    fill(0);
    rect(-10, 500, width+10, 100);

    //left arrow
    pushMatrix();
    fill(255);
    strokeWeight(1);
    translate(25, height/2);
    line(-20, 0, 20, 0);
    line(-10, -14, -20, 0);
    line(-10, 14, -20, 0);
    popMatrix();
    if (mouseX > leftlarrow && mouseX < rightlarrow && mouseY > topa && mouseY < bottoma) {
      noFill();
      quad (leftlarrow, topa, rightlarrow, topa, rightlarrow, bottoma, leftlarrow, bottoma);
      if (mousePressed==true&& pMousePressed==false)
      {
        scene=4;
      }
    }
    //pocket
    imageMode(CENTER);
    fill(100, 30);
    image(pocket, width-50, height-50, 50, 50);
    if (mouseX > lefti && mouseX < righti && mouseY > topi && mouseY < bottomi) {

      quad (lefti, topi, righti, topi, righti, bottomi, lefti, bottomi);
      if (mousePressed && pMousePressed==false)
      {
        scene = 2;
      }
    }

    //foam cup picture
    if (cupGet==false) {
      pushMatrix();
      translate(109, 325);
      rotate(PI/2);
      image(foamcup, 0, 0, 20, 33);
      popMatrix();
    }

    if (mouseX > leftc && mouseX < rightc && mouseY > topc && mouseY < bottomc) {
      if (mousePressed)
      {
        scene = 2;
        cupGet=true;
        newItem=true;
      }
    }
  }


  //left trees
  else if (scene == 8)
  {
    imageMode(CORNERS);
    image(scene8, 0, 0);


    stroke(255);
    fill(0);
    rect(-10, 500, width+10, 100);


    //right arrow
    pushMatrix();
    fill(255);
    strokeWeight(1);
    translate(width-25, height/2);
    line(-20, 0, 20, 0);
    line(10, -14, 20, 0);
    line(10, 14, 20, 0);
    popMatrix();
    strokeWeight(1);

    //boxes around arrows
    //right arrow
    if (mouseX > leftrarrow && mouseX < rightrarrow && mouseY > topa && mouseY < bottoma) {
      noFill();
      quad (leftrarrow, topa, rightrarrow, topa, rightrarrow, bottoma, leftrarrow, bottoma);
      if (mousePressed==true&& pMousePressed==false)
      {
        scene=4;
      }
    }
    //pocket
    imageMode(CENTER);
    fill(100, 30);
    image(pocket, width-50, height-50, 50, 50);
    if (mouseX > lefti && mouseX < righti && mouseY > topi && mouseY < bottomi) {

      quad (lefti, topi, righti, topi, righti, bottomi, lefti, bottomi);
      if (mousePressed)
      {
        scene = 2;
      }
    }


    //magnet picture
    if (magnetGet==false) {
      pushMatrix();
      translate(15, 483);
      rotate(PI/2);
      image(magnet, 0, 0, 20, 33);
      popMatrix();
    }

    if (mouseX > leftm && mouseX < rightm && mouseY > topm && mouseY < bottomm) {
      if (mousePressed)
      {
        scene = 2;
        magnetGet=true;
        newItem=true;
      }
    }
  }


  if (scene == 9)
  {
    imageMode(CORNERS);
    image(scene9, 0, 0);

    image(foamcup, handmovex, handmovey);


    drip+=2;

    if (drip>height-200) {    
      drip=165;
    }

    image(waterdrip, 188, drip);

    handmovex-=2;
    handmovey-=2;

    if (handmovex<160)
    {
      handmovex=160;
      handmovey=260;
    }

    image(foamcupcompass, handmovex, handmovey);


    if (millis()> filltime +10000) {
      scene=10;
      watchcompass=millis();
    }

    image(faucet, 265, 65, 130, 244);

    if (mousePressed==true && pMousePressed==false&&millis()>t+4000) {
      color tmp1 = get(mouseX, mouseY);
      if (blue(tmp1) < 20&&green(tmp1)<20) {
        scene = 2;
      }
    }
    stroke(255);
    fill(0);
    rect(-10, 500, width+10, 100);

    imageMode(CORNERS);
    image(slearningkid, 0, 500);
  }


  //compassfinished
  if (scene == 10)
  {
    imageMode(CORNERS);
    image(scene10, 0, 0);
    pushMatrix();
    a+=PI/16;
    imageMode(CENTER);
    translate(width/2+25, height/2-90);
    rotate((PI/2-a)*easing);
    image(compassparts, 0, 0);
    popMatrix();

    if (millis()> watchcompass +7000) {
      scene=4;
      compassGet=true;
      goinghome=millis();
    }


    stroke(255);
    fill(0);
    rect(-10, 500, width+10, 100);
    imageMode(CORNERS);
    image(spointmenorth, 0, 500);
  }


  pMousePressed=mousePressed;
}



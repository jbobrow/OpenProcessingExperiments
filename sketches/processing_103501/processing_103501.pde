
PGraphics pg;               
View[] views = new View[9];   
PImage[] imgs = new PImage[15];

PImage  slide1, slide2, slide3, slide4;


PVector translation = new PVector(-400, -100);
PVector vTranslation = new PVector(0, 0);
boolean moving;
int movingCounter;
float rotation;
int stepCounter;

PFont font;

CheckPoint publicCheckPoint;

CheckPoint[] localCheckPoints = new CheckPoint[10];
int triggeredCheckPoint;
boolean publicMove;


void setup() {
  size(1080, 720); 
  pg = createGraphics(width, height);
  pg.smooth();
  pg.noStroke(); 
  pg.fill(100, 150, 255);
  



  smooth();
  noStroke();
  noCursor();

  views[0] = new View(new PVector(400, 100, 0));
  views[1] = new View(new PVector(200, 900, HALF_PI));
  views[2] = new View(new PVector(2000, 400, TWO_PI));
  views[3] = new View(new PVector(1100, 100, 0));
  views[4] = new View(new PVector(1100, 400, 0));
  views[5] = new View(new PVector(1100, 700, 0));
  views[6] = new View(new PVector(400, -400, 0));
  views[7] = new View(new PVector(-600, -200, 0));
  views[8] = new View(new PVector(-1000, 600, 0));

  font = createFont("Arial-Black", 60);
  pg.textFont(font);
  pg.textAlign(CENTER);

  publicCheckPoint = new CheckPoint(true, new PVector(width-200, height-60), 60);

  localCheckPoints[0] = new CheckPoint(false, new PVector((views[0].position.x+views[1].position.x)/2, (views[0].position.y+views[1].position.y)/2), 60, 1);
  localCheckPoints[1] = new CheckPoint(false, new PVector((views[0].position.x+views[2].position.x)/2+60, (views[0].position.y+views[2].position.y)/2-50), 60, 2);
  localCheckPoints[2] = new CheckPoint(false, new PVector((views[0].position.x+views[6].position.x)/2, (views[0].position.y+views[6].position.y)/2+50), 60, 6);
  localCheckPoints[3] = new CheckPoint(false, new PVector((views[0].position.x+views[7].position.x)/2, (views[0].position.y+views[7].position.y)/2), 60, 7);

  localCheckPoints[4] = new CheckPoint(false, new PVector((views[0].position.x+views[6].position.x)/2, (views[0].position.y+views[6].position.y)/2+50), 60, 0);
  localCheckPoints[5] = new CheckPoint(false, new PVector((views[0].position.x+views[7].position.x)/2, (views[0].position.y+views[7].position.y)/2), 60, 0);
  localCheckPoints[6] = new CheckPoint(false, new PVector((views[0].position.x+views[1].position.x)/2, (views[0].position.y+views[1].position.y)/2), 60, 0);
  localCheckPoints[7] = new CheckPoint(false, new PVector((views[0].position.x+views[2].position.x)/2+60, (views[0].position.y+views[2].position.y)/2-50), 60, 0);

  localCheckPoints[8] = new CheckPoint(false, new PVector((views[0].position.x+views[3].position.x)/2+150, (views[0].position.y+views[3].position.y)/2), 60, 3);
  localCheckPoints[9] = new CheckPoint(false, new PVector((views[0].position.x+views[3].position.x)/2+150, (views[0].position.y+views[3].position.y)/2), 60, 0);

for(int i=0; i<6; i++) {
  imgs[i] =loadImage(""+i+".jpg");
}
//imageMode(CENTER);
}

void draw() {
  for (int i=0; i<views.length; i++) {
    views[i].update();
  }

  pg.beginDraw();
  pg.background(0);
  pg.translate(width/2+translation.x, height/2+translation.y);


  if (publicMove) {
    if (moving && movingCounter<views.length-1) {
      slowTranslate(new PVector(-views[movingCounter].position.x, -views[movingCounter].position.y), new PVector(-views[movingCounter+1].position.x, -views[movingCounter+1].position.y));
    } 
    else if (moving && movingCounter == views.length-1) {
      slowTranslate(new PVector(-views[movingCounter].position.x, -views[movingCounter].position.y), new PVector(-views[0].position.x, -views[0].position.y));
    }
  } 
  else {
    if (moving) {
      slowTranslate(new PVector(-views[movingCounter].position.x, -views[movingCounter].position.y), new PVector(-localCheckPoints[triggeredCheckPoint].viewN.position.x, -localCheckPoints[triggeredCheckPoint].viewN.position.y));
    }
  }
  translation.x += vTranslation.x;
  translation.y += vTranslation.y;

  //=====================================================================================================================
  //                                            Draw stuff on views
  //public style 
  pg.textFont(font);
  pg.noStroke();


  //views[0]==========================================================

  pg.pushStyle();
  
  pg.fill(0, 200, 255);
  pg.rect(views[0].position.x-330, views[0].position.y-160,700,480);

  pg.fill(255);
  pg.textSize(30);

  pg.text("void setup() {", views[0].position.x-300, views[0].position.y-120);
  pg.text("  size(300,100);", views[0].position.x-300, views[0].position.y-80);
  pg.text("}", views[0].position.x-300, views[0].position.y-40);
  pg.text("void draw() {", views[0].position.x-300, views[0].position.y);
  pg.text("  background(255,0,0);", views[0].position.x-300, views[0].position.y+40);
  pg.text("  fill(255);", views[0].position.x-300, views[0].position.y+80);
  pg.text("  stroke(0);", views[0].position.x-300, views[0].position.y+120);
  pg.text("  ellipse(90,50,10,10);", views[0].position.x-300, views[0].position.y+160);
  pg.text("  ellipse(210,50,10,10);", views[0].position.x-300, views[0].position.y+200);
  pg.text("  text(\"Hello,world!\",120,55);", views[0].position.x-300, views[0].position.y+240);
  pg.text("}", views[0].position.x-300, views[0].position.y+280);
  pg.image(imgs[0],views[0].position.x+20, views[0].position.y-20);
  pg.popStyle();

  //views[1]========================================================
  pg.pushStyle();
  
//  pg.fill(255, 206, 9);
//  pg.rect(views[1].position.x-350, views[1].position.y-180,740,340);

  pg.fill(255);
  pg.textSize(30);

  pg.text("//IDE introduction", views[1].position.x-imgs[1].width/2, views[1].position.y-imgs[1].height/2-20);
  pg.image(imgs[1],views[1].position.x-imgs[1].width/2, views[1].position.y-imgs[1].height/2);
  pg.popStyle();

  //views[2]=====================================================================================================
  pg.pushStyle();
  
  pg.fill(0, 174, 151);
  pg.rect(views[2].position.x-330, views[2].position.y-160,750,440);

  pg.fill(255);
  pg.textSize(30);

  pg.text("//Variables", views[2].position.x-300, views[2].position.y-120);
  pg.text("//int, float,char,color,String,long,double", views[2].position.x-300, views[2].position.y-80);
  pg.text("int x =30;", views[2].position.x-300, views[2].position.y-40);
  pg.text("int y =50;", views[2].position.x-300, views[2].position.y);
  pg.text("int r =20;", views[2].position.x-300, views[2].position.y+40);
  pg.text("color c =color(204, 153, 0);", views[2].position.x-300, views[2].position.y+80);
  pg.text("fill(c);", views[2].position.x-300, views[2].position.y+120);
  pg.text("ellipse(x,y,r,r);", views[2].position.x-300, views[2].position.y+160);
  pg.text("String t =\"Hello, world!\";", views[2].position.x-300, views[2].position.y+200);
  pg.text("text(t,x-10,y+30);", views[2].position.x-300, views[2].position.y+240);
  pg.image(imgs[2],views[2].position.x+150, views[2].position.y-40);
  pg.popStyle();

  //views[3]=====================================================================================================

  pg.pushStyle();
    pg.fill(20, 119, 80);
  pg.rect(views[3].position.x-330, views[3].position.y-460,1100,600);
  
  pg.fill(255, 119, 80);
  pg.rect(views[3].position.x-330, views[3].position.y-460,900,600);
 

  pg.fill(255);
  pg.textSize(30);
  pg.text("//Public and private viarables", views[3].position.x-300, views[3].position.y-420);
  pg.text("// Viarables declared in {  } only work there", views[3].position.x-300, views[3].position.y-380);
  pg.text("int x =30, y =50, r =20, w = 200, h =100;", views[3].position.x-300, views[3].position.y-340);
  pg.text("color c =color(204, 153, 0);", views[3].position.x-300, views[3].position.y-300);
  pg.text("String t =\"Hello, world!\";", views[3].position.x-300, views[3].position.y-260);
  pg.text("void setup() {", views[3].position.x-300, views[3].position.y-220);
  pg.text("  size(w,h); ", views[3].position.x-300, views[3].position.y-180);
  pg.text("  fill(c);", views[3].position.x-300, views[3].position.y-140);
  pg.text("}", views[3].position.x-300, views[3].position.y-100);
  pg.text("void draw() {", views[3].position.x-300, views[3].position.y-60);
  pg.text("  background(255);", views[3].position.x-300, views[3].position.y-20);
  pg.text("  ellipse(x,y,r,r);", views[3].position.x-300, views[3].position.y+20);
  pg.text("  text(t,x-10,y+30);", views[3].position.x-300, views[3].position.y+60);
  pg.text("}", views[3].position.x-300, views[3].position.y+100);
  pg.image(imgs[3],views[3].position.x+180, views[3].position.y-220);
  pg.popStyle();

  //views[4]=====================================================================================================

  pg.pushStyle();
  
  pg.fill(255, 52, 132);
  pg.rect(views[4].position.x-330, views[4].position.y-160,900,300);

  pg.fill(255);
  pg.textSize(30);

  pg.text("+, -, *, /, %: a = b + c;", views[4].position.x-300, views[4].position.y-120);
  pg.text("+=, -=, *=, /=: a +=1; a = a+1; a++; (The difference of = and ==)", views[4].position.x-300, views[4].position.y-80);
  pg.text("cos(f),sin(f),atan2(y,x),", views[4].position.x-300, views[4].position.y-40);
  pg.text("if(a >0){ }else{ }", views[4].position.x-300, views[4].position.y);
  pg.text("switch(a) {case 0:  case 1: ... case 10: }", views[4].position.x-300, views[4].position.y+40);
  pg.text("Practice:", views[4].position.x-300, views[4].position.y+80);
  pg.text("  1, 2, Bang, 4, 5, Bang, 7, 8, Bang, 10, 11, Bang, Bang,14... ", views[4].position.x-300, views[4].position.y+120);
  pg.popStyle();

  //views[5]=====================================================================================================

  pg.pushStyle();
  
  pg.fill(255, 228, 0);
  pg.rect(views[5].position.x-330, views[5].position.y-160,900,600);

  pg.fill(50);
  pg.textSize(30);
  pg.text("//Loop:", views[5].position.x-300, views[5].position.y-120);
  pg.text("for(int i=0; i<10; i++) {", views[5].position.x-300, views[5].position.y-80);
  pg.text("  println(i);", views[5].position.x-300, views[5].position.y-40);
  pg.text("  ellipse(50+cos(i*TWO_PI/10)*30,50+sin(i*TWO_PI/10)*30,6,6);", views[5].position.x-300, views[5].position.y);
  pg.text("}", views[5].position.x-300, views[5].position.y+40);
  
  pg.text("int i=0;", views[5].position.x-300, views[5].position.y+120);
  pg.text("while (i<10) {", views[5].position.x-300, views[5].position.y+160);
  pg.text("  float a = i*TWO_PI/10;", views[5].position.x-300, views[5].position.y+200);
  pg.text("  ellipse(50+cos(a)*30,50+sin(a)*30,6,6);", views[5].position.x-300, views[5].position.y+240);
  pg.text("  i++; ", views[5].position.x-300, views[5].position.y+280);
  pg.text("} ", views[5].position.x-300, views[5].position.y+320);
  pg.image(imgs[4],views[5].position.x+250, views[5].position.y+20);

  pg.popStyle();
 //views[7]=====================================================================================================
  pg.pushStyle();

  pg.fill(234, 18, 175);
  pg.rect(views[7].position.x-510, views[7].position.y-300,1020,600);

  pg.fill(255);
  pg.textSize(60);

  pg.text("Let's show the movie here", views[7].position.x-300, views[7].position.y-20);


  pg.popStyle();
  
  //views[6]=====================================================================================================
  pg.pushStyle();
  pg.pushMatrix();
    pg.fill(255);
  pg.textSize(60);
  pg.translate(0,-100);
  pg.image(imgs[5],views[6].position.x-imgs[5].width/2, views[6].position.y-imgs[5].height/2);
  pg.text("Demomonkeys.org", views[6].position.x-imgs[5].width/2, views[6].position.y-imgs[5].height/2-60);

pg.popMatrix();
  pg.popStyle();

 

  //views[8]=====================================================================================================
  pg.pushStyle();
  pg.fill(0, 200, 255);
  pg.textSize(100);
  pg.text("[ Thanks! ]", views[8].position.x, views[8].position.y);
  pg.popStyle();
  //                                            Draw ends
  //=====================================================================================================================  
  for (int i=0; i<localCheckPoints.length; i++) {
    if (movingCounter!=localCheckPoints[i].viewNumber) {
      localCheckPoints[i].update();
      localCheckPoints[i].display(pg);
    }
  }

  pg.endDraw();


  //Display stuff on first layer
  background(0);
  image(pg,0,0);

  checkCheckPoints();
  publicCheckPoint.update();
  publicCheckPoint.display(g);
  fill(100,120,255,100);
  ellipse(mouseX,mouseY,30,30);
}

void slowTranslate(PVector current, PVector next) {


  print("Counter = "+movingCounter);
  print(" Start = "+views[movingCounter].position.x+","+views[movingCounter].position.y);
  print("  End = "+next.x+","+next.y);
  print("  v= "+vTranslation.x+","+vTranslation.y);
  println ("  trans= "+translation.x+","+translation.y);


  vTranslation.x = (next.x - current.x)/50;
  vTranslation.y = (next.y - current.y)/50;

  if (dist(translation.x, translation.y, next.x, next.y)<=10) {
    moving =false;


    if (!publicMove) movingCounter = localCheckPoints[triggeredCheckPoint].viewNumber; 
    else {
      movingCounter +=1;
      //      if(movingCounter ==views.length) movingCounter =0;
    }
    if (movingCounter==views.length) movingCounter =0;
    vTranslation.x = 0;
    vTranslation.y = 0;
    translation.x = next.x;
    translation.y = next.y;
  }
}

void keyPressed() {
  moving= true;
}

void checkCheckPoints() {
  if (publicCheckPoint.triggered) {
    moving =true;
    publicCheckPoint.triggered =false;
  } 

  for (int i = 0; i<localCheckPoints.length; i++) {
    if (localCheckPoints[i].triggered) {
      triggeredCheckPoint = i;
      moving =true;
      localCheckPoints[i].triggered =false;
    }
  }
}

class View {
  PVector position, onScreenPosition;
  boolean on;
  float rotation;

  View(PVector _pos) {
    position = new PVector(_pos.x, _pos.y, _pos.z);
     PVector(_pos.x, _pos.y);
//    
  }

  void update() {
    
    onScreenPosition.x = translation.x+width/2 + position.x;
    onScreenPosition.y = translation.y+height/2 + position.y;
    
//    rotate(translation.z);
  }
}

class CheckPoint {
  boolean publicCheckPoint;
  PVector position, onScreenPosition;
  int counter;
  boolean triggered, mouseOut, renewed;
  int diameter, steps;
  float angleViews;
  int viewNumber;
  View viewC, viewN;

  CheckPoint(boolean _cp, PVector _p, int _d) {
    publicCheckPoint = _cp;
    position = new PVector(_p.x, _p.y);
     PVector(_p.x, _p.y);
    diameter = _d;
    steps =30;
  }

  CheckPoint(boolean _cp, PVector _p, int _d, int _n) {
    publicCheckPoint = _cp;
    position = new PVector(_p.x, _p.y);
     PVector(position.x, position.y);
    diameter = _d;
    steps =30;

    viewNumber = _n;
    viewN = views[_n];
  }

  void update() {
    if (!publicCheckPoint) {
      onScreenPosition.x = translation.x+width/2 + position.x;
      onScreenPosition.y = translation.y+height/2 + position.y;

      angleViews = atan2(viewN.position.y-views[movingCounter].position.y, viewN.position.x-views[movingCounter].position.x );
    } 


    if (!moving && dist(mouseX, mouseY, onScreenPosition.x, onScreenPosition.y)<diameter/2) { 
      counter++;
    } 
    else {
    }

    if (counter>steps) {
      triggered =true;
      if (publicCheckPoint) publicMove =true; 
      else publicMove =false;
      counter = 0;
    }
  }

  void display(PGraphics _p) {
    if (!publicCheckPoint) {
      //     _p.beginDraw();

      _p.fill(255, 100);
      _p.noStroke();
      _p.ellipse(position.x, position.y, diameter, diameter);
      _p.fill(0, 200, 255);
      _p.arc(position.x, position.y, diameter, diameter, 0, TWO_PI*counter/steps);
      _p.fill(0,100);
      _p.ellipse(position.x, position.y, diameter*0.8, diameter*0.8);

      _p.fill(0, 200, 255, 150);
      if (!moving) {     
        //     _p.ellipse(position.x, position.y, diameter*0.3,diameter*0.3);
        _p.pushMatrix();
        _p.translate(position.x, position.y);
        _p.rotate(angleViews);
        _p.rect(0, 2, diameter/2, -4);
        //     _p.rect(0,2,-diameter/2,-4);
        _p.popMatrix();
      } 
      else {
        _p.rect(position.x-10, position.y-10, 5, 20);
        _p.rect(position.x+5, position.y-10, 5, 20);
      }
      //    _p.endDraw();
      //   image(_p,0,0);
    }  
    else {
      fill(255, 100);
      noStroke();
      ellipse(position.x, position.y, diameter, diameter);
      fill(0, 200, 255);
      arc(position.x, position.y, diameter, diameter, 0, TWO_PI*counter/steps);
      fill(0);
      ellipse(position.x, position.y, diameter*0.8, diameter*0.8);

      fill(0, 200, 255);
      if (!moving) {     
        triangle(position.x-7, position.y+12, position.x-7, position.y-12, position.x+12, position.y);
      } 
      else {
        rect(position.x-10, position.y-10, 5, 20);
        rect(position.x+5, position.y-10, 5, 20);
      }
    }
  }
}


void mouseClicked() {
  publicMove =true; 
  moving= true;


}


//import gifAnimation.*;
//GifMaker gifExport = new GifMaker(this, "/home/ray/infiniteClapping.gif");

int bColor, bStroke, elements, fieldsW, fieldsH;
Boom[][] boomBoom;

void setup() {
  //size(1000, 1000); //add P2D for VSync
  //frameRate(-1); //for Vsync with P2D
  //frameRate(30);
  size(500,500);
  frameRate(60);
  elements = 10;
  initializer();
  smooth();


  //gifExport.setRepeat(0); //endless animation
  //gifExport.setTransparent(0, 0, 0); //black is transparent
}

void initializer() {
  fieldsW = width/(elements);
  fieldsH = height/(elements);

  bColor = 0;
  bStroke = 255;
  boomBoom = new Boom[500][500];

  for (int j = 0; j < height; j += fieldsH) {
    for (int i = 0; i < width; i += fieldsW) {
      boomBoom[i][j] = new Boom(i+(fieldsW/2), j+(fieldsH/2), 200, 1, 5 + (elements));
    }
  }
}

void draw() {
  //background(bColor);
  smooth();
  background(255);
  for (int j = 0; j < height; j += fieldsH) {
    for (int i = 0; i < width; i += fieldsW) {
      boomBoom[i][j].display();
      fill(155);
      textAlign(CENTER,CENTER);
      //text(i + " " + j,boomBoom[i][j].x(),boomBoom[i][j].y());
      println(boomBoom[i][j]);
      strokeWeight(1);
      stroke(155,155,155,50);
      line(boomBoom[i][j].zapX(), boomBoom[i][j].zapY(), boomBoom[i][i].zapX(), boomBoom[i][i].zapY());
      line(boomBoom[j][i].zapX(), boomBoom[j][i].zapY(), boomBoom[i][i].zapX(), boomBoom[i][i].zapY());
      line(boomBoom[j][j].zapX(), boomBoom[j][j].zapY(), boomBoom[j][j].zapX(), boomBoom[j][j].zapY());
      strokeWeight(2);
    }
  }
  
  for (int j = 0; j < height; j += fieldsH) {
    for (int i = 0; i < width; i += fieldsW) {
      //boomBoom[i][j].display();
      if ( dist(boomBoom[i][j].zapX(), boomBoom[i][j].zapY(), boomBoom[j][i].zapX(), boomBoom[j][i].zapY()) <= 200) {
        stroke(250, 0, 0, 255-(boomBoom[i][j].blamm())*2);
        strokeWeight(.1);
        line(boomBoom[i][j].zapX(), boomBoom[i][j].zapY(), boomBoom[j][i].zapX(), boomBoom[j][i].zapY());
        line(boomBoom[i][j].zapX(), boomBoom[j][i].zapY(), boomBoom[i][j].zapX(), boomBoom[i][j].zapY());
        line(boomBoom[i][j].zapX(), boomBoom[i][j].zapY(), boomBoom[j][i].zapX(), boomBoom[j][i].zapY());
      }
      
      if ( dist(boomBoom[i][j].zapX(), boomBoom[i][j].zapY(), boomBoom[j][i].zapX(), boomBoom[j][i].zapY()) <= 200) {
        stroke(250, 0, 0, 255-(boomBoom[i][j].blamm())*2);
        strokeWeight(.1);
        line(boomBoom[i][j].zapX(), boomBoom[i][j].zapY(), boomBoom[j][i].zapX(), boomBoom[j][i].zapY());
        //line(boomBoom[i][j].zapX(), boomBoom[i][j].zapY(), boomBoom[j][i].zapX(), boomBoom[j][i].zapY());
        //line(boomBoom[i][j].zapX(), boomBoom[i][j].zapY(), boomBoom[j][i].zapX(), boomBoom[j][i].zapY());
      }
      if ( dist(boomBoom[i][j].zapX(), boomBoom[i][j].zapY(), boomBoom[j][j].zapX(), boomBoom[j][j].zapY()) <= 200) {
        stroke(250, 0, 0, 255-(boomBoom[i][j].blamm())*2);
        strokeWeight(.1);
        line(boomBoom[i][j].zapX(), boomBoom[i][j].zapY(), boomBoom[j][i].zapX(), boomBoom[j][i].zapY());
        //line(boomBoom[i][j].zapX(), boomBoom[i][j].zapY(), boomBoom[j][i].zapX(), boomBoom[j][i].zapY());
        //line(boomBoom[i][j].zapX(), boomBoom[i][j].zapY(), boomBoom[j][i].zapX(), boomBoom[j][i].zapY());
      }
      if ( dist(boomBoom[i][i].zapX(), boomBoom[i][i].zapY(), boomBoom[j][j].zapX(), boomBoom[j][j].zapY()) <= 200) {
        stroke(250, 0, 0, 255-(boomBoom[i][j].blamm())*2);
        strokeWeight(.1);
        line(boomBoom[i][i].zapX(), boomBoom[i][i].zapY(), boomBoom[j][i].zapX(), boomBoom[j][i].zapY());
        //line(boomBoom[i][j].zapX(), boomBoom[i][j].zapY(), boomBoom[j][i].zapX(), boomBoom[j][i].zapY());
        //line(boomBoom[i][j].zapX(), boomBoom[i][j].zapY(), boomBoom[j][i].zapX(), boomBoom[j][i].zapY());
      }
      
    }
  }

  //gifExport.setDelay(1);
  //gifExport.addFrame();
}

void mousePressed() {
  //gifExport.finish();
  //println("gif exported");
}

class Boom {
  int x, y, systemSize, size, bStroke, blamSize, kaBlamO, blamO, baBlamSize;
  float pointX, pointY, pointX2, pointY2, speed, xSize, blam, baBlam, boomX, boomY;

  //constructor
  Boom(int _x, int _y, int _size, float _speed, int _systemSize) {
    x = _x;
    y = _y;  
    systemSize = _systemSize;
    size = _size;
    speed = _speed + random(0, 2);

    blam = 0;
    blamSize = 1;   
    blamO = 0;
    baBlamSize = 1;

    kaBlamO = -1;
  }

  void display() {
    xSize = size/systemSize;
    pointX = xSize * sin(radians(frameCount)*speed ) + x;
    pointY = xSize * cos(radians(frameCount)*speed ) + y;
    pointX2 = xSize * cos(radians(frameCount)*speed ) + x;
    pointY2 = xSize * sin(radians(frameCount)*speed ) + y;

    noFill();
    stroke(bStroke);

    if (blam <= 1) {
      blamSize = +1;
    } else if (blam >= 5) {
      blamSize = blamSize * -1;
    }
    blam = blam+(blamSize * .1);

    //strokeWeight(blam);
    //println("blam is " + blam + " and blamSize is " + blamSize);
    point(pointX, pointY);
    point(pointX2, pointY2);
    strokeWeight(.25);
    ellipse(x, y, xSize*2, xSize*2);
    //strokeWeight(5);

    if (dist(pointX, pointY, pointX2, pointY2) <= 2) {
      //float boomX, boomY;
      boomX = pointX;
      boomY = pointY;
      bStroke = 255;
      stroke(255, 0, 0, 100);
      ellipse(boomX, boomY, xSize/10, xSize/10);
      noStroke();
      fill(255, 0, 0, 40);
      kaBlamO = 1;
      blamO = 50;
      if (bColor == 255) {
        bColor = 0;
        bStroke = int(random(55, 255));
      } else {
        bColor = 255;
        bStroke = 50;
      }
    } else {
      kaBlamO = -1;
    }

    if (blamO <= 15) {
      baBlamSize = baBlamSize * -1;
    } else if (blamO >= 15) {
      baBlamSize = 1;
    }

    blamO = blamO+baBlamSize;
    //println("baBlam is " + baBlam + " and blamO is " + blamO);

    noFill();
    stroke(255, 0, 0, 255-(blamO*3));
    strokeWeight(.5);
    ellipse(boomX, boomY, blamO, blamO);
    stroke(255, 0, 0, 255-(blamO*2));
    strokeWeight(.5);
    ellipse(boomX, boomY, blamO/50, blamO/50);
  }

  float zapX() {
    return boomX;
  }
  
  float zapY() {
    return boomY;
  }
  
  float blamm() {
    return blamO;
  }
  
  float x() {
    return x;
  }
  
  float y() {
    return y;
  }
}

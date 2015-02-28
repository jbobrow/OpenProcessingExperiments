
public class coordinate {
  private float xPos, yPos;

  public coordinate(float x, float y) {
    xPos = x;
    yPos = y;
  }

  public float getXPos() {
    return xPos;
  }
  public float getYPos() {
    return yPos;
  }
}

public class imgSize {
  private float w, h;

  public imgSize(float wdth, float hgt) {
    w = wdth;
    h = hgt;
  }

  public float getWidth() {
    return w;
  }
  public float getHeight() {
    return h;
  }
}

public class floatWrap {
  private float v;

  public floatWrap(float value) {
    v = value;
  }

  public float getValue() {
    return v;
  }
}

PImage img0, img1, img2, img3, img4, img5, img6, img7, img8;
ArrayList imgList, xyList, sizeList, rotateList;

int count, randP;
float posX, posY, opacity;
float randX, randY, randR;
float moveX, moveY, xFact, yFact;
boolean putPic, doneSpin;

void setup() {
  size(800, 600);
  frameRate(25);
  img0 = loadImage("img0.jpg");
  img1 = loadImage("img1.jpg");
  img2 = loadImage("img2.jpg");
  img3 = loadImage("img3.jpg");
  img4 = loadImage("img4.jpg");
  img5 = loadImage("img5.jpg");
  img6 = loadImage("img6.jpg");
  img7 = loadImage("img7.jpg");
  img8 = loadImage("img8.jpg");
  randP = int(random(1, 9));

  count = 0;

  imgList = new ArrayList();
  xyList = new ArrayList();
  sizeList = new ArrayList();
  rotateList = new ArrayList();

  moveX = 0;
  moveY = 600;
  xFact = 0;
  yFact = 0;
  
  cursor(HAND);
  imageMode(CENTER); 
  rectMode(CENTER);
  smooth();
  fill(255);
}

void draw() {
  
  image(img0, width/2, height/2, width, height);
  
  for (int i=0; i<imgList.size(); i++) {
    
    if (!doneSpin && i==imgList.size()-1) {
       break; 
    }
    
    pushMatrix();

    translate(((coordinate)xyList.get(i)).getXPos(), ((coordinate)xyList.get(i)).getYPos());
    rotate(((floatWrap)rotateList.get(i)).getValue());
    rect(0, 0, ((imgSize)sizeList.get(i)).getWidth()+10, ((imgSize)sizeList.get(i)).getHeight()+10);
    image((PImage)imgList.get(i), 0, 0, ((imgSize)sizeList.get(i)).getWidth(), ((imgSize)sizeList.get(i)).getHeight());

    popMatrix();
  }
  
  if (mousePressed) {
    putPic = true;
  }
  if (putPic) {
    if (count == 0) {
      pushMatrix();
      posX = mouseX;
      posY = mouseY;
      randP = int(random(1, 9));
      randX = random(150, 250);
      randY = random(150, 250);
      randR = random(0, 360);
      doneSpin = false;
      xFact = (0+posX)/frameRate;
      yFact = (600-posY)/frameRate;
     
      xyList.add(new coordinate(posX, posY));
      sizeList.add(new imgSize(randX, randY));
      rotateList.add(new floatWrap(randR));
 
      if (randP == 1) {
        imgList.add(img1);
      }
      if (randP == 2) {
        imgList.add(img2);
      }
      if (randP == 3) {
        imgList.add(img3);
      }
      if (randP == 4) {
        imgList.add(img4);
      }
      if (randP == 5) {
        imgList.add(img5);
      }
      if (randP == 6) {
        imgList.add(img6);
      }
      if (randP == 7) {
        imgList.add(img7);
      }
      if (randP == 8) {
        imgList.add(img8);
      }      
    }

    if (randP == 1) {
      translate(moveX, moveY); 
      rotate(500+count);
      rect(0, 0, randX+10, randY+10);
      image(img1, 0, 0, randX, randY);
    }
    if (randP == 2) {
      translate(moveX, moveY); 
      rotate(500+count);
      rect(0, 0, randX+10, randY+10);
      image(img2, 0, 0, randX, randY);
    }
    if (randP == 3) {
      translate(moveX, moveY); 
      rotate(500+count);
      rect(0, 0, randX+10, randY+10);
      image(img3, 0, 0, randX, randY);
    }
    if (randP == 4) {
      translate(moveX, moveY); 
      rotate(500+count);
      rect(0, 0, randX+10, randY+10);
      image(img4, 0, 0, randX, randY);
    }
    if (randP == 5) {
      translate(moveX, moveY); 
      rotate(500+count);
      rect(0, 0, randX+10, randY+10);
      image(img5, 0, 0, randX, randY);
    }
    if (randP == 6) {
      translate(moveX, moveY); 
      rotate(500+count);
      rect(0, 0, randX+10, randY+10);
      image(img6, 0, 0, randX, randY);
    }
    if (randP == 7) {
      translate(moveX, moveY); 
      rotate(500+count);
      rect(0, 0, randX+10, randY+10);
      image(img7, 0, 0, randX, randY);
    }
    if (randP == 8) {
      translate(moveX, moveY); 
      rotate(500+count);
      rect(0, 0, randX+10, randY+10);
      image(img8, 0, 0, randX, randY);
    }
    moveX = moveX+xFact;
    moveY = moveY-yFact;
    println(frameRate);
   
    count++;
    if (count >= frameRate) {
      popMatrix();
      moveX = 0;
      moveY = 600;
      putPic = false;
      count = 0;
      doneSpin = true;
    }
  }
}



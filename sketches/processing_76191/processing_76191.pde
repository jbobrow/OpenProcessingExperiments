
/** Hourglass © 2012/10/21 by Peter Bosshard Schneider<br />
*  Press Mouse to reset.*/

PGraphics maskbuffer;
PImage sandImage;
float sandclock_width;
float sandclock_height;
color bgClr = color(0);                              // background color
int koerner;                                         // number of grains
int currkoerner;                                     // current number of grains
SandGrain[] SandKoerner;                             // array of sandgrain objects
int starttime = 0;
int duration = 0;


void setup() {
  size(500, 500, P2D);
  background(0);
  smooth();
  frameRate(72);
  noLoop();
  reset();
}

void reset() {
  starttime = millis();
  duration = 0;
  sandclock_width = 125;
  sandclock_height = sandclock_width*2.0;
  createMaskbuffer(sandclock_width, sandclock_height);  // create a mask buffer
  sandImage = createImage(int(sandclock_width), int(sandclock_height), ARGB); // create the sand image
  sandImage.mask(maskbuffer);                          // mask the image with the maskbuffer
  koerner = floor(getContainerSize(maskbuffer)*0.495);             // maximal number of sandgrains 
                                                        // is one third of the class container
  currkoerner = 0;                                      // there are no sandgrains in the container yet

  SandKoerner = new SandGrain[koerner]; 
  //SandKoerner[currkoerner] = new SandGrain(width/2, 0);
  while (currkoerner < koerner) {
    int zl=int(random(sandImage.height/2));
    int sp=int(random(sandImage.width));
    if (red(maskbuffer.get(sp, zl)) == 255) {
      SandKoerner[currkoerner] = new SandGrain(sp, zl);
      float bright = random(100)+155;
      SandKoerner[currkoerner].setColor(color(bright, bright-10, bright-100));
      sandImage.set(SandKoerner[currkoerner].getX(), SandKoerner[currkoerner].getY(), SandKoerner[currkoerner].getColor());
      currkoerner++;
    }
  }
  loop();
}

  //////////////////////////////////////////////////////////////////////////////////////
  // get the amount of pixels aka sandgrains that fit into the glass of the sandclock //
  //////////////////////////////////////////////////////////////////////////////////////
  int getContainerSize(PGraphics buf) {
    int result = 0;

    for (int i=0;i<buf.pixels.length;i++) {
      if (red(buf.pixels[i]) > 127) result++;
    }
    println("Buffer size: " + buf.pixels.length);
    println("Container size: " + result);
    return result;
  }

  //////////////////////////////////////////////////////////////////////////////////////
  // draw the shape of the glass into a graphics buffer                               //
  //////////////////////////////////////////////////////////////////////////////////////
  void createMaskbuffer(float w, float h) {
    float scw = w/2.0;                                         // half width of buffer
    float sch = h/2.0;                                         // half height of buffer
    float cop = w*0.4;
    maskbuffer = createGraphics(int(2*scw), int(2*sch), P2D); // create graphics object
    maskbuffer.beginDraw();
    maskbuffer.background(0);
    // draw white sandclock shape starting at its centre
    maskbuffer.fill(255);
    maskbuffer.noStroke();
    maskbuffer.pushMatrix();
    maskbuffer.translate(maskbuffer.width/2, maskbuffer.height/2);
    maskbuffer.beginShape();
    maskbuffer.vertex(-scw, -sch);                            // top left
    maskbuffer.vertex(scw, -sch);                              // top right
    maskbuffer.bezierVertex(scw, -cop, 1, -cop, 1, 0);          // curve segment top right
    maskbuffer.bezierVertex(1, cop, scw, cop, scw, sch);        // curve segment bottom right
    maskbuffer.vertex(scw, sch);                               // bottom right
    maskbuffer.vertex(-scw, sch);                             // bottom left
    maskbuffer.bezierVertex(-scw, cop, 1, cop, -1, 0);            // curve segment bottom left
    maskbuffer.bezierVertex(-1, -cop, -scw, -cop, -scw, -sch);   // curve segment top left
    maskbuffer.endShape(CLOSE);
    maskbuffer.popMatrix();
    // draw a 1 pixel black frame around the buffer
    maskbuffer.stroke(0);
    maskbuffer.noFill();
    maskbuffer.rect(0, 0, 2*scw-1, 2*sch-1);
    maskbuffer.endDraw();
  }

  ////////////////////////////////////////////////////////////////////////////////
  // update the sand image
  ////////////////////////////////////////////////////////////////////////////////
  void updateSand() {
    sandImage.loadPixels();
    maskbuffer.loadPixels();
    boolean no_move = true;
    for (int i=0;i<koerner;i++) {
      SandGrain currKorn = SandKoerner[i];
      if ((sandImage.get(currKorn.getX(), currKorn.getY()+1) == bgClr)&&(red(maskbuffer.get(currKorn.getX(), currKorn.getY()+1)) == 255)) {
        sandImage.set(currKorn.getX(), currKorn.getY(), bgClr);
        currKorn.setY(currKorn.getY()+1);
        sandImage.set(currKorn.getX(), currKorn.getY(), currKorn.getColor());
        no_move = false;
      }
      else if ((sandImage.get(currKorn.getX()-1, currKorn.getY()+1) == bgClr)&&(red(maskbuffer.get(currKorn.getX()-1, currKorn.getY()+1)) == 255)) {
        sandImage.set(currKorn.getX(), currKorn.getY(), bgClr);
        currKorn.setY(currKorn.getY()+1);
        currKorn.setX(currKorn.getX()-1);
        sandImage.set(currKorn.getX(), currKorn.getY(), currKorn.getColor());
        no_move = false;
      }
      else if ((sandImage.get(currKorn.getX()+1, currKorn.getY()+1) == bgClr)&&(red(maskbuffer.get(currKorn.getX()+1, currKorn.getY()+1)) == 255)) {
        sandImage.set(currKorn.getX(), currKorn.getY(), bgClr);
        currKorn.setY(currKorn.getY()+1);
        currKorn.setX(currKorn.getX()+1);
        sandImage.set(currKorn.getX(), currKorn.getY(), currKorn.getColor());
        no_move = false;
      }
      sandImage.updatePixels();
      maskbuffer.updatePixels();
    }
    if(no_move){
      duration = millis() - starttime;
      println("Time elapsed: " + nf(floor(duration/1000.0),0,3) + " seconds");
      noLoop();
    }
  }

  void draw() {
    updateSand();
    background(0,51,102);
    imageMode(CENTER);
    pushMatrix();
    translate(width/2, height/2);
    image(sandImage, 0, 0,width/2*0.8,height*0.8);
    popMatrix();
  }

  void mouseReleased() {    
      reset();
  }


  public class SandGrain {
    int currx;
    int curry;
    color sandColor = color(255, 200, 51);

    public SandGrain(int stx, int sty) {
      currx = stx;
      curry = sty;
    }

    int getX() {
      return currx;
    }
    int getY() {
      return curry;
    } 

    void setX(int sx) {
      currx = sx;
    }

    void setY(int sy) {
      curry = sy;
    }

    void setColor(color clr) {
      this.sandColor = clr;
    }

    color getColor() {
      return this.sandColor;
    }
  }



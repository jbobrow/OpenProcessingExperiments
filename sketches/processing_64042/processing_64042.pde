
/** an animation class with a set of animations */

class Animation {
  float position_x;        // top left corner of the animation frame
  float position_y;
  int anim_width;          // width and height of the animation frame
  int anim_height;
  PGraphics imgbuffer;     // an image buffer for the animation
  int animation_set = 0;   // default set  a blank movie with scratches
  float fulllight = 255;   // maximum brightness
  float lowlight = 0;      // minimum light
  float currentlight = 127;
  int duration = 1000;     // duration in milliseconds (default value 1 second)
  int elapsed = 0;         // time elapsed
  boolean job_done = false;// state of the animation
  color text_color = color(50, 100, 200, 255); // color for titles
  String title = "END";    // title
  float titleSize = 40;    // textsize of title
  PImage theimg = null;    // a picture
  PVector elemstart;       // start position of an animated element
  PVector elemstop;        // end position af an animated element
  PVector currpos;         // current position af an animated element
  PVector dir;             // direction af an animated element
  float currdist;          // current distance

  Animation() {       // default constructor
    position_x = 0;
    position_y = 0;
    anim_width = 100;
    anim_height = 100;
    animation_set = 0;
    elemstart = new PVector(anim_width/2, anim_height/2);
    elemstop = new PVector(anim_width/2, anim_height/2);
    imgbuffer = createGraphics(anim_width, anim_height, JAVA2D);
  }

  Animation(float x, float y, int w, int h) {   // constructor with position, width and height
    position_x = x;                             // with set 0 and default duration of 1 second
    position_y = y;
    anim_width = w;
    anim_height = h;
    animation_set = 0;
    elemstart = new PVector(anim_width/2, anim_height/2);
    elemstop = new PVector(anim_width/2, anim_height/2);
    imgbuffer = createGraphics(anim_width, anim_height, JAVA2D);
  }

  Animation(float x, float y, int w, int h, int s, int d) {   // constructor with position, width and height
    position_x = x;                                           // set and duration
    position_y = y;
    anim_width = w;
    anim_height = h;
    animation_set = s;
    elemstart = new PVector(anim_width/2, anim_height/2);
    elemstop = new PVector(anim_width/2, anim_height/2);
    imgbuffer = createGraphics(anim_width, anim_height, JAVA2D);
    switch(animation_set) {
    case 1:
      currentlight = lowlight;
      break;
    case 2:
      currentlight = fulllight;
      break;
    default:
      currentlight = 127;
      break;
    }
    duration = d;
  }

  // ------------------- update method where the animation takes place -----------------
  void update() {
    if (!job_done) {
      int start_time = millis();
      switch(animation_set) {
      case 1:                                             // fade in
        imgbuffer.beginDraw();                            // begin drawing to the image buffer
        imgbuffer.fill(currentlight, 240);                // set fill to slightly transparent white
        imgbuffer.noStroke();                             // disable stroke
        imgbuffer.rect(0, 0, anim_width, anim_height);    // draw white transparent background
        float increment = (fulllight-lowlight)/duration;
        if (currentlight<fulllight) currentlight = increment*elapsed;
        imgbuffer.endDraw();
        break;
      case 2:                                             // fade out
        imgbuffer.beginDraw();                            // begin drawing to the image buffer
        imgbuffer.fill(currentlight, 240);                // set fill to slightly transparent white
        imgbuffer.noStroke();                             // disable stroke
        imgbuffer.rect(0, 0, anim_width, anim_height);    // draw white transparent background
        float decrement = (fulllight-lowlight)/duration;
        if (currentlight>lowlight) currentlight = 255 - (decrement*elapsed);
        imgbuffer.endDraw();
        break;
      case 3:                                             // countdown
        imgbuffer.beginDraw();                            // begin drawing to the image buffer
        imgbuffer.fill(fulllight, 240);                   // set fill to slightly transparent white
        imgbuffer.noStroke();                             // disable stroke
        imgbuffer.rect(0, 0, anim_width, anim_height);    // draw white transparent background
        float theta = 10*TWO_PI/duration*elapsed;         // angle for rotation
        // draw a filled arc
        imgbuffer.stroke(200);
        imgbuffer.strokeWeight(10);
        imgbuffer.strokeCap(SQUARE);
        imgbuffer.fill(128, 10);
        imgbuffer.ellipseMode(RADIUS);
        imgbuffer.arc(anim_width/2, anim_height/2, anim_height/3, anim_height/3, -HALF_PI, radians(degrees(theta)%360)-HALF_PI);
        // draw a cross
        imgbuffer.line(anim_width/2 - anim_height/3 - 20, anim_height/2, anim_width/2 + anim_height/3 + 20, anim_height/2);
        imgbuffer.line(anim_width/2, anim_height/2 - anim_height/3 - 20, anim_width/2, anim_height/2 + anim_height/3 + 20);
        // draw countdown number
        imgbuffer.textFont(loadFont("Impact-40.vlw"));
        imgbuffer.fill(255, 0, 0, 100);
        imgbuffer.textSize(anim_height/2);
        imgbuffer.textAlign(CENTER, CENTER);
        int cnt_num = floor(10.0 - (10.0/duration*elapsed));// calculate number for countdown from 9 down to 0
        imgbuffer.text(cnt_num, anim_width/2, anim_height*0.45);
        imgbuffer.endDraw();
        break;
      case 4:
        imgbuffer.beginDraw();                            // begin drawing to the image buffer
        imgbuffer.fill(255, 240);                         // set fill to slightly transparent white
        imgbuffer.noStroke();                             // disable stroke
        imgbuffer.rect(0, 0, anim_width, anim_height);    // draw white transparent background
        dir = PVector.sub(elemstop, elemstart);
        currdist = dist(elemstart.x, elemstart.y, elemstop.x, elemstop.y)/duration*elapsed;
        dir.normalize();
        dir.mult(currdist);
        currpos = PVector.add(elemstart, dir);
        imgbuffer.fill(text_color);
        imgbuffer.textFont(loadFont("Impact-40.vlw"));
        imgbuffer.textSize(titleSize);
        imgbuffer.textAlign(CENTER, CENTER);
        imgbuffer.text(title, currpos.x, currpos.y);
        imgbuffer.endDraw();
        break;
      case 5:                                               // display an image
        if (theimg != null) {
          imgbuffer.beginDraw();                            // begin drawing to the image buffer
          imgbuffer.background(0);
          imgbuffer.imageMode(CENTER);
          dir = PVector.sub(elemstop, elemstart);
          currdist = dist(elemstart.x, elemstart.y, elemstop.x, elemstop.y)/duration*elapsed;
          dir.normalize();
          dir.mult(currdist);
          currpos = PVector.add(elemstart, dir);

          imgbuffer.image(theimg, currpos.x, currpos.y);
          imgbuffer.endDraw();
        }
        break;
      default:                                            // set 0 - blank movie with scratches
        imgbuffer.beginDraw();                            // begin drawing to the image buffer
        imgbuffer.fill(255, 240);                         // set fill to slightly transparent white
        imgbuffer.noStroke();                             // disable stroke
        imgbuffer.rect(0, 0, anim_width, anim_height);    // draw white transparent background
        imgbuffer.stroke(160);                            // set stroke to light gray
        imgbuffer.strokeWeight(random(3.0));              // set random stroke weight
        for (int i=0;i<10;i++) {                          // draw 10 random scratches
          float xp = random(anim_width);                  // random x position
          float yp = random(0, anim_height);              // random y position
          imgbuffer.line(xp, yp, xp, yp+random(-anim_height/2, anim_height/2)); // draw scratch
        }
        imgbuffer.endDraw();
        break;
      }
      int end_time = millis();
      elapsed+= end_time-start_time;
      if (elapsed >= duration) {
        job_done = true;
      }
    }  // end drawing to the image buffer
  }

  //------------------------------------- display method -------------------------------
  void display() {
    image(imgbuffer, position_x, position_y);    // display contents of the image buffer
  }
  // ------------------------------------ set animation path ---------------------------
  void setElempath(PVector stp, PVector enp) {
    this.elemstart = stp;
    this.elemstop = enp;
  }
  //------------------------------------- set title --------------------------------
  void setTitle(String ti) {
    this.title = ti;
  }
  void setTitleSize(float si) {
    this.titleSize = si;
  }
  void setTextColor(color tc) {
    this.text_color = tc;
  }
  //-------------------------------------- set image -------------------------------
  void setImage(String fnam) {
    this.theimg = loadImage(fnam);
  }
}



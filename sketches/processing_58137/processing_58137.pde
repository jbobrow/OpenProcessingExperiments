
//
//
//

PFont font;
String[] poem, thisline;
int pindex;
float seconds, timestart, rate, ralpha;
int elapsed, talpha;

void setup() {
  size(400,200);
  smooth();
  frameRate(20);
  
  font = loadFont("Garuda-BoldOblique-14.vlw");
  textFont(font);
  textSize(18);
  
  poem = loadStrings("data/text.txt");
  pindex = 0;
  timestart = 0;
  elapsed = 0;
  talpha = 0;
  rate = ralpha = 0.0;
  
  thisline = poem[pindex].split("#");
}

void draw() {
  background(0);
  fill(255, talpha);
  
  // My time!
  seconds = (frameCount/frameRate);
  elapsed = int(seconds - timestart);
  
  int currentX = 10;
  for(int i=0; i < thisline.length; i++) {
    String toUse = thisline[i];
    if(i%2 == 1) {
      if(elapsed >= 2) {
        fill(lerpColor(color(255), color(unhex("77" + toUse.substring(2,8))), rate));
        float warmth = warmth(toUse.substring(0,8));
        text(toUse.substring(9), currentX, ((1-ralpha)*(pindex*20 + 20)%height + ralpha*((pindex+1)*20 + 20)%height));
        // apply effect
        loadPixels();
        for(int y=int((1-ralpha)*(pindex*20 + 20)%height + ralpha*((pindex+1)*20 + 20)%height); y > int((1-ralpha)*(pindex*20 + 20)%height + ralpha*((pindex+1)*20 + 20)%height) - 100*warmth; y--) {
          for(int x=currentX-3; x < currentX+3 + textWidth(toUse.substring(9)); x++) {
            int ii = constrain(x + y*width, 0, pixels.length-1);
            float new_alpha = rate*constrain(random(warmth), 0.1, 0.41);
            pixels[ii] = color(min(new_alpha*max(red(pixels[constrain(ii + width, 0, pixels.length-1)]),red(pixels[ii])) +
                                   new_alpha*max(red(pixels[constrain(ii + width + 1, 0, pixels.length-1)]),red(pixels[ii])) +
                                   new_alpha*max(red(pixels[constrain(ii + width - 1, 0, pixels.length-1)]),red(pixels[ii])),
                                   255),
                               min(new_alpha*max(green(pixels[constrain(ii + width, 0, pixels.length-1)]),green(pixels[ii])) +
                                   new_alpha*max(green(pixels[constrain(ii + width + 1, 0, pixels.length-1)]),green(pixels[ii])) +
                                   new_alpha*max(green(pixels[constrain(ii + width - 1, 0, pixels.length-1)]),green(pixels[ii])),
                                   255),
                               min(new_alpha*max(blue(pixels[constrain(ii + width, 0, pixels.length-1)]),blue(pixels[ii])) +
                                   new_alpha*max(blue(pixels[constrain(ii + width + 1, 0, pixels.length-1)]),blue(pixels[ii])) +
                                   new_alpha*max(blue(pixels[constrain(ii + width - 1, 0, pixels.length-1)]),blue(pixels[ii])),
                                   255));
          }
        }
        updatePixels();
      } else {
        fill(talpha);
      }
      toUse = toUse.substring(9);
    } else
      fill(talpha);
    
    text(toUse, currentX, (pindex*20 + 20)%height);
    currentX += textWidth(toUse);
  }
  
  if(elapsed < 2)
    talpha = int(255*(seconds - timestart)/2);
  else if(elapsed < 4) {
    rate = (seconds - timestart)/2 - 1;
    talpha = 255;
  } else if(elapsed < 5) {
    talpha = int(255*(5 + timestart - seconds));
    ralpha = (seconds - timestart)/2 - 2;
  } else if(pindex < poem.length-1) {
    rate = (6 + timestart - seconds);
    ralpha = (seconds - timestart)/2 - 2;
  } else {
    ralpha = 0.0;
  }
  talpha = constrain(talpha, 0, 255);
  
  if(elapsed == 6 && pindex < poem.length-1) {
    timestart = seconds;
    talpha = 0;
    rate = ralpha = 0.0;
    pindex = (pindex + 1);//%poem.length;
    thisline = poem[pindex].split("#");
  }
}

float warmth(String c) {
  if(c.length() != 8) return 0;
  
  return (unhex("FF") + unhex(c.substring(2,4)) - unhex(c.substring(4,6))/2 - unhex(c.substring(6,8))/2)/(2.0*unhex("FF"));
}


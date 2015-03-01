
/*
 * Program: Freestyle
 * Description: Super interesting. Basically it uses a ton of
 * constraints and if statements. Also a ton of variables.
 * What it does is depending on where the mouse is, the area
 * the mouse is in, the shape will start glowing white. Move
 * it out of the way while it's lit and it changes to a 
 * pre-programmed designated color. If mouse just stays on the
 * section, then will just fade white to black.
 *
 * AUthor: Alex Lay (ylay@ucsc.edu)
 * Date: 2015 January 19.
 *
 */

float top_left = 0;
float top_right = 0;
float bot_left = 0;
float bot_right = 0;
float rev_tl = 0;
float rev_tr = 0;
float rev_bl = 0;
float rev_br = 0;

void setup() {
  size(600, 600);
  background(0);
  rectMode(CENTER);
}

void draw() {
  //drain();
  fill(top_left, 0, 0);
  rect(width/4, height/4, width/2, height/2);
  top_left = constrain(top_left - 2, -10, 265);
  fill(0, 0, top_right);
  rect(width * 3/4, height/4, width/2, height/2);
  top_right = constrain(top_right - 2, -10, 265);
  fill(0, bot_left, 0);
  rect(width * 1/4, height * 3/4, width/2, height/2);
  bot_left = constrain(bot_left - 2, -10, 265);
  fill(bot_right, bot_right, 0);
  rect(width * 3/4, height * 3/4, width/2, height/2);
  bot_right = constrain(bot_right - 2, -10, 265);
  //bg = constrain(bg - 4, 0, 255);
  lines();
  change();
}

void lines() {
  stroke(255);
  strokeWeight(2);
  line(width/2, 0, width/2, height);
  line(0, height/2, width, height/2);
}

void change() {
  //Top Left Corner
  if (mouseX < width/2 && mouseY < height/2) {
    if (top_left < 255 && rev_tl == 0) {
      rev_tl = 0;
      top_left = top_left + 8;
    } else if (top_left > 255 && top_left > 0) {
      rev_tl = 1;
      //top_left = top_left - 4;
    } else if (top_left < 0) {
      rev_tl = 0;
    }
    fill(top_left);
    rect(width/4, height/4, width/2, height/2);
  } 
  //Top Right Corner
  else if (mouseX > width/2 && mouseY < height/2) {
    if (top_right < 255 && rev_tr == 0) {
      rev_tr = 0;
      top_right = top_right + 8;
    } else if (top_right > 255 && top_right > 0) {
      rev_tr = 1;
      //top_left = top_left - 4;
    } else if (top_right < 0) {
      rev_tr = 0;
    }
    fill(top_right);
    rect(width * 3/4, height/4, width/2, height/2);
  } 
  //Bottom Left Corner
  else if (mouseX < width/2 && mouseY > height/2) {
    if (bot_left < 255 && rev_bl == 0) {
      rev_bl = 0;
      bot_left = bot_left + 8;
    } else if (bot_left > 255 && bot_left > 0) {
      rev_bl = 1;
      //top_left = top_left - 4;
    } else if (bot_left < 0) {
      rev_bl = 0;
    }
    fill(bot_left);
    rect(width * 1/4, height * 3/4, width/2, height/2);
  }
  //Bottom Right Corner
  else if (mouseX > width/2 && mouseY > height/2) {
    if (bot_right < 255 && rev_br == 0) {
      rev_br = 0;
      bot_right = bot_right + 8;
    } else if (bot_right > 255 && bot_right > 0) {
      rev_br = 1;
      //top_left = top_left - 4;
    } else if (bot_right < 0) {
      rev_br = 0;
    }
    fill(bot_right);
    rect(width * 3/4, height * 3/4, width/2, height/2);
  } 

  /*else {
   if (bg < 255 && bg_Rev == 0) {
   bg_Rev = 0;
   bg = bg + 2;
   } else if(bg > 255 || bg_Rev == 1) {
   bg_Rev = 1;
   bg = bg - 4;
   if (bg < 0) {
   bg_Rev = 0;
   }
   }
   background(bg);
   } */
}




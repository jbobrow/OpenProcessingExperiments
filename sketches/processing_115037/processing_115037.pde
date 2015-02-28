
boolean playing = false;
//int startTime = second();

void setup () {
  size (800, 800);
  background (58, 200, 250);
  noStroke ();
}

void draw () {
  float sec = map(second(), 0, 60, 0, 800);
  float min = map(minute(), 0, 60, 0, 800);
  float hour = map(hour(), 0, 24, 0, 800);
  background (58, 200, 250);

  updateBackground(sec);
//  makeTVcomedown(sec);
  arewethereyet(sec);
  arewethereyet2(sec);
}


//void makeTVcomedown (float s) {
//  if (second() %15 == 0) {
//      if (!playing && height < 100 && second() < 10) {
//  if (!playing && height<100) {
//    height=-height;
//        fill (0, 0, 0);
//        rect (320, 100, 160, 100);//TV
//        fill (90, 90, 90);
//        rect (330, 110, 140, 80);//TV monitor
//        println("Wee woo");
//      }
//      else {
//        playing = true;
//      }
//    }
  
//}

void arewethereyet (float s) {
  if (second() %6 == 0) {
    if (!playing) {
//      if (playing && second() < 10) {
        println("I just played");
        fill (255, 255, 255);
        ellipse (250, 550, 200, 100);
        triangle (200, 550, 220, 650, 240, 550);
        fill (0, 0, 0);
        text("Are we there yet?", 200, 550);//boy talking
      }
      else {
        playing = true;
      }
    }
  }
  
void arewethereyet2 (float s) {
  if (second() %5 == 0) {
    if (!playing) {
      fill (255, 255, 255);
      ellipse (530, 575, 200, 100);
      triangle (550, 550, 575, 650, 600, 550);
      fill (0, 0, 0);
      text ("Are we there yet?", 475, 575);//girl talking
    }
    else {
      playing = true;
    }
  }
}
//}


void updateBackground(float s) {
  fill (245, 236, 210, 100);
  ellipse (s, 200, 100, 50);//cloud
  ellipse (s+10, 190, 100, 60);//cloud
  ellipse (s+30, 210, 120, 60);//cloud
  ellipse (s+60, 180, 160, 70);//cloud
  ellipse (s+90, 230, 140, 60);//cloud
  ellipse (s+120, 190, 100, 60);//cloud
  ellipse (s+140, 200, 120, 70);//cloud
  ellipse (s+170, 200, 100, 50);//cloud
  ellipse (s+60, 190, 120, 60);//cloud

  ellipse (s, 100, 100, 50);//cloud
  ellipse (s-10, 90, 100, 60);//cloud
  ellipse (s-30, 110, 120, 60);//cloud
  ellipse (s-60, 80, 160, 70);//cloud
  ellipse (s-90, 130, 140, 60);//cloud
  ellipse (s-120, 90, 100, 60);//cloud
  ellipse (s-140, 100, 120, 70);//cloud
  ellipse (s-170, 100, 100, 50);//cloud
  ellipse (s-60, 90, 120, 60);//cloud

  fill (84, 193, 85);
  rect (0, 270, 800, 400);//grass
//  fill (11, 88, 32);
//  ellipse (75, 225, 50, 25);//tree top
//  fill (70, 41, 34);
//  rect (70, 235, 10, 40);//tree trunk
//  fill (11, 88, 32);
//  ellipse (125, 230+(s/3), 50, 25);//tree top
//  fill (70, 41, 34);
//  rect (120, 240+(s/3), 10, 40);//tree trunk
//  fill (11, 88, 32);
//  ellipse (150, 225, 50, 25);//tree top
//  fill (70, 41, 34);
//  rect (145, 235, 10, 40);//tree trunk
//  fill (11, 88, 32);
//  ellipse (250, 240+s, 50, 25);//tree top
//  fill (70, 41, 34);
//  rect (245, 250+s, 10, 40);//tree trunk
//  fill (11, 88, 32);
//  ellipse (280, 225+s, 50, 25);//tree top
//  fill (70, 41, 34);
//  rect (275, 235+s, 10, 40);//tree trunk
//  fill (11, 88, 32);
//  ellipse (525, 225, 50, 25);//tree top
//  fill (70, 41, 34);
//  rect (520, 235, 10, 40);//tree trunk
//  fill (11, 88, 32);
//  ellipse (600, 235, 50, 25);//tree top
//  fill (70, 41, 34);
//  rect (595, 245, 10, 40);//tree trunk
  fill (11, 88, 32);
  ellipse (630+s, 210+s, 60, 30);//tree top
  fill (70, 41, 34);
  rect (625+s, 225+s, 8, 50);//tree trunk
//  fill (11, 88, 32);
//  ellipse (725, 225, 50, 25);//tree top
//  fill (70, 41, 34);
//  rect (720, 235, 10, 40);//tree trunk
  
  fill (0, 0, 0);
  triangle (350, 450, 400, 270, 450, 450);//road
  stroke (250, 255, 0);
  strokeWeight(2);
  line (400, 270, 395, 450);//left yellow line
  line (400, 270, 405, 450);//right yellow line

  noStroke();
  fill (72, 72, 71);
  rect (90, 450, 620, 600);//dashboard center
  triangle (-200, 900, 90, 450, 90, 800);//dashboard left
  triangle (710, 450, 710, 800, 1000, 900);//dashboard right
  strokeWeight (10);
  stroke (72, 72, 71);
  line (0, 0, 90, 450);//window separater line left
  line (800, 0, 710, 450);//window separater line right
  noFill ();
  stroke (0, 0, 0);
  strokeWeight (30);
  ellipse (200, 500, 250, 250);
  noStroke();

  fill (255, 180, 155);
  ellipse (200, 400, 200, 250);//man's head
  fill(98, 50, 44);
  ellipse (200, 380, 200, 210);//man's hair
  fill (222, 187, 92);
  ellipse (600, 400, 200, 230);//woman's head/hair
  rect (510, 380, 180, 170);//woman's hair
  fill (142, 139, 137);
  rect (100, 300, 200, 150, 17);//left car seat head
  rect (500, 300, 200, 150, 17);//right car seat head
  rect (50, 500, 300, 600, 17);//left car seat
  rect (450, 500, 300, 600, 17);// right car seat
  stroke (0, 0, 0);
  strokeWeight (4);
  line (150, 450, 150, 500);//left car seat line 1
  line (250, 450, 250, 500);//left car seat line 2
  line (550, 450, 550, 500);//right car seat line 1
  line (650, 450, 650, 500);//right car seat line 2
  noStroke();
  fill (255, 180, 155);
  ellipse (200, 750, 200, 200);//boy's head
  ellipse (100, 750, 50, 50);//left ear
  ellipse (300, 750, 50, 50);//right ear
  fill (98, 50, 44);
  ellipse (200, 730, 200, 160);//boy's hair
  fill (98, 50, 44);
  ellipse (600, 750, 160, 160);//girl's head/hair
  rect (520, 750, 160, 100);//girl's hair
  fill (252, 125, 214);
  triangle (500, 750, 510, 670, 575, 680);//left side bow
  triangle (575, 680, 640, 640, 650, 710);//right side bow
}



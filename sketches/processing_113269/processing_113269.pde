
float x;
float y;
float lerp;
boolean colorchange;
PImage webImg;

void setup() {
  size(720, 360);
  background(255);
  noStroke();
  String url="http://www.blogohblog.com/wp-content/pop/2010/11/40FishLogos_23.png";
  imageMode(CENTER);
  webImg = loadImage(url, "png");
  image(webImg, width/2, height/2);
  textSize(12);
  String ch = "Click and Hold these Keys";
  fill(0);
  text(ch, 10, 10, 70, 80); 
  text("A", 30, 90); 
  fill(0);
  text("S", 30, 120);
  fill(0);
  text("D", 30, 150);
  String sp = "Space Bar Resets";
  fill(0);
  text(sp, 10, 160, 70, 80);
}

void draw() {
  x=mouseX;
  y=mouseY;
  rectMode(CENTER);

  if (mousePressed == true) {
    rect(x, y, 10, 10, 100, 100, 100, 100);
  }
  if (keyPressed == true) {
    if (key == ' ') { //space 
      background(255);
      imageMode(CENTER);
      image(webImg, width/2, height/2);
      textSize(12);
      String ch = "Click and Hold these Keys";
      fill(0);
      text(ch, 10, 10, 70, 80); 
      text("A", 30, 90); 
      fill(0);
      text("S", 30, 120);
      fill(0);
      text("D", 30, 150);
      String sp = "Space Bar Resets";
      fill(0);
      text(sp, 10, 160, 70, 80);
    }
  }
  if (keyPressed == true) {
    if (key == 'a') {
      color red = color(255, 0, 0);
      color green = color(0, 255, 0); 
      color tempa= lerpColor (red, green, lerp);
      fill(tempa);
      if (!colorchange) {
        lerp+=0.01;
      }
      else if (colorchange) {
        lerp-=0.01;
      }
      if (lerp <=0.001 || lerp >=0.999) {
        colorchange =!colorchange;
      }
    }
  }
  if (keyPressed == true) {
    if (key == 's') {
      color green = color(0, 255, 0);
      color blue = color(0, 0, 255); 
      color temps= lerpColor (green, blue, lerp);
      fill(temps);
      if (!colorchange) {
        lerp+=0.01;
      }
      else if (colorchange) {
        lerp-=0.01;
      }
      if (lerp <=0.001 || lerp >=0.999) {
        colorchange =!colorchange;
      }
    }
  }

  if (keyPressed == true) {
    if (key == 'd') {
      color red = color(255, 0, 0);
      color blue = color(0, 0, 255); 
      color tempd= lerpColor (red, blue, lerp);
      fill(tempd);
      if (!colorchange) {
        lerp+=0.01;
      }
      else if (colorchange) {
        lerp-=0.01;
      }
      if (lerp <=0.001 || lerp >=0.999) {
        colorchange =!colorchange;
      }
    }
  }

  /* if (mousePressed == true) {
   color yellow = color(255, 255, 0);
   color skyblue = color(0, 255, 255);
   color temp= lerpColor (yellow, skyblue, lerp);
   fill(temp);
   rect(x, y, 25, 25, 100, 100, 100, 100);
   if (!colorchange) {
   lerp+=0.01;
   }
   else if (colorchange) {
   lerp-=0.01;
   }
   if (lerp <=0.001 || lerp >=0.999) {
   colorchange =!colorchange;
   }
   }*/
}





import processing.pdf.*;

PImage img;

void setup() {  
  
  imageMode(CENTER);
  rectMode(CENTER);
  ellipseMode(CENTER); 
  img = loadImage("02.jpg");

  size(img.width, img.height);
  // zeichnet die draw() auch nur einmal
  noLoop();
  smooth();
  noStroke();
  background(img);

}
void keyPressed() {
  loop();
  if(key == 's');
  saveFrame("image_" + hour() + minute() + second() + ".png");

}

void keyReleased() {
  noLoop();
}
void draw() {


  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      color c = img.get(x, y);

      float r = red(c);
      float g = green(c);
      float b = blue(c);


      //SCHWARZ
      if (r >= 0 && r <= 20 && g >= 0 && g <= 20 && b >= 0 && b <= 20) {
        stroke(c, random(25, 35));
        strokeWeight(random(1, 15));
        line(x, y, x + random(-25, 25), y  + random(-25, 25));
      }
      if (r >= 20 && r <= 40 && g >= 20 && g <= 40 && b >= 20 && b <= 40) {
        stroke(c, random(25, 35));
        strokeWeight(random(1, 15));
        line(x, y, x + random(-25, 25), y  + random(-25, 25));
      }
      if (r >= 40 && r <= 60 && g >= 40 && g <= 60 && b >= 40 && b <= 60) {
        stroke(c, random(25, 35));
        strokeWeight(random(1, 5));
        line(x, y, x + random(-25, 25), y  + random(-25, 25));
      }
      if (r >= 60 && r <= 100 && g >= 60 && g <= 100 && b >= 60 && b <= 100) {
        stroke(c, random(25, 35));
        strokeWeight(random(1, 5));
        line(x, y, x + random(-25, 25), y  + random(-25, 25));
      }  
      if (r >= 100 && r <= 140 && g >= 100 && g <= 140 && b >= 100 && b <= 140) {
        stroke(c, random(25, 35));
        strokeWeight(random(1, 5));
        line(x, y, x + random(-25, 25), y  + random(-25, 25));
      }  

      // WEIß
            if (r > 200 && g > 200 && b > 200) {
        stroke(c, random(5, 25));
        strokeWeight(random(1, 5));
        line(x, y, x + random(-25, 25), y  + random(-25, 25));
      }
      
      if (r > 190 && r < 220 && g > 190 && g < 220 && b > 190 && b < 220) {
        stroke(c, random(25, 35));
        strokeWeight(random(1, 5));
        line(x, y, x + random(-25, 25), y  + random(-25, 25));
      }

      //vierthellste weiß
      if (r > 210 && r < 220 && g > 210 && g < 220 && b > 210 && b < 220) {
        stroke(c, random(25, 35));
        strokeWeight(random(1, 5));
        line(x, y, x + random(-25, 25), y  + random(-25, 25));
      }

      //dritthellste weiß

      if (r > 220 && r < 230 && g > 220 && g < 230 && b > 220 && b < 230) {
        stroke(c, random(35, 45));
        strokeWeight(random(1, 5));
        line(x, y, x + random(-30, 30), y  + random(-30, 30));
      }

      //zweithellste weiß
      if (r > 230 && r < 240 && g > 230 && g < 240 && b > 230 && b < 240) {
        stroke(c, random(15, 25));
        strokeWeight(random(1, 5));
        line(x, y, x + random(-20, 20), y  + random(-20, 20));
      }

      //hellste weiß
      if (r > 240 && g > 240 && b > 240) {
        stroke(c);
        strokeWeight(random(1, 10));
        line(x, y, x + random(-15, 15), y  + random(-15, 15));
      }

      noStroke();


      // ROT
      if (r > 240 && g < 120 && b < 120) {
        fill(c, 15);
        ellipse(x, y, random(40, 50), random(40, 50));
      }
      if (r <= 240 && r >200 && g < 120 && b < 120) {
        fill(c, 15);
        ellipse(x, y, random(30, 40), random(30, 40));
      }
      if (r <= 200 && r > 150 && g < 120 && b < 120) {
        fill(c, 15);
        ellipse(x, y, random(15, 30), random(15, 30));
      }
      if (r <= 150 && r > 50 && g < 120 && b < 120) {
        fill(c);
        ellipse(x, y, random(5, 10), random(5, 10));
      }

      // GRÜN

      if (r < 120 && g <= 240 && g > 200 && b < 120) {
        fill(c, random(1, 15));
        rect(x, y, random(30, 50), random(30, 50));
      }
      if (r < 120 && g > 240 && b < 120) {
        fill(c, random(1, 15));
        rect(x, y, random(15, 40), random(15, 40));
      }
      if (r < 120 && g < 210 && g > 120 && b < 150) {
        fill(c, random(1, 15));
        rect(x, y, random(5, 20), random(5, 20));
      }
      if (r < 120 && g < 150 && g > 50 && b < 150) {
        fill(c, random(1, 15));
        rect(x, y, random(5, 20), random(5, 20));
      }

      //BLAU
      //wie bekommt man die dreiecke gedreht? 
      //rotate(random(0, 360));
      if (r < 120 && g < 120 && b > 240) {
        fill(c, random (1, 10));
        triangle(x, y + random(20, 25), x + random(20, 25), y - random(20, 25), x - random(20, 25), y - random(20, 25));
      }
      if (r < 120 && g < 120 && b > 200 && b < 240) {
        fill(c, random (1, 10));
        triangle(x, y + random(15, 20), x + random(15, 20), y - random(15, 20), x - random(15, 20), y - random(15, 20));
      }
      if (r < 120 && g < 120 && b > 150 && b < 200) {
        fill(c, random (1, 10));
        triangle(x, y + random(10, 15), x + random(10, 15), y - random(10, 15), x - random(10, 15), y - random(10, 15));
      }
      if (r < 120 && g < 120 && b > 50 && b < 150) {
        fill(c, random (1, 10));
        triangle(x, y + random(10, 15), x + random(10, 15), y - random(10, 15), x - random(10, 15), y - random(10, 15));
      }

      //GELB
      if (r > 60 && g <= 240 && g > 160 && b < 200) {
        fill(c, random(1, 15));
        rect(x, y, random(30, 50), random(30, 50));
      }
      if (r > 60 && g > 200 && b < 120) {
        fill(c, random(1, 15));
        rect(x, y, random(15, 40), random(15, 40));
      }
      if (r > 60 && g < 210 && g > 110 && b < 200) {
        fill(c, random(1, 15));
        rect(x, y, random(5, 20), random(5, 20));
      }
      if (r > 60 && g < 150 && g > 50 && b < 200) {
        fill(c, random(1, 15));
        rect(x, y, random(5, 20), random(5, 20));
      }
      //gelb: rotwert 200-255
      if (r > 199 && r <=255 && g > 160 && b < 200) {
        fill(c, random(1, 15));
        rect(x, y, random(30, 50), random(30, 50));
      }
            //gelb: rotwert 140-200
      if (r > 140 && r < 200 && g > 60 && b < 200) {
        fill(c, random(1, 15));
        rect(x, y, random(5, 20), random(5, 20));
      }
      //gelb: rotwert 60-140
      if (r > 60 && r <= 140 && g > 200 && b < 200) {
        fill(c, random(1, 15));
        rect(x, y, random(15, 40), random(15, 40));
      }

    }
  }
 
}
//void keyPressed(){
//  if(key == 's');





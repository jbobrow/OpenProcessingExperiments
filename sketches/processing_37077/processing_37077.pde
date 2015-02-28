
//struggling to get my entire face into a subroutine so I can plug the subroutine into the for loop
//instead of plugging the for loop into every single part of the face. 
//this same subroutine would have been good for dividing my whole face by 10 rather than
//manually dividing all dimensions by 10
void setup() {
  size(480, 480);
  smooth();
  frameRate(10);
}

int value = 0;



void draw() {


  int tenWidth = width/10;
  int tenHeight = height/10;
  for (int x = 0; x <= 9; x++) {
    for (int y = 0; y <= 9; y++) {


      fill(random(256), 255, random (256));
      rect(tenWidth * x, tenHeight * y, 48, 48);
      //background

      noStroke();
      fill(137, 77, 66);
      quad(15+tenWidth * x, 33+tenHeight * y, 32.5+tenWidth * x, 33.0+tenHeight * y, 
      33.3+tenWidth * x, 40.0+tenHeight * y, 14.5+tenWidth * x, 42.5+tenHeight * y);
      //top of neck
      noStroke();
      fill(230, 193, 169);
      quad(33.3+tenWidth * x, 39.9+tenHeight * y, 14.5+tenWidth * x, 42.4+tenHeight * y, 
      14.3+tenWidth * x, 46.0+tenHeight * y, 34.0+tenWidth * x, 46.0+tenHeight * y);
      triangle(14.3, 46.0, 34.0, 46.0, 25.0, 48.0);
      //rest of neck



      noStroke();
      fill(230, 193, 169);
      quad(11.5+tenWidth * x, 15.0+tenHeight * y, 36.5+tenWidth * x, 15.0+tenHeight * y, 
      31.0+tenWidth * x, 39.0+tenHeight * y, 16.5+tenWidth * x, 39.0+tenHeight * y);
      //general plane of front of face

      noStroke();
      fill(137, 77, 66);
      triangle(17.0+tenWidth * x, 39.0+tenHeight * y, 15.0+tenWidth * x, 33.0+tenHeight * y, 
      14.7+tenWidth * x, 39.0+tenHeight * y);
      triangle(16.5+tenWidth * x, 39.0+tenHeight * y, 18.5+tenWidth * x, 39.0+tenHeight * y, 
      14.9+tenWidth * x, 34.0+tenHeight * y);
      //left jaw
      triangle(30.5+tenWidth * x, 39.0+tenHeight * y, 32.4+tenWidth * x, 33.0+tenHeight * y, 
      33.0+tenWidth * x, 39.0+tenHeight * y);
      triangle(30.6+tenWidth * x, 39.0+tenHeight * y, 29.2+tenWidth * x, 39.0+tenHeight * y, 
      32.4+tenWidth * x, 34.0+tenHeight * y);
      //right jaw

      noStroke();
      fill(209, 151, 141);
      quad(20.2+tenWidth * x, 35.0+tenHeight * y, 24.2+tenWidth * x, 35.0+tenHeight * y, 
      24.2+tenWidth * x, 34.5+tenHeight * y, 23.7+tenWidth * x, 34.0+tenHeight * y);
      quad(24.2+tenWidth * x, 35.0+tenHeight * y, 24.2+tenWidth * x, 34.5+tenHeight * y, 
      24.7+tenWidth * x, 34.0+tenHeight * y, 28.2+tenWidth * x, 35.0+tenHeight * y);
      triangle(22.5+tenWidth * x, 35.0+tenHeight * y, 23.8+tenWidth * x, 35.3+tenHeight * y, 
      25.1+tenWidth * x, 35.0+tenHeight * y);
      //top lip
      noStroke();
      fill(252, 183, 179);
      quad(20.2+tenWidth * x, 35.0+tenHeight * y, 21.9+tenWidth * x, 36.0+tenHeight * y, 
      25.9+tenWidth * x, 36.0+tenHeight * y, 28.2+tenWidth * x, 35.0+tenHeight * y);
      //bottom lip

      noStroke();
      fill(214, 165, 140);
      triangle(24.5+tenWidth * x, 32.0+tenHeight * y, 24.8+tenWidth * x, 21.0+tenHeight * y, 
      26.5+tenWidth * x, 30.5+tenHeight * y);
      //shadow on nose
      noFill();
      stroke(113, 87, 74);
      strokeWeight(.2);
      curve(20.0+tenWidth * x, 31.8+tenHeight * y, 22.0+tenWidth * x, 30.8+tenHeight * y, 
      23.0+tenWidth * x, 31.3+tenHeight * y, 23.5+tenWidth * x, 33.0+tenHeight * y); 
      //left nose hole
      curve(27.5+tenWidth * x, 32.5+tenHeight * y, 25.5+tenWidth * x, 31.3+tenHeight * y, 
      26.4+tenWidth * x, 30.7+tenHeight * y, 24.5+tenWidth * x, 33.0+tenHeight * y);
      //right nose hole
      stroke(113, 87, 74, 90);
      curve(22.5+tenWidth * x, 31.8+tenHeight * y, 21.0+tenWidth * x, 30.5+tenHeight * y, 
      21.3+tenWidth * x, 31.3+tenHeight * y, 23.0+tenWidth * x, 30.0+tenHeight * y);
      //left nostril
      curve(25.5+tenWidth * x, 31.8+tenHeight * y, 27.4+tenWidth * x, 30.4+tenHeight * y, 
      27.0+tenWidth * x, 31.3+tenHeight * y, 25.0+tenWidth * x, 30.0+tenHeight * y);
      //right nostril


      stroke(70, 49, 38);
      strokeWeight(.7);
      strokeJoin(ROUND);
      noFill();
      curve(24.0+tenWidth * x, 23.9+tenHeight * y, 22.0+tenWidth * x, 20.5+tenHeight * y, 
      16.0+tenWidth * x, 19.2+tenHeight * y, 14.0+tenWidth * x, 26.0+tenHeight * y);
      //left eyebrow
      arc(29.5+tenWidth * x, 21.6+tenHeight * y, 7.0, 5.5, PI+(PI/4), TWO_PI-(PI/4));
      //right eyebrow

      noStroke();
      fill(230, 193, 169);
      quad(12.8+tenWidth * x, 20.0+tenHeight * y, 10.8+tenWidth * x, 22.2+tenHeight * y, 
      12.5+tenWidth * x, 27.8+tenHeight * y, 14.4+tenWidth * x, 28.5+tenHeight * y);
      //left ear
      quad(35.0+tenWidth * x, 20.0+tenHeight * y, 36.7+tenWidth * x, 22.2+tenHeight * y, 
      35.0+tenWidth * x, 27.8+tenHeight * y, 33.0+tenWidth * x, 28.5+tenHeight * y);
      //right ear

      fill(70, 49, 38);
      noStroke();
      //quad(114, 145, 124, 200, 140, 205, 135, 147);
      beginShape();
      vertex(11.4+tenWidth * x, 15.0+tenHeight * y);
      vertex(12.4+tenWidth * x, 20.0+tenHeight * y);
      vertex(14.0+tenWidth * x, 20.5+tenHeight * y);
      vertex(13.5+tenWidth * x, 18.0+tenHeight * y);
      vertex(15.0+tenWidth * x, 16.0+tenHeight * y);
      vertex(16.5+tenWidth * x, 18.0+tenHeight * y);
      vertex(24.8+tenWidth * x, 16.0+tenHeight * y);
      vertex(25.5+tenWidth * x, 17.0+tenHeight * y);
      vertex(25.8+tenWidth * x, 16.8+tenHeight * y);
      vertex(26.3+tenWidth * x, 15.3+tenHeight * y);
      vertex(27.0+tenWidth * x, 16.0+tenHeight * y);
      vertex(27.5+tenWidth * x, 16.1+tenHeight * y);
      vertex(28.5+tenWidth * x, 15.3+tenHeight * y);
      vertex(30.0+tenWidth * x, 17.0+tenHeight * y);
      vertex(32.0+tenWidth * x, 16.5+tenHeight * y);
      vertex(33.0+tenWidth * x, 15.4+tenHeight * y);
      vertex(34.5+tenWidth * x, 18.0+tenHeight * y);
      vertex(34.0+tenWidth * x, 20.5+tenHeight * y);
      vertex(35.5+tenWidth * x, 20.2+tenHeight * y);
      vertex(36.5+tenWidth * x, 15.0+tenHeight * y);
      vertex(35.0+tenWidth * x, 11.0+tenHeight * y);
      vertex(30.0+tenWidth * x, 7.0+tenHeight * y);
      vertex(17.0+tenWidth * x, 7.0+tenHeight * y);
      vertex(12.0+tenWidth * x, 11.0+tenHeight * y);
      endShape(CLOSE);
      //hair

      noStroke();
      fill(148, 97, 119);
      quad(14.3+tenWidth * x, 44.0+tenHeight * y, 0+tenWidth * x, 47.0+tenHeight * y, 
      0+tenWidth * x, 48.0+tenHeight * y, 48.0+tenWidth * x, 48.0+tenHeight * y);
      quad(34.0+tenWidth * x, 44.0+tenHeight * y, 48.0+tenWidth * x, 47.0+tenHeight * y, 
      48.0+tenWidth * x, 48.0+tenHeight * y, 0+tenWidth * x, 48.0+tenHeight * y);
      //shirt

      //Nathan Trevino helped me make my eyes move. 
      //He was very helpful :)

      float ex = 18.5 + tenWidth * x;
      float ey = 22.9 + tenWidth * y;
      noStroke();
      fill(255, 255, 255);
      ellipse(ex, ey, 5.0, 2.5);
      //left eyeball

      float rx = 29.5 + tenWidth * x;
      float ry = 22.9 + tenHeight * y;
      ellipse(rx, ry, 5.0, 2.5);
      //right eyeball

      float txiris = constrain((mouseX-ex)/300, -14, 14);
      float tyiris = constrain((mouseY-ey)/300, -14, 14);
      fill(88, 59, 45);
      ellipse(ex+txiris, ey+tyiris, 2.0, 2.0);
      fill(124, 84, 64);
      ellipse(ex+txiris, ey+tyiris, 1.6, 1.6);
      //left iris

      float wxiris = constrain((mouseX-ex)/300, -14, 14);
      float wyiris = constrain((mouseY-ey)/300, -14, 14);
      fill(88, 59, 45);
      ellipse(rx+wxiris, ry+wyiris, 2.0, 2.0);
      fill(124, 84, 64);
      ellipse(rx+wxiris, ry+wyiris, 1.6, 1.6);
      //right iris

      float qx = constrain((mouseX-ex)/300, -14, 14);
      float qy = constrain((mouseY-ey)/300, -14, 14);
      fill(0, 0, 0);
      ellipse(ex+qx+tenWidth * x, ey+qy+tenHeight * y, .8, .8);
      //left pupil
      float qxr = constrain((mouseX-rx)/300, -14, 14);
      float qyr = constrain((mouseY-ry)/300, -14, 14);
      ellipse(rx+qxr+tenWidth * x, ry+qyr+tenHeight * y, .8, .8);
      //right pupil

      noStroke();
      fill(175, 115, 85);
      quad(18.5+tenWidth * x, 21.7+tenHeight * y, 21.3+tenWidth * x, 22.6+tenHeight * y, 
      18.8+tenWidth * x, 21.1+tenHeight * y, 16.0+tenWidth * x, 22.2+tenHeight * y);
      //left eyelid
      quad(26.8+tenWidth * x, 22.6+tenHeight * y, 29.5+tenWidth * x, 21.7+tenHeight * y, 
      32.3+tenWidth * x, 22.4+tenHeight * y, 29.5+tenWidth * x, 21.1+tenHeight * y);
      //right eyelid

      fill(random(value), 0, random(value));
      rect(205, 205, 70, 70);
      //button
    }
  }
}



void mousePressed() {
  if ((205<mouseX) && (205<mouseY) && (mouseX<275) && (mouseY<275)) {
    //mousepressed will only work if you click between the x values 205
    //and 275 and y values 205 and 275
    fill(random(256),random(256), random(256));
    if (value == 0) {
      value = (255);
    } 
    else {
      value = (255);
      //if the value of mousepressed is 0 then change the value to 255
      //and leave it as 255
    }
  }
}



void mouseReleased() {
  if ((205<mouseX) && (205<mouseY) && (mouseX<275) && (mouseY<275)) {
    //same as mousepressed basically but different command
    fill(value);
    if (value == 255) {
      value = 0;
    } 
    else {
      value = (255);
    }
  }
}



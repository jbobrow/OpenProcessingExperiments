
// Homework Assignment 2 Image Reproduction (9/24/2012)
// Kari Kawachi

// Title: IBM 
// Date: 1982
// Artist: Paul Rand

// PImage img; -- used to reference from the original image

void setup(){
  size(689, 1024);
  colorMode(HSB, 360, 100, 100, 100);
  smooth();
  background(290, 26, 9);
// img = loadImage("moma.jpg"); -- used to reference from the original image
}

void draw(){
  if(mousePressed){
    println("x:" +mouseX + "y:" +mouseY);
  }
  
//  image(img, 0, 0); -- used to reference from the original image
  
// "Eye"
  // Eyebrow
    noStroke();
    fill(8, 71, 65);
     beginShape();
      vertex(41, 419);
      vertex(40, 403);
      bezierVertex(50, 331, 210, 328, 219, 403);
      vertex(219, 403);
      vertex(219, 421);
      bezierVertex(219, 421, 140, 330, 41, 419);
     endShape();
    noFill();

  //Eyeball
    fill(44, 6, 91);
      beginShape();
        vertex(37, 471);
        bezierVertex(29, 460, 132, 326, 227, 471);
      endShape();
  
      beginShape();
        vertex(37, 471);
        bezierVertex(29, 480, 132, 612, 227, 471);
      endShape();
    noFill();
  
    fill(16, 32, 56);
      ellipse(130, 471, 104, 104);
    noFill();
  
    fill(340, 26, 9);
      ellipse(130, 471, 44, 44);
    noFill();
    
//"Bee"
    fill(339, 47, 87);
      ellipse(331, 401, 33, 33);
      ellipse(366, 401, 33, 33);
    noFill();
    
    fill(21, 68, 85);
      arc(349, 435, 62, 25, radians(180), radians(360));
      rect(314, 450, 69, 18);
      rect(314, 482, 69, 18);
      arc(349, 517, 62, 25, radians(0), radians(180));
    noFill();
    
    fill(99, 29, 31);
      triangle(317, 428, 257, 459, 301, 490);
      ellipse(272, 485, 59, 60);
      triangle(378, 428, 433, 455, 397, 490);
      ellipse(426, 485, 59, 60);
    noFill();
   
// "M"
    fill(225, 56, 53);
      quad(462, 366, 522, 366, 525, 378, 462, 378);
      quad(585, 367, 644, 367, 644, 378, 581, 378);
      quad(462, 387, 529, 387, 534, 399, 462, 399);
      quad(577, 387, 644, 387, 644, 399, 573, 399);
      quad(482, 409, 537, 409, 542, 421, 482, 421);
      quad(568, 409, 624, 409, 624, 421, 564, 421);
      quad(483, 430, 547, 430, 551, 442, 483, 442);
      quad(560, 430, 624, 430, 624, 442, 556, 442);
      rect(483, 452, 33, 12);
      quad(521, 452, 584, 452, 580, 463, 526, 463);
      rect(589, 452, 35, 12);
      rect(483, 473, 33, 12);
      quad(530, 473, 576, 473, 571, 485, 535, 485);
      rect(589, 473, 35, 12);
      rect(462, 494, 55, 12);
      quad(538, 495, 567, 495, 564, 506, 543, 506);
      rect(589, 494, 56, 12);
      rect(462, 516, 55, 12);
      quad(547, 516, 560, 516, 556, 527, 551, 527);
      rect(589, 516, 56, 12);
    noFill();
}
  
 
 



Image webImg;

float i = 0; //hey playgramming! this is a VARIABLE used to control the rotation
 
void setup() {
  size(500, 500);
    background(10);
    String url = "http://i.imgur.com/Uxt8Tgf.png";
    webImg = loadImage(url, "png");
    self = loadImage("/static/uploaded_resources/p.9751/self.jpg");
    image(webImg, 0, 0);

    pushMatrix();
    translate(-200, 200, -10);
    for (int x = 0; x < width; x += 2 )
{
    fill(random(40), random (180), random(255), random(20));
    stroke(random(255), random(255), random(255));
    ellipse(x*1, 0, x*1, 500);
    fill(random(40), random (180), random(255), random(20));
    stroke(random(255), random(255), random(255));
    rect(0, x*1, 1000, x*1);
}   
    popMatrix();

    //head
    strokeWeight(3);
    stroke(189, 114, 60);
    fill(189, 114, 60);
    quad(246, 295, 300, 293, 344, 162, 186, 157);
    quad(186, 157, 344, 162, 335, 60, 220, 60);
    line(246, 295, 300, 293);
    line(300, 293, 344, 162);
    line(186, 157, 246, 295);
    line(186, 157, 220, 60);
    line(344, 162, 335, 60);
    line(335, 60, 220, 60);
    
    //rightEye
    fill(255);
    stroke(0);
    strokeWeight(2);
    quad(205, 171, 220, 181, 240, 171, 218, 164);
    
    //leftEye
    fill(255);
    stroke(0);
    strokeWeight(2);
    quad(287, 172, 310, 161, 323, 168, 307, 178);

}
 
void draw() {

    //mouse stuff
    //println("X: " + mouseX + " Y: " +mouseY);
    
    //right arm
    stroke(0);
    strokeWeight(1);
    fill(46, 59, 68);
    quad(125, 239, 199, 297, 244, 500, 100, 500);
    triangle(125, 239, 100, 500, 2, 498);
    
    //hoodie
    stroke(0);
    strokeWeight(1);
    fill(11, 139, 216);
    quad(125, 239, 154, 222, 199, 223, 289, 367);
    quad(199, 297, 289, 367, 305, 500, 244, 500);
    quad(343, 346, 289, 367, 305, 500, 357, 500);
    quad(349, 360, 331, 244, 397, 294, 386, 335);
    fill(177, 199, 212);
    quad(343, 346, 331, 244, 309, 284, 306, 321);
    quad(343, 346, 306, 321, 268, 330, 289, 367);
    
    //face detail
    stroke(0);
    strokeWeight(2);
    fill(155, 113, 114);
    quad(237, 256, 255, 270, 275, 270, 295, 256);
    //line(245, 261, 286, 261);
    fill(189, 114, 60);    
    quad(264, 172, 247, 223, 263, 236, 282, 224);
    line(264, 172, 263, 236);
    noFill();
    strokeWeight(1);
    bezier(241, 258, 245, 263, 282, 265, 292, 256);
    
    //left arm
    stroke(0);
    strokeWeight(1);
    fill(46, 59, 68);
    triangle(397, 294, 487, 500, 357, 500);
    triangle(349, 360, 386, 335, 357, 500);

    //neck
    stroke(189, 114, 60);
    strokeWeight(1);
    fill(189, 114, 60);
    quad(308, 295, 306, 321, 268, 330, 254, 306);
    
    //eyeballs
    stroke(0);
    strokeWeight(2);
    fill(random(40), random (180), random(255), random(20));
    ellipse(306, 169, 13, 13);
    fill(random(40), random (180), random(255), random(20));
    ellipse(220, 171, 13, 13);
    noFill();
    bezier(331, 149, 335, 140, 290, 150, 277, 167);
    
    //glasses
    strokeWeight(3);
    stroke(random(80), random (180), random(255));
    line(348, 160, 333, 218);
    line(333, 218, 281, 218);
    line(281, 218, 272, 193);
    line(272, 193, 339, 186);
    
    line(272, 193, 257, 193);
    
    line(190, 160, 200, 212);
    line(200, 212, 247, 215);
    line(247, 215, 257, 193);
    line(257, 193, 190, 183);
        
    //hair
    pushMatrix();
    stroke(random(80), random (180), random(255), random(200));
    line(335, 30, random(345, 370), random(122,190));
    stroke(random(80), random (180), random(255), random(200));
    line(335, 30, random(162, 304), random(45, 150));
    stroke(random(80), random (180), random(255), random(200));
    line(335, 30, random(315, 343), random(45, 120));
    stroke(random(80), random (180), random(255), random(200));
    line(335, 30, random(145, 256), random(95, 180));
    stroke(random(80), random (180), random(255), random(200));
    line(335, 30, random(163, 175), random(150, 210));
    stroke(random(80), random (180), random(255), random(200));
    line(335, 30, random(256, 312), random(13, 40));
    stroke(random(80), random (180), random(255), random(200));
    line(335, 30, random(207, 312), random(25, 45));
    popMatrix();
   
}



int drawstate = 1;
color eyeson = color(19, 84, 178);
float x, y, x2, y2; 
float easing = 0.07; 
float eyesize = 1.0; 

void setup()
{
  size(640, 480, P3D); 
  noStroke(); 
  background(255); 
}

void draw()
{

  // Screen
  beginShape();
  noStroke();
  fill(0);
  vertex(0, 277); 
  bezierVertex(20, 33, 293, 34, 305, 31);
  bezierVertex(506, 27, 635, 150, 639, 282);
  bezierVertex(639, 434, 400, 446, 325, 448);
  bezierVertex(296, 447, 3, 449, 0, 277);
  endShape();

  //if(pmouseX != 0  && pmouseY != 0) 
  if (drawstate == 3)
  {

    float dirY = (mouseY / float(height) - 0.5) * 5; 
    float dirX = (mouseX / float(width) - 0.5) * 5; 

    float d = dist(mouseX, mouseY, 210, 240); 
    float d2 = dist(mouseX, mouseY, 430, 240); 

    directionalLight(18, 68, 155, -dirX, -dirY, -1);  
    directionalLight(400, 400, 400, -dirX, -dirY, -1);  

    // Initial Eyes
    beginShape(); 
    fill(eyeson); 
    noStroke();
    vertex(120, 199);
    bezierVertex(165, 144, 302, 227, 287, 283);
    bezierVertex(282, 300, 260, 328, 206, 324);
    bezierVertex(155, 315, 82, 256, 120, 199);
    endShape();

    x = constrain(x, 260, 255); 
    y = constrain(y, 220, 255); 

    beginShape();
    fill(eyeson);
    vertex(353, 282);
    bezierVertex(337, 227, 474, 146, 520, 199);
    bezierVertex(558, 257, 484, 317, 434, 325);
    bezierVertex(379, 328, 357, 300, 353, 282);
    endShape();
  }
  else if (drawstate ==1) 
  {
    // mean face
    //left eye
    beginShape(); 
    fill(eyeson); 
    vertex(98, 229); 
    bezierVertex(154, 249, 236, 257, 288, 283); 
    bezierVertex(303, 290, 261, 328, 206, 324);
    bezierVertex(105, 297, 66, 218, 98, 229);
    endShape(); 

    //right eye
    beginShape(); 
    fill(eyeson); 
    vertex(353, 283); 
    bezierVertex(403, 257, 485, 249, 541, 229); 
    bezierVertex(573, 218, 534, 296, 434, 326);
    bezierVertex(379, 328, 336, 290, 353, 282);
    endShape();
  }
  else if (drawstate ==2)
  { 
    beginShape();
    fill(eyeson);
    vertex(87, 253);
    bezierVertex(73, 227, 125, 180, 190, 180);
    bezierVertex(256, 180, 306, 251, 277, 258);
    bezierVertex(240, 231, 176, 218, 87, 253);
    endShape();

    beginShape();
    fill(eyeson);
    vertex(363, 258);
    bezierVertex(334, 251, 383, 180, 451, 180);
    bezierVertex(516, 179, 556, 226, 553, 253);
    bezierVertex(465, 218, 401, 231, 363, 258);
    endShape();
  }
  else if (drawstate ==4)
  {
  beginShape(); 
  fill(eyeson); 
  noStroke();
  vertex(120, 199);
  bezierVertex(165, 144, 302, 227, 287, 283);
  bezierVertex(282, 300, 260, 328, 206, 324);
  bezierVertex(155, 315, 82, 256, 120, 199);
  endShape();

  beginShape();
  fill(19, 84, 178);
  vertex(363, 279);
  bezierVertex(419, 329, 478, 289, 540, 241);
  bezierVertex(571, 229, 490, 324, 433, 326);
  bezierVertex(377, 328, 352, 275, 363, 279);
  endShape();

}
}

void mousePressed()
{
  println("mousePressed");
  drawstate =1;
}

void mouseReleased()
{
  println("mouseReleased");
  drawstate =2;
}

void mouseMoved()
{
  drawstate = 3;
}

void mouseDragged()
{
  println("mouseClicked");
  drawstate = 4;
}






PShape bg;                                                 //variable name?

void setup()                                               //the basis.
{
  smooth();                                                //toggle antialiasing on or off
  size(320,320);                                           //window size. 
  bg = loadShape("flower_bg.svg");                         //load svg background file. 
  //noLoop();                                              //toggle refresh on or off... as comment or code.                    
}

void draw()                                                //let's draw
{
  
  shape(bg,0,0,320,320);                                   //draw loadShape at 0,0 coordinate and window size
  fill(255,0,0,128);
  triangle(90,0, 151,0, 72,239);
 
  
  fill(0,255,0);                                           //mouse coordinates on-screen to help drawing.
  text(mouseX,8,15);                                      
  text(mouseY,8,35);
  
  //Now comes Lisa's face. 
  //I will use Bezier Curves for the basis of the face.
  
  //first layer of hair
  noStroke();
  fill(60,30,0);
  triangle(114,290, 100,225, 199,240);            //Some triangles...
  triangle(146,286, 134,250, 208,275);
  triangle(75,285, 100,95, 205,99);
  triangle(57,161, 140,37, 161,104);
  triangle(140,37, 190,38, 166,149);
  triangle(190,38, 254,66, 158,158);
  triangle(158,158, 254,66, 294,184);
  triangle(170,156, 294,184, 296,287);
 
  //neck                                          //Beziers...
  strokeWeight(1);
  fill(200);
  beginShape();
  vertex(153,236);
  bezierVertex(153,236, 173,289, 171,308);
  bezierVertex(183,330, 212, 303, 229,300);
  bezierVertex(239,282, 215, 229, 228,205);
  endShape();
  
  //Face                                        //More Beziers....
  strokeWeight(2);
  fill(230);
  beginShape();                                           
  vertex(110,200);
  bezierVertex(115,250, 135,250, 135,260);
  bezierVertex(135,260, 138,279, 170,260);
  bezierVertex(170,260, 188,254, 199,249);
  bezierVertex(199,249, 225,235, 231,183);
  bezierVertex(219,96, 224,91, 224,83);
  bezierVertex(221,72, 180, 77, 167,65);
  bezierVertex(158,68, 148,75, 140,84);
  bezierVertex(128,110, 130,116, 129,133);
  bezierVertex(115,166, 111,150, 110,200);
  endShape();
  
  //front layer of hair
  fill(100,70,0);
  beginShape();
  vertex(169,65);                               //vertex
  vertex(127,129);
  vertex(124,177);
  vertex(108,110);
  vertex(145,57);
  vertex(177,54);
  endShape();
  
  beginShape();
  vertex(205,69);
  vertex(248,180);
  vertex(242,94);
  vertex(205,58);
  endShape();
  
  //eyes or eyebrows
  fill(0);
  ellipse(187,135, 45,8);
  ellipse(183,144,16,16);
  
  //nose
  fill(255);
  triangle(128,181,150,139,150,191);
  
  //mouth
  fill(255);
  arc(153,227, 33,13, 0,PI);
  
  
  
}


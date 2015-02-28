
String message = "THE ACADEMY MUSEUM OF MOTION PICTURES";

float xpos;
float xpos2;
 
 
void setup(){
  size(500,500);
   smooth();
   PFont font = loadFont("OratorStd-48.vlw");
   textFont(font);
   textAlign(LEFT, CENTER);
   textSize(30);
 
}
 
void draw(){
 background(255);

    fill(0,0,0);
  text(message, 90,340,340,100);
   float xpos=map(mouseX,0,width,240,370);
   float xpos2=map(mouseX,0,width,150,280);
   float xpos3=map(mouseX,0,width,0,20);
   float xpos4=map(mouseX,0,width,20,0);
   
   beginShape();
   fill(xpos3,xpos3,xpos);
   noStroke();
   vertex(90,260);
   vertex(90,340);
   vertex(xpos,340);
   vertex(xpos,180);
   endShape();
 
      beginShape();
  fill(0,0,0,200);
   noStroke();
   vertex(420,260);
   vertex(420,340);
   vertex(xpos2,340);
   vertex(xpos2,180);
   endShape();
   
    PGraphics maskImage;
  maskImage = createGraphics(100,100, JAVA2D);
  maskImage.beginDraw();
  maskImage.fill(200);
  maskImage.noStroke();
  maskImage.rect(xpos, 0, 130, 331);
  maskImage.endDraw();
   

   

}
//  
//float x=map(mouseX,0, width, 593,682);
//float x2 = map (mouseX, 0, width,369, 278);
//float y=map(mouseX,0, width, 341,395);
// 
// 
//shape(logo,width/2, height/2, 400,400);
// 
//beginShape();
//fill(51,51,51);
//noStroke();
//vertex(543,269);
//vertex(642,211);
//vertex(x,y);
//vertex(504,447);
//vertex(504, 345);
//endShape();
// 
//beginShape();
//vertex(417,269);
//vertex(318,211);
//vertex(x2,y);
//vertex(455,447);
//vertex(455, 345);
//endShape();
//}
//
//referencesss
//
//float xpos1, xpos2;
//
//void setup() {
//  size(500,500);
//  xpos =


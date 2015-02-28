
//Global variables
PImage img;
//To get movement in spiral and giving displacing
int i=0;
int j=0;
int wiperAngle =0;
int spreadAngle = 0;
int angleChange = 5;
final int ANGLE_LIMIT = 300;
//Rotation
int x = 25;
int y = 25;
//To change the position of center when click
int centroX, centroY;
float rotation = 0;
void setup()
{
//Background image (must be the same size in pixels than bakcground)
PImage fondo = loadImage("desnudo04.jpg");
img = loadImage("desnudo04.jpg");
image(img, 20, 20);
 frameRate(80);
  size(800, 700);
  background(0); 
  smooth();
  centroX = width/8;
  centroY = height/2;
}
void draw()
{ 
  translate(50, 50); 
 //Images rotation 
 {frameRate(80); 
//Starting point begins wherever you click on the screen
translate(centroX, centroY);
rotation = (rotation +  0.05) %2;
rotate(PI*rotation);
i++;
j++;
 }
   pushMatrix();
  translate(50, 50); // place green always on screen
  drawGreen();
 drawGreenA();
 wiperAngle += angleChange;
  spreadAngle += angleChange;
  // if the wipe has moved past its limit,
  // reverse direction and set within limits.
  if (wiperAngle > ANGLE_LIMIT || wiperAngle < 0)
  if (spreadAngle > ANGLE_LIMIT || spreadAngle < -60)
  {
    angleChange = -angleChange;
    wiperAngle += angleChange;
    spreadAngle += angleChange;
  }
  popMatrix();
}
void drawGreen()
{
  drawLeftWiper();
  drawRightWiper(); 
drawBodyA();
//Rectangles and ellipses to create shadows
fill(#F09699);fill(0,15);
rect(-50,-50,400,700);
rect(300,-50,400,700);
ellipse(300,300,250,300);
rect(-50, -50, 50, 50);
ellipse(200,200,200,200);
ellipse(350,200,150,150);
ellipse(400,0,200,200);
ellipse(500,30,200,200);
ellipse(500,45,150,150);
rect(0, -50, 75, 75);
rect(-50, -50, 50, 50);
rect(50, 50, 50, 50);
rect(-50, 200, 150, 75);
rect(-25, -25, 75, 75);
rect(75, 75, 75, 75);
rect(-50, 0, 50, 50);
rect(0, 75, 75, 75);
rect(-50, 75, 75, 75);
}
void drawBody(){
pushMatrix();
translate(100, 150);
rotate(radians(spreadAngle));
fill( #989893);
 fill(0,15);
 rect(-50, 120, 0.5, 200); 
popMatrix();
 

}
void drawLeftWiper()
{
pushMatrix();
translate(100, 150);
rotate(radians(wiperAngle));
fill(#18B4F0);
rect(50, 0, 0.5, 30); // blue
rect(100, 0, 0.5, 30);
rect(150, 0, 0.5, 30);
rect(200, 0, 0.5, 30);
rect(250, 0, 0.5, 30);
rect(300, 0, 0.5, 30);
rect(350, 0, 0.5, 30);
rect(400, 0, 0.5, 30);
rect(450, 0, 0.5, 30);
popMatrix();
}
void drawRightWiper()
{
pushMatrix();
translate(66, 32);
rotate(radians(-wiperAngle));
fill(#2EBC13);
rect(0, 0, 1, 40); // green
rect(10, 5, 1, 40);
rect(-10, 5, 5, 60);
rect(-15, 5, 5, 60);
rect(-20, -15, 1, 60);
translate(66, 32);
rect(300, 300, 1, 40); // green
rect(10, 5, 1, 40);
rect(-10, 5, 5, 60);
rect(-15, 5, 5, 60);
rect(-20, -15, 1, 60);
translate(70, 38);
fill(#FF2403);
rect(300, 300, 25, 10); // green
popMatrix();
}
void drawGreenA()
{
drawLeftWiperA();
drawRightWiperA();
drawLeftSpreadA();
drawBodyA();
noStroke(); rect(92, -38, 38, 30);
}
void drawBodyA(){
pushMatrix();
translate(250, 0);
rotate(radians(spreadAngle));
fill(#79C185);
fill(0,50);
ellipse(38, 57, 55, 55); 
popMatrix();
}
void drawLeftSpreadA()
{
pushMatrix();
translate(300, 0);
rotate(radians(spreadAngle));
fill(#FA8508);
rect(22, 50, 0.5, 30);
rect(44, 50, 0.5, 30);
rect(66, 50, 0.5, 30);
rect(88, 50, 3, 30);
rect(110, 50, 0.5, 30);
rect(132, 50, 0.5, 30);
rect(144, 50, 0.5, 30);
rect(156, 50, 0.5, 30); // orange
rect(200, 50, 0.5, 30);
popMatrix();
}
void drawLeftWiperA()
{
pushMatrix();
translate(315, 0);
rotate(radians(wiperAngle));
fill(#FACA08);
rect(-12, 300, 3, 40);
rect(-50, 320, 1, 40);
popMatrix();
}
void drawRightWiperA()
{
pushMatrix();
translate(325, 0);
rotate(radians(-wiperAngle));
fill(#AF7619);
rect(0, 0, 1, 60);
rect(10, 0, 1, 60); // mustard
  rect(15, 0, 2, 60); 
  popMatrix();
}
void rightSpreadA()
{
  pushMatrix(); 
  translate(180, 0); 
  rotate(radians(spreadAngle)); 
fill(#ABD6B2); 
rect(0, 50, 200, 700); 
  popMatrix();
}
void mouseClicked() {
centroX = mouseX;
centroY = mouseY;
}
void keyReleased(){
  if (key == '1' || key == '1') background(0);
  if (key == 's' || key == 'S') saveFrame("smile-###.png");
  }
 void keyPressed() {
  if (key == '6' || key == '6') background(img);  
  if (key == '2' || key == '2') background(235);
  if (key == '3' || key == '3') background(#FC530F);
  if (key == '4' || key == '4') background(#0F9FFC);
  if (key == '5' || key == '5') background(#226705);
 }



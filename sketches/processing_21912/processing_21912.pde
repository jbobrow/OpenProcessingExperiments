
/*
colorful shiny screen
Made by Maryam Mohammadishalmani on February 16th,2011; update February 27th,2011
To interact,left click and right click and drag,
press 'e' or 'E' to erase
www.openprocessing.org/portal/?userID=9731
*/

int triX=-10;
int triY=-20;
int tri2X=-10;
int tri2Y=-20;
int xx;
int trans=80;
int aa=(triX+30);
//--------------------
void setup()
{
 smooth();
 size (960,640);
 background(0);
 frameRate(200);//Specifies the 200 of frames to be displayed every second,for disappearing the lines slowly.
  }
//--------------
void draw()
{
 if(mouseButton == LEFT)
   SS();
   bg();
   translate(mouseX,mouseY);//The system variable mouseX/mouseY contains the current horizontal/vertical coordinate of the mouse.
   rotate(radians(sin(frameCount)*360)); //rotate big rects
 if(frameCount%8==0)
  {
   fill(random(255),random(255),random(255),10);
   rect(0,0,width,height);
  }
//------clear bottom------
 if(keyPressed == true ){
 if(key == 'e' | key == 'E'){
   background (0);
  }
 }
}  
//-----small eliipses----
void ellipse ()
{
 int T1 = (mouseY);
 int a = T1; //----ellipse----
 float n = dist(width/3,height/4,mouseX,mouseY/4);//set of float prop.
 noFill();
 stroke(random(255),random( 255),random(255));//colore
 ellipse(mouseX/16, mouseY/16, n/18, n/18);//position
}
//--------------
void mouseDragged()
{
 ellipse();
 }
 //--------Heart---------
void mouseClicked()
{ 
  
 if(mouseButton == RIGHT ){
   
   PImage heart = loadImage("heart1.png");                  
   tint(random(255),random(255),random(255));
   image(heart,random(mouseX),random(mouseY));
 }
}

//--------------
void SS() {
  noStroke();
  xx+=1;
  pushMatrix(); 
  
  translate(470, 320); 
   /////line/////
  if(xx>30) { 
    float s=map(second(),0,60,0,PI)-HALF_PI;
    rotate(s);
    fill(random(255),random(255),100,trans);
    triangle(triX,triY,aa-=3,triY,(triX+275),(triY-20));
    xx=0;
           }
   popMatrix();
}
//-------------
void bg() {
 
  for (int k = 0; k < width; k+=70) {
   for (int l = 0; l< height+200; l+=70) {
       noStroke();
       fill(random(255),random(255),random(255),random(255));//small rect color
       ellipse(k,l,5,5);
  }
 }
}





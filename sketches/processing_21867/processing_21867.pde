
int triX=-10;
int triY=-20;
int tri2X=-10;
int tri2Y=-20;
int xx;
int trans=80;
int aa=(triX+30);

//-----flower----
 float val;
 float col;
//---------------
boolean firstTime = true;
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
 stroke(random(255),random( 255),random(255));
 ellipse(mouseX/16, mouseY/16, n/18, n/18);
}
//--------------
void disegnaEllipse( float angolo, float lunghezza )
{
 pushMatrix();
 
  //rotate(radians(random(190)));
  stroke(100+sin(frameCount)*random(205),50+sin(frameCount*2*PI/3)*random(170),20+sin(frameCount*PI)*random(235));
  strokeWeight(0.75);
  stroke(random(255),random( 255),random(255));
  line( 0,0, lunghezza,0 );
  
 popMatrix();
}
//-------------
void mouseDragged()
{
 ellipse();
 }
 //-------------
void mouseClicked()
{ 
  pushMatrix(); 
  
 if(mouseButton == RIGHT ){
   fill (255, 10);
   rect (0, 0, 400, 400);
   stroke (col, 255, 255);
   if (col > 255) col = 0;
   else col ++;
   float nX = map (sin(radians(val)), -1, 1, 0, 40);
   val += 5;
   bezier (200, 0, nX, 200, 400-nX, 200, 200, 40);
   stroke (random(256) *col, random(255), random(255));
   bezier (0, 200, 200, 400-nX, 200, nX, width/8, 200);
   
  popMatrix();
 }
}

//--------------
void SS() {
  noStroke();
  xx+=1;
  pushMatrix(); 
  
  translate(470, 320); 
   /////second/////
  if(xx>30) { 
    float s=map(second(),0,60,0,TWO_PI)-HALF_PI;
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





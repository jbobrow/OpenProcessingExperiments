
//bild reinbauen: sketch, add file
float counter;


PImage hg;
PImage hg3;
PImage spirale1;
PImage spirale2;
PImage mund1;
PImage mund2;
PImage vogel1;
PImage vogel2;
PImage vogel3;


void setup(){
  size(400,400);
noCursor();

 counter=0.0;
  
  
 

  spirale1=loadImage("3.png");
  spirale2 = loadImage("3.png");
 
 
  hg = loadImage("hg2.jpg");
  hg3 = loadImage("hg3.jpg");
  
  mund1 = loadImage("mund1.png");
  mund2 = loadImage("mund2.png");
  vogel1 = loadImage("vogel1.png");
  vogel2 = loadImage("vogel2.png");
  vogel3 = loadImage("vogel4.png");
}

void draw(){
  
  image(hg,0,0,width,height);
  
//mouse pressed
 if(mousePressed){
 
 image(hg3,0,0,width,height);
 tint(233,255,5);
 image(mund1, 185, 280, 40, 40);
 
 
 }else{
   noTint();
 image(mund2, 185, 280, 40, 40);
 }
 
 image(vogel1, mouseX, mouseY, 40, 40);
 image(vogel3, mouseX+30, mouseY+30, 20, 20);
 image(vogel2, mouseX-50, mouseY-50, 20, 20);
  
 
{

 translate(180,180);
 rotate(counter*TWO_PI/360);
 image(spirale1,mouseX, mouseY, mouseX-50,mouseY-50);
 
 }
 
 {
 counter--;
 translate(100,100);
 rotate(counter*TWO_PI/360);
 image(spirale1,mouseX, mouseY, 15,20);
 
 }
  {
 counter--;
 translate(120,100);
 rotate(counter*TWO_PI/360);
 image(spirale1,mouseX, mouseY, mouseX-40,mouseY-40);
 
 }
   {
 counter--;
 translate(120,120);
 rotate(counter*TWO_PI/360);
 image(spirale1,mouseX, mouseY, mouseX-30,mouseY-30);
 
 }
 
    {
 counter--;
 translate(220,280);
 rotate(counter*TWO_PI/360);
 image(spirale1,mouseX, mouseY, mouseX-50,mouseY-50);
 
 }
 
     {
 counter--;
 translate(10,10);
 rotate(counter*TWO_PI/360);
 image(spirale1,mouseX, mouseY, mouseX-60,mouseY-60);
 
 }
   

  
}







 


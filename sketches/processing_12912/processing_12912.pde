
       
int a = 600;
int b = 350;
int c = 100;
float xpos;
float ypos;
float drag = 30;
PImage sydney;
void setup()
{
   size (a,b);
   smooth();
   sydney = loadImage("sydney.gif");
   image(sydney,0,0);
   xpos = width/2;
   ypos = height/2;


}
void draw ()
{
//background (80); 
//int mx = constrain (mouseX, 0 , width);
  //int my = constrain (mouseY,0, height);
  //translate( mx,my);
  //ellipse (a,b,8,8);
  
  ellipseMode(CENTER);
   ellipse (c,c,100,60);
   ellipseMode(CENTER);
   ellipse (c,c,90,50);
   
     ellipseMode(CENTER);
     ellipse (c-40,c-20,10,10);
   ellipseMode(CENTER);
   ellipse (c+300,c-50,100,60);
   ellipseMode(CENTER);
    ellipse (c+300,c-50,90,50);
   ellipseMode(CENTER);
   
   ellipse (c+250,c-50,10,10);
   ellipseMode(CENTER);
   ellipse (c-100,c+200,100,60);
   ellipseMode(CENTER);
   ellipse (c-100,c+200,90,50);
   
   ellipseMode(CENTER);
   ellipse (c+400,c-65,10,10);
   ellipseMode(CENTER);
   ellipse (c+100,c+100,100,60);
   ellipseMode(CENTER);
   ellipse (c+100,c+100,90,50);
   ellipseMode(CENTER);
   ellipse (c+400,c+90,10,10);
   ellipseMode(CENTER);
   ellipse (c+400,c-100,100,60);
   ellipseMode(CENTER);
   ellipse (c+400,c-100,90,50);
   ellipseMode(CENTER);
   ellipse (c+350,c+150,10,10);
   ellipseMode(CENTER);
   ellipse (c+450,c+80,100,60);
   ellipseMode(CENTER);
   ellipse (c+450,c+80,90,50);
      ellipseMode(CENTER);
   ellipse (c+200,c+165,10,10);
   ellipseMode(CENTER);
   ellipse (c+400,c+150,100,60);
   ellipseMode(CENTER);
   ellipse (c+400,c+150,90,50);
   ellipseMode(CENTER);
   ellipse (c+250,c+230,10,10);
   ellipseMode(CENTER);
   ellipse (c+300,c+250,100,60);
   ellipseMode(CENTER);
   ellipse (c+300,c+250,90,50);
ellipseMode(CENTER);
   ellipse (c-90,c+230,10,10);
   ellipseMode(CENTER);
   ellipse (c+250,c+150,100,60);
   ellipseMode(CENTER);
   ellipse (c+250,c+150,90,50);
   ellipseMode(CENTER);
   ellipse (c+100,c+70,10,10);
   noFill();
    int mx = constrain (mouseX, -100 , width);
  int my = constrain (mouseY,-100, height);
  translate( mx,my);
  line (0,0,100,-60);
  
  line (0,0,60,-50);
  line (0,0,60,50);
  line (0,00,100,60);
  
  
  
}               

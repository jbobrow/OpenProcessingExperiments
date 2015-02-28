
//midterm MALVEAR
PImage process;
PImage digestion;

float x= 1.5;
float y=400.0;
float z=1.1;

//setup for button 1
boolean onbutton=false;
int buttonx=370;
int buttony=350;
int buttonw=70;
int buttonh=30;


//setup for button 2
boolean onbutton2=false;
int buttonx2=370;
int buttony2=400;
int buttonw2=70;
int buttonh2=30;

//setup for button 3
boolean onbutton3=false;
int buttonx3=370;
int buttony3=450;
int buttonw3=70;
int buttonh3=30;
float mango;
float ala;
float ala2;
float pelo;
float mar;
float arena;
Circle quad1;
float mover=1;
float mueve=.2;





void setup (){
  size(800,700);
  //background(255);
  process = loadImage("process.gif");
  digestion = loadImage("digestion.gif");
   quad1 = new Circle(300,300);
}


void draw(){
//background(255);
//fill(255);
stroke(255);
  rect(0,0,400,800);
  rect(10,10,390,790);
  
  rect(400,0,700,800);
  rect(410,10,375,700);
  update(mouseX,mouseY);
  //fill(0,0,245);
  rectMode(CORNER);
  fill(0);
  
  stroke(random(255));
  rect(buttonx,buttony,buttonw,buttonh);
  rect(buttonx2,buttony2,buttonw2,buttonh2);
  rect(buttonx3,buttony3,buttonw3,buttonh3);
  
  //trig
    //background(random(255));
  float ala = pelo* cos(radians(mango));
  float  ala2= pelo* sin(radians(mango))*cos(radians(mango/10))*sin(radians(500-mango));
   
    
    image(process,pelo+100,pelo+0);
    pushMatrix();
    translate(100,y);
    image(digestion,mar*2,pelo+100);
    popMatrix();
    
    

 
 
 

 
stroke(random(255),random(300));
 
ellipse(ala+100,ala2+500,2,2);
  point(ala+700,ala2+100);
 
  mango+=5;
  ala+=100;
  ala2+=.2;
  pelo+=.1;
 
   
 
   
  mar+=.4;
  arena+=3;
  
  //objects
     quad1.moveC();
  quad1.display();
 
 
  }class Circle{
  float x,y,growx,growy;
  Circle(float _x, float _y){
  x=_x;
  y=_y;
  growx=2;
  growy=.10;
  
}

void moveC(){
  x+=growx;
  y+=growy;
  
}
void display(){
  fill(random(255),random(20),random(0));
  quad(x,y,x*200,y*100,90,90,47.7,4.6);
  fill(random(400));
  quad(20,20,x*2,y*4,78,54,28,71);
  
}
}

  
void mousePressed()
{
  
  //when translate pressed
 if(onbutton)
 {
   
   
  drawTranslate();
  
  }
  
  
  //when loco 2 is pressed
   else if(onbutton2)
 {

drawLoco();  
  }
  
  //when button 3 is pressed
  else if(onbutton3)
  {
encounters();    
  }
  
  
  

   
 }
 
 
 void update(int x, int y)
 {
      
   
   if (mousePressed(buttonx,buttony,buttonw,buttonh))
       {
             onbutton=true;
       } 
 else if (mousePressed(buttonx2,buttony2,buttonw2,buttonh2))
       {
             onbutton2=true;
       } 
 else if (mousePressed(buttonx3,buttony3,buttonw3,buttonh3))
       {
             onbutton3=true;
       } 
 
       else
       {
             onbutton=false;
             onbutton2=false;
             onbutton3=false;
       }
 
   
 }
 
 
 
 boolean mousePressed(int x, int y, int width, int height)
 {
      if(mouseX>=x && mouseX<=x+width && mouseY>=y && mouseY<=y+height)
      {
           return true;
       }
      else 
      {
           return false; 
      }
 
  
 }
 

void drawTranslate()
  {
  
  for(int x = 0; x < 100; x ++){
    for(int y = 1; y < 100; y ++){
      
      fill(random(20),random(255),random(98));
      
   //line (x+100,y+100, 30,50);
     
  
   // rect(x,y ,100,5);
          fill(random(20),random(255),random(98));

  ellipse(x*10,y*10,5,5);
  //fill(0);
//line(mouseX=2,mouseY+2,mouseX/2,mouseY/1);
    } 
  }
   
  } 
  void drawLoco()
  {
    for(int x = 0; x < 100; x ++){
    for(int y = 1; y < 100; y ++){
    fill(random(255));
    noStroke();
    
   rect(x*20,y*10,10,10); 
   point(x*100,y*100);
   
  } 
    }
  }
   
   
   void encounters()
   {
     
  
if(mousePressed = true)
{

background(random(255));
fill(200,y,z,100);
rect(mouseX,mouseY,30,50);
fill(0,200,199);
triangle(mouseX/30,mouseY/50,mouseX+x,mouseY-y,mouseX/z,mouseY+y);
x=x+.2;
y=y-.5;
z=z+.2;



fill(x,20,130);
ellipse(mouseX+mouseY,mouseY+mouseY,30,20);


 stroke(x,y,z);
  line(mouseX+x,mouseY/z,mouseX,mouseY);



} 

else
{
x=0;
y=256;
z=0;
}  
   
  
}

   
 
  


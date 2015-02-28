
//homework4 MALVEAR

float x=0.0;
float y=256.0;
float z=0.0;

//setup for button 1
boolean onbutton=false;
int buttonx=500;
int buttony=500;
int buttonw=30;
int buttonh=30;


//setup for button 2
boolean onbutton2=false;
int buttonx2=400;
int buttony2=500;
int buttonw2=30;
int buttonh2=30;

//setup for button 3
boolean onbutton3=false;
int buttonx3=300;
int buttony3=500;
int buttonw3=30;
int buttonh3=30;




void setup (){
  size(600,600);
  background(255);
}


void draw(){
  
  update(mouseX,mouseY);
  fill(0,0,245);
  rectMode(CORNER);
  rect(buttonx,buttony,buttonw,buttonh);
  rect(buttonx2,buttony2,buttonw2,buttonh2);
  rect(buttonx3,buttony3,buttonw3,buttonh3);
  
}




void mousePressed()
{
  
  //when button1 is pressed
 if(onbutton)
 {
   
   
  drawLoop();
  
  }
  
  
  //when button 2 is pressed
   else if(onbutton2)
 {

drawCircle();  
  }
  
  //when button 3 is pressed
  else if(onbutton3)
  {
encounters();    
  }
  
  
  

   
 }
 
 
 void update(int x, int y)
 {
      
   
   if (overButton(buttonx,buttony,buttonw,buttonh))
       {
             onbutton=true;
       } 
 else if (overButton(buttonx2,buttony2,buttonw2,buttonh2))
       {
             onbutton2=true;
       } 
 else if (overButton(buttonx3,buttony3,buttonw3,buttonh3))
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
 
 
 
 boolean overButton(int x, int y, int width, int height)
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
 

void drawLoop()
  {
  
  for(int x = 0; x < 100; x ++){
    for(int y = 1; y < 100; y ++){
       
      fill(random(300));
      noStroke();
 
      quad(300,100,x+2,y+2,x+2,y+2,y+5,100);   
  fill(random(100));
      quad(500,400,x+1,y+2,x+2,y+2,y+1,100);       
  
    rect(x*10,y*100,100,5);
  ellipse(x*10,y*10,5,5);
  fill(0);
line(mouseX=2,mouseY+2,mouseX/2,mouseY/1);
    } 
  }
   
  } 
  void drawCircle()
  {
    for(int x = 0; x < 100; x ++){
    for(int y = 1; y < 100; y ++){
    
    fill(random(30));
   ellipse (random(600),random(600),random(20),random(20));
   //quad(300,100,x*2,y*2,x*2,y*2,y*5,100);   
   
  } 
    }
  }
   
   
   void encounters()
   {
     
  
if(x<256 & y>0 & z<256)
{

background(37);
fill(200,y,z,100);
rect(mouseX,mouseY,30,50);
fill(0,200,199,100);
triangle(mouseX/30,mouseY/50,mouseX+x,mouseY-y,mouseX/z,mouseY+y);
x=x+.2;
y=y-.5;
z=z+.2;

fill(y,z,x);

quad(0,0,mouseX-z,mouseY/z,mouseX+y,mouseY+x,mouseX/z,mouseY-y);

fill(0,10,z,35);
quad(600,0,mouseX+y,mouseY-x,mouseX/3,mouseY-z,mouseX/z,mouseY+x);

fill(199,y,200,118);
quad(0,600,mouseX/x,mouseY*z,mouseX+y,mouseY-x,mouseX-y,mouseY/2);


fill(x,20,130,255);
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

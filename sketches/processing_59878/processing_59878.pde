
// **Created by Aparna J. Nambiar
//Displays a wave tower

int startX,startY,endX;
int endY,endY_up;
int ampY=25;
float ampX=0.25;
int horzShift=0;
int vertShift=100; //=200 for the other version
int counter=0;
int linColor=0;
int colorCounter=0;
int direction=1;
void setup()
{
  //initialize the screen
  frameRate(60);
  screenWidth=800;
  screenHeight=500;
  size(screenWidth, screenHeight);
  background(255);
  smooth();
 }

void draw(){
  
  background(255);
  horzShift+=5;

 for(int i=1;i<=screenWidth;i+=5){
    if(counter>5&&endY== ((int)(screenHeight-vertShift))-1){
      print("inside");
       counter =0;
//      println(((int)(screenHeight-vertShift))+","+endY);
      ampY=(int)random(15,100);
      colorCounter+=10*direction;print(linColor);
       if(colorCounter==250){
        direction=-1;
       }
       if(colorCounter==0){
        direction=+1;
       }
       
      linColor=colorCounter;      
    }
   counter++;
   startX=i;
   startY=screenHeight;
   endX=startX;
   endY=(int) (screenHeight-((ampY*sin(ampX*(startX-horzShift)/(2*PI)))+vertShift));  
   endY_up=(int)((ampY*sin(ampX*(startX-horzShift)/(2*PI)))+vertShift);
   strokeWeight(3);
   stroke(linColor,linColor,linColor);
   line(startX, startY, endX, endY);
   line(startX,0,endX,endY_up);

 }
 counter =0;
 delay(300); 
}


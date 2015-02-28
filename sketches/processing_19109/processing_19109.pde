
/*
Interactive Minsky Plot, by Line C. Fibdork in 2011.
Uses the ControlP5 library, as well as a good bit of computing power.
*/

import processing.core.PApplet; //Appease Java

import controlP5.*;
 ControlP5 controlP5;
 Textlabel computeStatus;

int xSize=640;
int ySize=480;
int[][] periods = new int[xSize][ySize];
int maximum=-1;
int result;
boolean drawing=false;
double givend=1.0;
double givene=1.381966011250105;
int maxSteps=1000000;
int xSize2=xSize/2;
int ySize2=ySize/2;

int xPosition=0;
// double Delta=
//Just to remind you, this code is ©2011 Line C. Fibdork under the GNU Lesser General  License. Not ControlP5, that's ©2010 Andreas Schlegel 
 void setup(){

  background(0);
  noStroke();
  size(640,590);
  //print(periods[0][0]+"\n");
  controlP5=new ControlP5(this);
  controlP5.addSlider("Delta",0,2,1.381966011250105,80,ySize+20,xSize-130,20);
  Slider s1=(Slider)controlP5.controller("Delta");
  //s1.setNumberOfTickMarks(201);
  controlP5.addSlider("Epsilon",0,2,1.0,80,ySize+60,xSize-130,20);
  Slider s2=(Slider)controlP5.controller("Epsilon");
  //s2.setNumberOfTickMarks(201);
  controlP5.addButton("Redraw",10,20,ySize+20,40,60);
  //Button go=(Button)controlP5.controller("Redraw");
  computeStatus=controlP5.addTextlabel("label","Coded by Line C. Fibdork",20,ySize+90);
  //controlP5.addSlider("Epsilon",0,2,1.0,80,ySize+60,xSize-130,20);
  //Slider s2=(Slider)controlP5.controller("Epsilon");
}
void draw(){
if(drawing){
  //Start the arduous process of drawing a line, then updating.



      for(int j=0;j<ySize;j++){
        //Make the line
        if(periods[xPosition][j]==0){
        result=MinskyPoint(xPosition-xSize2,j-ySize2,givend,givene,maxSteps);
        if(result>maximum){
          maximum=result;
          print("New maximum at point"+(xPosition-xSize2)+","+(j-xSize2)+": Period: "+result+"\n");
        }
        
        periods[xPosition][j]=result;
        }
        
      }
      //TODO:Progress bar
      print(xPosition+"\n");
      //controlP5.controller("label").setValueLabel("Work,darn you!");
      xPosition++;
      if(xPosition==639){
         fill(0,0,0);
    rect(20,ySize+90,xSize-20,10);
    fill(255);
        controlP5.controller("label").setValueLabel("Drawing image..."); //This is a lie. It draws another line.
      }
      //Progress bar
      fill(0,100,128);
      rect(121,221,floor((398*xPosition)/640),38);
      if(xPosition==640){
    
    //Render the image
    double LogMax=log(maximum); 
    for(int i=0;i<xSize;i++){
      for(int j=0;j<ySize;j++){

        result=(int)(16777216*(log(periods[i][j])/LogMax));
        //result=(int)((16777216*((double)periods[i][j]))/maximum);
        //fill(resut%256,2*(result%128),4*(result%64));
        fill(result%256,((result/256)%256),result/65536);
        rect(i,ySize-j,1,1);
      }
    }


    //save("MinskyPlot_d="+givend+"_e="+givene+"_"+xSize+"x"+ySize+"_maxSteps="+maxSteps+".png");
    //print("\nSaved picture. \nMaximum encountered: "+maximum);
    fill(0,0,0);
    rect(20,ySize+90,xSize-20,10);
    fill(255);
    controlP5.controller("label").setValueLabel("Delta="+givend+", Epsilon="+givene+", Steps at most="+maxSteps+", Highest period found="+maximum);
    drawing=false;
      }
}
    
  
}


/*void drawPoints(){
  
}*/


 int MinskyPoint(int x,int y,double d, double e,int steps){
  int iterator=0;
  int x0=x;
  int y0=y;
  int[]temp=new int[2];
  ArrayList pointsVisited=new ArrayList();
  while((iterator++)<steps){
    if(((x<xSize2)&&(x>=-xSize2))&&((y<ySize2)&&(y>=-ySize2))){
    temp[0]=x;temp[1]=y;
    pointsVisited.add(temp);
    }
    x =x-(int)Math.floor(y*d);
    y =y+(int)Math.floor(x*e);
    if((x==x0)&&(y==y0)){
      break;
    }
  }
  for (int i = pointsVisited.size()-1; i >= 0; i--) {
   temp= ((int[])pointsVisited.get(i));
    periods[temp[0]+xSize2][temp[1]+ySize2]=iterator;
  }
  return iterator;
}

 void Delta(float d) {
  givend=d;
}

 void Epsilon(float e) {
  givene=e;
}

 void Redraw(float value){
  fill(0,0,0);
    rect(20,ySize+90,xSize-20,10);
    fill(255);
  controlP5.controller("label").setValueLabel("Pease sit back. This may take several minutes to generate.");
    int maximum=-1;
  periods = new int[xSize][ySize];
    xPosition=0;
    //create progress bar
    fill(0,64,128,50);
    rect(120,220,400,40);
    fill(0,64,128);
    rect(121,221,398,38);
  drawing=true;
}


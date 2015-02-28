
PImage bg;
PImage[] mario=new PImage[40];

int numFrames=40;
int frame=0;
int x=212; //set the original place of Mario
int y=290;

void setup() {
 bg=loadImage("bg.gif");
  size(625,447);
  
 
 
 mario[0]=loadImage("1.gif");
 mario[1]=loadImage("2.gif");
 mario[2]=loadImage("3.gif");
 mario[3]=loadImage("4.gif");
 mario[4]=loadImage("5.gif");
 mario[5]=loadImage("6.gif");
 mario[6]=loadImage("7.gif"); 
 mario[7]=loadImage("8.gif"); 
 mario[8]=loadImage("9.gif"); 
 mario[9]=loadImage("10.gif"); 
 mario[10]=loadImage("11.gif"); 
 mario[11]=loadImage("12.gif"); 
 mario[12]=loadImage("13.gif"); 
 mario[13]=loadImage("14.gif"); 
 mario[14]=loadImage("15.gif"); 
 mario[15]=loadImage("16.gif"); 
 mario[16]=loadImage("17.gif"); 
 mario[17]=loadImage("18.gif"); 
 mario[18]=loadImage("19.gif"); 
 mario[19]=loadImage("20.gif"); 
 mario[20]=loadImage("21.gif"); 
 mario[21]=loadImage("22.gif"); 
 mario[22]=loadImage("23.gif"); 
 mario[23]=loadImage("24.gif"); 
 mario[24]=loadImage("25.gif"); 
 mario[25]=loadImage("26.gif"); 
 mario[26]=loadImage("27.gif"); 
 mario[27]=loadImage("28.gif"); 
 mario[28]=loadImage("29.gif"); 
 mario[29]=loadImage("30.gif"); 
 mario[30]=loadImage("31.gif"); 
 mario[31]=loadImage("32.gif"); 
 mario[32]=loadImage("33.gif"); 
 mario[33]=loadImage("34.gif"); 
 mario[34]=loadImage("35.gif"); 
 mario[35]=loadImage("36.gif"); 
 mario[36]=loadImage("37.gif"); 
 mario[37]=loadImage("38.gif"); 
 mario[38]=loadImage("39.gif"); 
 mario[39]=loadImage("40.gif"); 

 
}
  

void draw() {
  background(bg);

  frame = (frame+1) % numFrames; 
    image(mario[(frame) % numFrames], x, y);
   
}


void keyPressed(){  //Mario will move if arrow keys are pressed
  if(keyCode==UP){  
    y-=10;
  }else if(keyCode==DOWN){
    y+=10;
  }else if(keyCode==LEFT){
    x-=10;
  }else if(keyCode==RIGHT){
    x+=10;
  }
}





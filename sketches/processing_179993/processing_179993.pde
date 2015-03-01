
int eSize; 
int x, y;  
int a;
PImage img;
byte brushMode=0;
byte brushColor=0;

/*setup------------------------------------*/
void setup() {
  size(400, 400);
  noStroke();
  smooth();
  fill(255);
  background(255);
  textSize(10);
  
    eSize = 7; 
    x = width/2;
    y = height/2;
}

/*draw-------------------------------------*/
void draw() {
  /*brushMode--------------------------*/  
    /*rect--------------------------*/
     if(brushMode==0){
      noFill();
      rectMode(CENTER);
      rect(mouseX,mouseY,eSize,eSize);  
     }
    /*ellipse-----------------------*/
     else if(brushMode==1){
      noFill();
      ellipse(mouseX,mouseY,eSize,eSize);
     }
    /*rectblack---------------------*/
     else if(brushMode==2){
      rectMode(CENTER);
      rect(mouseX,mouseY,eSize,eSize);
      fill(0);
     }
    /*ellipseblack------------------*/
     else if(brushMode==3){
      ellipse(mouseX,mouseY,eSize,eSize);
      fill(0);
     }
    /*triangle----------------------*/
     else if(brushMode==4){
      stroke(0);
      noFill();
      triangle(mouseX,mouseY,mouseX-50,mouseY+100,mouseX+50,mouseY+100);
     }
    /*triangleblack-----------------*/
     else if(brushMode==5){
      triangle(mouseX,mouseY,mouseX-50,mouseY+100,mouseX+50,mouseY+100);
      fill(0);
     }
    /*line--------------------------*/
     else if(brushMode==6){
      rectMode(CENTER);
      rect(mouseX,mouseY,1000,0);
     }
    /*line2------------------------*/
     else if(brushMode==7){
      rectMode(CENTER);
      rect(mouseX,mouseY,0,1000);
     }
    /*eraser------------------------*/
     else if(brushMode==8){
      noStroke();
      fill(255);
      rectMode(CENTER);
      rect(mouseX,mouseY,30,30);
     }
     
  /*image------------------------------*/
    {
    img=loadImage("googlepro3.png");
    image(img,0,0);
    }
  /*graph------------------------------*/
    /*cross-------------------------*/
      {
      stroke(0);
      strokeWeight(1);
      line(195,5,205,15);
      line(205,5,195,15);
    /*rect--------------------------*/
      noFill();
      rectMode(CENTER);
      rect(105,10,10,10);
    /*rectblack---------------------*/
      fill(0);
      rect(10,10,10,10);
    /*ellipse-----------------------*/
      noFill();
      ellipse(295,10,10,10);  
    /*ellipseblack------------------*/
      fill(0);
      ellipse(390,10,10,10);
    /*eraser------------------------*/
      noFill();
      rectMode(CENTER);
      rect(200,390,10,10);
      rect(200,392,10,7);
    /*triangle----------------------*/
      noFill();
      triangle(105,385,100,395,110,395);
    /*triangleblack-----------------*/
      fill(0);
      triangle(10,385,5,395,15,395);
    /*line--------------------------*/
      line(295,385,295,395);
    /*line2------------------------*/
      line(385,390,395,390);    
      }
}
/*mouseClicked-----------------------------*/
void mouseClicked(){
    /*cross-------------------------*/
      if(mouseX>=195 && mouseX<=205 && mouseY>=5 && mouseY<=15){
      size(400,400);
      background(255);
      fill(0);
      }
    /*rect--------------------------*/ 
      if(mouseX>=100 && mouseX<=110 && mouseY>=5 && mouseY<=15){
      brushMode=0;
      }
    /*rectblack---------------------*/   
      if(mouseX>=5 && mouseX<=10 && mouseY>=5 && mouseY<=15){
      brushMode=2;
      }
    /*ellipse-----------------------*/
      if(mouseX>=290 && mouseX<=300 && mouseY>=5 && mouseY<=15){
      brushMode=1;
      }
    /*ellipseblack------------------*/
      if(mouseX>=390 && mouseX<=400 && mouseY>=5 && mouseY<=15){
      brushMode=3;
      }
    /*eraser------------------------*/
      if(mouseX>=195 && mouseX<=205 && mouseY>=385 && mouseY<=395){
      brushMode=8;
      }
    /*triangle----------------------*/
      if(mouseX>=95 && mouseX<=105 && mouseY>=385 && mouseY<=395){
      brushMode=4;
      }
    /*triangleblack-----------------*/
      if(mouseX>=5 && mouseX<=10 && mouseY>=385 && mouseY<=395){
      brushMode=5;
      }
    /*line--------------------------*/
      if(mouseX>=290 && mouseX<=300 && mouseY>=385 && mouseY<=395){
      brushMode=7;
      }
    /*line2-------------------------*/
      if(mouseX>=390 && mouseX<=400 && mouseY>=385 && mouseY<=395){
      brushMode=6;
      }
}
  
/*mousePressed-----------------------------*/
void mousePressed(){  
  eSize = 100;
  stroke(0);
  fill(255,0,0,0);
  }
  
/*mouseReleased----------------------------*/
void mouseReleased(){
  eSize=0;
  noStroke();
  fill(0);
}







//Aleksandra Lopatic, 18th january 2009, Built with processing

boolean off=false;
float linX,linY,rand,speedX,speedY;

void setup(){
  background(60,182,185);
  size(800,650);
  noLoop();
  smooth();
  linX=random(14,width-14);
  linY=random(10,height-10);
  rand=random(255);
  speedX=4.5;
  speedY=4;
 
}
void draw(){
// background(60,182,185);
  if (off){
     nestMove();
     displayNest2();
  }else{
    
    elDisplay(random(width),random(height),random(30),random(0,255));
    nestMove();
    displayNest1();
  }
}
void mousePressed(){
  loop();
  off=!off;
}
void nestMove(){
  //left up corner
    if(mouseX>=1&&mouseX<=width/2&&mouseY>=0&&mouseY<=height/2){

      linX=linX-speedX;
      linY=linY-speedY;


    }
    //right up corner
    if(mouseX>=width/2&&mouseX<=width&&mouseY>=0&&mouseY<=height/2){
      linX=linX+speedX;
      linY=linY-speedY;

    }
    //left down corner
    if(mouseX>=1&&mouseX<=width/2&&mouseY>=height/2&&mouseY<height){
      linY=linY+speedX;
      linX=linX-speedY;

    }
    //right down corner
    if(mouseX>width/2&&mouseX<width&&mouseY>=height/2&&mouseY<height){
      linX=linX+speedX;
      linY=linY+speedY;
    }
}
//black and white nest
void displayNest1(){
   for(float a=rand;a>0;a--){
      stroke(a);
      line(linX+random(80)-a,linY+random(rand)-a,linX+random(rand)+a,linY+random(50)-a);
    }
}
//color nest
void displayNest2(){
  for(float a=rand;a>0;a--){
   // float val=random();
      stroke(mouseX-a,mouseY/a,mouseX/a,mouseX);
      line(linX+random(80)-a,linY+random(rand)-a,linX+random(rand)+a,linY+random(50)-a);
    }
}
//gray rain
void elDisplay(float elX,float elY,float elSize,float elColor){


  noStroke();
  fill(random(elColor),random(elColor));
  ellipse(elX,elY,elSize,elSize);
}




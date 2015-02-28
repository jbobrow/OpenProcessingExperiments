
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/79907*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
int button = 0;
int cover = 0;
PImage bear01;
PImage bear02;
PImage careBear;
PImage orb;

float bear01x;
float bear01y;
float bear02x;
float bear02y;
float bear03x;
float bear03y;
float bear04x;
float bear04y;

int col=100;
int hold=col;
float radiusE=0;
int fade=0;
int yes=0;

void setup() {
   size(800,600);
   smooth();
   noStroke();
   //frameRate(60);
   background(0);
   bear01 = loadImage("bear01.gif");
   bear02 = loadImage("bear02.gif");
   orb = loadImage("orb.gif");
   careBear = loadImage("carebearmini.gif");
}


void mouseClicked() {
  if (mouseX>=0 && mouseX<=50 && mouseY>=height-50 && mouseY<=height){
    fill(0);
    rect(0,0,width,height);
    button =1;
    yes = 0;
  } else if (mouseX>=51 && mouseX<=100 && mouseY>=height-50 && mouseY<=height) {
    fill(0);
    rect(0,0,width,height);
    button = 2;
    yes = 0;
  } else if (mouseX>=101 && mouseX<=150 && mouseY>=height-50 && mouseY<=height) {
    button = 3;
    fill(0);
    rect(0,0,width,height);
  }
}
 
void mousePressed(){
  bear01x = mouseX-60;
  bear01y = mouseY-230;
  bear02x = mouseX-130;
  bear02y = mouseY-90;
  bear03x = mouseX-60;
  bear03y = mouseY+30;
  bear04x = mouseX+30;
  bear04y = mouseY-60;
  yes = 1;
}

void draw() {
  
  cover++;
  //if (mousePressed == true) {
    if((mouseX < 150 && mouseY < 550) || (mouseX>150)){
      switch(button) {
        case 1:
          if(mousePressed == true) {
          fill(255,0,0);
          ellipse(mouseX,mouseY,20,20);
          fill(0,2);
          rect(0,0,width,height);
          }
          break;
        
        case 2:
           
           fill(0,10);
            rect(0,0,width,height);
            if (mousePressed == true) {
            image(bear01,bear01x,bear01y);
            image(bear02,bear02x,bear02y);
            image(bear01,bear03x,bear03y);
            image(bear02,bear04x,bear04y);
            bear01x=bear01x+(15*round(random(-2,2)));
            bear01y+=15;
            bear02x+=15;
            bear02y=bear02y+(10*round(random(-2,2)));
            bear03x=bear03x+(15*round(random(-2,2)));
            bear03y-=15;
            bear04x-=15;
            bear04y=bear04y+(15*round(random(-2,2)));
            }
           break;
           
        
        case 3:
          fill(0);
          //rect(0,0,width,height);
          if (mousePressed == false) {
            fade=0;
            col=100;
            hold=col;
          }
          if (mousePressed == true) {
            if(yes==1)
              {
                fill(255);
                ellipse(mouseX,mouseY,hold,hold);
                fade+=5;
                if (col>0)
                { 
                  fill(0);
                  ellipse(mouseX,mouseY,col,col);
                  col-=5;
                }
              }
          }
       }  
       
    }
    
//    if (cover==10){
//       fill(0,10);
//       rect(0,0,width,height);
//       //rect(0,0,width,height);
//       cover=0;
//       }
      
      fill(255,0,0);
      ellipse(25,height-25,45,45);
      fill(0,255,0);
      image(careBear,50,height-50);
      fill(0,0,255);
      image(orb,100,height-50);
}



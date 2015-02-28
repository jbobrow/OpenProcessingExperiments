

int x;
int y;
int spiderx;
int spidery;
//int webColor;
int mode;

void setup(){
  size (600,600);
  background (255,120,20);
  smooth();
  
  x =0;
  y =0;
  spiderx=x;
  spidery=y;
  //webColor = color(255,255,255);
  mode=0;
}

void draw(){
  background(255,120,20);
//"page" one
switch (mode){
  case 0:
    background(0);
  fill (255,117,10);
  textSize(50);
  for (int y = 74; y <height; y +=110){
  text ("Happy Halloween", 100,y);
  }
  break;
  
  //"page" two
case 1: 
 //Web
  {    
  translate(-10,-10);
  for( int i = 0; i <360; i ++) {
  rotate(radians(9));
  line(0,0,0,1000);
  
  //curves
  stroke(255,255,255);
   noFill();
  beginShape();
  vertex(702,509);
  bezierVertex(607,437,545,545,600,600);
  endShape();
  
 beginShape();
 vertex(427,588);
 bezierVertex(385,526,458,458,520,520);
 endShape();
 
 beginShape();
 vertex(440,440);
 bezierVertex(397,397,437,316,515,374);
 endShape();
  
 beginShape();
vertex(421,305);
bezierVertex(384,270,324,324,370,370);
endShape();

beginShape();
vertex(364,265);
bezierVertex(325,220,268,274,314,314);
endShape();
  
beginShape();
vertex(255,255);
bezierVertex(214,214, 270,186,293,213);
endShape();

beginShape();
vertex(206,206);
bezierVertex(183,183,212,150,234,170);
endShape();

beginShape();
vertex(165,165);
bezierVertex(146,146,175,127,189,138);
endShape();

beginShape();
vertex(133,133);
bezierVertex(129,130,126,96,157,114);
endShape();

beginShape();
vertex(109,109);
bezierVertex(94,94,115,82,123,90);
endShape();

beginShape();
vertex(88,88);
bezierVertex(75,75,91,66, 99,72);
endShape();

beginShape();
vertex(68,68);
bezierVertex(59,59,71,51,77,56);
endShape();

beginShape();
vertex(52,52);
bezierVertex(44,44, 52,38, 58,43);
endShape();

beginShape();
vertex(42,42);
bezierVertex(35,35,43,29,49,35);
endShape();

beginShape();
vertex(33,33);
bezierVertex(30,30,36,24,39,28);
endShape();

beginShape();
vertex(25,25);
bezierVertex(21,20,23,16,29,20);
endShape();
  }

  //flies
  fill(0);
  noStroke();
  ellipse(163,159,10,20);
  ellipse(259,313,10,17);
  ellipse(300,47,18,9);
  ellipse(110,42, 19,11);
  ellipse(480,241,19,13);
  ellipse(35,234,15,9);
  ellipse(208,530,12,19);
 
   spider(spiderx,spidery);
    }
  }

}
//http://processing.org/reference/keyCode.html
void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      spidery +=-2;
     // y= y-2; 
    } else if (keyCode == DOWN) {
      spidery+=+2;
        
    }
    else if (keyCode == LEFT){
      spiderx +=-2;
    }
    else if (keyCode == RIGHT){
      spiderx+=2;
     }
   }
}

 //shape
  void spider (int x, int y){
fill(0);
  stroke(0);
  ellipse(x+400,y+500,28,30);
  ellipse(x+392,y+481,15,15);
  //connecting to thorax
  stroke(0);
  strokeWeight(1.5);
  line(x+372,y+481,x+389,y+489); 
  line(x+368,y+489,x+388,y+490);
  line(x+368,y+498,x+388,y+492);
  line(x+376,y+508,x+388,y+493);
  
  line(x+400,y+483,x+406,y+467);
  line(x+400,y+484,x+414,y+472);
  line(x+401,y+486,x+420,y+482);
  line(x+401,y+486,x+424,y+490);
  //to the legs
  line(x+371,y+481,x+366,y+494);
  line(x+368,y+489,x+367,y+503);
  line(x+368,y+498,x+371,y+512);
  line(x+376,y+508,x+382,y+520);
  
  line(x+406,y+467,x+417,y+470);
  line(x+414,y+472,x+426,y+480);
  line(x+420,y+482,x+431,y+495);
  line(x+424,y+490,x+428,y+506);
  }
    //to switch to spider page
  void mouseClicked(){
  mode++;
  if(mode > 0){
    mode = 1;
  } 
     //println("x: " + mouseX + " y: "+ mouseY);  
}    
   


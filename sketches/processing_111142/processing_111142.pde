
PImage img1;
PImage img2;
int x,y,colorRed;
void setup(){
 img1=loadImage("Cute-White-Flowers-640x360.jpg");
 img2=loadImage("flower 1.png");
 size(640,360);
 noStroke();
 colorRed=183;
}

void draw(){
  println(mouseX+" "+mouseY);
 
  x=mouseX;
  y=mouseY;
  
  //image(img1,0,0);
  
 
  
  if(dist(230,232,x,y)<=15 && mousePressed==false){
    fill(183,211,164);
 rect(0,0,width,height);
 tint(255,130);
  image(img2,0,0);
 }else if(dist(230,232,x,y)<=15 && mousePressed==true){
    image(img1,0,0);
  }else if(dist(230,232,x,y)>15 && dist(230,232,x,y)<=60 ) {
    fill(183,211,164);
 rect(0,0,width,height);
  //drawing a flower------------------------
  fill(60,131,13);
  beginShape();
 curveVertex(202,359);
 curveVertex(202,359);
 curveVertex(206,324);
 curveVertex(221,270);
 curveVertex(216,266);
 curveVertex(202,326);
 curveVertex(201,356);
 curveVertex(201,356);
 endShape(CLOSE);
  
 fill(colorRed,247,230);
  beginShape();
  curveVertex(171,266);
  curveVertex(171,263);
  curveVertex(179,266);
  curveVertex(216,245);
  curveVertex(203,278);
  curveVertex(208,294);
  curveVertex(230,285);
  curveVertex(235,250);
  curveVertex(280,282);
  curveVertex(289,268);
  curveVertex(307,252);
  curveVertex(251,240);
  curveVertex(308,232);
  curveVertex(272,222);
  curveVertex(306,199);
  curveVertex(267,209);
  curveVertex(281,184);
  curveVertex(247,206);
  curveVertex(255,170);
  curveVertex(247,165);
  curveVertex(240,197);
  curveVertex(224,166);
  curveVertex(210,165);
  curveVertex(216,197);
  curveVertex(191,174);
  curveVertex(197,209);
  curveVertex(173,193);
  curveVertex(169,199);
  curveVertex(193,214);
  curveVertex(160,221);
  curveVertex(156,233);
  curveVertex(191,236);
  curveVertex(176,249);
  curveVertex(171,263);
  curveVertex(171,263);
  endShape(CLOSE);
  
   fill(250,255,10);
  ellipse(230,232,35,30);
  //-----------------------------------------
  }else {
    
   fill(183,211,164);
 rect(0,0,width,height);
  //drawing a flower------------------------
  fill(60,131,13);
  beginShape();
 curveVertex(202,359);
 curveVertex(202,359);
 curveVertex(206,324);
 curveVertex(221,270);
 curveVertex(216,266);
 curveVertex(202,326);
 curveVertex(201,356);
 curveVertex(201,356);
 endShape(CLOSE);
  
 fill(247,247,230);
  beginShape();
  curveVertex(171,266);
  curveVertex(171,263);
  curveVertex(179,266);
  curveVertex(216,245);
  curveVertex(203,278);
  curveVertex(208,294);
  curveVertex(230,285);
  curveVertex(235,250);
  curveVertex(280,282);
  curveVertex(289,268);
  curveVertex(307,252);
  curveVertex(251,240);
  curveVertex(308,232);
  curveVertex(272,222);
  curveVertex(306,199);
  curveVertex(267,209);
  curveVertex(281,184);
  curveVertex(247,206);
  curveVertex(255,170);
  curveVertex(247,165);
  curveVertex(240,197);
  curveVertex(224,166);
  curveVertex(210,165);
  curveVertex(216,197);
  curveVertex(191,174);
  curveVertex(197,209);
  curveVertex(173,193);
  curveVertex(169,199);
  curveVertex(193,214);
  curveVertex(160,221);
  curveVertex(156,233);
  curveVertex(191,236);
  curveVertex(176,249);
  curveVertex(171,263);
  curveVertex(171,263);
  endShape(CLOSE);
  
   fill(250,255,10);
  ellipse(230,232,35,30);
  //-----------------------------------------   
  }  
  
  }
  
  
  void mouseMoved() {
  colorRed+= 5;
  if (colorRed > 255) {
    colorRed = 0;
  }
}



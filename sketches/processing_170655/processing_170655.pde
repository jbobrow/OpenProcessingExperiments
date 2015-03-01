
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/28069*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
/////////////////////////////////////////////////////////////////
/////////////       By Chirs Pitt - 01/05/2011      ///////////// 
/////////////////////////////////////////////////////////////////



PFont  myFont;
float distanceFrequency;
float distanceRotate;
int t = 7;
int u = 7;
void setup(){
  frameRate(40);
  noCursor();
  size(1000, 740);
  smooth(); 
myFont = createFont("Avenir", 32);
   textFont(myFont);

}

void renderTriangle(){
  stroke(0);
  fill(#1DFF0A);
  //triangle(0, 0, random(90), random(90), random(255), random(255));
  ellipse(0,0,t+3,u+3);
  ellipse(10,10,t,u);
  ellipse(20,20,t,u);
   ellipse(30,30,t,u);
    ellipse(40,40,t,u);
     ellipse(50,50,t,u);
       ellipse(60,60,t,u);
        ellipse(70,70,t,u);
         ellipse(80,80,t,u);
          ellipse(90,90,t,u);
           ellipse(100,100,t,u);
           ellipse(110,110,t,u);
           ellipse(120,120,t,u);
            ellipse(130,130,t,u);
            ellipse(140,140,t,u);
            ellipse(150,150,t,u);
             ellipse(160,160,t,u);
         ellipse(170,170,t,u);
       fill(#0AF5FF);
       ellipse(180,180,t-3,u-3);
           fill(#FEFF08);
         ellipse(190,190,t-3,u-3);
        fill(255,0,0);
        ellipse(200,200,t-5,u-5);
        fill(#5D0CF5);
           ellipse(210,210,t-3,u-3);
        fill(#0AF5FF);
         ellipse(220,210,t-3,u-3);
              
}

void draw() {
  stroke(0);
  
  fill(0,20);
  rect(0, 0, width, height);
  fill(255);
  rect(0,0,5,90);
  fill(255,0,0);
  rect(10,0,5,90);
  fill(#5D0CF5);
  rect(20,0,5,90);
  fill(#FEFF08);
  rect(30,0,5,90);
  fill(#08FFFD);
  rect(40,0,5,90);
    stroke(0);
    fill(#1DFF0A);
    rect(50,0,25,90);
    fill(56);
     rect(50,0,25,40);
       fill(111);
       text("Active", 900, 35);
         text("S.A.F.E©", 868, 720);
         text("Property of BTI®", 10, 720);
          fill(200);
          rect(290,42,470,2);
         fill(111);
         text("Active Authentication is running ", 300, 35);
  
  //distanceFrequency = dist(width/2, height/2, mouseX, mouseY) * 2 + 50;
  distanceRotate = dist(width/2, height/2, mouseX, mouseY)/1000 + 0.1 + distanceRotate;
  translate(width/2, height/2);
  rotate(distanceRotate/20);
  renderTriangle();


   

}



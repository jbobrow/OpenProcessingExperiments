
PImage mp;
int myX;
int myY;
float x;
float y;
float easing = 0.03;
float m=0;
float n=0;
float [] xPos = new float[0];
float [] yPos = new float[0];
float [] xVel = new float[0];
float [] yVel = new float[0];
float [] parSize = new float[0];
float gravity;
float ePosY = 350;
float ePosX = 635;
float ellipseD = 580;
int speed=10;int slider=11;
float mX;
float mY;
color color1;
color color2;




void setup() {
  size(900, 700); 
  noStroke();  
  mp =loadImage("winter.jpg");
}


void draw() { 
image(mp,0,0);
myX=mouseX;
myY=mouseY;
gravity = speed*0.0007;

  xPos = append(xPos, random(ePosX-600, ePosX+300));
  yPos = append(yPos, ePosY-300);
  xVel = append(xVel, random(-0.5, 0.5));
  yVel = append(yVel, random(-0.6, 0.6));
  parSize = append(parSize, random(2, slider));
 
  for (int i = 0; i<xPos.length;i++) {
    noStroke();
    fill(242,244,250);
    ellipse(xPos[i], yPos[i], parSize[i], parSize[i]);
    xPos[i]+=xVel[i];
    yPos[i]+=yVel[i];
    
    
   
  }
  
makeship();
makePenguin();

}



void makeship(){
   //legs
    fill(196,0,0);
    quad(290,490, 340,530, 320,600, 290,600);
    quad(510,490, 460,530, 485,600, 510,600);
    quad(380,540, 420,540, 410,570, 390,570);
    ellipse(300, 600, 50, 50);
    ellipse(500, 600, 50, 50);
    ellipse(400, 580, 40, 40);
 
    //body 
    fill(196,0,0);
    ellipse(400, 400, 300, 300);
 
    //wind shield
    fill(255,255,255);
    ellipse(400, 400, 250, 100);
    fill(42,160,221);
    ellipse(400, 400, 230, 90);
 
    //upper lights 
    fill(255,255,0);
    ellipse(310, 330, 40, 40);
    ellipse(490, 330, 40, 40);
    
    //---------
    fill(0,155,39);
    ellipse(350, 320, 20, 20);
    ellipse(450, 320, 20, 20);
    //---------
    
    fill(255,255,0);
    ellipse(375, 317, 20, 20);
    ellipse(425, 317, 20, 20);
    //----------
    fill(0,155,39);
    ellipse(400, 315, 20, 20);
     
    //roof
    fill(0,0,160);
    ellipse(400, 275, 150, 50);
    fill(80,68,155);
    ellipse(400, 260, 100, 40);
     
    //antenna
    strokeWeight(0);
    curve(410,190, 400,250, 410,190, 500,150);
    
    strokeWeight(0);
    fill(0,0,160);
    ellipse(410, 190, 20, 20);
 
    //nose
    strokeWeight(0);
    fill(111,101,79);
    ellipse(400, 500, 50, 50);
    fill(80,72,56);
    ellipse(400, 520, 20, 20);
    fill(0,0,0);
    ellipse(400, 520, 13, 13);
 
    //lower lights
    strokeWeight(0);
    fill(42,160,221);
    ellipse(330, 480, 55, 55);
    fill(42,160,221);
    ellipse(470, 480, 55, 55);
    fill(255,255,255);
    ellipse(330, 480, 50, 45);
    fill(255,255,255);
    ellipse(470, 480, 50, 45);
    fill(255,255,0);
    ellipse(330, 480, 40, 40);
    fill(255,255,0);
    ellipse(470, 480, 40, 40);
}

void makePenguin(){
noStroke();
fill(8,10,18);//black body
ellipse(myX, myY, 180, 210);
fill(255,255,255);//white
ellipse(myX,myY+50,90,100);//belly
ellipse(myX-30,myY-50,54,50);//left eye
ellipse(myX+30,myY-50,54,42);//right eye
fill(0);//black
float w=random(2);
ellipse(myX-20,myY-50,30*1.3,30*w);//left eye2
ellipse(myX+20,myY-50,30,30);//right eye2
fill(192,109,240);//purple
rect(myX-15,myY+4,27,27);//tie
rect(myX-10,myY+10,17,83);//tie 2
fill(241,241,43);//yellow
ellipse(myX-70,myY+100,80,20);//left feet
ellipse(myX+70,myY+100,80,20);//right feet
triangle (myX-20,myY-30,myX+20,myY-30,myX,myY-10);
fill(0);//black
float e=random(1.3);
triangle(myX-180*e,myY-50*e,myX-80,myY-30,myX-90,myY+30);//left wing
triangle(myX+70,myY-50,myX+170*e,myY-100*e,myX+90,myY+20);//right wing  
}




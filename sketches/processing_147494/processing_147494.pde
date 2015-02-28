

import processing.serial.*;

Serial myPort;  // Create object from Serial classbuffer
String sdata,sdata2[];
String serialPorts;
float angle=0.0;
float offset=60;
float scalar=30;
float speed=0.5;
float fc1, fc2; // global variables used by all vertices for their dynamic movement
int numRects=20;
float[] alphaR1Center=new float[2]; //x,y coords
float[] alphaR2Center=new float[2]; //x,y coords
int numColors=numRects;
int numEllipses=20;//200

color[] colors = new color[numColors]; // array to store a selection of random colors
color[] colors1 = new color[numColors]; // array to store a selection of random colors
color[] colors2 = new color[numColors]; // array to store a selection of random colors
color[] colorsexplosion = new color[numColors]; // array to store a selection of random colors
color[] alphaColor = new color[numColors]; // array to store a selection of random colors
float rectw=20;float recth=20;
int alphaRect;float alphax; float alphay; 
int alphaRect2;float alphax2; float alphay2; //to track alpha rectangle
int alphaRect3;float alphax3; float alphay3; //to track alpha rectangle
int alphaRect4;float alphax4; float alphay4; //to track alpha rectangle

float camangle=.1; float camangleZ=.1;
rectangles[] rs=new rectangles[numRects];
rectangles[] rs2=new rectangles[numRects];
rectangles[] rs3=new rectangles[numRects];
rectangles[] rs4=new rectangles[numRects];
ellipses[] eps=new ellipses[numEllipses];
float ellipseSpeed=0;
int numEllipsesRh=5;
ellipses[] epsRh= new ellipses[numEllipsesRh];
float ellipses2RhSpeed=0.3; float countIncreaseSize=0;
//color ballColor=color(180,200,208); //default
//color ballColor=color(161,188,209);
color ballColor=color(23,146,168);
//for rhombus
String direction="None";
rhombus[] rhs=new rhombus[1];
boolean rhombusCollide=false;
float colTime=0;
float rhAcceleration=1;
color rhcolor=color(0,0,0);
int rhStrokeW=1;
float[] rhxy2=new float[2]; //x,y coords
float[] rhxy4=new float[2]; //x,y coords
float ellipsesFactor=.1;
boolean keyup = false;
boolean keyright = false;
boolean keyleft = false;
boolean keydown = false;
float value,valx,valy,valz;
float brightness=10;
boolean brightnessCooldown=false; float maxDarkTime=350; //350 ms max, then cooldown to use it again 200 frameCount
float currentMillis; float waitTime=0;
boolean camControl=false;float cameraTime;
int gridW=1;

//explosion effect variables
ArrayList plist = new ArrayList();
int MAX = 100;
boolean start=false;
float starttime;

void setup(){
  size(800,600,P3D);
  smooth();
  println(width);
  println(height);
  PFont scoreFont=loadFont("scoreFont.vlw");
  textFont(scoreFont,12);

  
  //randomColors(colors1, 30,38, 108,115, 25,33);//for green    
  //randomColors(colors1, 0,24, 0,28, 0,32);  //cool dark colors
  randomColors(colors1, 29,40,71,90,132,160);  
  randomColors(colors1, 71,71,132,132,179,179); //for white backg

  //randomColors(colors1, 35,41, 100,112, 200,255);
  //randomColors(colors1, 0,round(random(250)), 0, round(random(250)), 0,round(random(250)));
  //randomColors(colors2, 40,44, 60,63, 70,75);
  randomColors(colors2, 180,186, 200,215, 200,208);//for white backg
  randomColors(colors2, 40,44, 60,63, 70,75);
  randomColors(colors, 0,44, 0,63, 0,75);
  //randomColors(colors,180,186, 200,215, 200,208); //for white backgr
  randomColors(colorsexplosion,100,186, 100,215, 100,208); //for white backgr
  randomColors(alphaColor,118,150, 124,124, 168,168); //for white backgr

  //noLoop();//to record video
  //Camera stuff
//camera(eyeX, eyeY, eyeZ, centerX, centerY, centerZ, upX, upY, upZ)
  //camera(70.0, 35.0, 120.0, 50.0, 50.0, 0.0, 
       //1.0, 0.0, 0.0);
  camera();
//  translate(50, 50, 0);
//  rotateX(-PI/6);
//  rotateY(PI/3);
  background(0);
  float r,r2;
  //triangles
  //create rectangles
  for(int i=0;i<numRects;i++)
  {
    rs[i]=new rectangles(random(width),random(height),50,50,i,rs);
    rs2[i]=new rectangles(random(width),random(height),25,25,i,rs2);
        rs3[i]=new rectangles(random(width),random(height),60.0,20.0,i,rs3);
        rs4[i]=new rectangles(random(width),random(height),60.0,20.0,i,rs4);
  }
  for(int i=0;i<numEllipses;i++){
    float t=random(10,20);
    eps[i]=new ellipses(random(width),random(height),t,t,i,eps);
  }
  for(int i=0;i<numEllipsesRh;i++){
    float t=random(10,20);
    epsRh[i]=new ellipses(random(width),random(height),t,t,i,epsRh);
  }
  
  //rhombus
  rhs[0]=new rhombus(38, 31, 86, 20, 69, 63, 30, 76,0,rhs);
  rhs[0].randomlyDisplay(rhs);
  
//  getSerialPorts();
//  String portName=myPort.list()[0];
//  myPort = new Serial(this, portName, 9600);
//  myPort.bufferUntil('\n');
  
  starttime=millis();
}

void draw(){
  float x=offset+cos(angle)*scalar;
  float y=offset+sin(angle)*scalar;
  camFun();    //camera control function
  if(brightness>230){
  //background(color(180,200,200)); //gray
  //background(color(20,20,20));
  background(10);

  }
  else if(brightness<15) {background(brightness);}
  grid(16);
  if(millis()-colTime<300)
   text("+500",rhs[0].x1,rhs[0].y1);

  

  if(start==true){
  showScore();
  scoretime=millis()-starttime;

  if(rhombusCollide==true)
  {
    
    for(int i = 0; i < plist.size(); i++) {
      Particle p = (Particle) plist.get(i); 
      //makes p a particle equivalent to ith particle in ArrayList
      p.run();
      p.update();
      p.gravity();
      }
  }
  else{  
  if (camControl==false){
    rotateX(camangle);  
    rotateY(camangle*.5);
    rotate(camangleZ);}
  else{
    rotateX(camangle+valx*.005);  
    rotateY(camangle*.5+valy*.005);
    rotate(camangleZ);}
  fc1 = frameCount*0.01;
  fc2 = frameCount*0.02;
  strokeWeight(1); 
  fill(200);
  strokeWeight(1);
  stroke(0);
  //noStroke();
   for(int i=0;i<numRects;i++)
  {
    fill(colors1[i]);
    //if(i%2==0){rs[i].move("left");rs2[i].move("up");}    //half rectangles go up half down
    //else{rs[i].move("right");rs2[i].move("down");}
    if(i%2==0){rs[i].move("left");rs2[i].move("up");rs3[i].move("diag1");;rs4[i].move("diag3");} //including diagonal rectangles
    else{rs[i].move("right");rs2[i].move("down");rs3[i].move("diag2");;rs4[i].move("diag4");}
    
    if(brightness!=0){
    rs[i].display();
    rs3[i].display();
    fill(colors2[i]);
    rs2[i].display();
    rs4[i].display();}
    rs[i].checkcollision(rs);
    //rs2[i].checkcollision(rs);
    rs2[i].checkcollision(rs2);
    rs[i].rectAlpha(rs2);
    rs3[i].checkcollision(rs4);
    rs4[i].checkcollision(rs3);


    
    alphaRect=rs[i].rectAlpha(rs);
    alphaRect2=rs2[i].rectAlpha(rs2);
    alphaRect3=rs3[i].rectAlpha(rs3);
    alphaRect4=rs4[i].rectAlpha(rs4);
    //println(i + " No collision");
    //rs2[i].display();
    
    //make rectangles grow
    //rs2[i].w+=1;rs2[i].h+=1;
    //rs[i].w+=1;rs[i].h+=1;
    
    
  }
  //to show ellipses following alpha rects
  alphax=rs[alphaRect].x;alphay=rs[alphaRect].y;
  alphax2=rs2[alphaRect2].x;alphay2=rs2[alphaRect2].y;
  alphax3=rs3[alphaRect3].x;alphay3=rs3[alphaRect3].y;
  alphax4=rs4[alphaRect4].x;alphay4=rs4[alphaRect4].y;
  alphaR1Center[0]=rs[alphaRect].x+rs[alphaRect].w*.5;  //x
  alphaR1Center[1]=rs[alphaRect].y+rs[alphaRect].h*.5;  //y
  alphaR2Center[0]=rs2[alphaRect2].x+rs2[alphaRect2].w*.5;   //x
  alphaR2Center[1]=rs2[alphaRect2].y+rs2[alphaRect2].h*.5;  //y
  if(score>scoreEvent)
  ellipseSpeed=0.3;
  for(int i=0;i<numEllipses;i++)
  {
    //fill(color(49,186,122));
    fill(ballColor);
    if(i<numEllipses/2){
      if(i%2==0){
      eps[i].moveTowards(alphax,alphay,ellipseSpeed);}
      else{
      eps[i].moveTowards(alphax2,alphay2,ellipseSpeed);}}
    else{
      if(i%2==0){
      eps[i].moveTowards(alphax3,alphay3,ellipseSpeed);}
      else{
      eps[i].moveTowards(alphax4,alphay4,ellipseSpeed);}}
    if(brightness!=0)
    noStroke();
    if(score>scoreEvent-1000){
    eps[i].display();
    stroke(1);
    //rhombus check collision with ellipses
    eps[0].checkColRhombus(eps,rhs);}
  }
//  //Ellispes following rhombus
  if(score>scoreEvent+3000){
  for(int i=0;i<round(numEllipsesRh);i++)
  {
    //fill(color(49,186,122));
    noStroke();
     if(frameCount%20==0)
     {rhcolor=color(random(100),random(50),200);}
     fill(rhcolor);
    epsRh[i].moveTowards(rhs[0].x1,rhs[0].y1,ellipses2RhSpeed);
    //float d=eucDist(epsRh[i].x,rhs[0].x1,epsRh[i].y,rhs[0].y1);
    //if(d<3){noLoop();}
    epsRh[i].display();
    epsRh[0].checkColRhombus(epsRh,rhs);

  }
  if(score>scoreEvent+5000) //make one ellipse WAY big
  {
    stroke(rhcolor);
    strokeWeight(2);
    noFill();
    if(frameCount%3==0)
    ellipse(epsRh[0].x,epsRh[0].y,epsRh[0].w*2,epsRh[0].h*2);
    noStroke();
    if(frameCount%500==0){
      if(numEllipsesRh>10)
      ellipses2RhSpeed+=.05;//increase the speed of ellispes
        epsRh[0].w*=2;
        epsRh[0].h*=2;
      countIncreaseSize+=1;
      println(countIncreaseSize);
      if(countIncreaseSize==4){
              epsRh=initializeEllipsesRh(numEllipsesRh+2);  //add more ellipses
              epsRh[0].w=epsRh[1].w;
              epsRh[0].h=epsRh[1].h;
            countIncreaseSize=round(random(-1,0));
            print("reset size of ellipse");}
      }
     if(numEllipsesRh==11)
     respawnRects();
     
    //if(frameCount%1000==0)
    //epsRh=initializeEllipsesRh(numEllipsesRh+2);  //add more ellipses
    //if(frameCount%3000==0)
    //respawnRects();
  }
  }
  
  //rhombus
  //rhs[0].move(direction);
  rhs[0].move();
  rhs[0].display();  
  //rhombus check collision with Alpha rectangles
  boolean col1=false;boolean col2=false;boolean col3=false;boolean col4=false;
  col1=rhs[0].checkCol(rhs, rs);      //check colision with alpha rects
  col2=rhs[0].checkCol(rhs, rs2);
  col3=rhs[0].checkCol(rhs, rs3);
  col4=rhs[0].checkCol(rhs, rs4);
  if(col1==true || col2==true ||col3==true || col4==true){
      score+=500;
      fill(250);
      text("+500",rhs[0].x1,rhs[0].y1);
      colTime=millis();} //add score each time touches big rect

  //epsRh[0].checkColRhombus(epsRh,rhs);


//  if(frameCount%300==0){epsRh[0].randomlyDisplay(epsRh);}
  
//  if (frameCount % 5 == 0 && frameCount < 1000)//save frames for gif
//  saveFrame("image-####.gif");
  }//explosion

  }//start=true 
  else
  {
    textSize(18);
     if(frameCount%30==0)
    fill(color(random(100),random(50),200));
    text("Press a to start",20,40);
    text("Use arrow keys to move",20,60);
    text("Press w to restart",20,80);
    text("Hint : circles are bad! :s",20,100);
  }
} 
 
void randomColors(color[] colors, int r1,int r2, int g1,int g2, int b1,int b2) {
  for (int i=0; i<colors.length; i++) {
    //colors[i] = color(random(255),random(20),random(20));
    colors[i] = color(random(r1,r2),random(g1,g2),random(b1,b2));
  }
}

class triangles{
  float x1,x2,x3,y1,y2,y3,id;
  float vx=.3;float vy=.3;
  triangles[] ts;
  //constructor
  triangles(float x1a, float y1a, float x2a, float y2a, float x3a, float y3a,float ida, triangles[] tsa){
  x1=x1a;x2=x2a;x3=x3a;y1=y1a;y2=y2a;y3=y3a;id=ida;
  ts=tsa;
  }
  
  void move(){
    x1+=vx;x2+=vx;x3+=vx;
    y1+=vy;y2+=vy;y3+=vy;
    }
  void display(){
    triangle(x1,y1,x2,y2,x3,y3);
    }
}

class rectangles{
  float x,y,w,h,id;
  float speed=0.3;
  rectangles[] rts;
  //constructor
  rectangles(float xc, float yc, float wc, float hc,int idc, rectangles[] rts)
   {
     x=xc;y=yc;w=wc;h=hc;id=idc;
   }
  void move(String where){
   if(where=="right"){x+=speed;}
   else if(where=="left"){x-=speed;}
   else if(where=="up"){y+=speed;}
   else if(where=="down"){y-=speed;}
   else if(where=="diag1"){y-=speed;x+=speed;}
   else if(where=="diag2"){y+=speed;x+=speed;}
   else if(where=="diag3"){y-=speed;x-=speed;}
   else if(where=="diag4"){y+=speed;x-=speed;}
  }
  void checkcollision(rectangles[] rts){
  float x2=x+w; float y2=y+h;
  float btmedge=y+h; //bottom
  float tpedge=y; //top edge
  float lftedge=x; //left edge
  float rgtedge=x+w; //right edge
  //println(btmedge,tpedge,lftedge,rgtedge);
  boolean colFlag=false;
//  strokeWeight(5);
//  stroke(250);
//  fill(250);
//  point(lftedge,tpedge);//upper left point
//  text(tpedge,lftedge,tpedge);
//  point(rgtedge,tpedge);//upper right point
//  text(rgtedge,rgtedge,tpedge+h/2);
//  point(lftedge,btmedge);//lower left point
//  text(lftedge,lftedge-w,btmedge-h/2);
//  point(rgtedge,btmedge);//lower right point
//  text(btmedge,lftedge+w/8,btmedge+h/10);//lower right point
//  strokeWeight(1);
  
// ######to check if there is NO collision, ANY of the following conditions must exist.########
//    Rectangle 1′s bottom edge is higher than Rectangle 2′s top edge.
//    Rectangle 1′s top edge is lower than Rectangle 2′s bottom edge.
//    Rectangle 1′s left edge is to the right of Rectangle 2′s right edge.
//    Rectangle 1′s right edge is to the left of Rectangle 2′s left edge.
  for(int j=0;j<rts.length;j++) //check rectange against all rectangles
  {
    if(j!=id){ //to not check collition against itself
//      println("Bottom",'<', "Top  " ," Top" ,'>',"Bottom" ,"Left",'>',"Right " , " Right ",'<'," Left ");
//      println(btmedge,'<', rts[j].y ,tpedge,'>',rts[j].y+h ,lftedge,'>',rts[j].x+w , rgtedge,'<',rts[j].x);
//      println((btmedge<rts[j].y) ,(tpedge>rts[j].y+h) ,(lftedge>rts[j].x+w) ,(rgtedge<rts[j].x));
      
      //print(!((btmedge<rts[j].y) ||(tpedge>rts[j].y+h) ||(lftedge>rts[j].x+w) ||(rgtedge<rts[j].x))); //prints collision state
      if(!((btmedge<rts[j].y) ||(tpedge>rts[j].y+h) ||(lftedge>rts[j].x+w) ||(rgtedge<rts[j].x))==true)
      {
        int c=round(random(numRects-1));
        colFlag=true;
        fill(colors[c]);
        w-=.05*w; h-=.05*h;
        display();
        divideRects();
        break; 
                
      }
      if(rgtedge>width || lftedge<0 )//out of the screen horizontally..
      {
        fill(240);
        //w=width;
        x=random(width);y=random(height); //back in the game
        display();
        break;
      }
      if(tpedge<0 || btmedge>height )//out of the screen vertically..
      {
        //fill(240);
        //h=height;
        x=random(width);y=random(height); //back in the game
        display();
        break;
      }
      
    }
  }
  }
  
  
  
 float dx=.05; float dy=.05;
 int cr=250,cg=240,cb=41;
 
 void divideRects()
  {
    for(int k=0;k<20;k++){
    dx+=.1;dy+=.1;  
//    rect(x-dx,y+dy,w/2,h/2);//upper left rect, moving diagonal
//    rect(x+w/2+dx,y+dy,w/2,h/2);//upper right rect
//    rect(x-dx,y-h/2-dx,w/2,h/2);//lower left rect
//    rect(x+w/2+dx,y-h/2-dy,w/2,h/2);//lower right rect
    if(k>190){
    fill(color(cr,cg,cb));
    cr-=.5;cg-=.5;cb-=.5;
    //cr=20;
    //cb-=.5;
    //cg-=.5;
     }
    //if(k==199){println(cr,cb,cg);}
    //cg-=.5;
    //stroke(240);
    rect(x-dx+sin(x),y+dy+sin(y),w/2,h/2);//upper left rect, moving diagonal
    rect(x+w/2+dx+sin(dx),y+dy+sin(dy),w/2,h/2);//upper right rect
    rect(x-dx+sin(dx),y-h/2-dy+sin(dy),w/2,h/2);//lower left rect
    rect(x+w/2+dx+sin(dx),y-h/2-dy+sin(dy),w/2,h/2);//lower right rect
    stroke(0);
    }
  }
  int rectAlpha(rectangles[] rts)
  {
    float maxArea=0; int maxRect=0;
   for(int k=0;k<rts.length;k++)
   {
     if(maxArea<rts[k].w*rts[k].h){
       maxArea=rts[k].w*rts[k].h;
       maxRect=k;
     }
   }
    //fill(color(188,108,202)); //pink...
    //fill(color(186, 200, 200)); //alpha color
    //int(random(0,len(alphaColor)));
    fill(alphaColor[int(random(0,numColors-1))]);
    if(brightness==0)
       fill(rhcolor);
    stroke(color(71,132,179));
    strokeWeight(5);
    rts[maxRect].display();
    stroke(0);
    strokeWeight(1);
   return maxRect; 
  }
   
 void display(){
 //strokeWeight(0.5);
 noStroke();
 rect(x,y,w,h);
 }
 

   
}

class ellipses{
  float x,y,w,h,id;
  float speed=0.08;
  ellipses[] eps;
  //constructor
  ellipses(float xc, float yc, float wc, float hc,int idc, ellipses[] eps)
   {
     x=xc;y=yc;w=wc;h=hc;id=idc;
   }
   void moveTowards(float xo,float yo, float dx){
     if(dx>0){
       //float dx=0.3;float dy=0.3;
       float mov=0.9;
       //check where current position is in relation with target
       if(x<xo && y>yo)//lower left
         {x+=dx+sin(random(20));y-=dx+sin(random(20));}//{x+=dx;y-=dy;}
       else if(x>xo && y>yo){//lower right
         x-=dx+sin(random(20));y-=dx+sin(random(20));}//x-=dx;y-=dy;}
       else if(x<xo && y<yo)//upper left
         {x+=dx+sin(noise(20));y+=dx+sin(random(20));}//{x+=dx;y+=dy;}
       else if(x>xo && y<yo)//upper right
         {x-=dx+sin(random(20));y+=dx+sin(random(20));};//{x-=dx;y+=dy;};
     }
   }
   void checkColRhombus(ellipses[] eps, rhombus[] rhs)
   {
     float tpedge=rhs[0].y2; float btmedge=rhs[0].y4;
     float leftedge=rhs[0].x4; float rightedge=rhs[0].x2;
     boolean colFlag=false;
     for(int j=0;j<eps.length;j++){
       float epsTop=eps[j].y-.5*eps[j].h;float epsBtm=eps[j].y+.5*eps[j].h;  //make a rectangle around the ellipse, and detect 4 edges
       float epsLeft=eps[j].x-.5*eps[j].w;float epsRight=eps[j].x+.5*eps[j].w;
        if(!((btmedge<epsTop) ||(tpedge>epsBtm) ||(leftedge>epsRight) ||(rightedge<epsLeft))==true)
        {
          colFlag=true;          
          rhombusCollide=true;
          //noLoop();
          for (int i = 0; i < MAX; i ++) {
              plist.add(new Particle(rhs[0].x1,rhs[0].x2)); // fill ArrayList with particles
              if(plist.size() > 5*MAX) {
                plist.remove(0);
              }
            }

          
          //rhs[0].divideRects();
          //println(tpedge,btmedge,leftedge,rightedge);
          break;            
        }     
     }  
   }
   
   void randomlyDisplay(ellipses[] eps){
     for(int i=0;i<eps.length;i++)
     {
       eps[i].x=random(width);eps[i].y=random(height);
     }
   }
   
   void display(){
     ellipse(x,y,w,h);
     }  
}

class rhombus{
  float x1,y1,x2,y2,x3,y3,x4,y4,id;
  float speed=0.08;
  ellipses[] eps;
  //constructor
  rhombus(float xa, float ya, float xb, float yb, float xc, float yc,
  float xd, float yd,int idc, rhombus[] rhs)
   {
     x1=xa;y1=ya;x2=xb;y2=yb;x3=xc;y3=yc;x4=xd;y4=yd;id=idc;
   }

  void move(){
     //float dx=0.2;float dy=0.2;
     float delta=1.2;
     if(rhAcceleration>1)
     delta*=rhAcceleration;
     //check where current position is in relation with target
     if(keyup==true)
     {
       y1-=delta;y2-=delta;y3-=delta;y4-=delta;
       if(keyright==true){x1+=delta;x2+=delta;x3+=delta;x4+=delta;}
       else if(keyleft==true){x1-=delta;x2-=delta;x3-=delta;x4-=delta;}
     }
     else if (keydown==true)
     {
       y1+=delta;y2+=delta;y3+=delta;y4+=delta;
       if(keyright==true){x1+=delta;x2+=delta;x3+=delta;x4+=delta;}
       else if(keyleft==true){x1-=delta;x2-=delta;x3-=delta;x4-=delta;}
     }
     else if (keyright==true)
     {
       x1+=delta;x2+=delta;x3+=delta;x4+=delta;
     }
     else if(keyleft==true)
     {
       x1-=delta;x2-=delta;x3-=delta;x4-=delta;
     }
     float tpedge=rhs[0].y2; float btmedge=rhs[0].y4;
     float leftedge=rhs[0].x4; float rightedge=rhs[0].x2;
     if(leftedge>width)//out of the screen horizontally..
      {
        fill(240);
        rhs[0].x1=0;rhs[0].y1=rhs[0].y1;//first point of quad
        rhs[0].x2=rhs[0].x1+20;rhs[0].y2=rhs[0].y1-10;
        rhs[0].x3=rhs[0].x1+10;rhs[0].y3=rhs[0].y1+15;
        rhs[0].x4=rhs[0].x1-10;rhs[0].y4=rhs[0].y1+20;
        display();
      }
      else if(rightedge<0)//out of the screen horizontally..
      {
        fill(240);
        rhs[0].x1=width-10;rhs[0].y1=rhs[0].y1;//first point of quad
        rhs[0].x2=rhs[0].x1+20;rhs[0].y2=rhs[0].y1-10;
        rhs[0].x3=rhs[0].x1+10;rhs[0].y3=rhs[0].y1+15;
        rhs[0].x4=rhs[0].x1-10;rhs[0].y4=rhs[0].y1+20;
        display();
      }
      else if(btmedge<0)//out of the screen horizontally..
      {
        rhs[0].y1=height-20;//first point of quad
        rhs[0].x2=rhs[0].x1+20;rhs[0].y2=rhs[0].y1-10;
        rhs[0].x3=rhs[0].x1+10;rhs[0].y3=rhs[0].y1+15;
        rhs[0].x4=rhs[0].x1-10;rhs[0].y4=rhs[0].y1+20;
        display();
      }
      else if(tpedge>height)//out of the screen horizontally..
      {
        rhs[0].y1=0;//first point of quad
        rhs[0].x2=rhs[0].x1+20;rhs[0].y2=rhs[0].y1-10;
        rhs[0].x3=rhs[0].x1+10;rhs[0].y3=rhs[0].y1+15;
        rhs[0].x4=rhs[0].x1-10;rhs[0].y4=rhs[0].y1+20;
        display();
      }

     
     
     
   }
   boolean checkCol(rhombus[] rhs, rectangles[] rts)  //checl collision beteen rhombus and rectangles
   {
     //create rectangle shape around rhombus to simplify collision algorithm
     float tpedge=rhs[0].y2; float btmedge=rhs[0].y4;
     float leftedge=rhs[0].x4; float rightedge=rhs[0].x2;
     boolean colFlag=false;
     int alphaIndex=rts[0].rectAlpha(rts);
        if(!((btmedge<rts[alphaIndex].y) ||(tpedge>rts[alphaIndex].y+rts[alphaIndex].h) ||(leftedge>rts[alphaIndex].x+rts[alphaIndex].w) ||(rightedge<rts[alphaIndex].x))==true)
      {
        int c=round(random(numRects-1));
        colFlag=true;
        fill(colors[c]);
        rts[alphaIndex].w-=.05*rts[alphaIndex].w; rts[alphaIndex].h-=.05*rts[alphaIndex].h;
        rts[alphaIndex].display();
        rts[alphaIndex].divideRects();                 
      }   
    return colFlag;  
   }
   
   void randomlyDisplay(rhombus[] rhs){
     for(int i=0;i<rhs.length;i++)
     {
       //example quad(38, 31, 86, 20, 69, 63, 30, 76);
       rhs[i].x1=random(width);rhs[i].y1=random(height);//first point of quad
       rhs[i].x2=rhs[i].x1+20;rhs[i].y2=rhs[i].y1-10;
       rhs[i].x3=rhs[i].x1+10;rhs[i].y3=rhs[i].y1+15;
       rhs[i].x4=rhs[i].x1-10;rhs[i].y4=rhs[i].y1+20;
     }
   }
   void display(){
     if(frameCount%5==0)
     {rhStrokeW+=1;
      if(rhStrokeW>4){rhStrokeW=1;}
     }
     if(frameCount%20==0)
       {rhcolor=color(random(100),random(50),200);}
     fill(rhcolor);
     noFill();
     stroke(color(71,132,179));
     strokeWeight(rhStrokeW);
     quad(x1,y1,x2,y2,x3,y3,x4,y4);
     }
    float dx=.05; float dy=.05;
    int cr=250,cg=240,cb=41;
    void divideRects()
  {
    for(int k=0;k<35;k++){
    dx+=.1; dy+=.1;  

    if(k>190){
    fill(color(cr,cg,cb));
    cr-=.5;cg-=.5;cb-=.5;
     }
    //if(k==199){println(cr,cb,cg);}
    //cg-=.5;
    //stroke(240);
    rect(x1-dx+sin(dx),y1+dy+sin(dx),(x2-x1)/2,(y4-y2)/2);//upper left rect, moving diagonal
    rect(x1+(x2-x1)/2+dx+sin(dx),y1+dy+sin(dx),(x2-x1)/2,(y4-y2)/2);//upper right rect
    rect(x1-dx+sin(dx),y1-(y4-y2)/2-dy+sin(dx),(x2-x1)/2,(y4-y2)/2);//lower left rect
    rect(x1+(x2-x1)/2+dx+sin(dx),y1-(y4-y2)/2-dy+sin(dx),(x2-x1)/2,(y4-y2)/2);//lower right rect
    stroke(0);
    }

  }  
}

void getSerialPorts()
{
    for(int i=myPort.list().length-1;i>=0;i--)
  {
        if(i==myPort.list().length-1){
        serialPorts=myPort.list()[i];
        }//defaulting to last serial port
        //println(serialPorts);
  }
}


void keyPressed(){
  //println(key);
  if (key==ENTER){
      noLoop();  }
  if (key==TAB){
      loop();  }
  if (key=='w'){
     camangle=.1;camangleZ=.1;
     respawn();
     if(rhombusCollide==true)
     {
       rhombusCollide=false;
       score=0;
       scoretime=0;
       starttime=millis();
       plist = new ArrayList();
     }
     
   }
   if (key=='a'){
     start=true;
   }
   if (key=='x'){
  getSerialPorts();
  String portName=myPort.list()[0];
  myPort = new Serial(this, portName, 9600);
  myPort.bufferUntil('\n');}


//move rhombus
  if (key == CODED) {
    //println(keyCode);
//    if (keyCode==UP){
//      direction="up";}
//    else if(keyCode==DOWN){
//      direction="down";}
//    else if(keyCode==LEFT){
//      direction="left";}
//    else if(keyCode==RIGHT){
//      direction="right";}
      
    if (keyCode == UP) keyup = true; 
    if (keyCode == DOWN) keydown = true; 
    if (keyCode == LEFT) keyleft = true; 
    if (keyCode == RIGHT) keyright = true;
   if(keyup==true|| keydown==true || keyleft==true || keyright==true)
    {rhAcceleration+=.1;
      println("Accelerating" + str(rhAcceleration));
      //println(keyup,keydown,keyleft,keyright);
      }
    }
}

void keyReleased() {
  if (key == CODED) {
    if (keyCode == UP) keyup = false; 
    if (keyCode == DOWN) keydown = false; 
    if (keyCode == LEFT) keyleft = false; 
    if (keyCode == RIGHT) keyright = false;
     if(keyup==false && keydown==false && keyleft==false && keyright==false)
      rhAcceleration=1;  
  }
   
} 


void respawn()
{
  for(int i=0;i<numRects;i++)
  {
    rs[i]=new rectangles(random(width),random(height),50,50,i,rs);
    rs2[i]=new rectangles(random(width),random(height),25,25,i,rs2);
        //rs3[i]=new rectangles(random(width),random(height),60.0,20.0,i,rs3);
        //rs4[i]=new rectangles(random(width),random(height),60.0,20.0,i,rs4);
  }
  for(int i=0;i<numEllipses;i++){
    float t=random(10,20);
    eps[i]=new ellipses(random(width),random(height),t,t,i,eps);
  }
    rhs[0].randomlyDisplay(rhs);
  
}
void respawnRects()
{
  for(int i=0;i<numRects;i++)
  {
    rs[i]=new rectangles(random(width),random(height),50,50,i,rs);
    rs2[i]=new rectangles(random(width),random(height),25,25,i,rs2);
        rs3[i]=new rectangles(random(width),random(height),60.0,20.0,i,rs3);
        rs4[i]=new rectangles(random(width),random(height),60.0,20.0,i,rs4);
  }
}


float eucDist(float x1, float x2, float y1, float y2)
{
  float dis=sqrt(pow((x1-x2),2)+pow((y1-y2),2));//distance from alpha rect center to vertice 2
  return dis;
}

void camFun()    //function to enable camera movement with accelerometer
{
  currentMillis=millis();
  if(frameCount%1000==0){
  cameraTime=millis();
  camangle=random(.1,.9);camangleZ=random(.1,.9);
  camControl=true;}
  if(camControl==true && currentMillis-cameraTime>10000){camControl=false;camangle=0;camangleZ=0;}
}

float score=0;float scoreEvent=2000;
float scoretime=0;
void showScore()
{
  //fill(0);
  fill(220);
  //if(frameCount%10==0){fill(color(random(11,50),random(110,150),random(42,250)));}
  text("Score:"+str(score)+" "+scoretime/1000.0 ,10,20);
  if(rhombusCollide==false){
    if(frameCount%50==0)
    {score+=100;}//100 points for every 50 frames 
    fill(color(200,0,0));
    //rect(0,0,width,20);
  }
}

ellipses[]  initializeEllipsesRh(int number)
{  numEllipsesRh=number;
   ellipses[] epsRh= new ellipses[numEllipsesRh];
   println(numEllipsesRh);
   for(int i=0;i<numEllipsesRh;i++){
    float t=random(10,20);
    epsRh[i]=new ellipses(random(width),random(height),t,t,i,epsRh);}
   return epsRh;
}

void grid(int n)
{
  float x=0; float y=0;
  //stroke(200);
  stroke(color(20,20,20));
  stroke(color(80,80,80));
//  if (frameCount%15==0)
//  {
//    strokeWeight(gridW);
//    if(gridW<3){gridW+=1;}else{gridW=1;}
//  }

  float offsety=height/n;float offsetx=width/n;
  for(int j=1;j<n;j++)
  {
    //strokeWeight(j);
    //stroke(2);
    line(x,offsety*j,width,offsety*j); //horizontal line
    line(offsetx*j,y,offsetx*j,height); //vertical line
  }
  
}

//##### SERIAL PORT EVENT #############
  void serialEvent(Serial myPort) {
  //sdata = myPort.readStringUntil(13);
  sdata=(new String(myPort.readBytesUntil('\n')));
  //println(sdata);
  value=float(split(sdata,' ')[1]);
  //println("value:"+value);  
    if(sdata.indexOf("x")>=0)//x axis
    {
      sdata2=split(sdata,' ');
      valx=float(split(sdata,' ')[1]);
    }
    else if(sdata.indexOf("y")>=0)//x axis
    {
      sdata2=split(sdata,' ');
      valy=float(split(sdata,' ')[1]);
    }
    else if(sdata.indexOf("z")>=0)//x axis
    {
      sdata2=split(sdata,' ');
      valz=float(split(sdata,' ')[1]);
    }
    else if(sdata.indexOf("brightness:")>=0)//x axis
    {
      sdata2=split(sdata,' ');
      brightness=float(split(sdata,' ')[1]);
      //println("brightness" +str(brightness));
    }
  }



  
 //ideas: 
 //create BIG ellipse randomly following rh
 //make a title screen

class Particle {
  float r = 2;
  PVector pos,speed,grav; 
  ArrayList tail;
  float splash = 5;
  int margin = 2;
  int taillength = 25;

  Particle(float tempx, float tempy) {
    float startx = tempx + random(-splash,splash);
    float starty = tempy + random(-splash,splash);
    startx = constrain(startx,0,width);
    starty = constrain(starty,0,height);
    float xspeed = random(-3,3);
    float yspeed = random(-3,3);

    pos = new PVector(startx,starty);
    speed = new PVector(xspeed,yspeed);
    grav = new PVector(0,0.02);
    
    tail = new ArrayList();
  }

  void run() {
    pos.add(speed);

    tail.add(new PVector(pos.x,pos.y,0));
    if(tail.size() > taillength) {
      tail.remove(0);
    }

    float damping = random(-0.5,-0.6);
    if(pos.x > width - margin || pos.x < margin) {
      speed.x *= damping;
    }
    if(pos.y > height -margin) {
      speed.y *= damping;
    }
  }

  void gravity() {
    speed.add(grav);
  }

  void update() {
    for (int i = 0; i < tail.size(); i++) {
      PVector tempv = (PVector)tail.get(i);
      noStroke();
      fill(6*i + 50);
      //fill(color(200,20,20));
      int c=round(random(colorsexplosion.length-1));
      //fill(colorsexplosion[c]);
      fill(rhcolor);
      rect(tempv.x,tempv.y,random(10),random(10));
      //ellipse(tempv.x,tempv.y,random(10),random(10));
    }
  }
}




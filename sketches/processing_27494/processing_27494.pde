
//Swinging Atwood's Machine simulator by Daniel
/*const*/float SIZE=0.45; //should be around 1. For scaling to different screen sizes

/*const*/int strLen=(int)(490*SIZE); //string length. Doesn't include |pivotX3-mass2X|.
/*const*/int pivotX=(int)(683*SIZE), pivotY=(int)(500*SIZE); //pivot
float R0=300;
float R=(int)(R0*SIZE), T=-HALF_PI; //Radius and theta of main (swinging) mass.
float Rv, Tv; //velocity of main mass. Pixels per frame, radians per frame.
float samX=pivotX-SIZE*300, samY=pivotY, samvX, samvY; //main mass in cartesian coordinates

float mass=1, mass2=1.749;

/*const*/float g=0.000003*SIZE;//Gravity. Pixels per frame^2.

int mass2X=(int)(1150*SIZE), mass2Y; //x position of mass2 is constant.

/*const*/int width=(int)(1366*SIZE);
/*const*/int hist=width; //must be greater than or equal to width

int [] Tgraph = new int[width];
int [] Rgraph = new int[width];
int [] Xgraph = new int[hist];
int [] Ygraph = new int[hist];

int physRate = 200; //how many times the physics engine runs per frame

boolean graphornot=true; //whether to show the graph
boolean graphonly=false; //graph only the trajectory
boolean STOP=false;

float rmin=4*SIZE;

/*
Regarding the precision of the physics, typically the more times the physics engine runs per frame,
and the lower the gravitational constant, the more precise it is. For it to run at the same speed,
g needs to be roughly proportional to the inverse square of physRate. However, if you make g too 
small, the limitations of floating point precision kicks in and unexpected aberrations will occur. 
The current values for physRate and g seem to be okay, however.
*/

void setup() {
  frameRate(60);
  size(width+(int)(30*SIZE), (int)(1000*SIZE));
  graphInit();
  textSize(41*SIZE);
}

void draw() {
  background(0);//reset the background.
  stroke(0,40,60); noFill();
  for(int i=1; i<13; i++){
    //draw the polar-coordinates grid lines
    ellipse(pivotX,pivotY,i*strLen/6,i*strLen/6);
    line(pivotX,pivotY,strLen*cos(i*PI/6)+pivotX,strLen*sin(i*PI/6)+pivotY);
  }
  float Rold=R, Told=T;
  if (mousePressed) {
    if(mouseX<pivotX+(int)(strLen+100*SIZE)){
      //Use the mouse to make initial conditions!
      samX=mouseX; samY=mouseY;
      R=dist(samX,samY,pivotX,pivotY);
      R=R>strLen?strLen:R;
      T=atan((samX-pivotX)/(samY-pivotY));
      if(samY<pivotY) {
        T+=PI;
      }
      Rv=(R-Rold)/physRate;
      Tv=(T-Told)/physRate;
      graphInit();
    } else if(mouseY>(int)(400*SIZE)&&mouseY<(int)(900*SIZE)){
      //Set mass ratio!
      mass2=(int)((float)mouseY-400*SIZE)/(70*SIZE)+1;
      physics();
    } else {
      physics();
    }
  } else {
    physics();
  }
  
  mass2Y=pivotY+(int)(strLen-R);

  //Convert to cartesian coordinates;
  samX=R*sin(T)+pivotX;
  samY=R*cos(T)+pivotY;
  
  //process the graphs!
  graphProcess();
  Tgraph[width-1]=(int)((100-(int)(T*10))*SIZE);
  Rgraph[width-1]=(int)((130-(int)(R/4))*SIZE);
  Xgraph[hist-1]=(int)samX;
  Ygraph[hist-1]=(int)samY;
  
  if(graphonly){
    smooth();
    stroke(255);
    for(int i=0; i<hist-1; i++){
      line(Xgraph[i],Ygraph[i],Xgraph[i+1],Ygraph[i+1]);
    }
    noSmooth();
    return;
  }
  
  if(graphornot){
    drawGraphs();
  }

  //draw the string
  stroke(255,0,0);
  line(samX,samY,pivotX,pivotY);
  for(int i=0;i<20;i++){
    stroke(255-i*255/19,0,i*255/19);
    line(pivotX+i*(mass2X-pivotX)/20,pivotY,pivotX+(i+1)*(mass2X-pivotX)/20,pivotY);
  }
  stroke(0,0,255);
  line(mass2X,pivotY,mass2X,mass2Y);
  noStroke();
  //draw the pivots
  fill(49,64,100);
  ellipse(pivotX,pivotY,20*SIZE,20*SIZE);
  ellipse(mass2X,pivotY,20*SIZE,20*SIZE);
  //draw the masses
  fill(0,0,255);  
  ellipse(mass2X,mass2Y,sqrt(mass2)*40*SIZE, sqrt(mass2)*40*SIZE);
  fill(255,0,0);
  ellipse((int) samX, (int) samY, sqrt(mass)*40*SIZE, sqrt(mass)*40*SIZE);
  //energies
  fill(255);
  
  float ke=0.5*(mass*(Rv*Rv+Tv*Tv*R*R)+mass2*Rv*Rv);
  float pe= -samY*mass*g+(strLen-mass2Y)*mass2*g;
  float eng=ke+pe;
  //text("X ",10*SIZE,500*SIZE);  text((samX-pivotX)/SIZE,75*SIZE,500*SIZE);
  //text("Y ",10*SIZE,550*SIZE);  text((samY-pivotY)/SIZE,75*SIZE,550*SIZE);
  //text("R ",10*SIZE,600*SIZE);  text(R,75*SIZE,600*SIZE);
  //text("T ",10*SIZE,650*SIZE);  text(T,75*SIZE,650*SIZE);
  text("KE",10*SIZE,700*SIZE);  text(ke/g,75*SIZE,700*SIZE);
  text("PE",10*SIZE,750*SIZE);  text(pe/g,75*SIZE,750*SIZE);
  text("E ",10*SIZE,800*SIZE);  text(eng/g,75*SIZE,800*SIZE);
  
  //mass dragger
  fill(255-30*mass2,0,255);
  triangle(width-50*SIZE, ((mass2-1)*70+400)*SIZE, 
           width-10*SIZE, ((mass2-1)*70+380)*SIZE,
           width-10*SIZE, ((mass2-1)*70+420)*SIZE);
  //text("M/m=", width-160*SIZE, ((mass2-1)*70+409)*SIZE);
  text(mass2, width-170*SIZE, ((mass2-1)*70+409)*SIZE);
  for(int i=0;i<51;i++){
    fill(255-255*i/50,0,255);
    rect(width,(10*i+400)*SIZE,10,(10+400)*SIZE);
  }
  //framerate
  fill(40);
  text("FPS", 10*SIZE,900*SIZE); text(frameRate,85*SIZE,900*SIZE);
}

void keyPressed() {
  if(key=='c') {
    //reset all graphs
    graphInit();
  } else if(key=='r') {
    //reset everything except mass ratio
    reset();
    fill(255,0,0);
  } else if(key=='g') {
    //toggle whether to show the graphs
    graphornot=!graphornot;
  } else if(key=='f') {
    graphonly=!graphonly;
  } else if(key=='s') {
    //save a screenshot
    
    save("SAM_" + mass2 + ".png");
  } else if(key=='d') {
    //fast forward
    for(int i=0;i<1000;i++){
      physics();
      graphProcess();
      samX=R*sin(T)+pivotX;
      samY=R*cos(T)+pivotY;
      Tgraph[width-1]=(int)((100-(int)(T*10))*SIZE);
      Rgraph[width-1]=(int)((130-(int)(R/4))*SIZE);
      Xgraph[hist-1]=(int)samX;
      Ygraph[hist-1]=(int)samY;
    } 
  } 
}

void reset(){
  //reset everything except mass ratio
    R=(int)(R0*SIZE); T=-HALF_PI; 
    Rv=0; Tv=0;
    samX=pivotX-SIZE*R0; samY=pivotY;
    graphInit();
    ellipse(mass2X,mass2Y,sqrt(mass2)*40*SIZE, sqrt(mass2)*40*SIZE);
}

void physics(){
  for(int i=0; i<physRate; i++) {
    if(!STOP){
      float Rvv=(mass*R*pow(Tv,2)+g*(-mass2+mass*cos(T)))/(mass+mass2);
      float Tvv=-sin(T)*g/R-2*Rv*Tv/R;
      Rv+=Rvv;
      Tv+=Tvv;
      R+=Rv-0.5*Rvv; T+=Tv-0.5*Tvv;
      //bounds checking for R
      if(R<rmin) {
        STOP=true;
        R=rmin;
      }
      //bounds checking for T (unimportant, but makes the graphs look nicer)
      T=T>4*PI?T-2*PI:T;
      T=T<-2*PI?T+2*PI:T;
    } else if(R>rmin) {
      STOP=false;
    }
  }
}

void graphProcess() {
  //shift everything in the graph arrays
  for(int i=0; i<width-1; i++) {
    Tgraph[i]=Tgraph[i+1];
    Rgraph[i]=Rgraph[i+1];
  }
  for(int i=0; i<hist-1;i++) {
    Xgraph[i]=Xgraph[i+1];
    Ygraph[i]=Ygraph[i+1];
  }
}

void graphInit() {
  //initialize the graphs
  for(int i=0; i<width; i++) {
    Tgraph[i]=0;
    Rgraph[i]=0;
  }
  for(int i=0; i<hist; i++) {
    Xgraph[i]=(int)samX;
    Ygraph[i]=(int)samY;
  }
}

void drawGraphs(){
  fill(0,200,255);
  for(int i=0; i<width-1; i++){
    stroke(0,200*(i+1)/width,255*(i+1)/width);
    line(i,Tgraph[i],i+1,Tgraph[i+1]);
    line(i,(200*SIZE-(Xgraph[i+hist-width]-pivotX)/6),i+1,(200*SIZE-(Xgraph[i+1+hist-width]-pivotX)/6));
  }
  text("θ", width+3*SIZE, Tgraph[width-1]);
  text("X", width+3*SIZE, 200*SIZE-(Xgraph[hist-1]-pivotX)/6);
  
  fill(99,255,0);
  for(int i=0; i<width-1; i++){
    stroke(99*(i+1)/width,255*(i+1)/width,0);
    line(i,Rgraph[i],i+1,Rgraph[i+1]);
    line(i,(200*SIZE+(Ygraph[i+hist-width]-pivotY)/6),i+1,(200*SIZE+(Ygraph[i+1+hist-width]-pivotY)/6));
  }
  text("R", width+3*SIZE, Rgraph[width-1]);
  text("Y", width+3*SIZE, 200*SIZE+(Ygraph[hist-1]-pivotY)/6);
  
  for(int i=0; i<hist-1; i++){
    stroke(i*255/hist);
    line(Xgraph[i],Ygraph[i],Xgraph[i+1],Ygraph[i+1]);
  }
  return;
}




int speed = 100;
float x=300;
float y=600;
float oldx = 300;
float oldy = 600;
float p1 = 150;         //displacement of pendulum 1
float p1per  = 2;       //period of pendulum 1 (seconds)
float damp = 0.99995;    //dampening of pendulum 1 (per sec)
float p2 = 150;
float p2per = 1;
float p3 = 150;
float p3per = 1;
float p4 = 150;
float p4per = 1;
float t = 0;
float w1, w2, w3, w4;
boolean firstRun = true;
boolean stopped = false;
boolean mouseDown = false;
int clicks = 0;
float timestep = 0.02;

void setup(){
  smooth();
  background(200);
  stroke(128,0,0,50);
  strokeWeight(1);
  size(600,600);
  w1 = p1per;  //In sin(wt), period = 2pi/w
  w2 = p2per;
  w3 = p3per;
  w4 = p4per;
  print(w1+" "+w2+" "+w3+" "+w4+"\n");
}

void draw(){
  //determine period for four pendulums with two mouseclicks
  if (mousePressed && !mouseDown){
     mouseDown = true;
     clicks++;
     if(clicks==1){
         ellipse(mouseX,mouseY,10,10);
         stopped = true;
         p1per = 0.5*float(mouseX)/width  + 2;  //x,y positions give period between 2 and 2.5
         p2per = 0.5*float(mouseY)/height + 2;
     }
     if(clicks==2){
         p3per = 0.5*float(mouseX)/width  + 2;
         p4per = 0.5*float(mouseY)/height + 2;
         stopped = false;
         clicks = 0;
         firstRun = true;
         t = 0;
         print(p1per + " " + p2per + " " + p3per + " " + p4per + "\n\n");
         p1 = p2 = p3 = p4 = 150;
         setup();
     }
  }
  
  if(!stopped){ //draw the stuff
   for(int sp = 0; sp < speed; sp++){
    oldx = x; oldy = y;
    t += timestep;
    x = width/2 +  p1*sin(t*w1) + p2*cos(t*w2);
    y = height/2 + p3*sin(t*w3) + p4*cos(t*w1); 
    p1*=damp;
    p2*=damp;
    p3*=damp;
    p4*=damp;
    
    if(firstRun){
      firstRun = false;
    }
    else{
      stroke(128*oldx/width, 128*oldy/height, 128-10000/t, 60);
      line(oldx,oldy,x,y);
    }
  }
 }
}

void mouseReleased(){ 
  mouseDown = false;
}


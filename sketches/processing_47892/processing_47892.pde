
//Generative Project Version 1.0
LineSet line1;
LineSet line2;
LineSet line3;
int textSwitch=1;
int switchCounter;

int ypos2=int(random(200,250)); //Separate from setup to make it work in draw()

void setup(){
  size(600,600);
  int ypos1=int(random(0,50));
  int ypos3=int(random(400,450));
  line1 = new LineSet(50,ypos1, 200,ypos1+150,1,0);
  line2 = new LineSet(200,ypos2, 350,ypos2+150,1,0);
  line3 = new LineSet(350,ypos3, 500,ypos3+150,1,1);
}

void draw(){
  //beginning text code
  if (textSwitch==1){
    textSize(15);
    rotate(0.80);
    text("Space Bar",470,(ypos2-300), 30);
    text("Arrow Keys",320,(ypos2-150), 30);
    text("r to Reset",530,(ypos2-150), 30);
    text("p to Pause",210,(ypos2-310), 30);
    
    rotate(-0.80);
    switchCounter=switchCounter+1;
    if (switchCounter==180){
      background(100,120,150);
      textSwitch=0;
    }
  }
  else{
    //main moivement code
    line1.display();
    line1.movin();
    line2.display();
    line2.movin();
    line3.display();
    line3.movin();
  }
}

void keyPressed() {
    line1.keyCheck();
    line2.keyCheck();
    line3.keyCheck();
  }

class LineSet{
  //class for all the lines
  int c;
  int cswitch;
  int g=0;
  float x1;
  float y1;
  float x2;
  float y2;
  float slope;
  int dirx;
  int diry;
  int dirxt;
  int diryt;
  LineSet (float x1temp, float y1temp, float x2temp, float y2temp, int dirxt, int diryt){
    x1 = x1temp;
    y1 = y1temp;
    x2 = x2temp;
    y2 = y2temp;
    dirx=dirxt;
    diry=diryt;
    print(dirx);
    background(100,120,150);
  }
  void display(){
    if (cswitch==1){
      if (c==color(255,255,0,200)){
        cswitch=0;
        c=color(255,255,255,200);
      }
      c=c-1;
    }
    stroke(c);
    line(x1,y1,x2,y2);
  }
  void movin(){
    //actual movementa
    y1=y1+(1*diry);
    y2=y2+(1*diry);
    x1=(x1+(201-(x1/200))*dirx);
    x2=(x2+(201-(x2/200))*dirx);
    g=g+1;
     //border control
     
    if(x2>639){
      setDir(dirx,diry, 1);
    }
    if(y2>600){
      dirx= -1;
      diry= -1;
    }
    if(x1<1){
      diry=-1;
      dirx=1;
    }
    if(y1<-50){
      diry=1;
      dirx=1;
    }
  }
  
  void setDir(int dirxt, int diryt, int wall){
    if(wall==1){
      dirx= -1;
      diry= 1;
    }
  }
  void keyCheck() {
    //color white
    if (key == ' '){
        if(c==color(0,0,0,200)){
          c=color(255,255,255,200);
        }
        else if (c==color(255,255,255,200)){
          c=(color(255,255,255,200));
          cswitch=1;
          
          
        }
        else{
          cswitch=0;
          c=color(0,0,0,200);
          
        }
    }
        
    
    //pause
    if (key == 'p'){
        dirx=0;
        diry=0;
    }
    //reset
    if (key == 'r'){
      switchCounter=0;
      textSwitch=1;
      setup() ;
    }
    if (key == 's'){
        smooth();
    
    }
    if (key == CODED) {
      //direction
      if (keyCode == UP) {
        dirx=0;
        diry=-1;
        print("yeah");
    } else if (keyCode == DOWN) {
        dirx=0;
        diry=1;
    } else if (keyCode == RIGHT) {
        dirx=1;
    } else if (keyCode == LEFT) {
        dirx=-1;
    }
}
  }
}



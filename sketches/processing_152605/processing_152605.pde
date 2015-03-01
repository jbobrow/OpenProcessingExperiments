
int num = 100;
int frameNum = 72;
float radius = 200;  //circle radius
float rotateSp = 3;
PFont font;

CurveLine[] curve = new CurveLine[num];


void setup(){
  frameRate(24);
  size(500,500);
  background(255);
  noFill();
  colorMode(HSB,255);
  
  font = loadFont("sample.vlw");
  
  for(int i=0; i<num; i++){
    float rPos1 = random(0,180);  //random degree
    float rPos2 = random(180,360);  //random degree
    float rSp1 = random(0.2,rotateSp);  //random degree
    float rSp2 = random(0.2,rotateSp);  //random degree
    curve[i] = new CurveLine(rPos1,rPos2,rSp1,rSp2,i);
  }
}


void draw(){
  fadeToWhite(192);
  translate(width/2,height/2);
  drawBg();
  
  for(int i=0; i<num; i++){
    curve[i].move();
    curve[i].display();
  }

//  saveFrame("render2/render_####.jpg");
}


class CurveLine{
  float pos1,pos2;  //digree
  float sp1 ,sp2;  //digree
  float x1,y1,x2,y2;  //position
  int index;  //index number 0 to num-1
  
  CurveLine(float pPos1, float pPos2, float pSpeed1, float pSpeed2, int pIndex){
    pos1 = pPos1;  //point1 position
    pos2 = pPos2;  //point2 position
    sp1 = pSpeed1;  //point1 speed
    sp2 = pSpeed2;  //point2 speed
    index = pIndex;
  }
  
  void move(){
    pos1 += sp1;  //move
    pos2 += sp2;  //move
    
    x1 = radius * cos(radians(pos1)%TWO_PI);
    y1 = radius * sin(radians(pos1)%TWO_PI);
    x2 = radius * cos(radians(pos2)%TWO_PI);
    y2 = radius * sin(radians(pos2)%TWO_PI);
  }
  
  void display(){
    int subdiv = 50;
    float dist12 = dist(x1,y1,x2,y2);
    float y[] = new float[subdiv];
    float a; //sine wave's amplitude
    color stColor = color(map(index,0,num,0,255),255,180,90);  //stroke color
    
    for(int i=0; i<subdiv; i++){
      a = 35*sin(map(frameCount%frameNum,0,frameNum,0,TWO_PI)+index/75);
//      y[i] = a*sin( map(i,0,subdiv,0,TWO_PI) + map(frameCount%frameNum,0,frameNum,0,TWO_PI) );
      y[i] = a*sin(map(i,0,subdiv-1,0,TWO_PI));
    }
    
    //draw index number
    textFont(font);
    textSize(8);
    textAlign(CENTER,CENTER);
    fill(0,20,180,192);
    float textX1 = (radius+15+20*index/num)*cos(atan2(y1,x1));
    float textY1 = (radius+15+20*index/num)*sin(atan2(y1,x1));
    text(index,textX1,textY1);

    pushMatrix();  //____________________________________pushMatrix
    translate(x1,y1);
    rotate(atan2((y2-y1),(x2-x1)));
    
    
    //write sine wave
    for(int i=0; i<subdiv-1; i++){
      strokeWeight(0.3*index/num +0.2);
      stroke(stColor);
      line(i*dist12/(subdiv-1), y[i], (i+1)*dist12/(subdiv-1), y[i+1]);
    }

    //draw line (x1,y1) to (x2,y2)
//    line(0,0,dist12,0);

    //draw circle on circle
//    strokeWeight(1);
//    fill(stColor,150);
//    ellipse(0,0,sp1*5,sp1*5);
//    ellipse(dist12,0,sp2*5,sp2*5);
    
    popMatrix();  //____________________________________popMatrix
  }
}


void fadeToWhite(int alp){
  fill(255,alp);
  rect(-10,-10,width+20,height+20);
}

  
void drawBg(){
  //three circles
  stroke(200);
  strokeWeight(0.8);
  ellipse(0,0,radius*2+75,radius*2+75);
  strokeWeight(0.3);
  ellipse(0,0,radius*2+25,radius*2+25);
  strokeWeight(0.8);
  ellipse(0,0,radius*2,radius*2);
}


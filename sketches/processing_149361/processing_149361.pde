
//GrÃ¶Ã�e des Spielblobs
int xSize;
int ySize;

//Startpunkt des Spielblobs
int xKoordinate=150;
int yKoordinate=60;

//Ankerpunkt erste Feder
int x0=xKoordinate-20;
int y0=yKoordinate-30;

//Ankerpunkt zweite Feder
int x1=xKoordinate+20;
int y1=yKoordinate-30;

//Startgeschwindigkeit
float vx=0f;
float vy=0f;

//Physikalische Konstanten
float mass=0.1f;
float spring=0.01f;
float gravity=9.81f;
float deltat=0.2f;
float friction=0.01f;


//Ankerpunkte in Sechstel-Spielfeldbreiten
int[] xCoords=new int[]{1,2,3,4,5,
                        1,2,3,4,5,
                        1,2,3,4,5,
                        1,2,3,4,5,
                        1,2,3,4,5};
int[] yCoords=new int[]{1,1,1,1,1,
                        2,2,2,2,2,
                        3,3,3,3,3,
                        4,4,4,4,4,
                        5,5,5,5,5};
int[] anchorState=new int[]{0,1,1,1,0, 1,1,0,1,1, 1,0,1,0,1, 1,1,0,1,1, 0,1,1,1,0};

int anchorSize;

//Verwaltungsvariablen
int spielFeldGroesse;
boolean gameover=false;
boolean free=false;
int state=1;
int timer=0;

//KÃ¼nstlerischer Ausdruck
color figurFarbe=color(200,30,30);
color hintergrundFarbe=color(220,220,180);

//PunktezÃ¤hler
int score;

void setup(){
    size(600,600);
    ellipseMode(CENTER);
    textAlign(LEFT,CENTER);
    prepareSpielFeld();
}

void mouseClicked(){
  int clickedAnchor=-1;
  for(int i=0;i<anchorState.length;i++){
    if(dist(xCoords[i],yCoords[i],mouseX,mouseY)<anchorSize/2&&anchorState[i]==1){
      clickedAnchor=i;
      anchorState[i]=0;
      break;
    }
  }
  if(clickedAnchor>-1||gameover){
    free=!free;
    state+=1;
    if(state>2)state=1;
  }
  updateFederAnker();    
}

void updateFederAnker(){ 
  if(free){
    if(state==1){
      x0=mouseX;
      y0=mouseY;
      }else{
        x1=mouseX;
        y1=mouseY;
      }
      free=false;
  }
}

void draw(){
  drawSpielFeld();
  drawSpielFigur();
  updatePhysics();
  updateScore();
  drawScoreBoard();
}

void drawSpielFeld(){
  background(hintergrundFarbe);
  drawAnchors();
}

void drawSpielFigur(){
    //Federn zeichnen - die, die als nÃ¤chste versetzt wird, in grÃ¼n!
    fill(0,0,0,0);

    if(state==2) stroke(50,200,0);
    else stroke(0,0,0);
    line(x0,y0,xKoordinate,yKoordinate);
    ellipse(x0,y0,5,5);
    
    if(state==1) stroke(50,200,0);
    else stroke(0,0,0);
    line(x1,y1,xKoordinate,yKoordinate);
    ellipse(x1,y1,5,5);


    //Spielblob zeichnen
    stroke(0,0,0);
    fill(figurFarbe);
    ellipse(xKoordinate,yKoordinate,xSize,ySize);
}

void drawAnchors(){
    for(int i=0;i<xCoords.length;i++){
        stroke(0);
        if(anchorState[i]==1){
            fill(50,50,150);
        }else if(anchorState[i]==2){
            fill(150,50,50);       
        }else{
            fill(50,150,50,2);
        }
        ellipse(xCoords[i],yCoords[i],anchorSize,anchorSize);
    }
}

void updateScore(){
    for(int i=0;i<xCoords.length;i++){
        if(anchorState[i]==1&&dist(xCoords[i],yCoords[i],xKoordinate,yKoordinate)<=(xSize+anchorSize)/2)
            anchorState[i]=2; //berÃ¼hrt!            
    }
}

void drawScoreBoard(){
    score=anchorState.length;
    for(int i:anchorState){
        if(i==0)score--;
    }
    textSize(30);
    fill(0);
    text("Score: "+score+"\nTime: "+timer,width-200,40);
    boolean someleft=false;
    for(int i:anchorState){
        if(i==1)someleft=true;
    }
    if(!someleft){
        text("Game Over!",width/2-150,height/2);
        gameover=true;
        friction=1e-4;
    }else timer=frameCount;
}

void updatePhysics(){
    float Fx=0;
    //Schwerkraft
    float Fy=gravity*mass;
    //Federn
    Fy-=spring*(yKoordinate-y0);
    Fx-=spring*(xKoordinate-x0);
    Fy-=spring*(yKoordinate-y1);
    Fx-=spring*(xKoordinate-x1);
    //Reibung
    Fy-=friction*vy;
    Fx-=friction*vx;
    //v=v0+a*t=F*t/m
    vy+=Fy*deltat/mass;
    vx+=Fx*deltat/mass;
    //s=s0+v*t
    yKoordinate+=vy*deltat;
    xKoordinate+=vx*deltat;
}

void prepareSpielFeld(){
    spielFeldGroesse=width;
    for(int i=0;i<anchorState.length;i++){
      xCoords[i]=xCoords[i]*spielFeldGroesse/6;
      yCoords[i]=yCoords[i]*spielFeldGroesse/6;
    }
    anchorSize=spielFeldGroesse/12;
    xSize=spielFeldGroesse/25;
    ySize=spielFeldGroesse/25;
}






int xKoordinate=150;
int yKoordinate=30;

int x0=xKoordinate-10;
int y0=yKoordinate;
int x1=xKoordinate+10;
int y1=yKoordinate;

float vx=0;
float vy=0;

float mass=0.1f;
float spring=0.01f;
float gravity=9.81f;
float deltat=0.2f;
float friction=0.01f;

int xSize=20;
int ySize=20;

int[] xCoords=new int[]{100,200,300,400,100,200,300,400,100,200,300,400,100,200,300,400};
int[] yCoords=new int[]{100,100,100,100,200,200,200,200,300,300,300,300,400,400,400,400};
int[] anchorState=new int[]{1,1,1,1, 1,1,1,1, 1,1,1,1, 1,1,1,1};
int anchorSize=40;
boolean gameover=false;
boolean free=false;
int state=1;

color figurFarbe=color(200,30,30);
color hintergrundFarbe=color(220,220,180);

int spielFeldGroesse=500;
int score=anchorState.length;

void setup(){
    size(spielFeldGroesse,spielFeldGroesse);
    ellipseMode(CENTER);
    textAlign(LEFT,CENTER);
}

void mouseClicked(){
    int clickedAnchor=-1;
    for(int i=0;i<anchorState.length;i++){
        if(dist(xCoords[i],yCoords[i],mouseX,mouseY)<anchorSize&&anchorState[i]==1){
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
    
}


void draw(){
    background(hintergrundFarbe);
    score=anchorState.length;
    for(int i:anchorState){
        if(i==0)score--;
    }
    textSize(30);
    fill(0);
    text("Score: "+score,width-200,40);
    boolean someleft=false;
    for(int i:anchorState){
        if(i==1)someleft=true;
    }
    
    if(!someleft){
        text("Game Over!",width/2-150,height/2);
        gameover=true;
        friction=1e-4;
    }
    for(int i=0;i<xCoords.length;i++){
        stroke(0);
        if(anchorState[i]==1){
            fill(50,50,150);
        }else if(anchorState[i]==2){
            fill(150,50,050);
            
        }else{
            fill(50,150,50,2);
        }
        ellipse(xCoords[i],yCoords[i],anchorSize,anchorSize);
    }
    fill(figurFarbe);
    if(state==2)stroke(50,200,0);else stroke(0,0,0);
    line(x0,y0,xKoordinate,yKoordinate);
    if(state==1)stroke(50,200,0);else stroke(0,0,0);
    line(x1,y1,xKoordinate,yKoordinate);
    stroke(0,0,0);
    ellipse(xKoordinate,yKoordinate,xSize,ySize);
    updatev();
    yKoordinate+=vy*deltat;
    xKoordinate+=vx*deltat;
    for(int i=0;i<xCoords.length;i++){
        if(anchorState[i]==1&&dist(xCoords[i],yCoords[i],xKoordinate,yKoordinate)<=(xSize+anchorSize)/2)
            anchorState[i]=2;
            
    }
    if(free){
        if(state==1){
        x0=mouseX;
        y0=mouseY;
        }else{
            x1=mouseX;
            y1=mouseY;
        }
        free=false;
    }else{
        fill(0,0,0,0);
        ellipse(x0,y0,5,5);
        ellipse(x1,y1,5,5);
    }
}

void updatev(){
    float Fx=0;
    float Fy=gravity*mass;
    float sprlen=dist(xKoordinate,yKoordinate,x0,y0);
 
    Fy-=spring*(yKoordinate-y0);
    Fx-=spring*(xKoordinate-x0);
    Fy-=spring*(yKoordinate-y1);
    Fx-=spring*(xKoordinate-x1);
    Fy-=friction*vy;
    Fx-=friction*vx;
    vy+=Fy*deltat/mass;
    vx+=Fx*deltat/mass;
}

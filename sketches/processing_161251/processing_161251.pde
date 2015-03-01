
boolean[][] DLA;
int DLAMode = 2;
float DLAStickyness = .3;
Mover[] movers;
int nbMovers = 200000;

void setup(){
    size(1000,1000);
    background(0);
    stroke(255);
    
    initDLA();
    showDLA();
    initMovers();
}

void initDLA(){
    DLA = new boolean[width][height];
    for(int x=0; x<width;x++){
        for(int y=0; y<width;y++){
            if(sqDist(x,y,width/2, height/2)<85200 && sqDist(x,y,width/2, height/2)>84800) DLA[x][y] = true;
            else DLA[x][y] = false;
        }
    }
    
    //DLA[width/2][height/2] = true;
}

void showDLA(){
for(int x=0; x<width;x++){
        for(int y=0; y<width;y++){
            if(DLA[x][y]) point(x,y);
        }
    }
}

void initMovers(){
    movers = new Mover[nbMovers];
    for(int i=0; i<nbMovers; i++){
        movers[i] = new Mover(int(random(width)), int(random(height)));
    }
}

void draw(){
    background(0);
    for(int i=0; i<nbMovers; i++){
        if(!movers[i].isStuck){
            movers[i].update();
            movers[i].checkDLA();
            movers[i].display();
        }
    }
    
    showDLA();
    filter(BLUR,0.8);
}

int sqDist(int x1, int y1, int x2, int y2){
    return sq(x1-x2)+sq(y1-y2);
}

void keyPressed(){
    initDLA();
    showDLA();
    initMovers();
}

class Mover{
    int x, y;
    boolean isStuck = false;
    
    Mover(int _x, int _y){
        x = _x;
        y = _y;
    }
    
    void update(){
        x += round(random(-1,1));
        x = constrain(x, 1, width-2);
        y += round(random(-1,1));
        y = constrain(y, 1, height-2);
    }
    
    void checkDLA(){
        if(random(1) < DLAStickyness && sqDist(x,y,width/2,height/2)<90000){
            switch(DLAMode){
                case 0:
                    if(DLA[x][y-1] || DLA[x+1][y] || DLA[x][y+1] || DLA[x-1][y]){
                        isStuck = true;
                        DLA[x][y] = true;
                    }
                    break;
                case 1:
                    if(DLA[x-1][y-1] || DLA[x+1][y-1] || DLA[x+1][y+1] || DLA[x-1][y+1]){
                        isStuck = true;
                        DLA[x][y] = true;
                    }
                    break;
                case 2:
                    if(DLA[x][y-1] || DLA[x+1][y] || DLA[x][y+1] || DLA[x-1][y] 
                       || DLA[x-1][y-1] || DLA[x+1][y-1] || DLA[x+1][y+1] || DLA[x-1][y+1]){
                        isStuck = true;
                        DLA[x][y] = true;
                    }
                    break;
            }
        }
    }
    
    void display(){
        if(isStuck){
            point(x,y);
        }
    }
}

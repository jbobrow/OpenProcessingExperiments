
int x=100;
int y=100;

int x1=250;
int y1=250;

int r1=20;
int r2=40;

void setup(){
    size(400,400);
}

void draw(){
    background(200,100,100);
    ellipse(x,y,r1,r1);
    ellipse(x1,y1,r2,r2);
    
    if(dist(x1,y1,x,y)<(r1+r2)/2){
        fill(200,0,0);
    }else{
        fill(0,200,0);
    }
}



void keyPressed(){
    if(key=='w'){
        y=y-10;
    }
    else if(key=='a'){
        x=x-10;
    }
    else if(key=='s'){
        y=y+10;
    }
    else if(key=='d'){
        x=x+10;
    }
}

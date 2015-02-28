
int x1=100;
int y1=100;

int x2=250;
int y2=250;

int w1=20;
int w2=40;

int h1=20;
int h2=20;

int punkte=0;
void setup(){
    size(400,400);
}

void draw(){
    if(mouseY>y1+h1)y1+=5;
    else if(mouseY<y1)y1-=5;
    
    //Kollisionsabfrage
    boolean kollision=false;
    if(x1+w1>x2){
        if(x1<x2+w2){
            if(y1+h1>y2){
                if(y1<y2+h2){
                    fill(200,0,0);
                    kollision=true;
                }
            }
        }
    }
    
    if(kollision){
        fill(200,0,0);
    }else{
        fill(0,200,0);
    }
    
    background(200,100,100);
    rect(x1,y1,w1,h1);
    rect(x2,y2,w2,h2);
    
    //Rechteck bewegen!
    
    x2-=3;
    
    
    
    if(x2<0-w2||kollision){//"ODER"    
        if(kollision)punkte++;
        else punkte--;
        x2=width;
        y2=round(random(height-h2));
    }
    
    
    punkteAnzeige();
}

void punkteAnzeige(){
    fill(0);
    textSize(15);
    text(punkte+" Punkte",20,20);
}

void reagiere(){
}


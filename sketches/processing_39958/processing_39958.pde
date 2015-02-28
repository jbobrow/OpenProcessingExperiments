
int x1=0;
int y1=0;
int x2=0;
int y2=0;
int rad=0;
void setup(){
    size(900,450);
    background(255);
    frameRate(1000);
    x1=0;
    y1=0;
    x2=0;
    y2=0;
    rad=0;
}
 
void draw(){
    if(mousePressed){
        if(mouseButton==LEFT){
            line(pmouseX,pmouseY,mouseX,mouseY);
          
            if(rad==1){
                line(x1,y1,mouseX,mouseY);
            }  
        }           
    }
    if(keyPressed){
        if((key=='q')||(key=='Q')){
            ellipse(mouseX,mouseY,20,20);
        }
        if((key=='w')||(key=='W')){
            rectMode(CENTER);
            rect(mouseX,mouseY,20,20);
            rectMode(CORNER);
        }
        if((key=='a')||(key=='A')){
            line(mouseX-10,mouseY-10,mouseX+10,mouseY+10);
            line(mouseX+10,mouseY-10,mouseX-10,mouseY+10);
        }
        if((key=='s')||(key=='S')){
            fill(255);
            stroke(255);
            ellipse(mouseX,mouseY,20,20);
        }
        if((key=='r')||(key=='R')){
            setup();
        }
        if((key=='j')||(key=='J')){
            stroke(0);
            fill(255);
        }
        if((key=='d')||(key=='d')){
          stroke(0);
          fill(0);
        }
        if((key=='f')||(key=='F')){
          stroke(255,0,0,128);
          fill(255,0,0,128);
        }
        if((key=='g')||(key=='G')){
          stroke(0,255,0,128);
          fill(0,255,0,128);
        }
        if((key=='h')||(key=='H')){
          stroke(0,0,255,128);
          fill(0,0,255,128);
        }
    }
}
 
void mouseReleased(){
    if(mouseButton==RIGHT){
        if(rad==0){
            x1=mouseX;
            y1=mouseY;
            rad=1;
        }else{
            x2=mouseX;
            y2=mouseY;
            line(x1,y1,x2,y2);
            rad=0;
        }
    }
}  

                
                                                                                                                

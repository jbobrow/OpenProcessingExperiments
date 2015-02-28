
color red=color(200,0,0);
color yellow=color(255,255,0);
color blue=color(0,0,200);
color selected=blue;
color clicked=blue;
 
void setup(){
    size(300,300);
    background(255,255,200);
}
 
void draw(){
    if(mousePressed){
        if(constrain(mouseY,200,250)==mouseY){
            if(constrain(mouseX,50,100)==mouseX){
                clicked=red;
            }
            if(constrain(mouseX,110,160)==mouseX){
                clicked=yellow;
            }
            if(constrain(mouseX,170,220)==mouseX){
                clicked=blue;
            }
        }
        if(constrain(mouseY,50,100)==mouseY&&constrain(mouseX,125,175)==mouseX){
                selected=clicked;
        }
    }
    fill(red);
    rect(50,200,50,50);
    fill(yellow);
    rect(110,200,50,50);
    fill(blue);
    rect(170,200,50,50);
    fill(selected);
    rect(125,50,50,50);
    fill(clicked);
    rect(15,150,270,10);
    
}
    

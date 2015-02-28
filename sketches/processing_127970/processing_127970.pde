
color red=color(200,0,0);
color green=color(0,200,0);
color blue=color(0,0,200);
color gelb=color(200,200,30);
color zwischenSpeicher=blue;
color selected=blue;
 
void setup(){
    size(300,300);
    background(gelb);
}
 
void draw(){
    if(mousePressed){
        if(constrain(mouseY,200,250)==mouseY){
            if(constrain(mouseX,50,100)==mouseX){
                zwischenSpeicher=red;
            }else
            if(constrain(mouseX,110,160)==mouseX){
                zwischenSpeicher=green;
            }else
            if(constrain(mouseX,170,220)==mouseX){
                zwischenSpeicher=blue;
            }
        }
        if(constrain(mouseY,50,100)==mouseY&&constrain(mouseX,170,220)==mouseX){
            selected=zwischenSpeicher;
        }
    }
    fill(red);
    rect(50,200,50,50);
    fill(green);
    rect(110,200,50,50);
    fill(blue);
    rect(170,200,50,50);
    fill(selected);
    rect(170,50,50,50);
    fill(zwischenSpeicher);
    rect(20,180,260,10);
}

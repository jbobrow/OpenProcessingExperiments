
color red=color(200,0,0);
color green=color(0,200,0);
color blue=color(0,0,200);
color red=color(200,0,0);
color selected=red;
void setup(){
    size(300,300);
    background(200,200,30);
}
  
void draw(){
    if(mousePressed){
        if(constrain(mouseY,200,250)==mouseY){
            if(constrain(mouseX,50,100)==mouseX){
                selected=red;
            }else
            if(constrain(mouseX,110,160)==mouseX){
                selected=green;
            }else
            if(constrain(mouseX,170,220)==mouseX){
                selected=blue;
            }
        }
        if(constrain(mouseY,50,100)==mouseY&&constrain(mouseX,170,220)==mouseX){     
        selected=blue   
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
}

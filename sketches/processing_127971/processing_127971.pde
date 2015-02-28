
color red=color(200,0,0);
color green=color(0,200,0);
color blue=color(0,0,200);
color selected=blue;
 
void setup(){
    size(300,300);
    background(1000,1000,1000);
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
    }
    fill(selected);
    rect(110,140,50,50);
    fill(red);
    rect(50,200,50,50);
    fill(green);
    rect(110,200,50,50);
    fill(blue);
    rect(170,200,50,50);
    noFill()
    rect(110,50,50,50);
    if(mousePressed){
        if(constrain(mouseY,60,110)==mouseY){
            if(constrain(mouseX,110,220)==mouseX){
                    fill(selected);
                    rect(110,50,50,50);}}
            }

}

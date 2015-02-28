
color red=color(200,0,0);
color green=color(0,200,0);
color blue=color(0,0,200);
color gelb=color(200,200,30);
color zwischenSpeicher=blue;
color selected=blue;

float setrot=0f;
float setscal=1f;

void setup(){
    size(300,300);
    textAlign(CENTER,CENTER);
}

void draw(){
    background(gelb);
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
            if(selected==red) {
                setrot+=PI/32f;
            }else if(selected==blue){
                setscal+=0.02f;
            }else if(selected==green){
                setscal-=0.02f;
            }
        }
    }

    fill(150,170,170);
    pushMatrix();
    translate(195,75);
    rotate(setrot);
    scale(setscal);
    rect(-25,-25,50,50);
    fill(0);
    translate(0,-1);
    scale(3);
    rotate(PI/2f);
    text(": )",0,0);
    popMatrix();

    fill(red);
    rect(50,200,50,50);
    fill(green);
    rect(110,200,50,50);
    fill(blue);
    rect(170,200,50,50);
    fill(zwischenSpeicher);
    rect(45,180,180,10);
}



var start=false;
int ranR=0;
int ranG=0;
int ranB=0;
var num=true;

void setup(){
    size(400,300);
    println("Hello World");
}

//continous function
void draw(){
    if(num){
        for(int i=0;i<20;i++){
            fill(ranR,ranG,ranB);
            ellipse(i*20+10,150,20,20);
        }
        num=false;
    }
    fill(ranR,ranG,ranB);
    if(start) ellipse(mouseX,mouseY,20,20);
}

void mouseClicked(){
    if(start) start=false;
    else start=true;
    ranR = floor(random(255));
    ranG = floor(random(255));
    ranB = floor(random(255));
}

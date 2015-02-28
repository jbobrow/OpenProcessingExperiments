
int x1;
int x2;
int x3;
int x4;
int y1;
int y2;
int y3;
int y4;
int lastMouseX=-1;
int lastMouseY=-1;

void setup() {
    size (400,400);
    background(0,156,255);
    fill(0,156,0);
    noStroke();
    rect(0,350,400,50);
    fill(120,68,33);
    noStroke();
    triangle(0,400,60,360,120,400);
    stroke(120,68,33);
    strokeWeight(10);
    line(0,100,0,400);
    stroke(160,90,44);
    strokeWeight(10);
    line(10,100,10,400);
    stroke(120,68,33);
    strokeWeight(10);
    line(20,100,20,400);
    stroke(160,90,44);
    strokeWeight(10);
    line(30,100,30,400);
    stroke(120,68,33);
    strokeWeight(10);
    line(40,100,40,400);
    stroke(160,90,44);
    strokeWeight(10);
    line(50,100,50,400);
    stroke(120,68,33);
    strokeWeight(10);
    line(60,100,60,400);
    fill(0,0,0);
    noStroke();
    ellipse(30,250,50,75);
    fill(255,random(255),0);
    noStroke();
    ellipse(30,10,250,250);
    fill(255,random(255),0);
    x1=138;
    y1=51;
    x2=186;
    y2=40;
    x3=169;
    y3=83;
    x4=130;
    y4=96;
}

void draw() {
    quad(x1,y1,x2,y2,x3,y3,x4,y4);
    x1=x1+1;
    x2=x2+1;
    x3=x3+1;
    x4=x4+1;
    if(x4>=400){
        x1=8;
        x2=56;
        x3=39;
        x4=0;
        fill(255,random(255),0);
    }
    y2=y2+1;
    y1=y1+1;
    y3=y3+1;
    y4=y4+1;
    if(y4>=400){
        y1=11;
        y2=0;
        y3=43;
        y4=56;
        fill(255,random(255),0);
    } 
}

void mousePressed() {
    fill(255,255,0);
    noStroke();
    ellipse(mouseX,mouseY,200,200);
    if(lastMouseX !=-1){
    line(lastMouseX,lastMouseY,mouseX,mouseY);
    }
    lastMouseX=mouseX;
    lastMouseY=mouseY;
}

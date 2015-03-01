
int x = 0;
int y = 10;
int n = 50;
int left=0;
int right=0;
int speedUp=10;

void setup() {
size(600,600);
}
void draw() {
background(255);
ellipse(left,right,n,n);
line(left,right,x,x);

left=left+10;
right=right+10;

if ((left> width) || (left < 0)) {    
speedUp = speedUp * -1;
}
if ((right>height)||(right<0)){
speedUp=speedUp/-1;
}

}



void mousePressed() {
y=y+speedUp;
}
 
void keyPressed() {
//Stop draw()
noLoop();

//Start draw()
loop();
}


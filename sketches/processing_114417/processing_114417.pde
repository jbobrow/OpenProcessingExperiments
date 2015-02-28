
int lc = 20;
int rc = 460;
void setup(){
size(700,500);
background(193,66,66);
rect(lc,lc,rc,rc);
}

void draw(){
 //background(random(255));
//line( 350,250,100,250);
//line( mouseX,mouseY,100,250);
if(mousePressed){
line( mouseX,mouseY,pmouseX,pmouseY);
}
}




//placement
int d= 60;

void setup(){
size(300,300);
background(#00F4FF);
}


void draw(){

rectMode(CENTER);
fill(#FFA600);
rect(150,150,d,d);
rectMode(CORNER);
fill(#00FF8E,100);
rect(150,150,d,d);

}

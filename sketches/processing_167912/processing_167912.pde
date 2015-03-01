
void setup(){
size(400,400);
}

void draw(){
drawFace(200,300);
drawFace(100,100);
}
void drawFace(int x,int y){
rect(x,y,50,50);
rect(x+10,y+10,10,10);
rect(x+30,y+10,10,10);
}

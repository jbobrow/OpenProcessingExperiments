

void setup(){
size(600,600);
background(200);
smooth();
}

void draw(){
  //frameRate(10);


for (int i = 0 ; i <= 200; i++){
drawX(int(random(-255,255)),int (random(100)), int(random(20)),int(random(-50,width)),int(random(-50,height)),random(10,30));




}
//noLoop();
}

void drawX(int tono, int transp, int grosor, int X, int Y, float largo){
stroke(tono,transp);
strokeWeight(grosor);
line(X,Y,X+largo,Y+largo);
line(X+largo,Y,X,Y+largo);

}

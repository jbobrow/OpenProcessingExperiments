
void setup(){

size(402,402);
strokeWeight(4);

for(int i=1;i<=401;i+=50){
for(int j=1;j<=401;j+=50){
point(i,j);
}
}


}


void draw(){
strokeWeight(1);


if (mousePressed){

  if (mouseButton == RIGHT){
line(mouseX,mouseY,mouseX+50,mouseY);
}else{line(mouseX,mouseY,mouseX,mouseY+50);}

}
}


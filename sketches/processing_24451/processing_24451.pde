

void setup(){
size (300, 600);
background (255,252,183);
smooth();

}

void draw(){

strokeWeight(4.5);

stroke(205,8,250,180);//purple
noFill();
for (int i=20; i< 3000; i+=40) {
  arc (500, 0, i + 15, i + 15, 0, PI);
}

stroke(68,198,18,180);//green
noFill();
for (int i=20; i< 3000; i+=40){
  arc(500, 1000, i+15, i+15, 0, PI+HALF_PI);
}


strokeWeight(4);//orange
stroke(252,59,59,160);
noFill();
for (int i=20; i< 3000; i+=40){
  arc(0, 1000, i+15, i+15,0, TWO_PI+HALF_PI);
}

strokeWeight(3.5);//blue
stroke(15,221,255,160);
noFill();
for (int i=20; i< 3000; i+=40){
  arc(0, 1000, i+2, i+2,0, TWO_PI+HALF_PI);
}



stroke(255,96,15,160);//red
noFill();
for (int i=20; i< 3000; i+=40) {
  arc (500, 0, i + 2, i + 2, 0, PI);
}
stop();
endRecord();
}





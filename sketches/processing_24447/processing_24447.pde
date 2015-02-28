

void setup() {
size (300, 600);
background (255,252,183);
smooth ();
}

void draw(){
strokeWeight(5);

stroke(205,8,250,100);
noFill();
for (int i=20; i< 3000; i+=40) {
  arc (500, 0, i + 15, i + 15, 0, PI);
}


stroke(205,8,250,160);
noFill();
for (int i=20; i< 3000; i+=40){
  arc(500, 1000, i+15, i+15, 0, PI+HALF_PI);
stop();
}

}



 


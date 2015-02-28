
void setup() {
  size(700,700);
noFill();
smooth();
strokeWeight(70);
background(255);
strokeCap(SQUARE);
stroke(150, 100);
}
 
// PI 3.14  180deg  radians(180)
// arc(300,300, 100,100,   0,PI+HALF_PI);
 void draw(){
   
    background(255);
int x = millis();
    
arc(700/2,700/2, 150,150,   radians(320+x/16), radians(340+x/16)); 

arc(700/2,700/2, 150,150,   radians(270+x/20), radians(318+x/20));

arc(700/2,700/2, 150,150,   radians(342+x/25), radians(350+x/25));

arc(700/2,700/2, 250,250,   radians(50), radians(180));

arc(700/2,700/2, 250,250,   radians(190), radians(220));

arc(700/2,700/2, 350,350,   radians(270), radians(360));

arc(700/2,700/2, 450,450,   radians(200), radians(300));

arc(700/2,700/2, 550,550,   radians(0), radians(180));

 }
//

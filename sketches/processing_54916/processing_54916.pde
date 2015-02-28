
void setup(){
  size(600,400);
}
void draw(){
 //Cara
 noStroke();
 fill(255);
 ellipse(300,200,100,100);
   
 //Ojos
 fill(0,150,250);
 ellipse(280,178,15,30);
 ellipse(320,178,15,30);
 fill(255);
 ellipse(280,177,10,20);
 ellipse(320,177,10,20);
 fill(0);
 ellipse(280,178,4,4);
 ellipse(320,178,4,4);
 
 //Naríz
 fill(255,0,0);
 ellipse(300,200,20,20);
 
 //Boca
 ellipse(275,220,20,20);
 rect(280,211,49,19);
 ellipse(325,220,20,20);
 strokeWeight(4);
 stroke(255);
 line(270,220,330,220);
}

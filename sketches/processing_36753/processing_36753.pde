
void setup(){
size(300,300); //canvas size
smooth();      //anti aliasing

//background
background          ( 240 , 240 , 255 );
}

void draw(){
 
//size(640,640); //canvas size
//nose
noFill();
fill (250 , 100 , 10 );
stroke(  150 , 0  , 0 );
strokeWeight ( 3 );
bezier(105, 99, 98, 122, 34, 189, 80, 165);

//mouth
fill(255,255,255);
beginShape();
vertex(50,200);
bezierVertex(58, 210, 66, 210, 170, 200);
bezierVertex(166, 310, 58,210 ,50,200);
endShape();

/*
bezier(50, 200, 58, 210, 66, 210, 170, 200);
bezier(50, 200, 58, 210, 166, 310, 170, 200);
*/

fill(#FFA544);
beginShape();
vertex(449,489);
bezierVertex(400,424,268,417,211,489);
//bezierVertex(500,424,268,317,211,489);
bezierVertex(275,440,385,437,449,489);
endShape();

//eyes
int eyeMeetx=200;
int eyeMeety=70;
int eyeStartx=130;
int eyeStarty=70;

line(eyeStartx,eyeStarty,eyeMeetx,eyeMeety);
line(eyeStartx+10,eyeStarty+30,eyeMeetx,eyeMeety);

int eye2ox=100;
line(eyeStartx-eye2ox,eyeStarty,eyeMeetx-eye2ox-20,eyeMeety);
line(eyeStartx+10-eye2ox,eyeStarty+30,eyeMeetx-eye2ox-20,eyeMeety);

//pupils
//arc(eyeMeetx, eyeMeety, 70, 70, PI, TWO_PI-PI/2);
arc(eyeMeetx-3, eyeMeety+2, 70, 70, PI-PI/7, PI);
arc(eyeMeetx-3-eye2ox-20, eyeMeety+2, 70, 70, PI-PI/5.2, PI);
//arc(eyeMeetx, eyeMeety, 70, 70, PI+PI/3, PI);

//ear
arc(240, 130, 20, 120, PI+PI/7, TWO_PI+3);
stroke (200,200,200);
noFill();
arc(240, 190, 20, 30, -PI/3, PI+PI/3);

//Grill
noFill();
stroke(0,0,0);
beginShape();
vertex(68, 226);
vertex(70, 198);
vertex(78, 240);
vertex(88, 198);
vertex(98, 246);
vertex(110, 198);
vertex(112, 258);
vertex(134, 194);
vertex(136, 262);
vertex(150, 192);
vertex(160, 244);
endShape();

} //end of face

void mousePressed(){
  println (mouseX + "   " + mouseY);
  println ("hoop");
}



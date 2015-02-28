
// Name: Tzu-Yi (Zoe) Lu, Andrew ID: tzuyil
// Computing for the Arts with Processing
// Zoe Lu copyright 2012
size (400, 400);
background (176, 224, 242);
smooth ();

int x;
int y;

//**** bg decoration ****//
for(x=0; x<400;x+=80){
  for(y=0; y<400; y+=10){
    stroke(253, 255, 167);
    noFill();
    arc(x, x, y, y, 0, TWO_PI+PI/2);
  }
}    


//**** Y ****//
noStroke();
fill(82, 200, 203);
quad(50, 50, 125, 50, 215, 200, 150, 200);
quad(275, 50, 350, 50, 250, 200, 185, 200);
quad(150, 200, 250, 200, 230, 350, 170, 350);
fill(45, 157, 160);
quad(60, 55, 120, 55, 210, 200, 155, 200);
quad(280, 55, 340, 55, 245, 200, 190, 200);
quad(155, 195, 245, 195, 225, 345, 175, 345);
fill(126, 229, 232);
quad(70, 60, 115, 60, 205, 200, 162, 200);
quad(285, 60, 330, 60, 240, 200, 195, 200);
quad(160, 190, 240, 190, 220, 340, 180, 340);

//**** T ****//
//first stroke of T 
for (x=10;x<190;x+=10){
  for(y=100;y<150;y+=10){
    strokeWeight(5);
    stroke(255, 150, 21);
    line(x+10, y, x, y+10);
  }
}
//second stroke of T
for(x=79;x<125;x+=10){
  for(y=151;y<300;y+=10){
    strokeWeight(5);
    stroke(255, 150, 21);
    line(x+10, y, x, y+10);
  }
}
//**** L ****//
//first stroke of L
for(x=210;x<260;x+=10){
  for(y=100;y<300;y+=10){
    strokeWeight(5);
    stroke(255, 150, 21);
    line(x+10, y, x, y+10);
  }
}
//second stroke of L
for(x=260;x<390;x+=10){
  for(y=260;y<300;y+=10){
    strokeWeight(5);
    stroke(255, 150, 21);
    line(x+10, y, x, y+10);
  }
}
//outline of T
noStroke();
fill(255, 255, 255);
rect(8, 90, 180, 10);
rect(8, 90, 10, 70);
rect(183, 90, 10, 70);
rect(8, 150, 72, 10);
rect(130, 150, 63, 10);
rect(125, 150, 10, 160);
rect(70, 150, 10, 160);
rect(70, 300, 65, 10);
//outlint of L
rect(210, 90, 50, 10);
rect(202, 90, 10, 220);
rect(260, 90, 10, 170);
rect(260, 250, 130, 10);
rect(383, 250, 10, 60);
rect(202, 300, 185, 10);

//saveFrame( "hw1.jpg" );
                

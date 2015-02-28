
int r = 0;
int g = 0;
int b = 0;
int f = 3;

void setup () {
background (255) ;
size (500,500);

}

void draw () {
fill (255);
rect (0,45,30,65);
  ellipseMode(CENTER);
  fill (0);
ellipse (15,50,3,3);
  fill (0);
ellipse (15,65,5,5);
  fill (0);
ellipse (15,80,7,7);
  fill (0);
ellipse (15,95,10,10);


fill (255);
rect (0,0,500,40);
fill (0);
rect (15,15,15,15) ;
fill (255,0,0);
rect (40,15,15,15);
fill (0,255,0);
rect (65,15,15,15) ;
fill (0,118,26);
rect (90,15,15,15) ;
fill (0,0,142);
rect (115,15,15,15) ;
fill (10,245,211);
rect (140,15,15,15) ;
fill (245,238,10);
rect (165,15,15,15) ;
fill (250,99,23);
rect (190,15,15,15) ;
fill (231,23,255);
rect (215,15,15,15) ;
fill (255);
rect (240,15,15,15) ;
textSize(20);
fill (0,0,255);
text("DrawIt", 270, 30);  
fill (10,245,211);
text("By Gil Gerstel", 350, 30);
fill (0);

text("Press R to reset workspace", 230, 70);
  if (keyPressed) {
    if (key == 'r' || key == 'R') {
      background (255);
    }

  fill (255);
 rect (0,0,500,40);
fill (255);
rect (0,45,30,65);
  ellipseMode(CENTER);
  fill (0);
ellipse (15,50,3,3);
  fill (0);
ellipse (15,65,5,5);
  fill (0);
ellipse (15,80,7,7);
  fill (0);
ellipse (15,95,10,10);

  fill (0);
rect (15,15,15,15) ;
fill (255,0,0);
rect (40,15,15,15);
fill (0,255,0);
rect (65,15,15,15) ;
fill (0,118,26);
rect (90,15,15,15) ;
fill (0,0,142);
rect (115,15,15,15) ;
fill (10,245,211);
rect (140,15,15,15) ;
fill (245,238,10);
rect (165,15,15,15) ;
fill (250,99,23);
rect (190,15,15,15) ;
fill (231,23,255);
rect (215,15,15,15) ;
fill (255);
rect (240,15,15,15) ;
textSize(20);
fill (0,0,255);
text("DrawIt", 270, 30);  
fill (10,245,211);
text("By Gil Gerstel", 350, 30);
}
}
void mouseDragged () {
    strokeWeight(f);
 stroke(r,g,b);
line(pmouseX,pmouseY,mouseX,mouseY);
strokeWeight (0);
stroke (0);
}
void mouseClicked () {
  if (mouseY>15 && mouseY<30){
   if (mouseX<30 && mouseX>15){
    r = 0;
    g = 0;
    b = 0;
  }
    if (mouseX<55 && mouseX>40){
    r = 255;
    g = 0;
    b = 0;
  }

  if (mouseX<80 && mouseX>65){
    r = 0;
    g = 255;
    b = 0;
  }
    if (mouseX<105 && mouseX>90){
    r = 0;
    g = 118;
    b = 26;
  }
    if (mouseX<130 && mouseX>115){
    r = 0;
    g = 0;
    b = 142;
  }
    if (mouseX<155 && mouseX>140){
    r = 10;
    g = 245;
    b = 211;
  }
    if (mouseX<180 && mouseX>165){
    r = 245;
    g = 238;
    b = 10;
  }
    if (mouseX<205 && mouseX>190){
    r = 250;
    g = 99;
    b = 23;
  }
    if (mouseX<230 && mouseX>215){
    r = 231;
    g = 23;
    b = 255;
  }
    if (mouseX<255 && mouseX>240){
    r = 255;
    g = 255;
    b = 255;
  }
}
if (mouseX<25 && mouseX>5){
 if (mouseY<53 && mouseY >47){
f = 3;
 }
if (mouseY<70 && mouseY>60){
f = 5;
} 
if (mouseY<87 && mouseY>73){
f = 5;
}
if (mouseY<105 && mouseY>85){
f = 10;
}
}
}

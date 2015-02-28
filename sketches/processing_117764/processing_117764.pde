
float leftbutton=0;
float rightbutton=0;
float upbutton=0;
float zbutton=0;



void setup(){
size(600,600,P3D);

}

void draw () {
background(0);

stroke (255);
noFill();
box(200);

//camera(eyeX, eyeY, eyeZ, centerX, centerY, centerZ, upX, upY, upZ)
camera (leftbutton,upbutton,mouseY,mouseX,0,0,0,0,1);

}


void keyPressed() {
 if (key == CODED) { if (keyCode == LEFT) {  upbutton = upbutton-10;  } else if (keyCode == RIGHT) { upbutton = upbutton+10;} } else {upbutton = upbutton+0; }
  if (key == CODED) { if (keyCode == LEFT) {  leftbutton = leftbutton+10;  } else if (keyCode == RIGHT) { leftbutton = leftbutton-10;} } else {leftbutton = leftbutton+0; }
  
   if (key == CODED) { if (keyCode == UP) {  leftbutton = leftbutton+10;  } else if (keyCode == DOWN) { leftbutton = leftbutton-10;} } else {leftbutton = leftbutton+0; }
   if (key == CODED) { if (keyCode == UP) {  upbutton = upbutton+10;  } else if (keyCode == DOWN) { upbutton = upbutton-10;} } else {upbutton = upbutton+0; }
   

}

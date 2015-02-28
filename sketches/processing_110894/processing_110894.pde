
//Hon Hin Yee, Jam
//Scene1: Typhoon form
//Scene2: Lines in 3D space

void setup() {
size(600, 600);
smooth();
  frameRate(500);
  background(0);
}
int frame =0;

void draw() {
  //for structure of first scene
    for (int e=0;e<frame-20;e++) {
      noFill();
      stroke(0,50);
      strokeWeight(0);
      quad(50, 10+e, 550-e, 50, 550, 550-e, 50+e, 550); //add quad
    for (int j=0; j<600; j += 50) {
    stroke(255,50);
    strokeWeight(1);
    line(random(width), j, 0, 0);  //flash lines from top left corner
    line(random(width), j, 600, 0); //flash lines from top right corner
    line(random(width), j, 0, 600); //flash lines from botton left corner
    line(random(width), j, 600, 600); //flash lines from botton right corner
      }
   
    }
    
  //if structure to second scene
if (mousePressed == true) {   //If hold pressing mouse
  background(0);
strokeWeight(1);
for (int i=0;i<frame-10;i++) { //line1 (Delay 10 frame)
stroke(255);
line(40*i, 600, 0, 0);
}

for (int i=0; i<frame-15; i++) { //line2 (Delay 15 frame)
stroke(0);
line(600-i*40, 600, 600, 0);
}

for (int i=0; i<frame-20; i++) { //line3 (Delay 20 frame)
stroke(0);
line(30*i, 600, 0, 0);
}

for (int i=0; i<frame-25; i++) { //line4 (Delay 25 frame)
stroke(255);
line(600-i*30, 600, 600, 0);
}

for (int i=0; i<frame-30; i++) { //line5 (Delay 30 frame)
stroke(255);
line(20*i, 600, 0, 0);
}

for (int i=0; i<frame-35; i++) { //line6 (Delay 35 frame)
stroke(0);
line(600-i*20, 600, 600, 0);
}

for (int i=0; i<frame-40; i++) { //line7 (Delay 40 frame)
stroke(0);
line(10*i, 600, 0, 0);
}

for (int i=0; i<frame-45; i++) { //line8 (Delay 45 frame)
stroke(255);
line(600-i*5, 600, 600, 0);
  } 
  
for (int i=0; i<frame-50; i++) { //line9 (Delay 50 frame)
stroke(0);
line(5*i, 600, 0, 0);
}

for (int i=0; i<frame-55; i++) { //line10 (Delay 55 frame)
stroke(255);
line(600-i*2, 600, 600, 0);
  } 
  
for (int i=0; i<frame-60; i++) { //line11 (Delay 60 frame)
stroke(0);
line(2*i, 600, 0, 0);
}

  
}
  else { //go back to scene1)
    stroke(0);
  }

frame++;
 
if (keyPressed) { // Press Keyboard to restart
frame= 0;
}

}

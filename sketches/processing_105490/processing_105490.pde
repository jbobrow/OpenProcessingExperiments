
color white = color(255);
color gray = color(220, 220, 220);
boolean silent;
int note;

void setup() {
  background(255);
  size(1000, 400, P2D); 
  noStroke();
  silent = true;


}

void draw() {

if (mouseY < 350){
  play();
}
if(mouseY > 350){
silentWhiteKey(silent);
}




println(mouseY);
// println(mouseX);
// println(note);

playedWhiteKey(note,0, 100, 350, white, gray);
  


      silentBlackKeys(silent);
}

void playedWhiteKey(int x, int y, int w, int h, color c1, color c2) {
  beginShape();
  stroke(0);
  strokeWeight(.5);
   fill(c1);
  vertex(x,y);
  vertex(x+w,y);
  fill(c2);
  vertex(x+w,y+h);
  vertex(x,y+h);
  endShape();
}

void silentWhiteKey(boolean silent){
  
    for(int i=0;i<10; i++){
     fill(255);
     stroke(0);
     strokeWeight(.5);
     rect(0+(i*100),0,100,350);
    }
}

void silentBlackKeys(boolean silent){
  fill(0);
  noStroke();
  rect(0,0,30,250);  
  rect(170,0,60,250);
  rect(270,0,60,250);
  rect(470,0,60,250);
  rect(570,0,60,250);
  rect(670,0,60,250);
  rect(870,0,60,250);
  rect(970,0,60,250);
}




void play(){

if (mouseX >=0 && mouseX <=100){
  note=0;
 }
 
 if(mouseX >=100 && mouseX <=200){
note=100;
}
if (mouseX >=200 && mouseX <=300){
  note=200;
 }
 
 if(mouseX >=300 && mouseX <=400){
note=300;
}
if (mouseX >=400 && mouseX <=500){
  note=400;
 }
 
 if(mouseX >=500 && mouseX <=600){
note=500;
}
if (mouseX >=600 && mouseX <=700){
  note=600;
 }
 
 if(mouseX >=700 && mouseX <=800){
note=700;
}
 if(mouseX >=800 && mouseX <=900){
note=800;
}

if (mouseX >=900 && mouseX <=1000){
  note=900;
 }
else{
silentWhiteKey(silent);
}

}

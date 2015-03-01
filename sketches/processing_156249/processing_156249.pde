
boolean move1;
boolean wrong1;
boolean move2;
boolean wrong2;
boolean move3;
boolean move3P;

int wrong2PosX;
int wrong2PosY;

void setup(){
  size (800,250); //200 extra
  move1=false;
  wrong1=false;
  move2=false;
  wrong2=false;
  move3=false;
  move3P=false;
  wrong2PosX=160;
  wrong2PosY=0;
}

void draw(){
  background (255);
  fill(0);
  rect(0,0,400,240);
  
  fill(255,102,102);
  rect (0,0,40,40); //start yellow sq
  
  fill(102,255,255);
  rect (40,0,40,40);//blue sq
  
  fill(255,255,102);
  rect(360,200,40,40); //finish yellow sq
  
  textSize(12);
  fill(0);
  text("Help Dorthy get home.",420,20);
  text("Build the yellow brick road by choosing the red or the blue pill.",420,40);

  move1True();
  wrong1True();
  move2True();
  wrong2True(int(random(0,5)));
  move3True();
//  move3PTrue();
  
  
if (mouseX>40 && mouseX<80 && mouseY>0 && mouseY<40) {
  if(mousePressed) {
  move1=true;
  wrong1=false;
  }
}

if (mouseX>0 && mouseX<40 && mouseY>0 && mouseY<40){
  if (mousePressed) {
    wrong1=true;
  }
}
if (move1==true && mouseX>120 && mouseX<160 && mouseY>0 && mouseY<40){
  if(mousePressed) {
    move2=true;
  }
}
if(move1==true && mouseX>160 && mouseX<200 && mouseY>0 && mouseY<40){
  if(mousePressed) {
    wrong2=true;
  }
}
if(move1==true && move2==true && mouseX>0 && mouseX<40 && mouseY>200 && mouseY<240){
  if(mousePressed) {
    move3=true;
}
}

}

void move1True(){
if (move1==true){
  fill(255,255,102);
  rect(0,0,120,40);
  fill(255,102,102);
  rect(120,0,40,40);
  fill(102,255,255);
  rect(wrong2PosX,wrong2PosY,40,40);
  }
}
  
void wrong1True(){
if (wrong1==true){
  fill(random(200,250), random(200,250), random (200,250));
  rect(0,0,40,40);
}
}

void move2True(){
  if (move2==true){
    fill(255,255,102);
    rect(120,0,40,80); //yellow
    fill(255,255,102); 
    rect(80,80,40,40);
    fill(255,255,102);
    rect(40,120,40,40);
    fill(255,255,102);
    rect(0,160,40,40);
    fill(102,255,255);
    rect(0,200,40,40);
    fill(255,102,102);
    rect(40,200,40,40);
    
  }
}

void wrong2True(int x){
  if (wrong2==true){
    wrong2PosY=wrong2PosY+x;
  }}
  
  void move3True(){
    if(move3==true){
      fill(255,255,102);
      rect(0,200,360,40);
      fill(255,255,102);
      rect(360,200,40,40);
      fill(102,255,255);
      rect(0,40,120,40);
      fill(102,255,255);
      rect(0,80,80,40);
      fill(102,255,255);
      rect(0,120,40,40);
      fill(102,255,255);
      rect(160,0,240,40);
      fill(102,255,255);
      rect(160,40,240,40);
      fill(102,255,255);
      rect(120,80,280,40);
      fill(102,255,255);
      rect(80,120,320,40);
      fill(102,255,255);
      rect(40,160,360,40);
      
      textSize(24);
      fill(0);
      text("There's no place like home!", 410,230);
      
    }}




PFont myFont;

void setup(){
size(800,400);
background(0,255,0);
smooth();
noStroke();
myFont=loadFont("Skia-Regular_Light-24.vlw");
textFont(myFont);
text("CLICK",0,100);
text("CLICK",730,100);
fill(255);
}

void draw(){
fill(0,0,0);
rect(0,0,70,70);
stroke(0);
strokeWeight(5);

rect(727,0,70,70);

//  drawCircle(40,35,30);
//fill(random(50,255),random(40,200),random(70,250));
//
//drawCircle(40,35,20);
//fill(random(0,200),random(40,80),random(70,150));
//drawCircle(40,35,10);
//fill(random(100,255),random(50,100),random(150,250));
            }


void keyPressed(){

  if(key=='e'){
  ellipse(mouseX,mouseY,50,50);
  }
  }

void mouseClicked(){
if(mouseX<=70&& mouseX>=0&& mouseY<=70&&mouseY>=0){
  
for (int i=0; i<width; i++){
  for(int j=0;j<height;j++){  
  
  ellipse(10* i, 10*j, 20, 20);}
  fill(random(100,255),random(50,100),random(150,250));
    }
  }
if(mouseX<=800&&mouseX>=727&&mouseY<=70&&mouseY>=0){
 for (int i=0; i<width; i++){
  for(int j=0;j<height;j++){  
  
  ellipse(10* i, 10*j, 20, 20);}
 fill(random(0,30),random(200,250),random(70,150));
    }
}
}
// void mousePressed(){
// if(mouseX <700 && mouseX>300 && mouseY < 400&& mouseY>200);
// fill(249,50,50);
// ellipse(mouseX,mouseY,5,5);
// }
//  




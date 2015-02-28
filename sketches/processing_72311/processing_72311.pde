
//no is the saddest experience you'll ever know
//so elliott smith says 'say yes'.
//margot's sketch, sketch!
color fillColor;
boolean button = false;
int dir;
int xPos;



void setup(){
  size(750,600);
  smooth();
  strokeWeight(.2);
  dir=1;
  xPos=0;
 
}

void draw(){
  background(fillColor);
  if(mouseX < 200){
    fillColor=color(#E559F5);
  }else if(mouseX > 200 && mouseX < 400){
    fillColor=color(#7559F5);
  }else{
    fillColor=color(#59B0F5);
  }
 noFill();
  for(int i = 0; i < 160; i++){
   // ellipse(mouseX*.5,mouseY,mouseX*.5,mouseY);
   // ellipse(mouseX*.8,mouseY/2,mouseX*2,mouseY/2);
   // ellipse(mouseX,mouseY/3,mouseX*.7,mouseY*.65);
   //ellipse(xPos,100,10,10);
//ellipse(xPos,150,12,12);
//ellipse(xPos,175,15,15);
//ellipse(145,xPos,20,20);
//ellipse(120,xPos,30,30);
ellipse(375,300,xPos,xPos);
ellipse(100,200,xPos,xPos);
ellipse(650,200,xPos,xPos);
ellipse(375,100,xPos,xPos);
ellipse(650,500,xPos,xPos);
ellipse(100,500,xPos,xPos);
ellipse(375,550,xPos,xPos);

xPos+=dir;//use
if(xPos>width){
  dir=-1;
}
if(xPos<0){
  dir=1;
}
  if(mouseX < width/2){
  
  }
    
  }
  for(int i = 0; i < 800; i+=10){
    for(int y = 0; y < 600; y+=10){
      rect(i,y,10,10);
      noFill();
     if(mouseX > i && mouseX < i+20 && mouseY > y && mouseY < y+20) {
    rect(i,y,10,10);
    fill(255);
     }
     
    }
  }
 

for(int i = 0; i < 100; i++){
  fill(255);
  text("one is the loneliest",0,i*12);
  }
  for(int i = 0; i < 200; i++){
    fill(255);
    text("number that you'll ever do",125,i*12);
  }
  for(int i=0; i < 300;i++){
    fill(255);
    text("two can be as bad as one",295,i*12);
  }
  for(int i=0; i< 400;i++){
    fill(255);
    text("it's the loneliest number since the number one",455,i*12);
  }
}



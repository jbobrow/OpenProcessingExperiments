
PImage dr;
int img_x=0;
int img_y=0;
int width_x=0;
int hight_y=0;
int add_amount = 3;
int fillR=0;
int fillG=0;
int fillB=0;
int moveamount=10;
int addx=0;
int addy=0;
void setup(){
size(300,300);
background(180);

}

void draw(){
  dr=loadImage("draw.png");
  image(dr,0,0,300,300);
  
}

void mouseDragged(){
  fill(fillR,fillG,fillB);
  noStroke();
  ellipse(mouseX+addx,mouseY+addy,width_x+add_amount,hight_y+add_amount);
}

void keyPressed(){
  if(key == 'b'){
  add_amount=3;
  }else if (key=='a') {
  background(180);
  }else if(key=='c'){
  add_amount=6;
  }else if(key=='d'){
  add_amount=15;
  }else if(key=='e'){
  fillR=200;
  fillG=50;
  fillB=50;
  }else if(key=='f'){
  fillG=200;
  fillB=50;
  fillR=50;
  }else if(key=='g'){
  fillR=0;
  fillG=0;
  fillB=0;
  }if (keyCode==RIGHT){
    ellipse(150+addx,150+addy,3,3);
  addx=addx+1;
  }if (keyCode==LEFT){
    ellipse(150+addx,150+addy,3,3);
  addx=addx-1;
  }if (keyCode==UP){
    ellipse(150+addx,150+addy,3,3);
  addy=addy-1;
  }if(keyCode==DOWN){
    ellipse(150+addx,150+addy,3,3);
  addy=addy+1;
}
}


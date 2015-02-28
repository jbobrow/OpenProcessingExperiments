
void setup(){
  size(400,400);
}//尺寸


void draw(){
   background(255);
  if(mousePressed){
stroke(220,100,70,120);
strokeWeight(50);//按下線條
background(230);
noFill();
ellipse(mouseX,mouseY,150,150);//圓圈
stroke(220,100,70,50);


  }else{
    stroke(220,200,10,200);
    strokeWeight(20);//線條
  }
line(mouseX,mouseY,mouseX*2,mouseY/2);
line(mouseX,mouseY,mouseX+100,mouseY-50);
line(mouseX,mouseY,mouseX-50,mouseY+120);
}


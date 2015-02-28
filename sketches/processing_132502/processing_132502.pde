
void setup(){
  
  
  size(1000,500);      
  background(255);
  smooth();
  frameRate(8);
  
}


void mouseClicked() {
  setup();
}




void draw(){
  
  
noStroke();

fill(255,255,2555,20);
rect(0,0,1000,500);

float color1=random(0,255);
float color2=random(0,255);
float color3=random(0,255);
float color4=random(0,255);
float color5=random(0,255);
float color6=random(0,255);
float color7=random(0,255);
float color8=random(0,255);
float color9=random(0,255);
float color10=random(0,255);
float color11=random(0,255);
float color12=random(0,255);

float size1=random(160,300);
float size2=random(100,150);
float size3=random(50,100);
float size4=random(10,50);

float circleX=random(0,1000);
float circleY=random(0,500);

float size1=size2+size3+size4;

float size1b=size1+30;
float size1c=size1b+50;

float opacity1=random(150,200);
float opacity2=opacity1-20;
float opacity3=opacity2-20;
float opacity4=opacity3-20;
float opacity5=opacity4-20;
float opacity6=opacity5-20;

fill(color1,color2,color3,opacity4);
ellipse(circleX,circleY,size1,size1);

fill(color4,color5,color6,opacity3);
ellipse(circleX,circleY,size2,size2);

fill(color7,color8,color9,opacity2);
ellipse(circleX,circleY,size3,size3);

fill(color10,color11,color12,opacity1);
ellipse(circleX,circleY,size4,size4);

noFill();
stroke(color1,color5,color9,opacity5);
strokeWeight(3);
ellipse(circleX,circleY,size1b,size1b);

stroke(color2,color6,color10,opacity6);
strokeWeight(5);
ellipse(circleX,circleY,size1c,size1c);

}

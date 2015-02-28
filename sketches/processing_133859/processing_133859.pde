
void setup(){
  
  
  size(600,600);      
  background(255);
  smooth();

  
}


void mouseClicked() {
  setup();
}




void draw(){
  
  
noStroke();

fill(255,255,255,5);
rect(0,0,600,600);

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

float size1=random(80,170);
float size2=random(50,100);
float size3=random(20,50);
float size4=random(10,20);

float size1=size2+size3+size4;

float size1b=size1+30;
float size1c=size1b+50;

float opacity1=random(150,200);
float opacity2=opacity1-20;
float opacity3=opacity2-20;
float opacity4=opacity3-20;
float opacity5=opacity4-20;
float opacity6=opacity5-20;

float circle1X=map(mouseX,0,600,0,300);
float circle1Y=map(mouseY,0,600,300,300);


//circle1
fill(color1,color2,color3,opacity4);
ellipse(circle1X,circle1Y,size1,size1);
fill(color4,color5,color6,opacity3);
ellipse(circle1X,circle1Y,size2,size2);
fill(color7,color8,color9,opacity2);
ellipse(circle1X,circle1Y,size3,size3);
fill(color10,color11,color12,opacity1);
ellipse(circle1X,circle1Y,size4,size4);
noFill();
stroke(color1,color5,color9,opacity5);
strokeWeight(3);
ellipse(circle1X,circle1Y,size1b,size1b);
stroke(color2,color6,color10,opacity6);
strokeWeight(5);
ellipse(circle1X,circle1Y,size1c,size1c);

//circle2
fill(color1,color2,color3,opacity4);
ellipse(circle1Y,circle1X,size1,size1);
fill(color4,color5,color6,opacity3);
ellipse(circle1Y,circle1X,size2,size2);
fill(color7,color8,color9,opacity2);
ellipse(circle1Y,circle1X,size3,size3);
fill(color10,color11,color12,opacity1);
ellipse(circle1Y,circle1X,size4,size4);
noFill();
stroke(color1,color5,color9,opacity5);
strokeWeight(3);
ellipse(circle1Y,circle1X,size1b,size1b);
stroke(color2,color6,color10,opacity6);
strokeWeight(5);
ellipse(circle1Y,circle1X,size1c,size1c);

//circle3
fill(color1,color2,color3,opacity4);
ellipse(map(circle1X,0,600,600,0),map(circle1Y,0,600,600,0),size1,size1);
fill(color4,color5,color6,opacity3);
ellipse(map(circle1X,0,600,600,0),map(circle1Y,0,600,600,0),size2,size2);
fill(color7,color8,color9,opacity2);
ellipse(map(circle1X,0,600,600,0),map(circle1Y,0,600,600,0),size3,size3);
fill(color10,color11,color12,opacity1);
ellipse(map(circle1X,0,600,600,0),map(circle1Y,0,600,600,0),size4,size4);
noFill();
stroke(color1,color5,color9,opacity5);
strokeWeight(3);
ellipse(map(circle1X,0,600,600,0),map(circle1Y,0,600,600,0),size1b,size1b);
stroke(color2,color6,color10,opacity6);
strokeWeight(5);
ellipse(map(circle1X,0,600,600,0),map(circle1Y,0,600,600,0),size1c,size1c);

//circle4
fill(color1,color2,color3,opacity4);
ellipse(map(circle1Y,0,600,600,0),map(circle1X,0,600,600,0),size1,size1);
fill(color4,color5,color6,opacity3);
ellipse(map(circle1Y,0,600,600,0),map(circle1X,0,600,600,0),size2,size2);
fill(color7,color8,color9,opacity2);
ellipse(map(circle1Y,0,600,600,0),map(circle1X,0,600,600,0),size3,size3);
fill(color10,color11,color12,opacity1);
ellipse(map(circle1Y,0,600,600,0),map(circle1X,0,600,600,0),size4,size4);
noFill();
stroke(color1,color5,color9,opacity5);
strokeWeight(3);
ellipse(map(circle1Y,0,600,600,0),map(circle1X,0,600,600,0),size1b,size1b);
stroke(color2,color6,color10,opacity6);
strokeWeight(5);
ellipse(map(circle1Y,0,600,600,0),map(circle1X,0,600,600,0),size1c,size1c);



}



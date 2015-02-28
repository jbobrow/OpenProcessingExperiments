
void setup(){

//Scene 1
size(300,300);
colorMode(RGB);
background(229,125,28);

//base lines
line(0,120,width/4,120);
line(0,270,width/4,270);

//top person
line(20,120,40,90);
line(width/4-20,120,40,90);
line(40,90,40,50);
ellipseMode(CENTER);
noFill();
ellipse(40,40,20,20);
line(40,70,50,80);
line(40,70,50,60);

//bottom balls
ellipseMode(CENTER);
fill(0);
ellipse(20,260,20,20);
ellipse(50,240,30,30);


}

//Scene 2
void draw(){

if(mouseX<width/4){



}else{
  
background(157,110,65);
stroke(0);

//Base lines
line(width/4,120,width/2,120);
line(width/4,270,width/2,270);

//Top Person
line(100,100,110,90);
line(100,100,90,80);
line(110,90,120,120);
line(110,90,110,50);
ellipseMode(CENTER);
noFill();
ellipse(110,40,20,20);
line(110,70,120,80);
line(110,70,120,60);

//Bottom balls
ellipseMode(CENTER);
fill(0);
ellipse(100,220,30,30);
ellipse(130,170,20,20);

}
//Scene 3
if(mouseX<width/2){



}else{
  
background(139,104,70);
stroke(0);

//Base Lines
line(width/2,120,225,120);
line(width/2,270,225,270);

//Top Person
line(190,90,220,120);
line(170,100,160,90);
line(190,90,170,100);
line(190,90,200,50);
ellipseMode(CENTER);
noFill();
ellipse(200,40,20,20);
line(195,70,205,80);
line(195,70,210,60);

//Bottom balls
ellipseMode(CENTER);
fill(0);
ellipse(200,170,30,30);
ellipse(170,240,20,20);


}
//Scene 4
if(mouseX<225){



}else{
  
background(62,54,47);
stroke(0);

//Base Lines
line(225,120,300,120);
line(225,270,300,270);

//Top Person
line(260,90,240,120);
line(270,110,260,120);
line(260,90,270,110);
line(260,90,290,50);
ellipseMode(CENTER);
noFill();
ellipse(290,40,20,20);
line(275,70,285,80);
line(275,70,290,60);

//Bottom balls
ellipseMode(CENTER);
fill(0);
ellipse(250,240,30,30);
ellipse(280,210,20,20);


}



stroke(128);

line(width/4,0,width/4,height);
line(width/2,0,width/2,height);
line(225,0,225,height);
line(0,height/2,width,height/2);

}



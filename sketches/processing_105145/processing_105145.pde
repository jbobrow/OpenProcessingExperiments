


int X=mouseX;
int y=0;
PImage weapon;
PImage img;
PImage yo;
PImage scoreboard;
float []Xz= new float[500];

float []Xx= new float[500];
float []Xy= new float[500];

float []XC= new float[500];
int ct=0;
void setup(){
 
  size(1850,1000);
  img=loadImage("cool-background-random-color.jpg");
image(img,0,0);




for(int i = 0; i<500;i++){
XC[i]=random(1850);
Xz[i]=random(1850);
Xy[i]=random(1850);
Xx[i]=random(1850);
}
}
void draw(){
  fill(42,67,188);
stroke(237,7,7);
 img=loadImage("cool-background-random-color.jpg");
image(img,0,0);
line(mouseX-66, mouseY-5, mouseX-10,mouseY+105);
line(mouseX+67,mouseY-5,mouseX+5,mouseY+115);
quad(mouseX-5,mouseY+110,mouseX+5,mouseY+120,mouseX-10,mouseY+210,mouseX-20,mouseY+220);//left leg//from the worker's view
quad(mouseX+5,mouseY+110,mouseX-5,mouseY+120,mouseX+10,mouseY+220,mouseX+20,mouseY+220);//right leg
quad(mouseX-70,mouseY-20,mouseX-70,mouseY-10,mouseX-10,mouseY+80,mouseX-10,mouseY+70);//left arm
quad(mouseX+67,mouseY-20,mouseX+67,mouseY-10,mouseX,mouseY+95,mouseX,mouseY+85);//right arm
quad(mouseX+10,mouseY+7,mouseX-10,mouseY+7,mouseX-10,mouseY+119,mouseX+10,mouseY+117);//body
ellipse(mouseX,mouseY,60,60);//head250,150 x,y
if(y>1000){
ct++;
y=0;
}else{
ellipse(Xy[ct],y=y+30,50,50);
}
if(y>1000){
ct++;
y=0;

}else{
ellipse(Xx[ct],y=y+30,50,50);
}if(y>1000){
ct++;
y=0;
}
if(y>1000){
ct++;
y=0;
}else{
ellipse(XC[ct],y=y+30,50,50);
}
if(y>1000){
ct++;
y=0;

}else{
ellipse(Xz[ct],y=y+30,50,50);
}if(y>1000){
ct++;
y=0;
}
yo=loadImage("Unknown copy.png");
yo.resize(90,90);
image(yo,mouseX-40,mouseY-50);
scoreboard=loadImage("images-4.png");
image(scoreboard,1550,-10);
loadImage("images.png");
weapon=loadImage("Unknown-1.png");
loadImage("Unknown-1.png");
weapon.resize(70,70);
image(weapon,mouseX+50,mouseY-50);
if(mouseX>Xz[ct]-70 && mouseX<Xz[ct]+70&&mouseY>y-220&&mouseY>y+0){
println("hit");
background(0,0,0);

noLoop();
}
if(mouseX>XC[ct]-70 && mouseX<XC[ct]+70&&mouseY>y-220&&mouseY>y+0){
background(0,0,0);

}
if(mouseX>Xy[ct]-70 && mouseX<Xz[ct]+70&&mouseY>y-220&&mouseY>y+0){
println("hit");
background(0,0,0);

noLoop();
}
if(mouseX>Xx[ct]-70 && mouseX<XC[ct]+70&&mouseY>y-220&&mouseY>y+0){
background(0,0,0);
noLoop();
}


}





boolean happySad=true;
boolean click;
//basics

void setup() {
click=false;
size(600,600);
smooth();
}

void draw() {
flag();
skull(300,250,400);

if(happySad=true){
  smile(300,250,400);
}
else{
  creepyTeeth(300,250,400);
}
eyePatch(300,250,400);
}
void mousePressed(){
  happySad=false;
}

//Eye Patch_____________________________________________________________________
void eyePatch(float x,float y,float sze){
float a = ((sze*1.3)/2);
float b= sze/2;
float c= sqrt((a*a)-(b*b));
float e=c/a;
float l = a*(1-(e*e));
float patchX=0;
float patchY=0;

fill(0);
if(click=true){
  patchX=mouseX;
  patchY=mouseY;
}
else{
  patchX=0;
    patchY=0;
}

strokeWeight(sze/30);
stroke(0);
line(x+c,y-l,patchX,patchY);
line(x-c,y+l,patchX,patchY);
ellipse(patchX,patchY,sze/2,sze/2);

}

  

//Flag_________________________________________________________________________
void flag(){
background(20,20,20);
strokeWeight(100);//blacklines
stroke(50,50,50);
line(0,width,width,0);
line(0,0,width,width);

strokeWeight(60);//grey lines
stroke(80,80,80);
line(0,0,width,width);
line(0,width,width,0);
}

//Skull________________________________________________________________________
void skull(float x,float y,float sze){

noStroke();//upper skull
fill(255);
ellipse(x,y,sze*1.3,sze);

rectMode(CENTER);//jaw
rect(x,y+(sze/2),(sze*0.6)+10,(sze*0.6));

//eye socket right
fill(210,210,210);
ellipse((x+(sze*0.3)),(y+(sze/14)),sze/2,sze/2);

//eye socket left
fill(210,210,210);
ellipse((x-(sze*0.3)),(y+(sze/14)),sze/2,sze/2);

stroke(0);//right eye
strokeWeight(sze/90);
fill(255,220,220);
ellipse((x+(sze*0.3)),(y+(sze/14)),sze/3,sze/3);

fill(255);//left eye
ellipse((x-(sze*0.3)),(y+(sze/14)),sze/2.5,sze/2.5);

fill(95,40,10);//right iris
ellipse((x+(sze*0.3)),(y+(sze/14)),sze/5,sze/5);

fill(95,40,10);//left iris
ellipse((x-(sze*0.3)),(y+(sze/14)),sze/5,sze/5);

noStroke();

fill(0);//right pupil
ellipse((x+(sze*0.3)),(y+(sze/14)),sze/8,sze/8);

fill(0);//left pupil
ellipse((x-(sze*0.3)),(y+(sze/14)),sze/8,sze/8);

fill(0);//nose
triangle((x-(sze/20)),(y+(sze/4)),x,(y+(sze/4.8)),(x+(sze/20)),(y+(sze/4)));

}

// Creepy Teeth_________________________________________________________________
void creepyTeeth(float x,float y,float sze){
  //teeth
strokeWeight(sze/90);
stroke(0);
fill(255);
rect(x,y+(sze/2),(sze*0.1),(sze*0.1));
rect((x+(sze*0.1)),y+(sze/2),(sze*0.1),(sze*0.1));
rect((x-(sze*0.1)),y+(sze/2),(sze*0.1),(sze*0.1));
rect((x-(sze*0.2)),y+(sze/2),(sze*0.1),(sze*0.1));
rect((x+(sze*0.2)),y+(sze/2),(sze*0.1),(sze*0.1));
rect(x,y+(sze/2),(sze*0.1),(sze*0.1));

rect((x+(sze*0.1)),y+(sze/1.65),(sze*0.1),(sze*0.1));
rect((x-(sze*0.1)),y+(sze/1.65),(sze*0.1),(sze*0.1));
rect((x-(sze*0.2)),y+(sze/1.65),(sze*0.1),(sze*0.1));
rect((x+(sze*0.2)),y+(sze/1.65),(sze*0.1),(sze*0.1));
rect(x,y+(sze/1.65),(sze*0.1),(sze*0.1));
noStroke();}

//Smike_________________________________________________________________________
void smile(float x, float y ,float sze)
{
strokeWeight(sze/90);
stroke(0);
fill(255);
rect(x,y+(sze/2),(sze*0.1),(sze*0.1));
rect((x+(sze*0.1)),y+(sze/2),(sze*0.1),(sze*0.1));
rect((x-(sze*0.1)),y+(sze/2),(sze*0.1),(sze*0.1));
rect((x-(sze*0.2)),y+(sze/2),(sze*0.1),(sze*0.1));
rect((x+(sze*0.2)),y+(sze/2),(sze*0.1),(sze*0.1));

fill(255,20,20);
arc((x),y+(sze/1.8),(sze*0.5),(sze*.2),0,PI);
}



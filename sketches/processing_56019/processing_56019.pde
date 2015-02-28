
float r = 255;
float g = 213;
float b = 195;



float eyeR;
float eyeG;
float eyeB;



void setup(){
size(500,700);

smooth();//Turns on smoothing

noStroke();
}


void draw(){
  background(r,g,b);

if(mouseX>width/2){
  r=r+1;
}else{
  r=r-1;
}
  
if(r>255){
  r=255;
}else if (r<195){
  r=195;
}else if (r<213){
  r=213;
}




//Antennae
fill(233,52,14);
triangle(220,150,280,150,250,130);

//HEAD
fill(255,246,146);
rect(150,150,200,100);
fill(125,32,190);
rect(170,170,65,10);
fill(214,43,26);
rect(265,170,65,10);




 eyeR=random(255);
  eyeG=random(255);
  eyeB=random(255);
  fill(eyeR,eyeG,eyeB);
  
rect(180,185,45,10);

 eyeR=random(255);
  eyeG=random(255);
  eyeB=random(255);
  fill(eyeR,eyeG,eyeB);
rect(275,185,45,10);
fill(255,133,133);
rect(180,215,140,30);

//NECK
fill(103,255,217);
rect(220,250,60,20);

//BODY
fill(255,246,146);
rect(140,270,220,200);
fill(103,255,217);
rect(100,280,40,40);
rect(360,280,40,40);
rect(150,470,70,40);
rect(280,470,70,40);
fill(198,255,197);
rect(110,320,20,80);
rect(370,320,20,80);
rect(150,510,70,20);
rect(280,510,70,20);


}


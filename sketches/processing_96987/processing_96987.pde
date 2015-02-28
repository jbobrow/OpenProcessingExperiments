


float posx=20;
float posy=50;
float vx=random(10);
float vy=random(10);

float val=110;


void setup(){
size(1000,1000);
background(#FFFFFF);
}

void draw(){
 
  fill(255);
  rect(0,0,width,height);
posx=posx+vx;
posy=posy+vy;


if((posx>=(width-400))||(posx<=0)){
  vx=-vx;
}
if((posy>=(height-400))||(posy<=0)){
  vy=-vy;
}


//FIGURA

strokeWeight(2);
fill(#23D824);
rect(posx,posy,20,20);
fill(#F59300);
strokeWeight(5);
rect(posx+15,posy+15,40,40);
fill(#23D824);
strokeWeight(10);
rect(posx+35,posy+35,80,80);

//COLOR SEGONS MEITAT
if(posy<=height/2){
fill(#F59300);
}else{
  fill(#C41010);
}
strokeWeight(15);
rect(posx+75,posy+75,160,160);

//COLOR PROGRESSIU
fill(50,posx,posy);
strokeWeight(5);
rect(posx+155,posy+155,245,245);
fill(#C41010);
noStroke();
ellipse(posx+320,posy+320,70,70);
stroke(#000000);
strokeWeight(5);
noFill();
ellipse(posx+320,posy+75,100,50);
ellipse(posx+320,posy+75,50,100);
fill(#000000);

//ELIPSECAMB-----------------------------------------
ellipse(posx+75,posy+320,val,val);
stroke(#000000);
fill(#000000);
ellipse(posx+320,posy+75,30,30);
noFill();
stroke(#000000);
triangle(posx+320,posy+75,posx+75,posy+320,posx+320,posy+320);
noFill();
stroke(#FFFFFF);
ellipse(posx+75,posy+320,100,50);
ellipse(posx+75,posy+320,50,100);

strokeWeight(5);

fill(#000000);
stroke(#000000);
triangle(posx+320,posy+320,posx+320,posy+150,posx+150,posy+320);
fill(#C41010);
triangle(posx+320,posy+320,posx+320,posy+170,posx+170,posy+320);
fill(#FBFF1C);
triangle(posx+320,posy+320,posx+320,posy+190,posx+190,posy+320);
noSmooth();
stroke(#000000);
strokeWeight(3);
 
fill(#FFFFFF);
triangle(posx+310,posy+310,posx+310,posy+215,posx+215,posy+310);
noFill();

// ELLIPSE CAMBIANTE 2
ellipse(posx+320,posy+320,val,val);
smooth();
fill(#FBFF1C);
quad(posx+250,posy+340,posx+220,posy+340,posx+220,posy+360,posx+250,posy+380);
quad(posx+210,posy+340,posx+180,posy+340,posx+180,posy+380,posx+210,posy+360);
triangle(posx+215,posy+370,posx+240,posy+385,posx+190,posy+385);
strokeWeight(3);




//FINAL FIGURA//







  
}

void mousePressed(){
  

posx=mouseX;
posy=mouseY;
if(val==110){
  val=200;
}else{
  val=110;
}


}








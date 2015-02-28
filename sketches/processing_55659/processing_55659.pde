
int movex;
int movey;

void setup(){
size(900,450);
background(0);
smooth();
noFill();
stroke(random(255),random(255),random(255),random(60,80));
movex=0;
movey=0;

}


void draw(){

curve ( movex+100,movey+0,1800,0,0,900,movey+0,movex+100);
strokeWeight(random(0,.1));
stroke(random(255),random(0),random(0),random(60,80));
fill(random(255),random(0),random(0),random(0,2));


movex=movex+1;
movey=movey+100;

if (movex>=width){
  movex=0;
}

if (movey>=height*20){
  movey=0;
}


}



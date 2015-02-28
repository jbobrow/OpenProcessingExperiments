
int movex;
int movey;

void setup(){
size(900,450);
background(0);
smooth();
noFill();
stroke(random(255),random(255),random(255),random(80));
movex=0;
movey=0;

}


void draw(){

bezier( movex+100,movey+0,40,50,100,50,movey+0,movex+100);
strokeWeight(random(5));

movex=movex+10;
movey++;

if (movex>=width){
  movex=100;
}

if (movey>=height){
  movey=100;
}


}


//bezier(x1, y1, cpx1, cpy1, cpx2, cpy2, x2, y2);


//curve(cpx1, cpy1, x1, y1, x2, y2, cpx2, cpy2);


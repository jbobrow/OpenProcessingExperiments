
int j = 100;
int k = 400;
float l = .8;


void setup(){
  size(800,800); 
}

void draw(){
SENSEI();
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      j = j-10;
    } else if (keyCode == RIGHT) {
      j = j+10;
  }
    if (keyCode == UP) {
      l = l-(.01);
    } else if (keyCode == DOWN) {
      l = l+(.01);
}
}
}

void SENSEI(){

scale(l);

//rightfoot/
fill(random(0,255),random(0,255),random(0,255));
quad(j+70,k+250,j+95,k+250,j+60,k+270,j+35,k+270);

//leftfoot/
fill(random(0,255),random(0,255),random(0,255));
quad(j+105,k+250,j+130,k+250,j+155,k+270,j+130,k+270);

//pants//
fill(random(0,255),random(0,255),random(0,255));
rect(j+70,k+150,25,100);
fill(random(0,255),random(0,255),random(0,255));
rect(j+105,k+150,25,100);

//neckline//
triangle(j+80,k+30,j+120,k+30,j+100,k+60);
fill(random(0,255),random(0,255),random(0,255));

//torso//
fill(random(0,255),random(0,255),random(0,255));
rect(j+70,k+30,60,140,15,15,0,0);

//belt//
fill(random(0,255),random(0,255),random(0,255));
rect(j+70,k+130,60,10);

// face //
fill(random(0,255),random(0,255),random(0,255));
ellipse(j+100,k,50,65);

// left eke //
fill(random(0,255),random(0,255),random(0,255));
ellipse(j+90,k,10,3);

// right eke //
fill(random(0,255),random(0,255),random(0,255));
ellipse(j+110,k,10,3);

// hat //
fill(random(0,255),random(0,255),random(0,255));
ellipse(j+100,k-20,60,30);
fill(random(0,255),random(0,255),random(0,255));
rect(j+80,k-65,40,50,5,5,15,15);

//nose//
fill(random(0,255),random(0,255),random(0,255));
arc(j+100,k+10, 10, 5, 0, PI, OPEN);

//smile//
fill(random(0,255),random(0,255),random(0,255));
arc(j+100, k+20, 20, 10, 0, PI);

//righthand//
fill(random(0,255),random(0,255),random(0,255));
ellipse(j+92,k+93,20,25);

line(j+94,k+92,j+101,k+92);
line(j+94,k+96,j+100,k+96);
line(j+94,k+88,j+100,k+88);

//lefthand//
fill(random(0,255),random(0,255),random(0,255));
rect(j+102,k+60,8,43,60,60,0,20);

//rightarm//
fill(random(0,255),random(0,255),random(0,255));
quad(j+70,k+80,j+70,k+40,j+50,k+100,j+50,k+130);

fill(random(0,255),random(0,255),random(0,255));
quad(j+50,k+100,j+50,k+130,j+90,k+110,j+90,k+80);

//left arm//
fill(random(0,255),random(0,255),random(0,255));
quad(j+130,k+80,j+130,k+40,j+150,k+100,j+150,k+130);
 
fill(random(0,255),random(0,255),random(0,255));
quad(j+110,k+110,j+110,k+80,j+150,k+100,j+150,k+130);

}



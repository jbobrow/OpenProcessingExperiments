
//Spider colors (c1= antennas, c2=body and head, c3=eyes, c5=legs, c6=eye dots, c7=mouth

color s_c1= color(0);

color s_c2= color(mouseX,mouseY,69);

color s_c3= color(139,0,0);

color s_c5= color(102,51,0);

color s_c6= color(0);

color s_c7= color(85,83,44);

color s_c8= color(174,0,22);

color s_c9= color(155,196,146);

int mouseColorX = 100;
int mouseColorY = 100;

//spider's local origin
int localX=400;

int localY=400;

void setup(){

size (800,800);

}

boolean bDisplayCreature = true;

void keyTyped() {
  if (key == 'v') {
    bDisplayCreature = !bDisplayCreature;
    }
}
    

void draw(){

background(255);

noStroke();

rectMode(CENTER);

//Move origin point

  if(mousePressed && (mouseButton==LEFT) ) {
    localX=mouseX;
    localY=mouseY;
  
  }
  
  if(bDisplayCreature == true){
    
    draw_spider(localX, localY);
    draw_spider(localX + 250, localY + 250);
    draw_spider(localX - 100, localY + 200);
  }
}

void draw_spider (int x, int y) {
  draw_body(x, y);
  draw_legs(x, y);
  draw_mouth(x,y);
  draw_eyes(x, y);
  draw_antennae( x, y);
}

void draw_legs(int x, int y){
 ellipseMode(CENTER);
//draw legs

stroke (s_c5);

strokeWeight(5);

line(x-88,y-46,x-216,y-103);

line(x-216,y-103,x-254,y+60);

line(x-94,y-20,x-197,y-53);

line(x-197,y-53,x-232,y+62);

line(x-98,y+15,x-192,y-19);

line(x-192,y-19,x-221,y+71);

line(x-90,y+43,x-187,y+9);

line(x-187,y+9,x-207,y+78);

//right side

line(x+88,y-46,x+216,y-94);

line(x+216,y-94,x+264,y+60);

line(x+97,y-20,x+197,y-53);

line(x+197,y-53,x+232,y+62);

line(x+98, y+15, x+192, y-19);

line(x+192,y-19,x+218,y+71);

line(x+90,y+43,x+187,y+9);

line(x+187,y+9,x+207,y+78);

}

void draw_body (int x, int y) {
  
  noStroke ();
  fill(localX+45,localY, 69);
  ellipse(x-0,y-0,x-200,y-200);

  ellipse(x-0,y-150,x-300,y-300);

}

//eyes

void draw_eyes (int x, int y) { 
  noStroke();

fill (s_c3);

if(mousePressed && (mouseButton==RIGHT) ) {
  fill(s_c8);
  
}

ellipse(x-30,y-160,25,35);

ellipse(x-8,y-160,9,12);

ellipse(x+5,y-160,9,12);

ellipse(x+25,y-160,25,35);

//eye points

stroke(0);

point(x-31,y-163);

point(x-31,y-155);

point(x+23,y-154);

point(x+23,y-162);

point(x-8,y-160);

point(x+5,y-160);

}

//mouth

void draw_mouth (int x, int y) {

noStroke();

fill(s_c7);

if(mousePressed && (mouseButton==RIGHT) ) {
  fill(s_c9);
}

ellipse(x-11,y-127,22,40);

ellipse(x+9,y-127,22,40);
}

//antennas

void draw_antennae (int x, int y) {

fill(0);

if(mousePressed && (mouseButton==RIGHT) ) {
  fill(s_c2);
}

noStroke();

rect(x-13,y-200,4,60);

rect(x-44,y-228,58,4);

rect(x+13,y-200,4,60);

rect(x+44,y-228,58,4);



}














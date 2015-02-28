
void setup(){
size(250,250);
background(0);
  
}
  
void draw() {
  
strokeWeight(1);

// blue
stroke(0,0,255);

// blue trianlge 1
line(0,50,50,0);
line(50,0,100,50);
line(0,50,100,50);

// blue triangle 2
line(50,100,100,50);
line(100,50,150,100);
line(50,100,150,100);

// blue triangle 3
line(100,150,150,100);
line(150,100,200,150);
line(100,150,200,150);

// blue triangle 4
line(150,200,200,150);
line(200,150,250,200);
line(150,200,250,200);

// yellow
stroke(255,255,0);

// yellow triangle 1
line(5,55,55,5);
line(55,5,105,55);
line(5,55,105,55);

// yellow triangle 2  
line(55,105,105,55);
line(105,55,155,105);
line(55,105,155,105);

// yellow triangle 3  
line(105,155,155,105);
line(155,105,205,155);
line(105,155,205,155);

// yellow triangle 4
line(155,205,205,155);
line(205,155,255,205);
line(155,205,255,205);
  
//red
stroke(255,0,0);

// red triangle 4  
line(10,60,60,10);
line(60,10,110,60);
line(10,60,110,60);

// red triangle 4  
line(60,110,110,60);
line(110,60,160,110);
line(60,110,160,110);

// red triangle 4  
line(110,160,160,110);
line(160,110,210,160);
line(110,160,210,160);

// red triangle 4  
line(160,210,210,160);
line(210,160,260,210);
line(160,210,260,210);

// green
fill(0,255,0);
stroke(0,255,0);

// small green rectangles
rect(15,15,8,8);
rect(65,65,8,8);
rect(115,115,8,8);
rect(165,165,8,8);
rect(215,215,8,8);

// big green rectangles
rect(210,1,100,100);
rect(-55,150,100,100);
  
if(keyPressed){
if(key==' '){
saveFrame("symbalance.png");
}
}
  
}


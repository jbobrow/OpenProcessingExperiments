


float zoogX;
float zoogY;

float eyeR; //random eye colour
float eyeG;
float eyeB;
int endY;
float x=0;
float y=0;
float xspeed=2.6;
float yspeed=2.5;
float r=32;

void setup(){ 
size (200,200);
smooth();
frameRate(20);
endY=0;
}

void draw (){ 

 
if (mouseX<100 && mouseY<100) {
    background(180,0,180);
    
  }else if (mouseX>100 && mouseY>100){
background(0,60,100);
  }else if(mouseX<100 && mouseY>100){
background(0,30,180);
  }else if (mouseX>100 && mouseY<100){
    background(180,0,0);
  }
    for (int y=0;y<endY; y+=10){
      stroke(0);
      line (0,y,width,y);
    }
    
    endY+=10;
  
  if (endY > height){
    endY=0;
  }
  
  x=x+xspeed;
  y=y+yspeed;
  if ((x>width)||(x<0)){
    xspeed=xspeed*-1;
    r=64;
  }
  
  if ((y>height)|| (y<0)){
    yspeed=yspeed*-1;
    r=100;
  }
  
  stroke(0);
  fill(150,0,0);
  
  

  
ellipseMode(CENTER);
rectMode(CENTER);

// zoog body
if (mouseX<100){ //either true or false
stroke(0);
fill(246,202,165);
rect(x,y,20,100);
fill(255);
}else if(mouseX>100){
  fill(0);
  rect(x,y,50,100);
 
}



// zoog head
fill(246,202,165);
ellipse(x,y-30,60,60);

//zoog antennas
if (mouseX>100){
  stroke(0);
  fill(0);
  triangle(x-60,y+90,x-30,y-55,x-20,y-55);
triangle(x+60,y+90,x+30,y-55,x+20,y-55);
}else if(mouseX<100){
  
triangle(x-60,y-90,x-30,y-55,x-20,y-55);
triangle(x+60,y-90,x+30,y-55,x+20,y-55);
}

// zoog eyes
if (mouseX>100){
  stroke(0);
  fill(0);
  ellipse(x-3,y-10,5,5);
  ellipse(x-19,y-20,10,12);
 ellipse(x+19,y-30,15,15);
}else if(mouseX<100){
eyeR=random(255);
eyeG=random(255);
eyeB=random(255);
fill(eyeR,eyeG,eyeB);
ellipse(x-19,y-30,10,12);
ellipse(x+19,y-30,15,15);
}

// zoog legs
stroke(0);
line(x-10,y+50,x-10,y+60);
line(x+10,y+50,x+10,y+60);

// zoog left hand 
stroke(0);
line(x-10,y+20,x-30,y-10);
line(x+10,y+20,x+30,y+30);


stroke(0);
fill(120,140,80);
ellipse(x-50,y-90,r,r);
ellipse(x+50,y-90,r,r);

r=constrain(r-2,32,100);
}



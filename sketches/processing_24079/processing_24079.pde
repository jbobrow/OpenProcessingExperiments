
int x=100;
int y=100;

float zoogX;
float zoogY;

float eyeR; //random eye colour
float eyeG;
float eyeB;



void setup(){ 
size (200,200);
smooth();
}

void draw (){ 

 
  int x=mouseX;
  int y=mouseY;
   fill(0);
  
  if (mouseX<100 && mouseY<100) {
    background(180,0,180);
      
  }else if (mouseX>100 && mouseY>100){
background(0,60,100);
  }else if(mouseX<100 && mouseY>100){
background(0,30,180);
  }else if (mouseX>100 && mouseY<100){
    background(180,0,0);
  }
  

  
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

x+=2;
y+=1;
}





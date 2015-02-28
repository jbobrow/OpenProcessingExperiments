

int zoogX = 500;
int zoogY = 500;



void setup(){ 
  size(1000,850);
 
  smooth();
}

void draw(){
  println(mouseX + "," + mouseY);
   background(26,143,234);
//Clouds
fill(255,255,255,175);
stroke(0,0,255);
ellipse(300,200,200,100);
ellipse(700,200,200,100);
ellipse(350,150,200,100);
ellipse(650,150,200,100);

//Sun
fill(251,255,54);
stroke(0,0,255);
ellipse(500,100,120,120);
stroke(251,255,54);

//Right
line(500,100,600,300);
line(500,100,400,300);
line(500,100,500,300);
line(500,100,700,300);
line(500,100,784,281);
line(500,100,823,207);
line(500,100,823,155);
line(500,100,823,100);
line(500,100,823,50);
line(500,100,823,0);
line(500,100,700,0);
line(500,100,600,0);
line(500,100,550,0);




//Left
line(500,100,300,300);
line(500,100,200,300);
line(500,100,180,200);
line(500,100,180,100);
line(500,100,180,150);
line(500,100,180,50);
line(500,100,180,0);
line(500,100,370,0);
line(500,100,450,0);
line(500,100,500,0);

  
fill(0,255,0);
stroke(0,0,0);


//Body
rectMode(CENTER);
  rect(zoogX,zoogY,75,224);
  
//Head
fill(0);
ellipseMode(CENTER);
  ellipse(zoogX,zoogY-130,100,110);
  
//Eyes
fill (random (0,255), 0, 0);
ellipseMode(CENTER);
  ellipse(zoogX-30,zoogY-130,25,50);
ellipseMode(CENTER);
  ellipse(zoogX+30,zoogY-130,25,50);
  
//Legs  
line(zoogX+15,zoogY+80,zoogX+115,zoogY+300);
line(zoogX-15,zoogY+80,zoogX-100,zoogY+300);

//Arms
line(zoogX+15,zoogY-50,zoogX+115,zoogY+70);
line(zoogX-15,zoogY-50,zoogX-100,zoogY+70);
fill(185,185,185);

//LightSaber
rect(zoogX-100,zoogY+70,10,30);
fill(252,242,31);
ellipse(zoogX-100,zoogY+50,25,15);
fill(0, 0, random(0,255));
ellipse(zoogX-100,zoogY-70,12,250);

zoogY -= 1;
}



float centreX;
float centreY;
float x;
float y;
float v = 5; 

void setup() {
  size(500,500);
  x = width/2;
  y = height/2;
}
  
void draw() {
  
background(#FFFFFF);
fill(#FFFFFF);
stroke(#000000);
//cap//
ellipse(x,y-100,80,80);
rect(x-40,y-100,80,50);
stroke(#FFFFFF);
line(x-39,y-100,x+39,y-100);
noStroke();
//boca elipse//
fill(#EDCEB6);
ellipse(x,y-75,40,30);
//ulls voltant//
ellipse(x-35,y-100,20,20);
ellipse(x+35,y-100,20,20);
//ulls blanc//
fill(#FFFFFF);
ellipse(x-35,y-100,15,15);
ellipse(x+35,y-100,15,15);
//ulls blau//
fill(random(255),random(255),random(255),random(255));
ellipse(x-39,y-100,8,8);
ellipse(x+39,y-100,8,8);
//ulls negre//
fill(#000000);
ellipse(x-39,y-100,4,4);
ellipse(x+39,y-100,4,4);
//boca linea//
stroke(#000000);
line(x-10,y-75,x+10,y-75);
//cos//
fill(#FFFFFF);
ellipse(x,y,100,100);
stroke(#FFFFFF);
rect(x-100,y-50,200,50);
stroke(#000000);
line(x-50,y,x-40,y-50);
line(x+50,y,x+40,y-50);
//potes//
fill(#FFFFFF);
stroke(#000000);
rect(x-40,y,37,70);
rect(x+3,y,37,70);
stroke(#FFFFFF);
ellipse(x,y,95,99);
//panxa//
fill(#EDCEB6);
noStroke();
ellipse(x,y,40,60);


  float r = random(100);

  if (r < 25) {
    //cap amunt
    y = y - v;
  } 
  else if (r < 50) {
    //cap avall
    y = y +v;
  } 
  else if (r <75) {
    //dreta
    x = x+v;
  } 
  else {
    //esquerra
    x = x-v;
  }
  

  
 float elipsex;
 float elipsey;
 
 fill(#FFA600);
    if (mousePressed == true) {
   elipsex=mouseX;
   elipsey=mouseY;
  } else {
   elipsex=random(500);
   elipsey=random(500);
  }
  
  if (mousePressed == true) {
  
   if (y > mouseY) {
    //cap amunt
    y = y - v;
  } 
  if (y < mouseY) {
    //cap avall
    y = y +v;
  } 
  if (x <mouseX) {
    //dreta
    x = x+v;
  } 
  if (x >mouseX) {
    //esquerra
    x = x-v;
  }
  }
    
         
      ellipse(elipsex,elipsey,20,20);
      
    comprovaLimits();
}

void comprovaLimits() {
  if (x-50<0) {
    x =50;
  }
  if (x+50>width) {
    x=width-50;
  }
  if (y-140<0) {
    y =140;
  }
  if (y+70>height) {
    y=height-70;
  }
      
}











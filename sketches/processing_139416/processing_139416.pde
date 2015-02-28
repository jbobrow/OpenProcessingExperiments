
float w = random(25,75);
float h = random(25,75);
float x = 100;
float y = 100;
float c = color(250,0,0);

void setup() {
  size(600, 600);
  noStroke();
  frameRate(10);
}

void draw() {
      background(250,250,250);
  fill(c);
  rectMode(CENTER);
  rect(random(-20,20)+x,random(-20,20)+y, w, h);
  rect(random(-20,20)+x,random(-20,20)+y, w, h);
  rect(random(-20,20)+x,random(-20,20)+y, w, h);
  rect(random(-20,20)+x,random(-20,20)+y, w, h);


//Outer Bounding Box
if(x<=50){
 x = x+2;
}
if(x>=550){
x = x-2;
}
if(y<= 50){
 y = y+2;
}
if(y>=550){
y = y-2;
}


//Center Box
if ((x>=250) && (x<=450) && (y>=250) && (y<=450)){
 x = x+ random(-300,300); 
 y = y+ random(-300,300);
}

// top left box
if ((x <= 300) && (y<=300)){
  x = x+random(-1,2);
  y = y+random(-1,2);
}


// bottom left box
if ((x <= 300) && (y >= 300)){
  x = x+random(-1,2);
  y = y+random(-1,2);
}


// bottom right box
if ((x >= 300) && (y>=300)){
  x = x+random(-2,1);
  y = y+random(-2,1);
}


// top right box
if ((x >= 300) && (y<=300)){
  x = x+random(-2,1);
  y = y+random(-2,1);
}


}
//Cloud



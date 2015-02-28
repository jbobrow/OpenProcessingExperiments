
float a;
float y;
float aspeed = +1;
float yspeed = -1;
float r = 0; float b = 0; float g = 0;
 
void setup(){
  size(500,500);
  background(0);
  smooth();
  frameRate(30);
  a=100;
  y=450;
  
}

void draw(){
  { background(r,g,b); stroke(0); 
  
  if(mouseX > width/2) { r = r + 1;
} else { r = r - 1;
}
if (mouseY > height/2) { b = b + 1;
} else { b = b - 1;
}
if (mousePressed) { g = g + 1;
} else { g = g - 1;
}
r = constrain(r,0,255); g = constrain(g,0,255); b = constrain(b,0,255);
}
  
  if(y >= 500-45){
    yspeed = yspeed * -1;
  }
   
  if (y<=0+45){
  yspeed = aspeed * -1;
}
 
if(a >= 500-45){
  aspeed = aspeed * -1;
  }
   
if (a<=0+45){
  aspeed = yspeed * -1;
}
   
   
   
   
a= a + aspeed;
y= y + yspeed;
  noStroke();
  fill(a,random(0),random(255),random(100));
  if (!mousePressed) {rect(a,y,random(90),random(90));}
  else { ellipse(a,y,random(200),random(255));;}
 
}




float angle = 10;
float R = 100;
PFont font;
 
size(400, 400);
background(0);
smooth();
noStroke();
colorMode(HSB, 360, 100, 100);
 
float cX = width/2;

////////////////////////////////////////mannaka
  for(int i = 0; i < 360; i += angle) {
  for(int a = 0; a < 360; a += angle) {
    float rad = radians(i);
    float cZ = 200 + R*sin(rad);
///////////////////////////////////////hannbunnyorisita de kieru
    if(cZ > width/2){  
    noFill();  
    }
    else{
  fill(i, 100, 100, a);
  }
  
///////////////////////////////////////en no byouga
  ellipse(200 + R*cos(rad), 200 + R*sin(rad), 10, 10);
  }
}
 
////////////////////////////////////////sayuu
for(int i = 0; i < 360; i += angle) {
  for(int a = 0; a < 360; a += angle) {
    float rad = radians(i);
    float cY = 200 + R*sin(rad);
///////////////////////////////////////hannbunnyoriue de kieru
    if(cY <= width/2){  
    noFill();  
    }
    else{
  fill(i, 100, 100, a);
  }
  
///////////////////////////////////////en no byouga
  ellipse(0 + R*cos(rad), 200 + R*sin(rad), 10, 10);
  ellipse(400 + R*cos(rad), 200 + R*sin(rad), 10, 10);
  }
}
 

 




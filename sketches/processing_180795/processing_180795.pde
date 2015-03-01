

int startX,startY,x,y; // declare int for rect
startX = 100;
startY = 100; 
x = 2;
y = 20;


size(400,400);
colorMode (HSB, 360, 100, 100, 100); //set max for HSB and alpha
background (360,0,0);

float hue, sat, bright, alpha;  //red-pink color
hue = 345;
sat = 100;
bright = 100;
alpha = 80;

noStroke();

for (float j = startY; j<=height; j=j+5){ //repeat across Y
  for(float i = startX; i<=width; i=i+5){ //repeat across X
  fill(hue,sat,bright,alpha); 
  rotate(PI/6);
  rect(i, j, x, y);
  hue = random(280,345);
  alpha = random(50,100);
  } 
}

for (float l = startY-50; l<=height; l=l+5){ //repeat across Y
  for(float k = startX-50; k<=width; k=k+5){ //repeat across X
  fill(hue,sat,bright,alpha); 
  rotate(PI/6);
  rect(k, l, x, y);
  hue = random(240,270);
  alpha = random(0,50);
  } 
}









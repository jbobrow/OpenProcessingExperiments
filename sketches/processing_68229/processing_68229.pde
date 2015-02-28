
//Hello world+Mondrian
size(500, 500);
background (15, 15, 15);
smooth();
noStroke();
color(255,255,255);
rect(0, 0, 100, 150);//rect top left
rect(0, 170, 100, 200);//middle left
int j, i;
for(i=-3, j=100; i<50 ; i=i+1, j=j+7){//page gradient top left
  fill(j,j,j);
  rect(i,0,i,150);
}
for(i=-3, j=100; i<50 ; i=i+1, j=j+8){//page gradient middle
  fill(j,j,j);
  rect(i,170,i,200);
}
fill(55, 140, 255);//fill lower left blue
rect(0, 380, 100, 400);//lower left
fill(255,000,000);
rect(110, 0, 400, 370);//Red Square
fill(255,255,255);
rect(110, 380, 350,200); //white middle bottom
rect(468, 380, 75,60);//white small
fill(245,245,40);
rect(468, 450, 75, 55);//yellow small

//Hello world
for(int f=0; f<50; f++){
  int r=int(random(30, 220));
  textSize(int(random(10, 60)));
  fill(r+random(-15, 15),r+random(-15, 15),r+random(-15, 15));
  text("Hello, World", random(-30, 500), random(-10, 500));
}



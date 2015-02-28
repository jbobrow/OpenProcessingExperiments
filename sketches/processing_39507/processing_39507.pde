
size(400, 400);
background(0);
fill(0, 255, 255, 40);
noStroke();
smooth();

int ili = 0;

//plaid
for (int i = 10; i>0; i--) {
  for (int j = 1; j<10; j++) {
    rect((width/2)-20*i, (height/2)-20*j, width/i, height/j);
  }
}


//arrow
int bobx = 2*width/7;
int boby = height/3;

color red = color(255, 00, 0, 80);
fill(red);

beginShape();
vertex(bobx, boby);
vertex(2*bobx, boby);
vertex(2*bobx + (bobx/2), 2*boby - (boby/2));
vertex(2*bobx, 2*boby);
vertex(bobx, 2*boby);
vertex(bobx + bobx/2, boby + boby/2);
vertex(bobx, boby);
endShape();

//broken circle
noFill();
stroke(0);
strokeWeight(1);
int originX = 2*bobx + (bobx/2);
int originY = 2*boby - (boby/2);
for (int h = 50; h>=h*h/200; h=h+9) {
  if (h % 2 == 0) {
    stroke(0); // black
    strokeWeight(2);
  }
  else {
    stroke(255); // white
    strokeWeight(1);
  }
  arc(originX, originY, h, h, 0, PI/2);
  arc(originX, originY, h*h/13, h*h/13, PI/2, PI);
  arc(originX, originY, h*h/29, h*h/29, PI, TWO_PI-PI/2);
  arc(originX, originY, h*h/47, h*h/47, TWO_PI-PI/2, TWO_PI);
}


/*
for (int i = 10; i<260; i=i+20) {
 fill(i+10%255);
 rect(i, i, width/3, height/3);
 }
 
 */


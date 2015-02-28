

int x = 0;

int columnOne = -50;
float lineOne = 0;
float lineTwo = lineOne-42.5;
float lineThree = lineOne+42.5;
float placeOne = columnOne + random(-50,50);
float placeTwo = placeOne + random(-25,25);

void setup() {
  
  size (250,500);
  background(255);
  strokeWeight(1);
  smooth();
  
}

void draw() {
  
  while (x<8000){
  stroke(193,193,193,random(0,200));
  line (random(-1000,1000),random(-2000,2000),random(-1000,1000),random(-2000,2000));
x=x+1;  
}

while(lineOne<550){
while(placeOne<300){
  
noStroke();

fill(255);
bezier(placeOne,lineOne,placeOne+25,lineTwo,placeOne+65,lineTwo,placeOne+90,lineOne);

fill(0,56,124);
arc(placeOne+45,lineOne,45,45,PI,TWO_PI);

fill(255,234,0);
arc(placeOne+45,lineOne,40,40,PI,TWO_PI);

fill(0,56,124);
arc(placeOne+45,lineOne,30,30,PI,TWO_PI);


fill(255);
bezier(placeTwo,lineOne,placeTwo+25,lineThree,placeTwo+65,lineThree,placeTwo+90,lineOne);

fill(0,56,124);
arc(placeTwo+45,lineOne,45,45,0,PI);

fill(255,234,0);
arc(placeTwo+45,lineOne,40,40,0,PI);

fill(0,56,124);
arc(placeTwo+45,lineOne,30,30,0,PI);

placeOne = placeOne+90;
placeTwo = placeTwo+90;
}

lineOne = lineOne+37.5;
lineTwo = lineOne-42.5;
lineThree = lineOne+42.5;
placeOne = columnOne + random(-15,15);
placeTwo = placeOne + random(-15,15);
}


}


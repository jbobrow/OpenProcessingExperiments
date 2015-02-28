

int columnOne = -50;

int y = 0;
int lineOne = 0;
float lineTwo = lineOne-42.5;
float lineThree = lineOne+42.5;
int count = 0;
int countTwo = 0;

int x = 0;

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
  
while(countTwo<3){
  
  while(count<5){
    
    float placementOne = columnOne+random(0,85);
    
noStroke();
fill(255);
bezier(placementOne,lineOne,placementOne+25,lineTwo,placementOne+65,lineTwo,placementOne+90,lineOne);

fill(0,56,124);
arc(placementOne+45,lineOne,45,45,PI,TWO_PI);

fill(255,234,0);
arc(placementOne+45,lineOne,40,40,PI,TWO_PI);

fill(0,56,124);
arc(placementOne+45,lineOne,30,30,PI,TWO_PI);

placementOne = placementOne + random(-15,15);

fill(255);
bezier(placementOne,lineOne,placementOne+25,lineThree,placementOne+65,lineThree,placementOne+90,lineOne);

fill(0,56,124);
arc(placementOne+45,lineOne,45,45,0,PI);

fill(255,234,0);
arc(placementOne+45,lineOne,40,40,0,PI);

fill(0,56,124);
arc(placementOne+45,lineOne,30,30,0,PI);

//

placementOne = columnOne+random(0,35);


lineOne = lineOne+125;
lineTwo = lineOne-42.5;
lineThree = lineOne+42.5;

count = count+1;
  }
  
count = 0;
columnOne = columnOne+175;
y = 0;
lineOne = 0;
lineTwo = lineOne-42.5;
lineThree = lineOne+42.5;

countTwo = countTwo+1;


}


}



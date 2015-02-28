
float inicio1=0.0;
float fin1= PI*2;
float inicio2=0.63;
float fin2=5.61;
float temp=0.0;

void setup() {

size(400,400);
smooth();
strokeWeight(2);
noStroke();
//fill(247,38,112);
frameRate(5);
ellipseMode(CORNER);


}

void draw(){
  background(0);
  
  fill(255);
  ellipse(mouseX+30,mouseY+10,10,10);
fill(255);

  fill(247,38,112);
  arc(mouseX,mouseY,50,50,inicio1,fin1);

fill(0);
  ellipse(mouseX+4,mouseY+5,25,25);
fill(0);

fill(255);
  ellipse(mouseX+7,mouseY+9,10,10);
fill(255);
  
  temp=inicio1;
  inicio1=inicio2;
  inicio2=temp;
  
 temp=fin1;
 fin1=fin2;
 fin2=temp;
}

//Detalles


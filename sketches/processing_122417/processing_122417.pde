
int monsterX;
int monsterY;

void setup() {
  size(500, 500);
  monsterX=170;
  monsterY=250;
}


void draw() {
  
  monsterY--;
  background(255);
 
  //lichaam
  fill(255, 255, 0);
  noStroke();
  ellipse(mouseX+75, monsterY, 150, 100);
  rect(mouseX, monsterY, 150, 200);

  //armen
  rect(mouseX-40, monsterY+130, 50, 20);
  rect(mouseX+140, monsterY+130, 50, 20);


  //streep
  fill(0);
  rect(mouseX, monsterY+30, 150, 20);


  //linkeroog
  stroke(0);
  fill(0);
  ellipse(mouseX+40, monsterY+40, 60, 60);
  fill(255);
  ellipse(mouseX+40, monsterY+40, 50, 50);
  fill(0);
  ellipse(mouseX+45, monsterY+45, 15, 15);


  //rechteroog

  fill(0);
  ellipse(mouseX+110, monsterY+40, 60, 60);
  fill(255);
  ellipse(mouseX+110, monsterY+40, 50, 50);
  fill(0);
  ellipse(mouseX+105, monsterY+45, 15, 15);

  //mond
  fill(255);
  ellipse(mouseX+75, monsterY+110, 100, 20);


  //benen
  noStroke();
  fill(255, 255, 0);
  rect(mouseX+35, monsterY+190, 20, 30);
  rect(mouseX+95, monsterY+190, 20, 30);


  //broek
  fill(0, 0, 225);
  rect(mouseX+25, monsterY+140, 100, 60);
  rect(mouseX, monsterY+130, 150, 30);


  //voeten
  fill(0);
  rect(mouseX+25, monsterY+210, 30, 20);
  rect(mouseX+95, monsterY+210, 30, 20);
   

}

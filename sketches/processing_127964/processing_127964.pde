
int x;
int y;
int stop = 1000;
int spatie = 300;

void setup() {
  size(1000, 300);
}


void draw() {
  background(255);
  
  for(int i=0; i<stop; i=i+spatie){
    drawMonster(i,50);
  }
  
}

  void drawMonster(int x, int y){
  
  //lichaam
  fill(255, 255, 0);
  noStroke();
  ellipse(x+75, y, 150, 100);
  rect(x, y, 150, 200);

  //armen
  rect(x-40,y+130,50,20);
  rect(x+140,y+130,50,20);


  //streep
  fill(0);
  rect(x, y+30, 150, 20);


  //linkeroog
  stroke(0);
  fill(0);
  ellipse(x+40, y+40, 60, 60);
  fill(255);
  ellipse(x+40, y+40, 50, 50);
  fill(0);
  ellipse(x+45, y+45, 15, 15);


  //rechteroog

  fill(0);
  ellipse(x+110, y+40, 60, 60);
  fill(255);
  ellipse(x+110, y+40, 50, 50);
  fill(0);
  ellipse(x+105, y+45, 15, 15);

  //mond
  fill(255);
  ellipse(x+75, y+110, 100, 20);


  //broek
  noStroke();
  fill(0, 0, 225);
  rect(x+25, y+140, 100, 60);
  rect(x, y+130, 150, 30);

  //benen
  fill(255, 255, 0);
  rect(x+35, y+190, 20, 30);
  rect(x+95, y+190, 20, 30);

  //voeten
  fill(0);
  rect(x+25, y+210, 30, 20);
  rect(x+95, y+210, 30, 20);
  }



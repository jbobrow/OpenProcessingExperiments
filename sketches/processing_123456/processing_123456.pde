
int monsterX;
int monsterY;
int richting;
int teller;
boolean test;

void setup() {
  size(500, 500);
  monsterX=170;
  monsterY=170;
  richting=10;
  teller=0;
  test=true;
}


void draw() {
  background(255);
  
  if(test==true){
    fill(255,255,0);
  }
  if(test==false){
    fill(255,0,0);
  }
  

  //lichaam
 
  noStroke();
  ellipse(monsterX+75, monsterY, 150, 100);
  rect(monsterX, monsterY, 150, 200);

  //armen
  rect(monsterX-40, monsterY+130, 50, 20);
  rect(monsterX+140, monsterY+130, 50, 20);
  
  


  //streep
  fill(0);
  rect(monsterX, monsterY+30, 150, 20);


  //linkeroog
  stroke(0);
  fill(0);
  ellipse(monsterX+40, monsterY+40, 60, 60);
  fill(255);
  ellipse(monsterX+40, monsterY+40, 50, 50);
  fill(0);
  ellipse(monsterX+45, monsterY+45, 15, 15);


  //rechteroog

  fill(0);
  ellipse(monsterX+110, monsterY+40, 60, 60);
  fill(255);
  ellipse(monsterX+110, monsterY+40, 50, 50);
  fill(0);
  ellipse(monsterX+105, monsterY+45, 15, 15);



  //mond
    fill(255);
  ellipse(monsterX+75, monsterY+110, 100, 20);


  //benen
  noStroke();
  fill(255, 255, 0);
  rect(monsterX+35, monsterY+190, 20, 30);
  rect(monsterX+95, monsterY+190, 20, 30);


  //broek
  fill(0, 0, 225);
  rect(monsterX+25, monsterY+140, 100, 60);
  rect(monsterX, monsterY+130, 150, 30);


  //voeten
  fill(0);
  rect(monsterX+25, monsterY+210, 30, 20);
  rect(monsterX+95, monsterY+210, 30, 20);
  
  monsterX=monsterX+richting;
  
  if(monsterX > width-140 || monsterX <0){
    richting=-richting;
  if(teller==10){
    teller=0;
    test = !test;
  }
  
  println(teller);
  teller=teller+1;

  }
}


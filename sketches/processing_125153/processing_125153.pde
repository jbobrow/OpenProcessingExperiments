

int Y;
int spatie;
int breedte;
int hoogte;
int stop;


void setup() {
  size(500, 500);

  Y = 20;
  breedte = 500;
  hoogte = 20;
  spatie = 40;
  stop = 500;
}


void draw() {

  background(255);
  
  
  


Y = 10;
  
  //lichaam
  fill(255, 255, 0);
  noStroke();
  ellipse(255, 190, 150, 100);
  rect(180, 190, 150, 200);

  //armen
//  rect(140,320,50,20);
//  rect(320,320,50,20);
  
 for(int i=320; i<380; i=i+30){
   fill(255, 255, 0);
   rect(140,i,50,20);
 }
 
 for(int i=320; i<380; i=i+30){
   fill(255, 255, 0);
   rect(320,i,50,20);
 } 
 
 
  //streep
  fill(0);
  rect(180, 220, 150, 20);


  //linkeroog
  stroke(0);
  fill(0);
  ellipse(220, 230, 60, 60);
  fill(255);
  ellipse(220, 230, 50, 50);
  fill(0);
  ellipse(225, 235, 15, 15);


  //rechteroog

  fill(0);
  ellipse(290, 230, 60, 60);
  fill(255);
  ellipse(290, 230, 50, 50);
  fill(0);
  ellipse(285, 235, 15, 15);

  //mond
  fill(255);
  ellipse(255, 300, 100, 20);


  //broek
  noStroke();
  fill(0, 0, 225);
  rect(205, 320, 100, 60);
  rect(180, 320, 150, 30);

  //benen
  fill(255, 255, 0);
  rect(215, 380, 20, 30);
  rect(275, 380, 20, 30);

  //voeten
  fill(0);
  rect(205, 400, 30, 20);
  rect(275, 400, 30, 20);
}

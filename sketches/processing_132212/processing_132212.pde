
int greenX = 250;
int greenY = 250;
int X;
int richting;
int teller = 0;
int spatie;
int y;
int stop;
boolean test = true;

void setup() {
  size(500,500);
  richting = 5;
  spatie = 15;
  stop = 500;
  X = height/2;
}

void draw(){
  background(255,255,255);
  
  streepjes();
}

void streepjes (){
 
  while ( y < stop){
    noStroke();
    fill(100,0,100);
    rect(0,y,500,10);
    y = y + spatie;
  }
  
  y=0;
  
  for (int i = 1; i< 4; i++){
    monster((i*135),X);
  }
  
}
void monster(int greenX, int greenY){
  if(test ==true){
    fill(191, 52, 52);
  }
  
  if(test == false){
    fill(234, 121, 0);
  }



  /*body*/
  ellipseMode(CENTER);
  ellipse(greenX, greenY, 100, 90);
  
  /*inside*/
  fill(240, 174, 174);
  ellipseMode(CENTER);
  ellipse(greenX,greenY, 60, 69);
  stroke(0);
  
if(test ==true){
    fill(191, 52, 52);
  }
  
  if(test == false){
    fill(234, 121, 0);
  }
  
  /*head*/
  ellipseMode(CENTER);
  ellipse(greenX,greenY -60, 80, 60);
  
    /*mouth*/
  fill(0);
  ellipseMode(CENTER);
  ellipse(greenX,greenY -48, 18, 19);
  
  /*teeth left*/
  fill(255);
  rect(greenX -5,greenY -57, 5,8);
 
  /*teeth right*/
  fill(255);
  rect(greenX,greenY -57, 5, 8);
  
  /*eye*/
  fill(247, 245, 245);
  ellipseMode(CENTER);
  ellipse(greenX,greenY -76, 35, 26);
  
  /*pupil*/
  fill(0);
  ellipseMode(CENTER);
  ellipse(greenX, greenY -75, 18, 18);
  
  /*iris*/
  fill(247, 245, 245);
  ellipseMode(CENTER);
  ellipse(greenX +3, greenY -71, 5, 5);
  
if(test ==true){
    fill(191, 52, 52);
  }
  
  if(test == false){
    fill(234, 121, 0);
  }
  
  /*foot left*/
  ellipseMode(CENTER);
  ellipse(greenX -25, greenY +40, 30, 38);
  
  /*foot right*/
  ellipseMode(CENTER);
  ellipse(greenX +25, greenY +40, 30, 38);
  
  /*hand left*/
  ellipseMode(CENTER);
  ellipse(greenX -45, greenY -13, 28, 33);
  
  /*hand right*/
  ellipseMode(CENTER);
  ellipse(greenX +45, greenY -13, 28, 33);
 
  /*left and right*/
  greenX = mouseX;
   
  /*repeat*/
  if(greenY==-30) {
    greenY=200;
  }
} 


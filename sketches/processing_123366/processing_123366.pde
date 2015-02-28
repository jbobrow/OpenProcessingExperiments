
int greenX;
int greenY;

void setup() {
  size(200,200);
  greenX = 250;
  greenY = 250;
}

void draw(){
  background(255,255,255);
  
  /*body*/
  fill(191, 52, 52);
  ellipseMode(CENTER);
  ellipse(greenX, greenY, 100, 90);
  
  /*inside*/
  fill(240, 174, 174);
  ellipseMode(CENTER);
  ellipse(greenX,greenY, 60, 69);
  stroke(0);
  
  /*head*/
  fill(191, 52, 52);
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
  
  /*foot left*/
  fill(191, 52, 52);
  ellipseMode(CENTER);
  ellipse(greenX -25, greenY +40, 30, 38);
  
  /*foot right*/
  fill(191, 52, 52);
  ellipseMode(CENTER);
  ellipse(greenX +25, greenY +40, 30, 38);
  
  /*hand left*/
  fill(191, 52, 52);
  ellipseMode(CENTER);
  ellipse(greenX -45, greenY -13, 28, 33);
  
  /*hand right*/
  fill(191, 52, 52);
  ellipseMode(CENTER);
  ellipse(greenX +45, greenY -13, 28, 33);
 
 /*up and down*/
  greenY = greenY -2;
   
  /*left and right*/
  greenX = mouseX;
   
  /*repeat*/
  if(greenY==-30) {
    greenY=530;
  }

}

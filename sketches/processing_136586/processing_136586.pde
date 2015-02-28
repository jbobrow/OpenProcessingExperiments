
// This Sketch Code creates a two-d plant charcter

//The Size of the sketch and background color

void setup(){
  size(1000,1000);

}

void draw() {
  background(75);
  drawWayne(-200,200);
  drawWayne(200,200);
  drawWayne(600,200);

}



  void drawWayne(int x,int y){
 pushMatrix();
translate(x,y);
  //Body and fill(green)
  fill(50,130,20);
  ellipse( 300,300,200,250);
  noFill();
  
  //Mouth and fill(black)
  fill(0,0,0);
  ellipse(300,320,80,50);
  noFill();
  
  //Eyes and fill(white)
  fill(225,225,225);
  ellipse(277,250,40,60);
  ellipse(317,250,40,60);
  noFill();
  
  //Pupils and fill(red)
  fill(190,20,0);
  ellipse(277,258,30,35);
  ellipse(317,258,30,35);
  noFill();
  
  //pot and fill(brown)
  fill( 160,82,45);
  quad(200,395,400,395,360, 550,240,550);
  noFill();
  
  //Hat and fill (black)
  fill(0,0,0);
  rect(245,80,110,120);
  rect(200,180,200,20);
  noFill();
  
  //Stripe and fill(red)
  fill(0,0,205);
  rect(245,165,110,15);
  noFill();
 popMatrix();
  
}







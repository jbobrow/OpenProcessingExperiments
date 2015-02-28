
int greenyX;
int greenyY;

void setup(){
  size(500,500);
  greenyX = 250;
  greenyY = 250;
}

void draw(){
  background(255,255,255);
  /*head*/
  stroke(0);
  fill(119,229,170);
  ellipseMode(CENTER);
  ellipse(greenyX,greenyY,140,150);
  /*eyes*/
  fill(255);
  ellipse(greenyX,greenyY-30,45, 60);
  fill(0);
  ellipse(greenyX,greenyY-20,30,40);
  /*mouth*/
  fill(0);
  ellipse(greenyX,greenyY+40,20,30);
  /*body*/
  fill(119,229,170);
  ellipse(greenyX-25,greenyY+60,50,60);
  fill(119,229,170);
  ellipse(greenyX+25,greenyY+60,50,60);


  /*up and down*/
  greenyY = greenyY -2;
  
  /*left and right*/
  greenyX = mouseX;
  
  /*repeat*/
  if(greenyY==-30) {
    greenyY=530;
  }
}

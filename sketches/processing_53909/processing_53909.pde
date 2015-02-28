
float posX=320;
float posY=240;
float posA=200;
float posB=300;
float speedX = 5;
float speedY = 5;
float speedA = 3;
float speedB = 3;
int counter = 0;
 
void setup(){
  size(650,500);
  frameRate(60);
  background(0);
}
 //red ghost
void draw(){
  noStroke();
  rect(0,0,width,height);
  if(posX < 0 || posX > width){
    speedX *= -1;
  }
  if(posY < 0 || posY > height){
    speedY *= -1;
  } 
 
  posX += random(speedX);
  posY += random(speedY); 
 
  strokeWeight(random(50,100)); //random stroke weights between 1-150
  stroke(#ff0926,100);//stroke colour (red) and opacity
  point(posX,posY);
  
   fill(#ffe35f,1);//if the fill is put last, it the ghost lines will be on the top
  
  


//circular zones
    noStroke();
  fill(#ffe35f,10); //background colour pale yellow and opacity
  rect(0,0,width,height); //the area that the ghost will travel on
  
    fill(#ffe35f,100);
  ellipse(100,100,200,200);
  
      fill(#ffe35f,100);
  ellipse(300,300,200,200);
  
      fill(#ffe35f,100);
  ellipse(450,500,200,200);
  
      fill(#ffe35f,100);
  ellipse(550,200,200,200);
  
      fill(#ffe35f,100);
  ellipse(200,450,200,200);
  
      fill(#ffe35f,100);
  ellipse(0,600,200,200);
  
      fill(#ffe35f,100);
  ellipse(500,50,200,200);
  
      fill(#ffe35f,100);
  ellipse(500,400,200,200);
  
  
  
    //light blue ghost
  
  if(posA < 0 || posA > width){
    speedA += -1;
  }
  if(posY < 0 || posY > height){
    speedB += -1;
  } 
 
  posA += random(speedA);
  posB += random(speedB); 
 
  strokeWeight(random(10,35)); //random stroke weights between 1-150
  stroke(#0eadff,100);//stroke colour (blue) and opacity
  point(posX,posY);
  
    noStroke();
  rect(0,0,width,height);
  
}


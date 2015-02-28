
PImage city;
PImage lose;
float x,y,x2,y2,x3,y3,x4,y4,x5,y5;
float directionX,directionY,directionX2,directionY2,directionX3,directionY3,directionX4,directionY4,directionX5,directionY5;

void setup(){
  size(450,700);
  smooth();
  x = 20;
  y = 0;
  x2 = 120;
  y2 = 0;
  x3 = 220;
  y3 = 0;
  x4 = 320;
  y4 = 0;
  x5 = 420;
  y5 = 0;
  directionX = 4;
  directionY = 4;
  directionX2 = 2;
  directionY2 = 6.5;
  directionX3 = 1;
  directionY3 = 7;
  directionX4 = 5;
  directionY4 = 2;
  directionX5 = 2;
  directionY5 = 6;
  
 
 city = loadImage("city.gif"); 
 lose = loadImage("you_lose.gif");


}

void draw(){
  background(0);
  image(city,0,0);
   stroke(255);
    fill(255);
      ellipse(x,y,25,25);
      ellipse(x2,y2,13,35);
      ellipse(x3,y3,50,2);
      ellipse(x4,y4,18,20);
      ellipse(x5,y5,25,25);
      
       
fill(255);
 text("click the right bomb to save the city",100,200);
    
    x+= directionX;
    y+= directionY;
    x2+= directionX2;
    y2+= directionY2;
    x3+= directionX3;
    y3+= directionY3;
    x4+= directionX4;
    y4+= directionY4;
    x5+= directionX5;
    y5+= directionY5;
 
  if(x > 40){
   directionX= -5;}
  
  if(x < 0){
   directionX= 5;}
  
  if(x2 > 150){
   directionX2 = -2;}  
    
  if(x2 < 100){
   directionX2 = 4;}
  
  if(x3 > 270){
   directionX3 = -1;}
  
  if(x3 < 200){
   directionX3 = 1;} 
   
  if(x4 > 350){
   directionX4 = -10;}
  
  if(x4 < 290){
   directionX4 = 4;}
  
  if(x5 > 450){
  directionX5 = -5;}
  
  if(x5 < 350){
  directionX5 = 5;} 
   
   
  if(y3 > height){
    image(lose,0,0);}

}

void mousePressed(){
 if(dist(x2,y2,mouseX,mouseY) < 30){
   directionX = 0;
   directionY = 0;
   directionX2 = 0;
   directionY2 = 0;
   directionX3 = 0;
   directionY3 = 0;
   directionX4 = 0;
   directionY4 = 0;
   directionX5 = 0;
   directionY5 = 0;

stroke(255);
  text("YOU WIN",350,350);

}
}


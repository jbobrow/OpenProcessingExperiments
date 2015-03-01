
float time = 0;
float planetX = 0;
float planetY = 0;
float starSize =50;
float starshipX=0;
float starshipY=0;
float starshipH=0;
float starshipV=0;
PImage starship;
PImage stars;
int score = 0;
PImage youWin;
 
void setup (){
size(500,500);
starship = loadImage("starship.png");
stars = loadImage("stars.jpg");
youWin = loadImage("you-win.jpg");
}
void draw() {
    
  time += 0.015;
    
  if (score >= 5) {
    fill(163,206,114);
    image(youWin, 0 , 0);
     
  }
     
     
  if (time > 0.6) {
    image(stars, 0 ,0);
    fill(0);
    planetX = random(0, width - starSize);
    planetY = random(50, height - starSize);
    fill(random(255),random(255),random(255));
    ellipse(planetX, planetY, starSize, starSize);
    time = -.3;
  }
 
 fill(250,96,137);
     
  text("Score: " + score, 25, 30);
}
   
void mousePressed() {
  if (mouseButton == LEFT) {
    if (mouseX < (planetX + starSize)
      && mouseX > planetX
      && mouseY < (planetY + starSize)
      && mouseY > planetY)
    {
      score++;
    }
    else {
  
    }
  }
}




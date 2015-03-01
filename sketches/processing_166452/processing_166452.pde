
PImage photo;
PImage photo2;
PImage photo3;
PImage dragon;


void setup() {
  background(0);
  size(1000, 600);
  
  photo = loadImage ("snowflake.png");
  photo2 = loadImage ("red.png");
  photo3 = loadImage ("button.png");
  dragon = loadImage ("dragon.png");
}

void draw() {

  if (key == 'q' || key == 'Q') {
      computersolving();
  }
  if (key == 'w' || key == 'W') {
      learningfromexperience();
  }
  if (key == 'e' || key == 'E') {
      consistency();
  }
 
}

void computersolving() {
noStroke();
  fill(255);
  rect(0, 450, 1000, 5);
  
  
  if (mouseY > width/2){
    background(255);
  fill(0);
  textSize(25);
  text("It's easier when the computer translates", 500, 490); 
  text("and solves problems for you,", 500, 520);
  text("is it not?",500, 550);
  }else{
    
  fill(255);
  textSize(25);
  text("Il est plus facile lorsque l'ordinateur", 30, 50);
  text("traduit et résout les problèmes pour vous,", 30, 80);
  text("n'est-ce pas ?",30, 110);
}
} 


void learningfromexperience() {
   //showing snowflake
 background(255);
 image (photo, 250, 25);
 
 
 //when clicked shows bad image
 if(mousePressed == true) {
   background(0);
   image (photo2, 200, 10);
 }else{
   noStroke();
   fill(12, 195, 203);
   image( photo3, 790, 130);
 }
}



void consistency() {
 translate(width/2, height/2);
  float zoom = map(mouseX, 0, width, 0.1, 4.5);
  scale(zoom);
  image(dragon, -140, -140);
}




int myState = 0 ;
PImage img1;
PImage img2;
PImage img3;
PImage img4;

void setup() {
  size(600,600);
  img1 = loadImage("bee_1.jpeg");
  img2 = loadImage("bee_2.jpg");
  img3 = loadImage("sad_bee.jpg");
  img4 = loadImage("cool_bee.jpg");
}

void draw() {
  switch(myState) {
    case 0 :
    background(0) ;
    image(img1, 100, 150);
    textSize(25); 
    fill(255) ;
    text("How much do you know about bees?", 75, 75); 
    textSize(18) ;
    text("Click to start!", 240, 550); 
    break ;
    
    case 1 :
    background(0) ;
    image(img2, 150, 100, width/2, height/2);
    textSize(20); 
    fill(255) ;
    text("How many legs does the average bee have?", 90, 50); 
    
    fill(255) ;
    rect(100, 450, 100, 100) ;
    rect(400, 450, 100, 100) ;
    
    fill(0) ;
    text("8", 145, 507) ;
    text("6", 445, 507) ;

   
    break ;
    
    case 2 :
    background(0) ;
    image(img4, 100, 200);
    textSize(35); 
    fill(255); 
    text("Great job! Buzz Buzz!", 120, 100); 
    text("Press 'R' to reset", 150, 550); 
    break ;
    
    case 3 :
    background(0) ;
    image(img3, 200, 200);
    textSize(35); 
    fill(255);
    text("Oh no, try again, sad bee!", 80, 100); 
    text("Press 'R' to reset", 150, 550); 
    break ;
  
    default :
    break ;
  }
}

void mouseClicked() {
  if ((myState ==1) && (mouseX > 100) && (mouseX < 200) && (mouseY > 450) && (mouseY < 550)) 
  myState = 3 ;
  
  if ((myState ==1) && (mouseX > 400) && (mouseX < 500) && (mouseY > 450) && (mouseY < 550))
  myState = 2;
  
  if ((myState ==0) && (mouseX > 0) && (mouseY > 0))
  myState = 1 ;
}

void keyPressed() {
   if ((myState ==1) && (key == 'r'))
  myState = 0;
  
   if ((myState ==2) && (key == 'r'))
  myState = 0;
  
   if ((myState ==3) && (key == 'r'))
  myState = 0;
  
}







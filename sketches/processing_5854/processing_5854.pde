
  int x = 0;
  int speed = 1;
 
  float oogGrootte = 10;
 
  float r = 0;
  float b = 0;
  float g = 0;
  
  float funnyPetX;
  float funnyPetY;
  
  float staartR;
  float staartG;
  float staartB;
  
  float oogR;
  float oogG;
  float oogB;
  
void setup() 
{
  size(500,500);
  smooth();
  frameRate(30);
  
  funnyPetX = width/3; 
  funnyPetY = height + 100;
}

void draw() 

{ background(255,200,230);
  stroke(0);
  line(width/2,0,width/2,height);
  line(0,height/2,width,height/2);
  
  rectMode(CORNERS);
  
//Veranderende achtergrond rechthoeken met kleuren
 noStroke();
 
  if(mouseX < 250 && mouseY< 250) {
  fill(b,180,255);
  rect(0,0,250,250);
  } else if (mouseX > 250 && mouseY < 250) {
  fill(b,0,255);
  rect(250,0,500,250);
  } else if (mouseX < 250 && mouseY > 250) {
  fill(b,255,255);
  rect(0,250,250,500);
  } else if (mouseX > 250 && mouseY > 250) {
  fill(b,0,127);
  rect(250,250,500,500);
}
 
  ellipseMode(CENTER);
  rectMode(CENTER);
  
  //TekenWezen(mouseX,mouseY);
  stroke(150,0,255);
  
  //Nek
  line( funnyPetX+10,funnyPetY+10, funnyPetX+180,funnyPetY+210);
  
  //Staart
  line( funnyPetX+190,funnyPetY+190, funnyPetX+260,funnyPetY+60);

  //Recht been
  line( funnyPetX+160,funnyPetY+310, funnyPetX+160,funnyPetY+160);
  
  //Lopend been
  line( funnyPetX+40,funnyPetY+260, funnyPetX+160,funnyPetY+160);
  
  noStroke();
  fill(255,200,200);
  
  //Hoofd
  ellipse(funnyPetX,funnyPetY,90,90);
  
  //Staart                                                       
  staartR = random(255);
  staartG = random(255);
  staartB = random(255);
  fill (staartR,staartG,staartB);
  ellipse(funnyPetX+260,funnyPetY+50,50,50);
  
  noStroke();
  fill(255,200,200);
  
  //Lichaam
  ellipse( funnyPetX+160,funnyPetY+160,110,110);
  
  //Voeten
  rectMode(CENTER);
  rect( funnyPetX+20,funnyPetY+270,55,20);
  rect( funnyPetX+140,funnyPetY+310,55,20); // voet voor
  
  //Oog
  oogR = random(255);
  oogG = random(255);
  oogB = random(255);
  fill(oogR,oogG,oogB);
  ellipse(funnyPetX-10,funnyPetY-10,oogGrootte,oogGrootte*2);
  
  //Mond
  stroke(255);
  line( funnyPetX-37,funnyPetY+25, funnyPetX-20,funnyPetY+20);
  
  //Wezentje beweegt omhoog
  funnyPetY = funnyPetY -1;
  
  //Wezentje blijft op scherm
  funnyPetY = constrain(funnyPetY,50,500);
  
 
// Bewegende speelbal van funnyPet
  noStroke();
  fill(255,0,0);
  ellipse(x,320,32,32);
  
  x = x + speed;
  
  if ((x>150) || (x<0)) {
    speed = speed * -1;
  }
}

void mousePressed() 
{
  println("Hello people, I'm your funny pet!");
  
}



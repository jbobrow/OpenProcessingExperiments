
int monstertjeY;
int monstertjeX;
int pmonstertjeY;
int pmonstertjeX; //variabelen monster positie

int richting;
int teller;
boolean test;//variabelen beweging

float R;
float G;
float B;   //variabelen willekeurige kleur

int y;
int spatie;
int stop;

void setup() {
  size(600, 600); //grootte document
  smooth();
  frameRate(30);
  monstertjeY = height-200;
  monstertjeX = width/2;
  pmonstertjeY = height-200;
  pmonstertjeX = width/2; 

  test = true;
  teller = 0;
  richting =10; 

  R = random(255);
  G = random(255);
  B = random(255);     //variabelen waarde

  y = 0;
  spatie = 20;
  stop = height;
}

void draw() {
  background(0);   //achtergrond kleur
  drawBackground();
  drawMonster();
  drawMovement();
  drawColorchange();
                          //functies  
 
  println(teller);
  println(test); 
}

void drawBackground(){

  while (y < stop) { 
      stroke(random(255),random(255),random(255));
      line(0,y,600,y);     
      y = y + spatie;
  }
      y = 0;
  
}                                                           //Tekent de discoachtergrond 

void drawMonster(){

  rectMode(CENTER);        //body
  stroke(255);

  rect(monstertjeX, monstertjeY, 50, 80);

  line(monstertjeX-70, monstertjeY-25, monstertjeX-25, monstertjeY+10); //left arm
  line(monstertjeX+70, monstertjeY-25, monstertjeX+25, monstertjeY+10); //right arm
  line(monstertjeX-20, monstertjeY+40, pmonstertjeX-30, pmonstertjeY+80); //left leg
  line(monstertjeX+20, monstertjeY+40, pmonstertjeX+30, pmonstertjeY+80); //right leg

  stroke(255);
  line(monstertjeX-40, monstertjeY-95, pmonstertjeX-5, pmonstertjeY-50); // left antenna
  line(monstertjeX+40, monstertjeY-95, pmonstertjeX+5, pmonstertjeY-50); // right antenna

  ellipseMode(CENTER);    //head
  stroke(255);

  ellipse(monstertjeX, monstertjeY-40, 100, 75);

  ellipseMode(CENTER); //left eye
  stroke(255);
  fill(255);
  ellipse(monstertjeX-15, monstertjeY-35, 20, 25);

  ellipseMode(CENTER); // left eye pupil
  stroke(0);
  fill(0);
  ellipse(monstertjeX-10, monstertjeY-40, 10, 15);

  ellipseMode(CENTER); //right eye
  stroke(255);
  fill(255);
  ellipse(monstertjeX+15, monstertjeY-35, 20, 25);

  ellipseMode(CENTER); // right eye pupil
  stroke(0);
  fill(0);
  ellipse(monstertjeX+10, monstertjeY-35, 10, 15);

}

void drawColorchange(){

  if (test == true) {
    fill(R,G,B);
  }

  if (test == false) {
    fill(R, B, G);
  }
  
}                                            //zorgt ervoor dat het monstertje van kleur veranderd

void drawMovement(){

  monstertjeY = monstertjeY + richting;
  pmonstertjeY = pmonstertjeY + richting;  //monstertje vliegt omhoog

  monstertjeX = mouseX;
  pmonstertjeX = pmouseX;  //monstertje gaat horizontaal mee met de muis

  if (monstertjeY < 0 + 100) {
      richting = -richting;
      teller = teller +1;
  }                            //monster veranderd van richting

  if (monstertjeY > height -100) {
      richting = -richting;
  }                            //beweging verticaal

  if (teller == 5) {
      teller = 0;                 // als de teller op 5 staat wordt hij 0
      test = !test;              // als de teller op 5 staat wordt true false en andersom.
  }                          

}


void mousePressed() {
  fill(random(255),random(255),random(255));
  println("Meow");
}







//ANDREA GOH 03933492
//LA 200 INTRO TO PROGRAMMING
Cook[] CookVege = new Cook[50];
Cook[] CookSaltPep = new Cook[100];
Cook[] CookMeat = new Cook[100];



color red;
color yellow;
color fireFill;
boolean  meat, sp, vege;
int  mtPop, meatO, spPop, spO, vgPop, vgO, textO;
float meatSpeed, spSpeed, vgSpeed1, vgSpeed2;

void setup() {

  size(800, 800);

  //meat
  meatSpeed = 0;
  meat = false;
  meatO = 255;
  mtPop = 48;

  //saltPep
  spSpeed = 0;
  sp = false;
  spO = 255;
  spPop = 48;

  //vege
  vgSpeed1 = 0;
  vgSpeed2 = 0;
  vege = false;
  vgO = 255;
  vgPop = 48;
  
  textO = 255;



  //meat
  for (int i = 0; i <CookMeat.length; i++) {

    CookMeat[i] = new Cook(random(3*width/8, 5*width/8));
  }


  //vege
  for (int i = 0; i <CookVege.length; i++) {

    CookVege[i] = new Cook(random(3*width/8, 5*width/8));
  }


  //sp
  for (int i = 0; i <CookSaltPep.length; i++) {

    CookSaltPep[i] = new Cook(random(3*width/8, 5*width/8));
  }
}



void draw() {
  clear();
  background(50);
  
  //words
  fill(150,textO);
  textAlign(CENTER,CENTER);
  textSize(50);
  text("CHOOSE INGREDIENT", width/2, height/2); 

  //PARTICLES
  // meat particles 
  for (int i = 0; i <CookMeat.length; i++) {

    CookMeat[i].move(random(meatSpeed));
    CookMeat[i].display(random(20, 25), 4, color(74, 33, 7), color(204, 136, 93), meatO);

  }


  // vege particles 
  for (int i = 0; i <CookVege.length; i++) {

    CookVege[i].move(random(vgSpeed1, vgSpeed2));
    CookVege[i].display(random(10, 20), random(10, 20), color(33, 115, 84), color(114, 255, 201), vgO);
  }  


  // sp particles 
  for (int i = 0; i <CookSaltPep.length; i++) {

    CookSaltPep[i].move(random(spSpeed));
    CookSaltPep[i].display(random(7), random(7), color(0), color(255), spO);
  }




  //INTERFACE
  //fire
  red = color(214, 6, 6);
  yellow = color(255, 198, 0);
  fireFill = lerpColor(red, yellow, random(0, 1));
  fill(fireFill);
  ellipse(width/2, 7*height/8, width/2, 50);

  //pothandles
  noStroke();
  fill(0);
  rect(width/4, 11*height/16, width/8, 20, 10, 10, 10, 10);
  rect(3*width/4, 11*height/16, width/8, 20, 10, 10, 10, 10);

  //pot
  noStroke();
  fill(100);
  rectMode(CENTER);
  rect(width/2, 3*height/4, width/2, 200, 10, 10, 100, 100);



  //BOXES
  //vegeBox
  noStroke();
  fill(20, 69, 73);
  rectMode(CENTER);
  rect(width/2, 800, 250, vgPop);
  //words
  fill(180);
  textAlign(CENTER);
  textSize(11);
  text("BROCCOLI", width/2, 790); 

  //meatBox
  noStroke();
  fill(178, 91, 53);
  rectMode(CENTER);
  rect(690, 800, 250, mtPop);
  //words
  fill(180);
  textAlign(CENTER);
  textSize(11);
  text("STEAK", 690, 790); 

  //saltPepBox
  noStroke();
  fill(178, 57, 0);
  rectMode(CENTER);
  rect(125, 800, 250, spPop);
  //words
  fill(180);
  textAlign(CENTER);
  textSize(11);
  text("SALT & PEPPER", 125, 790); 

  //vent
  noStroke();
  fill(64, 140, 158);
  rectMode(CENTER);
  rect(width/2, 0, 250, 48, 0, 0, 30, 30);
}



void mousePressed() {
  
  

  //meat click
  if (mouseX> 565 && mouseX<800  && mouseY < 800 && mouseY >748 && meat == false) {
    meat = true;
    textO = 0;
    meatSpeed = 13;
    meatO = 255;
    mtPop = 70;
  } 
  
  else if (mouseX> 565 && mouseX<800  && mouseY < 800 && mouseY >748 && meat == true) {
    meat = false;
    meatSpeed = 0;
    meatO = 0;
    mtPop = 48;
  }

  //saltPep click
  if (mouseX> 0 && mouseX<250  && mouseY < 800 && mouseY >748 && sp == false) {
    sp = true;
    textO = 0;
    spSpeed = 10;
    spO = 255;
    spPop = 70;
  } 
  
  else if (mouseX> 0 && mouseX<250  && mouseY < 800 && mouseY >748 && sp == true) {
    sp = false;
    spSpeed = 0;
    spO = 0;
    spPop = 48;
  }


  //vege click
  if (mouseX> 275 && mouseX<525 && mouseY < 800 && mouseY >748 && vege == false) {
    vege = true;
    textO = 0;
    vgSpeed1 = 3;
    vgSpeed2 = 11;
    vgO = 255;
    vgPop = 70;
  } 
  
  else if (mouseX> 275 && mouseX<525 && mouseY < 800 && mouseY >748 && vege == true) {
    vege = false;
    vgSpeed1 = 0;
    vgSpeed2 = 0;
    vgO = 0;
    vgPop = 48;
  }
  
  
  if(meat == false && vege == false && sp == false){
  textO = 255;
  }
}      





class Cook {


  float xPos;
  float yPos;
  color colourFill;
  int potBottom;
  float speed;
 
  


  //constructor
  Cook(float xPos2) {

    xPos = xPos2;
    yPos = 0;
  }

  void move(float speed) {
    potBottom = 7*height/8;
    yPos = yPos + speed;

    if (yPos>potBottom) {
      yPos = 0;
    }
  }

  void display(float size,  float round ,color start, color end, int o) {
    noStroke();
    colourFill = lerpColor(start, end, random(0,1));
    fill(colourFill,o);
    rect(xPos, yPos, size, size,round, round, round, round);
    //ellipse(xPos, yPos, size, size);
    
   }
   

   
   
}




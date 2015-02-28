
void setup() {
 size(480,480);
smooth();
}

void draw() {

  background(144,144,144);
  
  if (mousePressed) {
  
     myAngryCreature();
     
     }
  else {
  
      myCalmCreature();
      
    }
   
}

void myAngryCreature() {

  fill(155,0,0);
  
  //Abdomen
  ellipse(mouseX,mouseY - 140,70,120);
  
  //Thorax
  ellipse(mouseX,mouseY - 50,70,100);
  
  //Head
  ellipse(mouseX,mouseY + 20,60,50);
  
  fill(0,0,0);
  
  //Antenna
  line(mouseX + 20,mouseY + 30,mouseX + 60,mouseY + 60);
  
  line(mouseX + 60,mouseY + 60,mouseX + 30,mouseY + 80);
  
  line(mouseX - 20,mouseY + 30,mouseX - 60,mouseY + 60);
  
  line(mouseX - 60,mouseY + 60,mouseX - 30,mouseY + 80);
  
  fill(255,0,0);
  //Eyes
  
  ellipse(mouseX - 15,mouseY + 42,20,10);
  
  ellipse(mouseX + 15,mouseY + 42,20,10);
  
  fill(0);
  
  //Legs
  
  //Middle Legs
  line(mouseX - 35,mouseY - 50,mouseX - 100,mouseY - 30);
  
  line(mouseX - 100,mouseY - 30,mouseX - 140,mouseY - 40);
  
  line(mouseX + 35,mouseY - 50,mouseX + 100,mouseY - 30);
  
  line(mouseX + 100,mouseY - 30,mouseX + 140,mouseY - 40);
  
  //Back Legs
  line(mouseX - 32,mouseY - 70,mouseX - 110,mouseY - 90);
  
  line(mouseX - 110,mouseY - 90,mouseX - 140,mouseY - 110);
  
  line(mouseX + 32,mouseY - 70,mouseX + 110,mouseY - 90);
  
  line(mouseX + 110,mouseY - 90,mouseX + 140,mouseY - 110);
  
  //Front Legs
  
  line (mouseX - 32,mouseY - 30,mouseX - 90,mouseY + 20);
  
  line (mouseX - 90,mouseY + 20,mouseX - 140,mouseY + 25);
  
  line (mouseX + 32,mouseY - 30,mouseX + 90,mouseY + 20);
  
  line (mouseX + 90,mouseY + 20,mouseX + 140,mouseY + 25);
  
  }    
      
void myCalmCreature() {

  fill(40);
  
  //Abdomen
  ellipse(mouseX,mouseY - 140,70,120);
  
  //Thorax
  ellipse(mouseX,mouseY - 50,70,100);
  
  //Head
  ellipse(mouseX,mouseY + 20,60,50);
  
  fill(0,0,0);
  
  //Antenna
  line(mouseX + 20,mouseY + 30,mouseX + 60,mouseY + 60);
  
  line(mouseX + 60,mouseY + 60,mouseX + 30,mouseY + 80);
  
  line(mouseX - 20,mouseY + 30,mouseX - 60,mouseY + 60);
  
  line(mouseX - 60,mouseY + 60,mouseX - 30,mouseY + 80);
  
  //Eyes
  
  ellipse(mouseX - 15,mouseY + 42,20,10);
  
  ellipse(mouseX + 15,mouseY + 42,20,10);
  
  //Legs
  
  //Middle Legs
  line(mouseX - 35,mouseY - 50,mouseX - 100,mouseY - 30);
  
  line(mouseX - 100,mouseY - 30,mouseX - 140,mouseY - 40);
  
  line(mouseX + 35,mouseY - 50,mouseX + 100,mouseY - 30);
  
  line(mouseX + 100,mouseY - 30,mouseX + 140,mouseY - 40);
  
  //Back Legs
  line(mouseX - 32,mouseY - 70,mouseX - 110,mouseY - 90);
  
  line(mouseX - 110,mouseY - 90,mouseX - 140,mouseY - 110);
  
  line(mouseX + 32,mouseY - 70,mouseX + 110,mouseY - 90);
  
  line(mouseX + 110,mouseY - 90,mouseX + 140,mouseY - 110);
  
  //Front Legs
  
  line (mouseX - 32,mouseY - 30,mouseX - 90,mouseY + 20);
  
  line (mouseX - 90,mouseY + 20,mouseX - 140,mouseY + 25);
  
  line (mouseX + 32,mouseY - 30,mouseX + 90,mouseY + 20);
  
  line (mouseX + 90,mouseY + 20,mouseX + 140,mouseY + 25);
  
  }    

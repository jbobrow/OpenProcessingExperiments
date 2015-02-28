
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
  ellipse(240,100,70,120);
  
  //Thorax
  ellipse(240,190,70,100);
  
  //Head
  ellipse(240,260,60,50);
  
  fill(0,0,0);
  
  //Antenna
  line(260,270,300,300);
  
  line(300,300,270,320);
  
  line(220,270,180,300);
  
  line(180,300,210,320);
  
  //Eyes
  
  ellipse(225,282,20,10);
  
  ellipse(255,282,20,10);
  
  //Legs
  
  //Middle Legs
  line(205,190,140,210);
  
  line(140,210,100,200);
  
  line(275,190,340,210);
  
  line(340,210,380,200);
  
  //Back Legs
  line(208,170,130,150);
  
  line(130,150,100,130);
  
  line(272,170,350,150);
  
  line(350,150,380,130);
  
  //Front Legs
  
  line (208,210,150,260);
  
  line (150,260,100,265);
  
  line (272,210,330,260);
  
  line (330,260,380,265);
  
  }    


float ypos1 = 70;
float yspeed1 = 1;

void setup() {
  size (400,400);
}

void draw() {
  smooth();
  background(150);
  moveCreature();
  bounceCreature();
  display();
  }

void display(){
  for (float m = 176; m < 210; m+=32){ // Legs
    stroke(0);
    fill(203,154,92);
    rect(m,ypos1+100,15,100);
  }
    
    for (float n = 176; n < 233; n+=47){ // Feet
      stroke(0);
      fill(242,186,113);
      ellipse(n,ypos1+200,30,15);
  }

    fill(203,154,92); // Body
    ellipse(200,ypos1+70,70,130);
    
    noStroke(); // Stomach
    fill(242,186,113);
    ellipse(200,ypos1+75,50,80);

    stroke(0); // Head
    fill(242, 186, 113);
    ellipse(200,ypos1,80,60);

    for (float i = 180; i < 230; i+=40) { // Eyes
     fill (90,39,6);
     ellipse(i,ypos1,10,10);
  }
  
    stroke(0); // Nose
    fill(203,154,92);
    ellipse(200,ypos1+10,20,10);

    noStroke(); // Mouth
    fill(0);
    ellipse(200,ypos1+23,15,7);

    fill(216,17,7); // Tongue
    ellipse(200,ypos1+25.5,15,3);
  
    for (float j = 154; j < 250; j+=93) { // Ears
      stroke(0);
      fill(203,154,92);
      ellipse(j,ypos1-20,25,25); 
  }

     for (float k = 150; k < 250; k+=90) { // Arms
       stroke(0);
       fill(203, 154, 92);
       rect(k, ypos1+40,10,50);
   }

    for (float k = 156; k < 250; k+=89) { // Shoulders
      stroke(0);
      fill(203,154,92);
      ellipse(k,ypos1+40,27,27);
  }

    for (float l = 155; l < 280; l+=91) { // Hands
      stroke(0);
      fill(242,186,113);
      ellipse(l,ypos1+100,20,20);
  }
}

void moveCreature(){
  ypos1 = ypos1 + yspeed1;
}

void bounceCreature(){
  if ((ypos1 > height-205) || (ypos1 < 30)) {
    yspeed1 = yspeed1 * -1;
  }
}



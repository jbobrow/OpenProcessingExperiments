
float rect1x = 100; 
float rect1y = 500;
float rect1size = 50; 

float rect2x = 400; 
float rect2y = 500;
float rect2size = 50; 

boolean active = true;
boolean q0 = true;
boolean q1 = false ;
boolean q2 = false;
boolean q3 = false;


void setup() {
  size(600,600);
}

void draw() {
  background(255);
  textAlign(CENTER,TOP);
  textSize(40);
  fill(0);
  text("Do you like this shape?",width/2, 100);
  
  
  
  if (q0==true){
    fill(100,200,255);
    rectMode(CENTER);
    rect(width/2, height/2, 200, 200);
  }

  
  else if (q1==true) {
    fill(225,200,55);
    ellipse(width/2,height/2, 200, 200);
  }
  
  else if (q2 == true) {
    fill (253,142,45);
    triangle(250,200, 450,350, 200,450);
  }
  
  else if (q3 == true) {
    background(255);
    textAlign(CENTER,CENTER);
    textSize(32);
    fill(0);
    text( "You don't like shapes. :( ", width/2, height/2);
  }
  
  
  else if (active ==false) {
    background(255);
    textAlign(CENTER,CENTER);
    textSize(32);
    fill(0);
    text( "It likes you too!", width/2, height/2);
  }
  
  pushMatrix();
  rectMode(CORNER);
  fill(0,0,255);
  rect(rect1x, rect1y, rect1size *2 , rect1size); 

  fill(255, 0, 0);  

  rect(rect2x, rect2y, rect2size *2 , rect2size); 
  
  textAlign(CENTER,CENTER);
  textSize(32);
  fill(255);
  text ("Yes",150,520);
  textSize(32);
  fill(255);
  text("No",450, 520);
  popMatrix();
  
  if (keyPressed) {
    if (key == 's') {
      saveFrame("screen-#####.jpg");
    }
 
  }
  
 /* if (q1==true) {
    fill(225,200,55);
    ellipse(width/2,height/2, 100, 100);
  }
  
  /*if(q2==true && q0==false) {
    background(255);
    textAlign(CENTER,CENTER);
    textSize(32);
    fill(0);
    text( "Circle likes you too!", width/2, height/2);
  }
    
  
  if (q0==true){
    fill(100,200,255);
    rectMode(CENTER);
    rect(width/2, height/2, 100, 100);
  }
  else if (q1==true && start== false){
    background(255);
    textAlign(CENTER,CENTER);
    textSize(32);
    fill(0);
    text( "Rectangle likes you too!", width/2, height/2);
  }
  */
 

  
}

void mousePressed() {
  if (q0 == true && active== true && mouseX > rect1x && mouseX < rect1x + (rect1size*2) &&
    mouseY > rect1y && mouseY < rect1y + rect1size) {
    q0=false;
    active = false;
  } 
  else if ( q0== true && mouseX > rect2x && mouseX < rect2x + (rect2size*2) &&
    mouseY > rect2y && mouseY < rect2y + rect2size) {
    q0 = false;
    q1 = true; 
    }
  else if (q1==true && mouseX > rect1x && mouseX < rect1x + (rect1size*2) &&
    mouseY > rect1y && mouseY < rect1y + rect1size) {
    q1=false;
    active=false;
    }
  else if (q1==true&& mouseX > rect2x && mouseX < rect2x + (rect2size*2) &&
    mouseY > rect2y && mouseY < rect2y + rect2size) {
    q1=false;
    q2=true;
    }
  else if (q2==true&& mouseX > rect1x && mouseX < rect1x + (rect1size*2) &&
    mouseY > rect1y && mouseY < rect1y + rect1size) {
    q2=false;
    active=false;
    }
  else if (q2==true&&mouseX > rect2x && mouseX < rect2x + (rect2size*2) &&
    mouseY > rect2y && mouseY < rect2y + rect2size) {
    q2=false;
    q3=true;
    }
  else {
  }
  /*if (q0 == true && mouseX > rect1x && mouseX < rect1x + (rect1size*2) &&
    mouseY > rect1y && mouseY < rect1y + rect1size) {
    q0=false;
    q1 = true;
    active = false;
  } 
  else if ( q0== true && mouseX > rect2x && mouseX < rect2x + (rect2size*2) &&
    mouseY > rect2y && mouseY < rect2y + rect2size) {
    q1 = true; 
    q0 = false;
    }
   else if (q1 == true && start == false && mouseX > rect1x && mouseX < rect1x + (rect1size*2) &&
    mouseY > rect1y && mouseY < rect1y + rect1size) {
    q2 =true;
  } 
  else if ( q1== true && start == true && mouseX > rect2x && mouseX < rect2x + (rect2size*2) &&
    mouseY > rect2y && mouseY < rect2y + rect2size) {
    q2 = true; 
    }
    */
}





// Header comment: This is a building project. People can build their houses
 // everywhere in this picture. Also if you press any key, there will automatically be grass on the ground.
 
  // Declare variables

  float d;
  float e;
  float f;
    
void setup () {
  size(500,500);
  drawBackground();
}

void drawBackground() {
  //here is to make the background change to random colores
  d=random(255);
  e=random(255);
  f=random(255);
  background(d,e,f);
  
}


void draw () {
}

 
  void House() {
    //This is to draw/define the small house
    // wall
  fill(mouseX, mouseY, 0);
  rect(mouseX, mouseY, 40, 40);
  
  // door
  fill(mouseX, mouseY, 20);
  rect(mouseX+15, mouseY+20, 10, 20);
  
  // roof
  fill(mouseY);
  triangle(mouseX, mouseY, mouseX+20, mouseY-20, mouseX+40, mouseY);
  }
  
  void bigHouse() {
    //This is to draw/define the big house
    // wall
  fill(mouseX, mouseY, 0);
  rect(mouseX, mouseY, 50, 50);
  
  // door
  fill(mouseY);
  rect(mouseX+25, mouseY+30, 20, 20);
  
  // roof
  fill(mouseY);
  triangle(mouseX, mouseY, mouseX+30, mouseY-30, mouseX+50, mouseY);
  }
    
   
void mousePressed() {
    // Here is to use the mouse to change the postition and the shape of houses
    if (mouseX < 200) {
     House();
   
    }
    else  {
   bigHouse();
}
   

}

  void keyPressed() {
    //this is to make the background change color each time I press a key
    drawBackground();
    
    for(int i = 0; i < 6;  i++){
    //this is to creat random grass on the ground in the new background
  
    float a = random(0,500);
    float b = random(110,500);
 
   stroke(100,100,255);
   strokeWeight(5);
   line(a,b,a+10,b-10);
   line(a+10,b,a+10,b-10);
   line(a+10,b-10,a+20,b);
  }
}

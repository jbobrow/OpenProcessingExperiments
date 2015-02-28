
int sube;
int bla;


void setup() {
 size(600, 600);
  smooth();
  background(34,45,76);
  colorMode(RGB);
  noStroke();
  sube = 45;
  bla = 34;
}


void draw() {
  sube += random(1);
  bla -= 1;
  
  noStroke();
   
  stroke(273,232,232, 4);
  
  if (mousePressed == true) {
    random(243,56);
    fill(54,87,98, 5);
  }
  else {
    fill(250,122,122,.4);
  }
  quad(mouseX, bla*random(5), width/2, sube+random(2), bla/2, 400, 600, mouseY);
  quad(random(2), random(35), mouseY, random(45), random(600), bla*2, mouseX, bla);
 
 //button 1
 {fill(255);
 rect(580, 10, 10, 10);
if(mouseX > 580 && mouseX < 590 && mouseY > 10 && mouseY < 20 && mousePressed) {
  if(mousePressed = true){
    fill(random(600), 100);
    ellipse(random(600), random(600), 4, 4);
  }
}
 }
  
  //button 2
  {fill(255);
  rect(580, 30, 10, 10);
if(mouseX > 580 && mouseX < 590 && mouseY > 30 && mouseY < 40 && mousePressed) {
  if(mousePressed = true){
    fill(random(444),100);
   rect(random(600), random(600), random(10), random(10));
  }
}
  }


// button 3
  {fill(255);
  rect(580, 50, 10, 10);
  if(mouseX > 580 && mouseX < 590 && mouseY > 50 && mouseY < 60 && mousePressed) {
  if(mousePressed = true){
    for(int x = 0; x < 100; x++){
    for(int y = 0; y < 100; y++){
    if(mousePressed){
    fill(222,random(300),223,150);    
    noStroke();
    smooth();
    ellipse(x*10, y*10, 2, 2);
    }
    }
    }
  }
  }
  }
    
//button 4
 {fill(255);
  rect(580, 70, 10, 10);
  if(mouseX > 580 && mouseX < 590 && mouseY > 70 && mouseY < 80 && mousePressed) {
  if(mousePressed = true){
    for(int x = 0; x < 5; x++){
    for(int y = 0; y < 5; y++){
    if(mousePressed){
    fill(255,0,0);    
    fill(random(444));
    smooth();
    fill(255,0,0);
    line(x*random(600), y*random(600), random(600), random(600));
    }
    }
    }
  }
  }
 }
}

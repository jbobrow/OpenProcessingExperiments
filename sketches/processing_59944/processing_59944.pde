
//E6: interaktive Kreise
//Erstelle eine dynamische und interaktive Kreis-Komposition. 

void setup(){
  size(450, 450);
  smooth();
  background(255); 
  noStroke();
  
  rectMode(CENTER);
  //noCursor();
  
}




void draw() {
 
  frameRate(20);
  fill(95, 149, 116,50);
    ellipse(width/2, height/2, random(700), random(700));
  
 
  
  
  if(mousePressed){
    //fill(0, 4);
 //(rect(random(0,500), random(0, 500), mouseY, mouseX);
  //fill(255, 30);
   frameRate(80);
  fill(192,219,203);
  ellipse(mouseX, height-50, 45, 45);
  ellipse(mouseX, height-100, 45, 45);
  ellipse(mouseX, height, 45, 45);
  ellipse(mouseX, height-150, 45, 45);
  ellipse(mouseX, height-200, 45, 45);
  ellipse(mouseX, height-250, 45, 45);
  ellipse(mouseX, height-300, 45, 45);
  ellipse(mouseX, height-350, 45, 45);
  ellipse(mouseX, height-400, 45, 45);
  ellipse(mouseX, height-450, 45, 45);
  ellipse(mouseX, height-500, 45, 45);
     
  }
     //fill(255,10);
 //rect(random(0,500), random(0, 500), mouseY, mouseX);

}

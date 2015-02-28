
int cs = 24;

void setup() {
  size(500, 500);
}

void draw() {
  background(0);
  
  // Sekunden
  
    fill(116,159,51);
  
    pushMatrix();
  float x = map(second(),0 ,5, 0, width);
  int y = 0;
  noStroke();
  rect(x, y, width/5, height/5);
    popMatrix();
  
      pushMatrix();
  x = map(second(),5 ,10, 0, width);
  y = 0;
  noStroke();
  rect(x, y, width/5, height/5);
    popMatrix();
  
  pushMatrix();
  x = map(second(),10 ,15, 0, width);
  y = 0;
  noStroke();
  rect(x, y, width/5, height/5);
    popMatrix();
  
      pushMatrix();
  x = map(second(),15 ,20, 0, width);
  y = 0;
  noStroke();
  rect(x, y, width/5, height/5);
    popMatrix();
  
      pushMatrix();
  x = map(second(),20 ,25, 0, width);
  y = 0;
  noStroke();
  rect(x, y, width/5, height/5);
    popMatrix();
  
  pushMatrix();
  x = map(second(),25 ,30, 0, width);
  y = 0;
  noStroke();
  rect(x, y, width/5, height/5);
    popMatrix();
  
       pushMatrix();
  x = map(second(),30 ,35 , 0, width);
  y = 0;
  noStroke();
  rect(x, y, width/5, height/5);
    popMatrix();
  
  pushMatrix();
  x = map(second(),35 ,40, 0, width);
  y = 0;
  noStroke();
  rect(x, y, width/5, height/5);
    popMatrix(); 
  
       pushMatrix();
  x = map(second(),40 ,45, 0, width);
  y = 0;
  noStroke();
  rect(x, y, width/5, height/5);
    popMatrix();
  
  pushMatrix();
  x = map(second(),45 ,50, 0, width);
  y = 0;
  noStroke();
  rect(x, y, width/5, height/5);
    popMatrix(); 
    
   pushMatrix();
  x = map(second(),50 ,55, 0, width);
  y = 0;
  noStroke();
  rect(x, y, width/5, height/5);
    popMatrix();  
   
    pushMatrix();
  x = map(second(),55 ,60, 0, width);
  y = 0;
  noStroke();
  rect(x, y, width/5, height/5);
    popMatrix();  
  
  // Minuten
  
  fill(135,50,99);
  y = width/5;
  x = map(minute(), 0, 60, 0, width);
  rect(x, y, width/3, height/3);

  // Stunden
  

  noStroke();
  fill(48,95,124);
  y = width/5+width/3;
  x = map(hour(), 0, 24, 0, width);
  rect(x, y, width/2, height/2);

if (mousePressed) {
  fill(255); 
  textAlign(CENTER);
  textSize(40);
  text(hour() +"/"+ minute() +"/"+ second(),width/2,height/2);

}
}




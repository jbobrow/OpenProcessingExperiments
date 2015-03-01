
Pingui[] pinguins = new Pingui[20];
 
void setup(){
  size (800, 500);
  for (int i = 0; i < pinguins.length;i++){
    pinguins[i] = new Pingui(random(width), random(height), random(1, 5));
  }
   
}
void draw(){
  background(255);
  
  //Petit iceberng
  fill(#99CCFF);
  stroke(#99CCFF);
  triangle(301, 194, 284, 134, 332, 143);
  rect(0 , 0 , 799, 147);
  rect(0 , 147, 300, 652);
  fill(255);
  stroke(255);
  beginShape();
  curveVertex(300,  199);
  curveVertex(300,  199);
  curveVertex(307,  177);
  curveVertex(321,  151);
  curveVertex(337, 147);
  curveVertex(337, 147);
  endShape();
  fill(#CCFFFF);
  stroke(#000099);
  ellipse(714, 42, 50, 50);
  for (int i = 0; i < pinguins.length;i++){
    pinguins[i].dibuixa();
    pinguins[i].moure();
  }
 }
class Pingui {
  float xSpeed;  
  float xPos = 0;
  float yPos = 0;
  float a = 0.0;
  float inc = TWO_PI/35.0;
  
  Pingui(float x, float y, float vel){
    
    xPos = x;
    yPos = y;
    xSpeed = vel;
  }
  void dibuixa(){
    //cos negre
  fill(0);
  stroke(0);
  ellipse(xPos+364, yPos+186, 40, 92);
  //cos blanc
  fill(255);
  stroke(255);
  ellipse(xPos+364, yPos+191, 20, 75);
  //cap
  fill(0);
  stroke(0);
  ellipse(xPos+364, yPos+130, 40, 40);
  //ulls 
  fill(255);
  stroke(255);
  ellipse(xPos+357, yPos+126, 10, 15);
  ellipse(xPos+370, yPos+126, 10, 15);
  //pulila
  fill(0);
  stroke(255);
  ellipse(xPos+357, yPos+130, 5, 5);
  ellipse(xPos+370, yPos+130, 5, 5);
  //braç esquerre
  fill(0);
  stroke(0);
  beginShape();
  curveVertex(xPos+348, yPos+158);
  curveVertex(xPos+348, yPos+158);
  curveVertex(xPos+337, yPos+177);
  curveVertex(xPos+329, yPos+190);
  curveVertex(xPos+347, yPos+189);
  curveVertex(xPos+347, yPos+189);
  endShape();
  //braç dreta
  fill(0);
  stroke(0);
  beginShape();
  curveVertex(xPos+379, yPos+158);
  curveVertex(xPos+379, yPos+158);
  curveVertex(xPos+389, yPos+172);
  curveVertex(xPos+397, yPos+189);
  curveVertex(xPos+381, yPos+189);
  curveVertex(xPos+381, yPos+189);
  endShape();
  //nas
  fill(255, 128, 0);
  stroke(0);
  triangle(xPos+374, yPos+136, xPos+356, yPos+136, xPos+366, yPos+158);
  //peus
  fill(255, 128, 0);
  stroke(0);
  beginShape();
  curveVertex(xPos+351, yPos+219);
  curveVertex(xPos+351, yPos+219);
  curveVertex(xPos+340, yPos+227);
  curveVertex(xPos+349, yPos+235);
  curveVertex(xPos+359, yPos+229);
  curveVertex(xPos+359, yPos+229);
  endShape();
  beginShape();
  curveVertex(xPos+377, yPos+219);
  curveVertex(xPos+377, yPos+219);
  curveVertex(xPos+390, yPos+227);
  curveVertex(xPos+381, yPos+235);
  curveVertex(xPos+373, yPos+229);
  curveVertex(xPos+373, yPos+229);
  endShape();
  }
  void moure(){
    xPos = xPos +random(-5,5);
    yPos = yPos +random(-5,5);
    if (xPos <0) xPos = 0;
    if (yPos <0) yPos = 0;
    if (xPos >width) xPos = width;
    if (yPos >height) yPos = height;
    //Ones amb cos()
    for (int i = 0; i < 75; i++) {
    fill(#0000CC); 
    stroke(#0000CC); 
    line(i*4, 380, i*4, 380+cos(a)*30.0);
    a = a + inc;
    }
    for (int i = 0; i < 75; i++) {
    fill(#0000CC); 
    stroke(#0000CC); 
    line(i*4, 370, i*4, 370+cos(a)*30.0);
    a = a + inc;
    }
    for (int i = 0; i < 75; i++) {
    fill(#0000CC); 
    stroke(#0000CC); 
    line(i*4, 350, i*4, 350+cos(a)*30.0);
    a = a + inc;
    }
    for (int i = 0; i < 75; i++) {
    fill(#0000CC); 
    stroke(#0000CC); 
    line(i*4, 320, i*4, 320+cos(a)*30.0);
    a = a + inc;
    }
    for (int i = 0; i < 75; i++) {
    fill(#0000CC); 
    stroke(#0000CC); 
    line(i*4, 290, i*4, 290+cos(a)*30.0);
    a = a + inc;
    }
    for (int i = 0; i < 75; i++) {
    fill(#0000CC); 
    stroke(#0000CC); 
    line(i*4, 260, i*4, 260+cos(a)*30.0);
    a = a + inc;
    }
    for (int i = 0; i < 75; i++) {
    fill(#0000CC); 
    stroke(#0000CC); 
    line(i*4, 230, i*4, 230+cos(a)*30.0);
    a = a + inc;
    }
    for (int i = 0; i < 75; i++) {
    fill(#0000CC); 
    stroke(#0000CC); 
    line(i*4, 400, i*4, 400+cos(a)*30.0);
    a = a + inc;
    }
    for (int i = 0; i < 75; i++) {
    fill(#0000CC); 
    stroke(#0000CC); 
    line(i*4, 430, i*4, 430+cos(a)*30.0);
    a = a + inc;
    }
    for (int i = 0; i < 75; i++) {
    fill(#0000CC); 
    stroke(#0000CC); 
    line(i*4, 460, i*4, 460+cos(a)*30.0);
    a = a + inc;
    }
    for (int i = 0; i < 75; i++) {
    fill(#0000CC); 
    stroke(#0000CC); 
    line(i*4, 490, i*4, 490+cos(a)*30.0);
    a = a + inc;
    }
  }
}



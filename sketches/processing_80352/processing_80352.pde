
// Echo por: Marc Cabañas Garcia 1ºASIX(TARDA)
// Rectangles en bucle

void setup(){
  size(400,200);
  noStroke();  
}

void draw (){ 
  background(255);
int i = 10;
int i2 = 0;    
int i3 = 110;
  
  while(i <= 400){
    
    fill(random(255),mouseX,mouseY);
    rect(20,i,350,15);
    
    fill(mouseX);
    rect(0,i2,450,15);
 
    if (mousePressed){
    fill(mouseX,mouseY,random(255));  
    rect(0,i2,mouseX,10);
    rect(mouseX,i2,300,10);
    }
    
    //RODONA CENTRAL
    
    stroke(0);
    fill(mouseX,mouseY,random(255));
    ellipse(200,100,180,180);
    fill(mouseY,mouseX,random(255));
    ellipse(200,100,160,i3);
    fill(mouseX,mouseY,random(255));
    ellipse(200,100,i3,140);
    fill(mouseY,mouseX,random(255));
    ellipse(200,100,120,120);
    fill(mouseX,mouseY,random(255));
    ellipse(200,100,100,100);
    fill(mouseY,mouseX,random(255));
    ellipse(200,100,80,80);
    fill(mouseX,mouseY,random(255));
    ellipse(200,100,60,60);
    fill(mouseY,mouseX,random(255));
    ellipse(200,100,40,40);
    fill(mouseX,mouseY,random(255));
    ellipse(200,100,20,20);
    
    
    i=i+25;
    i2=i2+25;
    i3=i3+5;
 
    
    
    
    
  
  }
}


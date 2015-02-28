
PFont font;


void setup()  {
  
  size(640, 640);
  font = loadFont("Helvetica-30.vlw"); 
  textFont(font); 
  
}

void draw(){
  
  if (mousePressed==false){
    
    background(random(0, 150),random(0, 150), mouseX, 10);
    fill(255, 255, 255);
    text("I'm going crazy without you!", mouseX + 250, mouseY + (random(-300, 300)));
    fill(255, 255, 255);
    
    }
    
  else if(mousePressed==true){
    
    background(0);  
    delay(60);
    fill(255, 255, 255);
    text("stop stalking me!", mouseX, mouseY-10);
    
    }
}





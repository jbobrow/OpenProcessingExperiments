
boolean drawLine = false;
boolean drawEllipse = false;
boolean fillEllipse = false;
boolean drawRect = false;
boolean drawLines = false;

void setup(){
  size(800,800) ;
  background(0) ;
  smooth() ;
}


void draw() {
    frameRate(500);
    
    strokeWeight(3);
    stroke (random(100),0,random(100));
    if(drawLine==true) line(mouseX,mouseY,pmouseX,pmouseY);
  
  
    for (int i = 200; i<=600; i+=40){
    fill (random(100),random(100),random(100),80);
    noStroke();
    if(drawEllipse==true) ellipse(mouseX+random(-i,i),mouseY+random(-i,i),random(20),random(20));
    }
    
    
    
    for (int i = 4; i<=40; i+=6){
    fill (random(100),random(100),random(100));
    noStroke();
    if(fillEllipse==true) ellipse(mouseX+random(-i,i),mouseY+random(-i,i),random(20),random(20));
    }
    
    
    for (int i = 15; i<=60; i+=6){
    fill (10,20,150,100);
    noStroke();
    frameRate(200);
    if(drawRect==true) rect(mouseX+random(-i,i),mouseY+random(-i,i),random(40),random(40));
    }
    
    
    strokeWeight(1);
    stroke(50);
    frameRate(200);
    if(drawLines==true) line(pmouseX,pmouseY,mouseX+random(-800,800),mouseY+random(-800,800));
    
  
    
    fill(0);
    noStroke();
    ellipse(mouseX,mouseY,5,5);
  }
  
 
void keyReleased(){
   if(key=='1')drawLine = !drawLine;
   if(key=='2')drawEllipse = !drawEllipse;
   if(key=='3')fillEllipse = !fillEllipse;
   if(key=='4')drawRect = !drawRect;
   if(key=='5')drawLines = !drawLines;
}


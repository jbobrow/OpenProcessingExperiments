
PGraphics pg;

void setup(){
  size(500,500);
  pg = createGraphics(300, 200);
}

void draw(){
 //The shadow
 fill(0, 12);
 rect(0, 0, width, height);
 
 //Pinsel
 fill(255,0,255);
 noStroke();
 ellipse(mouseX, mouseY, 60, 60);
  
 pg.beginDraw();
 pg.background(51);
 pg.noFill();
 pg.stroke(255);
 pg.ellipse(mouseX-120, mouseY-60, 60, 60);
 pg.endDraw();
 
 //Kreis in der Mitte
 fill(0,255,255);
 ellipse(250, 250, 160, 160);
 
}


//move mouse up and down to change time of day, move toward the bottom right for stars
//right and left click for something cute
//click the turtle and scare him

boolean turtle=true;
//set turtle as true/false statement, starting with true

void setup() {
  size(600,500);
  smooth();
}

void draw() {

  background(201-mouseY,270-mouseY,250-mouseY/2,50); 
  //background color changes with mouseY
  
  noStroke();
  fill(255,255,200,(mouseY+2*mouseX)/6);
  ellipse(width/6,height/6,2,2);
  fill(255,255,200,(mouseY+2*mouseX)/6);
  ellipse(width/4,height/3,2,2);
  fill(255,255,200,(mouseY+2*mouseX)/6);
  ellipse(width/3,height/9,2,2);
  fill(255,255,200,(mouseY+2*mouseX)/6);
  ellipse(width/2,height/5,2,2);
  fill(255,255,200,(mouseY+2*mouseX)/6);
  ellipse(2*width/3,height/4,2,2);
  //stars that become opaque as mouseX and mouseY approach bottom right corner
  
  fill(244,226,125);
  ellipse(width/6,mouseY,70,70);
  //sun that follows mouseY
  
  fill(170,210,220);
  arc(480,height-mouseY,95,80,-PI/2,PI/2);
  fill(200-mouseY,270-mouseY,250-mouseY/2);
  arc(480,height-mouseY,40,85,-PI/2,PI/2);
  //moon that follows height-mouseY using 2 arcs, the smaller of which follows background collor
  
  if (mousePressed) {
    if(mouseButton == LEFT) {
      fill(0);
      ellipse(-10+width/6,mouseY,18,18);
      ellipse(20+width/6,mouseY,18,18);
      fill(200,100,100);
      arc(5+width/6,mouseY+17,25,15,0,PI);
      stroke(0);
      strokeWeight(1);
      noFill();
      arc(5+width/6,mouseY+2,15,10,-PI,0);
      line(-35+width/6,mouseY-5,-12+width/6,mouseY-2);
      line(20+width/6,mouseY,35+width/6,mouseY-5);
    }
    //face on sun when left click
    
    else if (mouseButton == RIGHT) {
      fill(0);
      arc(518,height-mouseY,7,6,-PI,0);
      arc(504,height-mouseY,7,6,-PI,0);
      noStroke();
      fill(200,100,100);
      arc(511,height-mouseY+7,15,10,0,PI);
    }
    //face on moon when right click
  }
  
  noStroke();
  fill(210-mouseY/3,210-mouseY/3,210-mouseY/3);
  beginShape();
    vertex(width/20,height);
    bezierVertex(width/5,height/2,width/2,height/6,2*width/3,height);
    endShape();
  fill(230-mouseY/3,225-mouseY/3,220-mouseY/3);
  beginShape();
    vertex(width/3,height);
    bezierVertex(290,380,445,290,5*width/6,height);
    endShape(); 
  //draw rocks using free curves that also change color depending on mouseY
    
  fill(79,138,217,80);
  rect(0,300,width,height-300);
 //draw water that is near transparent
 
  if (turtle) {
   fill(100-3*mouseY/4,250-mouseY/3,100-3*mouseY/4);  
   arc(235,268,112,125,-PI,0);
  
   fill(126-3*mouseY/4,262-mouseY/3,125-3*mouseY/4); 
   ellipse(246,252,41,34);
   arc(204,273,30,37,-PI,0);
   arc(285,273,30,37,-PI,0);
   //when turtle is on, draw turtle shell, head, and arms that change color with mouseY

    if (abs(mouseX-235)<56 && 268-mouseY<63 && mouseY<268) {
     fill(0);
     ellipse(240,252,5,5);
     ellipse(262,252,5,5);
 
     noFill();
     stroke(0);
     strokeWeight(1);
     beginShape();
     vertex(245,263);
     vertex(253,260);     
     vertex(259,263);
     endShape();
    }
    //when turtle is on and mouse is on shell, turtle face becomes scared
    
   else { 
    fill(0);
    ellipse(240,252,6,6);
    ellipse(262,252,6,6);
      
    noFill();
    stroke(0);
    strokeWeight(1);
    beginShape();
    vertex(242,262);
    vertex(253,261);
    vertex(260,262);
    endShape();
   }
   //when turtle is on but mouse isn't on shell, turtle face is normal
 }
 
 else {
  fill(100-3*mouseY/4,250-mouseY/3,100-3*mouseY/4);  
  arc(235,270,114,129,-PI,0); 
  
  fill(80-3*mouseY/4,230-mouseY/3,80-3*mouseY/4);  
  ellipse(246,255,32,29);
  arc(205,270,23,24,-PI,0);
  arc(280,270,21,27,-PI,0);
 }
 //when turtle is not on, head and arms are replaced by holes and shell is slightly bigger; all of these depend on mouseY
}

void mousePressed() {
  if (abs(mouseX-235)<56 && 268-mouseY<63 && mouseY<268) {
    turtle = !turtle;
  }
  //switch turtle on/off each time mouse is pressed while on shell
}



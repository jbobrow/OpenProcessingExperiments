



void setup() {


  size(500, 500);
}


void draw() { 
  boolean smile =true;
  boolean eyes =true;




  background(0);
  //legs

  beginShape();
  fill(0, 255, 0);
  vertex(210, 300);
  bezierVertex(210, 300, 225, 315, 247, 330);
  bezierVertex(250, 340, 230, 350, 230, 365);
  bezierVertex(230, 375, 250, 400, 230, 410);
  bezierVertex(230, 410, 125, 420, 120, 410);
  bezierVertex(120, 410, 120, 300, 200, 365);
  bezierVertex(200, 365, 180, 340, 210, 300);
  endShape();

  beginShape();
  fill(0, 255, 0);
  vertex(290, 300);
  bezierVertex(290, 300, 275, 315, 253, 300);
  bezierVertex(250, 340, 270, 350, 270, 365);
  bezierVertex(270, 365, 250, 400, 270, 410);
  bezierVertex(270, 410, 375, 420, 380, 410);
  bezierVertex(380, 410, 380, 300, 300, 365);
  bezierVertex(300, 365, 320, 340, 290, 300);
  endShape();



  //body
  beginShape();
  fill(0, 255, 0);
  vertex(250, 240);
  bezierVertex(250, 240, 220, 240, 210, 230);
  bezierVertex(220, 290, 200, 300, 210, 300);
  bezierVertex(250, 350, 250, 350, 290, 300);
  bezierVertex(300, 290, 280, 310, 290, 230);
  bezierVertex(290, 250, 280, 240, 250, 240);
  endShape();

  //arms
  beginShape();
  fill(0, 255, 0);
  vertex(210, 230);
  bezierVertex(210, 230, 170, 170, 150, 190);
  bezierVertex(130, 210, 170, 250, 210, 260);
  bezierVertex(210, 260, 220, 200, 210, 230);
  endShape();

  beginShape();
  vertex(290, 230);
  bezierVertex(290, 230, 330, 170, 350, 190);
  bezierVertex(370, 210, 330, 250, 290, 260);
  bezierVertex(290, 260, 280, 200, 290, 230);
  endShape();
  //face shape

    strokeWeight(3);
  fill(0, 255, 0);
  beginShape();
  vertex(175, 100);
  bezierVertex(175, 75, 325, 75, 325, 100);
  bezierVertex(325, 100, 340, 150, 325, 225);
  bezierVertex(325, 250, 175, 250, 175, 225);
  bezierVertex(175, 225, 160, 150, 175, 100);
  endShape();

  //eyes



  if (smile==true) {
    if(key=='k'){

      bezier(185, 200, 185, 150, 240, 150, 240, 200);
      bezier(310, 200, 310, 150, 260, 150, 260, 200);

    } 
    
    

    else{if(key != 'k'){
          
      fill(0);
      ellipse(210, 160, 45, 90);
      ellipse(290, 160, 45, 90);
      fill(255);
      ellipse(210, 130, 30, 30);
      ellipse(290, 130, 30, 30);
    }}}
  
  

  //mouth
  if (smile==true) 
    if (keyPressed) {
      noFill();

      bezier(185, 220, 185, 235, 300, 235, 310, 220);
    }
    if (keyPressed) {
      if (key=='k') {
        fill(110,0,0);
        beginShape();
        vertex(185, 220);
          bezierVertex(205, 250, 290, 250, 310, 220);
        bezierVertex(250, 210, 185, 220, 185, 220);
        endShape();
      }
    
    }

  else {  
    noFill();
    bezier( 225, 225, 225, 220, 275, 220, 275, 225);}
    
    if( mousePressed){background(255);}
    
  
}
  
 


  




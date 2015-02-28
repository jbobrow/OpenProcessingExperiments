
/* Copyright (c) Linnea LaMon, January 2013
    All Rights Reserved
    lplamon@gmail.com */

    
void setup() {
  size(600,400,P2D);
//  background(255);
  smooth();
}




void draw(){
  background(255);
  
//what happens when you have the mouse in the middle diamond  
  if ( ((2.5)*mouseX-450>mouseY) && ((2.5)*mouseX-650<mouseY) && ((-2.5)*mouseX+1050>mouseY) && ((-2.5)*mouseX+850<mouseY)){
    for (int i=1; i < 8; i++){
      fill(millis()%(175*i),millis()%(238*i),millis()%(238*i));
        //1
        beginShape();
        vertex(260,200);
        vertex(300,100);
        vertex(340,200);
        vertex(300,300);
        endShape(CLOSE);
      
      fill(millis()%(72*i),millis()%(209*i),millis()%(204*i));
        //2
        beginShape(TRIANGLES);
        vertex(200,0);
        vertex(300,100);
        vertex(260,200);
        endShape();
      
      fill(millis()%(95*i),millis()%(158*i),millis()%(260*i));
        //3
        beginShape();
        vertex(200,200);
        vertex(300,300);
        vertex(260,200);
        vertex(200,0);
        vertex(160,0);
        endShape(CLOSE);
      
      fill(millis()%(65*i),millis()%(105*i),millis()%(225*i));
        //4
        beginShape();
        vertex(0,80);
        vertex(120,280);
        vertex(140,140);
        vertex(200,200);
        vertex(160,0);
        vertex(0,0);
        endShape(CLOSE);
      
      fill(millis()%(123*i),millis()%(104*i),millis()%(238*i));
        //5
        beginShape();
        vertex(0,80);
        vertex(120,280);
        vertex(240,340);
        vertex(0,400);
        endShape(CLOSE);
      
      fill(millis()%(72*i),millis()%(61*i),millis()%(139*i));
        //6
        beginShape();
        vertex(0,400);
        vertex(240,340);
        vertex(200,200);
        vertex(400,400);
        endShape(CLOSE);
      
      fill(0,0,millis()%(128*i));
        //7  
        beginShape();
        vertex(120,280);
        vertex(140,140);
        vertex(200,200);
        vertex(240,340);
        endShape(CLOSE);
        
      translate(width,height);
      rotate(PI);
      
      
      fill(millis()%(72*i),millis()%(209*i),millis()%(204*i));
        //2b
        beginShape(TRIANGLES);
        vertex(200,0);
        vertex(300,100);
        vertex(260,200);
        endShape();
      
      fill(millis()%(95*i),millis()%(158*i),millis()%(260*i));
        //3b
        beginShape();
        vertex(200,200);
        vertex(300,300);
        vertex(260,200);
        vertex(200,0);
        vertex(160,0);
        endShape(CLOSE);
      
      fill(millis()%(65*i),millis()%(105*i),millis()%(225*i));
        //4b
        beginShape();
        vertex(0,80);
        vertex(120,280);
        vertex(140,140);
        vertex(200,200);
        vertex(160,0);
        vertex(0,0);
        endShape(CLOSE);
      
      fill(millis()%(123*i),millis()%(104*i),millis()%(238*i));
        //5b
        beginShape();
        vertex(0,80);
        vertex(120,280);
        vertex(240,340);
        vertex(0,400);
        endShape(CLOSE);
      
      fill(millis()%(72*i),millis()%(61*i),millis()%(139*i));
        //6b
        beginShape();
        vertex(0,400);
        vertex(240,340);
        vertex(200,200);
        vertex(400,400);
        endShape(CLOSE);
      
      fill(0,0,millis()%(128*i));
        //7b  
        beginShape();
        vertex(120,280);
        vertex(140,140);
        vertex(200,200);
        vertex(240,340);
        endShape(CLOSE);
      
    }
  }
  else{
    
//go back to original colorings
//1
  fill(255);
  beginShape();
  vertex(260,200);
  vertex(300,100);
  vertex(340,200);
  vertex(300,300);
  endShape(CLOSE);

//2
  fill(225);
  beginShape(TRIANGLES);
  vertex(200,0);
  vertex(300,100);
  vertex(260,200);
  endShape();

//3
  fill(180);
  beginShape();
  vertex(200,200);
  vertex(300,300);
  vertex(260,200);
  vertex(200,0);
  vertex(160,0);
  endShape(CLOSE);

//4
  fill(135);  
  beginShape();
  vertex(0,80);
  vertex(120,280);
  vertex(140,140);
  vertex(200,200);
  vertex(160,0);
  vertex(0,0);
  endShape(CLOSE);

//5
  fill(90);  
  beginShape();
  vertex(0,80);
  vertex(120,280);
  vertex(240,340);
  vertex(0,400);
  endShape(CLOSE);
  
//6  
  fill(45);
  beginShape();
  vertex(0,400);
  vertex(240,340);
  vertex(200,200);
  vertex(400,400);
  endShape(CLOSE);

//7  
  fill(0);
  beginShape();
  vertex(120,280);
  vertex(140,140);
  vertex(200,200);
  vertex(240,340);
  endShape(CLOSE);  
  
  translate(width,height);
  rotate(PI);

//2b
  fill(225);
  beginShape(TRIANGLES);
  vertex(200,0);
  vertex(300,100);
  vertex(260,200);
  endShape();

//3b
  fill(180);
  beginShape();
  vertex(200,200);
  vertex(300,300);
  vertex(260,200);
  vertex(200,0);
  vertex(160,0);
  endShape(CLOSE);


//4b
  fill(135);  
  beginShape();
  vertex(0,80);
  vertex(120,280);
  vertex(140,140);
  vertex(200,200);
  vertex(160,0);
  vertex(0,0);
  endShape(CLOSE);


//5b
  fill(90);  
  beginShape();
  vertex(0,80);
  vertex(120,280);
  vertex(240,340);
  vertex(0,400);
  endShape(CLOSE);
  
  
//6b 
  fill(45);
  beginShape();
  vertex(0,400);
  vertex(240,340);
  vertex(200,200);
  vertex(400,400);
  endShape(CLOSE);


//7b  
  fill(0);
  beginShape();
  vertex(120,280);
  vertex(140,140);
  vertex(200,200);
  vertex(240,340);
  endShape(CLOSE);  
  }
}



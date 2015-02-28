

                void setup(){
  frameRate(35);
  size(720, 480);
  smooth();
  strokeWeight(2);
}

float angle = 0.0;
int speed = 15;
float speed1 = dist(pmouseX, pmouseY, mouseX, mouseY);
int bcentX=205;
int bcentY=175;

void draw(){
  noStroke();
  fill(204,70);
  rect(0, 0, 720, 480);
  fill(204);
  rect(0,0, 200, 480);
  //Head and body
  
  stroke(1);
  fill(255);
  line(120,100, 80,300);
  ellipse(120,100, 60,60);
   
  //left arm
  noFill();
  strokeJoin(BEVEL);
  beginShape();
    vertex(105,170);
    vertex(50,180);
    vertex(25,120);
  endShape();
     
  //right arm
  line(105,170, 200,170);
  
 //Throwing the lightsaber
  if (mousePressed==false && speed<525){
    pushMatrix();
    translate(speed+=20, speed1);
    
      //spin the lightsaber
      pushMatrix();
      translate(bcentX, bcentY);
      rotate(angle++);
      
      //lightsaber blade
      strokeWeight(4);
      stroke(5,255,150);
      line(204-bcentX,157-bcentY, 255-bcentX,40-bcentY);
       
      //sword hilt
      strokeWeight(1);
      stroke(0,0,0);
      fill(255, 255, 255);
      strokeJoin(BEVEL);
      beginShape();
        vertex(198-bcentX,160-bcentY);
        vertex(180-bcentX,180-bcentY);
        vertex(185-bcentX,190-bcentY);
        vertex(205-bcentX,160-bcentY);
        vertex(215-bcentX,163-bcentY);
        vertex(214-bcentX,160-bcentY);
        vertex(207-bcentX,157-bcentY);
        vertex(198-bcentX, 150-bcentY);
        vertex(198-bcentX,160-bcentY);
      endShape();
      popMatrix();
    popMatrix();
    
  //Returning the lightsaber
    } else { if(speed>20){
      pushMatrix();
      translate(speed-=20, speed1);
    
      //spin the lightsaber
      pushMatrix();
      translate(bcentX, bcentY);
      rotate(angle+speed++);
      
      //lightsaber blade
      strokeWeight(4);
      stroke(5,255,150);
      line(204-bcentX,157-bcentY, 255-bcentX,40-bcentY);
       
      //sword hilt
      strokeWeight(1);
      stroke(0,0,0);
      fill(255, 255, 255);
      strokeJoin(BEVEL);
      beginShape();
        vertex(198-bcentX,160-bcentY);
        vertex(180-bcentX,180-bcentY);
        vertex(185-bcentX,190-bcentY);
        vertex(205-bcentX,160-bcentY);
        vertex(215-bcentX,163-bcentY);
        vertex(214-bcentX,160-bcentY);
        vertex(207-bcentX,157-bcentY);
        vertex(198-bcentX, 150-bcentY);
        vertex(198-bcentX,160-bcentY);
      endShape();
      popMatrix();
    popMatrix();
    
  //Stopping the lightsaber  
    } else {
       pushMatrix();
      translate(bcentX, bcentY);
      rotate(0);
      
      //lightsaber blade
      strokeWeight(4);
      stroke(5,255,150);
      line(204-bcentX,157-bcentY, 255-bcentX,40-bcentY);
       
      //sword hilt
      strokeWeight(1);
      stroke(0,0,0);
      fill(255, 255, 255);
      strokeJoin(BEVEL);
      beginShape();
        vertex(198-bcentX,160-bcentY);
        vertex(180-bcentX,180-bcentY);
        vertex(185-bcentX,190-bcentY);
        vertex(205-bcentX,160-bcentY);
        vertex(215-bcentX,163-bcentY);
        vertex(214-bcentX,160-bcentY);
        vertex(207-bcentX,157-bcentY);
        vertex(198-bcentX, 150-bcentY);
        vertex(198-bcentX,160-bcentY);
      endShape();
      popMatrix();
    }    
  }
   
   
  //treads - really lame ones at the moment
  fill(255,255,255);
  triangle(75,280, 20,400, 120, 400);
  translate(13,-5);
  triangle(75,280, 20,400, 120, 400);
  }


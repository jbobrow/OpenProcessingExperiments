
int x = 250;
int y = 230;
int bodyCenterX = x;
int bodyCenterY = y+150;

void setup(){
  
  size (500,700);
  smooth();
  strokeWeight(3);
 
}



void draw(){
  
  if( keyPressed && (key == CODED)){
    if (keyCode == LEFT) {
     bodyCenterX--;
     x--;
    } if( keyPressed && (key == CODED)){
    if (keyCode == RIGHT) {
     bodyCenterX++;
     x++;
    } if( keyPressed && (key == CODED)){
    if (keyCode == UP) {
     bodyCenterY--;
     y--;
    }else if( keyPressed && (key == CODED)){
    if (keyCode == DOWN) {
     bodyCenterY++;
     y++;
    }
  }
  }
  }
  
  }
  
 
    

background(255);
//body
fill(238,240,186);
beginShape();
curveVertex(bodyCenterX-50,bodyCenterY-82);
curveVertex(bodyCenterX-50,bodyCenterY-82);
curveVertex(bodyCenterX-150,bodyCenterY-85);
curveVertex(bodyCenterX-150,bodyCenterY-30);
curveVertex(bodyCenterX-70,bodyCenterY-20);
curveVertex(bodyCenterX-100,bodyCenterY+170);
curveVertex(bodyCenterX-30,bodyCenterY+170);
curveVertex(bodyCenterX-30,bodyCenterY+90);
curveVertex(bodyCenterX,bodyCenterY+90);
curveVertex(bodyCenterX-5,bodyCenterY+170);
curveVertex(bodyCenterX+60,bodyCenterY+170);
curveVertex(bodyCenterX+70,bodyCenterY-20);
curveVertex(bodyCenterX+150,bodyCenterY-60);
curveVertex(bodyCenterX+150,bodyCenterY-130);
curveVertex(bodyCenterX+50,bodyCenterY-82);
curveVertex(bodyCenterX+50,bodyCenterY-82);
endShape(CLOSE);


fill(255);
ellipse(bodyCenterX,bodyCenterY,90,120); //belly


//ears
fill(238,240,186);
ellipse(x+100,y-100,100,80);
fill(250,207,223);
ellipse(x+100,y-90,80,60);

fill(238,240,186);
ellipse(x-100,y-100,100,80);
fill(250,207,223);
ellipse(x-100,y-90,80,60);


//head

fill(238,240,186);
ellipse(x,y-30,250,210);
fill(0);
ellipse( x-55,y-50,20,20); // left eye
ellipse( x+55,y-50,20,20); //  right eye
fill(255);
ellipse( x,y+10,90,60);
fill(0);
ellipse(x,y,25,25); //nose
noFill();
arc(x+18,y+12,35,30,0,PI); // right lip
arc(x-18,y+12,35,30,0,PI); // left lip

if (mousePressed){
 if (mouseButton == LEFT) {
   y-=1;
 } if (mouseButton == RIGHT) {
   y+=1;
 } 
   
   //strokeWeight(6);
  ellipse( x-55,y-50,30,30); // left eye
  ellipse( x+55,y-50,30,30);
  
}
}




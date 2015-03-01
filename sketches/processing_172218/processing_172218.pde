
void setup()
{
 size(600,600); 
 background (225, 245, 196 );
 //noLoop();
  
}

void draw()
{
  //BEGIN BIG DONUT____
  noStroke();
  fill (237, 229, 116);
  ellipseMode (CENTER);
  ellipse (width/2, height/2, 460, 460);
 
 //frosting.... 
  fill (255, 181, 202);
  ellipse (300, 185, 90, 90);
   ellipse (300, 415, 90, 90);
    ellipse (410, 300, 90, 90);
     ellipse (185, 300, 90, 90);
      ellipse (370, 200, 90, 90);
       ellipse (370, 405, 90, 90);
        ellipse (207, 373, 90, 90);
    ellipse (200, 233, 90, 90);
     ellipse (405, 357, 90, 90);
      ellipse (242, 417, 90, 90);
    ellipse (242, 195, 90, 90);
     ellipse (420, 235, 90, 90);
   
      //sprinkles.....
      pushMatrix();
      fill(random(0, 255), random(0, 255), random(0, 255));
      translate (width/2, height/2);
      rotate (random (radians (360)));
      beginShape();
      for (int i=0; i<30; i++)
      {
        rect (random(height), random(height), 3, 10);
      }
      endShape();
      popMatrix();
      
  fill (225, 245, 196);
  ellipse(width/2, height/2, 180, 180);
  

//BEGIN CLOCK____  
 // background(225, 245, 196 );
  
  pushMatrix();
  translate(width/2,height/2);
 
strokeWeight (6);
strokeCap(ROUND);

//MINUTE HAND.....
pushMatrix();
rotate(radians( minute()*6-90));
stroke(255);
line(0,0,135,0);
popMatrix();

//strokeWeight (6);

//HOUR HAND....
pushMatrix();
rotate(radians( hour()* 3));
stroke(255);
line(0,0,0,-110);
popMatrix();

 //SECONDS...
 strokeWeight (2);
stroke(0, 95);

pushMatrix();
rotate(radians(  second() *6-90));
line(0,0,75,0);
popMatrix();

  popMatrix();
  
  
ellipseMode (CENTER);
noStroke();
fill(0, 99);
ellipse(width/2, height/2, 12, 12);


//println(mouseX, mouseY);
  
}

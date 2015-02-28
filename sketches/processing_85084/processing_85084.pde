
//Diablo
//left and right pupi; movements variables
float xpupila = 0.0, ypupila = 0.0;
float xpupila2 = 0.0, ypupila2 = 0.0;
float xtong = 0.0, ytong = 0.0; 


void setup() {
  size(500, 500);
  background(#FF0303);
  smooth();
}

void draw() {
  ellipseMode(CENTER);
  rectMode(CENTER);

  //head
  noStroke();
  fill(#9D2020);
  triangle(width/2-200, height/2-150, width/2+200, height/2-150, width/2, height/2+200 );
  //mouth
  fill(#FF0303);
  triangle(width/2-40, height/2+95, width/2+40, height/2+95, width/2, height/2+170 );
 
  //nose
  fill(#FF0303);
  triangle(width/2-30, height/2+20, width/2+30, height/2+20, width/2, height/2+45 );

  
    //eyes
  fill(#FF0303);
  triangle(width/2-100, height/2-50, width/2-30, height/2-50, width/2-30, height/2 );
  fill(#FF0303);
  triangle(width/2+100, height/2-50, width/2+30, height/2-50, width/2+30, height/2 );
  //stroke(0);
  fill(#9D2020);
  ellipse(width/2+50, height/2-35, 35, 35);
  fill(#9D2020);
  ellipse(width/2-50, height/2-35, 35, 35);
  
    
  // Interactive movement

  xpupila = mouseX;
  ypupila = mouseY;
    xpupila2 = mouseX;
    ypupila2 = mouseY;
    xtong = mouseX; 
    ytong = mouseY; 
    
    //Constrain movement
    xpupila = constrain(xpupila,294,308);
    ypupila = constrain(ypupila,210,220);
    xpupila2 = constrain(xpupila2,195,208);
    ypupila2 = constrain(ypupila2,210,220);
  
  //tong constrains
  xtong = constrain(xtong,250,250);
  ytong = constrain(ytong,330,350);

  
  //eye balls
  //stroke(0);
  fill(#FF0303);
  ellipse(xpupila, ypupila, 15, 15);
  ellipse(xpupila2, ypupila2, 15, 15);
  
   //tonge
  //stroke(0);
  fill(#9D2020);
  ellipse(xtong,ytong,30,50);
  
  //ears
  //stroke(0);
  fill(#9D2020);
  ellipse(width/2+120, height/2, 100, 30);
  ellipse(width/2-120, height/2, 100, 30);
  //ellipse(xear, ear_y, 100, 30);
  //ellipse(xear2, ear_y2, 100, 30);
  
    
   //horns
  noStroke();
  ellipse(width/2-80, height/2-140, 150, 180);
  ellipse(width/2+80, height/2-140, 150, 180);
  fill(#FF0303);
  rect(width/2, height/2-180, 150,70);
  
  
}

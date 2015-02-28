

void setup() {
  size(500, 500);
}

void draw() 
{
  background(255);
  //Schlafenszeit
 if (hour() >= 0 && hour() < 8)
{
  //Z
  pushMatrix();
  translate(width/1.5,height/8);
   line(0,120,120,120);
   line(0,120,120,0);
   line(120,0,0,0);
    popMatrix();
   
   //mittel z
    pushMatrix();
   translate(width/2.3,height/2.55);
   line(0,80,80,80);
   line(0,80,80,0);
   line(80,0,0,0);
   popMatrix();
   
   //z
    pushMatrix();
    translate(width/3.5,height/1.75);
   line(0,40,40,40);
   line(0,40,40,0);
   line(40,0,0,0);
    popMatrix();
}

//Wecker/Aufstehen
if (hour() == 8)
{
   //"Ohren
   pushMatrix();
   translate(width/4,height/4);
   rotate(QUARTER_PI);
   ellipse(0,0,70,100);
   popMatrix();
   
    pushMatrix();
   translate(width/1.35,height/4);
   rotate(-QUARTER_PI);
   ellipse(0,0,70,100);
   popMatrix();
   
  pushMatrix();
   translate(width/2,height/2);
   fill(255);
   ellipse(0,0,250,250);
   ellipse(0,0,230,230);
    fill(0);
    ellipse(0,0,15,15);
    //stützen
    pushMatrix();
    translate(-70,104);
    rotate(QUARTER_PI);
   rect(0,0,5,30); 
   popMatrix();
   
   pushMatrix();
    translate(70,104);
    rotate(-QUARTER_PI);
   rect(0,0,5,30); 
   popMatrix();
   //klingel
    pushMatrix();
   rect(-3,-135,5,10); 
   ellipse(0,-150,40,40);
   popMatrix();
  //Zeiger
  
  pushMatrix();
  rect(-3,0,5,-90,5);
  rotate(QUARTER_PI);
  rect(-3,0,5,60,5);
     popMatrix();
   for (int i=0; i<360; i+=90) //360 grad in 20° schritten
  {
    pushMatrix();
    rotate(radians(i)); // um i rotieren
    translate(0, -115);    // um radius verschieben -i/2.0 Schnecke wird  kleiner
    stroke(0);
    line(0, 0, 0, 10);
    popMatrix();
   
  }
   popMatrix();
}
 //Frühstücken
 if (hour() > 8 && hour() <10)
{
    //messer
        pushMatrix();
    fill(0);
    rect(width/3, height/1.6, 15, 130, 3);
    ellipse(width/2.9, height/1.9, 35, 110);
    fill(255);
    noStroke();
    rect(width/2.75, height/2.45, 20, 110);
    
    //gabel
    fill(0);
    ellipse(width/1.56, height/1.65, 25, 20);
    rect(width/1.6, height/1.6, 15, 130, 3);
    ellipse(width/1.6, height/1.9, 5.5, 70);
    ellipse(width/1.56, height/1.9, 5, 70);
    ellipse(width/1.52, height/1.9, 5.5, 70);
     popMatrix();
    
}
//Mittagessen
 if (hour() >= 12 && hour() <14)
{
    //messer
        pushMatrix();
    fill(0);
    rect(width/3, height/1.6, 15, 130, 3);
    ellipse(width/2.9, height/1.9, 35, 110);
    fill(255);
    noStroke();
    rect(width/2.75, height/2.45, 20, 110);
    
    //gabel
    fill(0);
    ellipse(width/1.56, height/1.65, 25, 20);
    rect(width/1.6, height/1.6, 15, 130, 3);
    ellipse(width/1.6, height/1.9, 5.5, 70);
    ellipse(width/1.56, height/1.9, 5, 70);
    ellipse(width/1.52, height/1.9, 5.5, 70);
     popMatrix();
    
}
//Abendessen
if (hour() >= 18 && hour() <20)
{
    //messer
        pushMatrix();
    fill(0);
    rect(width/3, height/1.6, 15, 130, 3);
    ellipse(width/2.9, height/1.9, 35, 110);
    fill(255);
    noStroke();
    rect(width/2.75, height/2.45, 20, 110);
    
    //gabel
    fill(0);
    ellipse(width/1.56, height/1.65, 25, 20);
    rect(width/1.6, height/1.6, 15, 130, 3);
    ellipse(width/1.6, height/1.9, 5.5, 70);
    ellipse(width/1.56, height/1.9, 5, 70);
    ellipse(width/1.52, height/1.9, 5.5, 70);
     popMatrix();
    
}
//Arbeitszeit
 if (hour() >= 10 && hour() < 12)
 {
 pushMatrix();
    translate(width/4,height/4);
   noFill();
   rect(0,0,250,150);
   fill(0);
   stroke(0);
   rect(5,5,240,140);
   line(-11,170,266,170);
   line(0,150,-30,200);
   line(250,150,290,200);
   rect(-30,200,320,10);
   line(105,175,155,175);
   line(105,175,95,190);
   line(95,190,165,190);
   line(155,175,165,190);
    popMatrix();
 }
 if (hour() >= 14 && hour() < 18)
 {
 pushMatrix();
    translate(width/4,height/4);
   noFill();
   stroke(0);
   rect(0,0,250,150);
   fill(0);
   rect(5,5,240,140);
   line(-11,170,266,170);
   line(0,150,-30,200);
   line(250,150,290,200);
   rect(-30,200,320,10);
   line(95,175,145,175);
   line(95,175,85,190);
   line(85,190,155,190);
   line(145,175,155,190);
    popMatrix();
 }
 
 //Sport, Freizeit
 
 if (hour() >= 20 && hour() < 22)
 {
   pushMatrix();
    stroke(0);
  ellipse(300,155,50,50);
  noFill();
  ellipse(320,100,40,40);
 pushMatrix();
    translate(width/2,height/3);
    fill(0);
    rotate(QUARTER_PI);
    rect(0,0,50,100);

    rect(0,110,10,50);
    rect(37,110,10,120);
    rect(-30,-80,10,80);
 popMatrix();
 pushMatrix();
 translate(width/2,height/3);
 rotate(-QUARTER_PI);
  rect(0,-30,10,150);
      popMatrix();
  
  popMatrix();
 }
 //Chillen
 
 if (hour() >= 22 && hour() < 24)
 {
     pushMatrix();
    fill(255);
    stroke(0);
  ellipse(width/2,height/2,300,300);
  noStroke();
  ellipse(width/2,height/1.5,300,250);
  fill(0);
 ellipse(width/4,height/1.75,50,100);
  ellipse(width/1.33,height/1.75,50,100);
  popMatrix();
 
 }
 
}


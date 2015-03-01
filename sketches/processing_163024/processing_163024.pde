
//TJ Zimmardi September 25 2014

void setup(){
  
  size(400,300);
  background(255);
  smooth();
}


void draw(){
  
  //Head of Skip
  smooth();
  stroke(0);
  fill(#FFB564);
  rectMode(CENTER);
  rect(width/2, height/4,100,100);
  
  //Arms
  stroke(#FFB564);
  //Left Arm
  line(width/2 - 40,height/2 + 30,width/2 - 70, height/2);
  //Right Arm
  line(width/2 + 40, height/2 + 30,width/2 + 70,height/2);
  
  
  //Legs
  stroke(#FFB564);
  //Left Leg
  line(width/2 - 40,height - 50, width/2 - 40, height);
  //Right Leg
  line(width/2 + 40,height - 50, width/2 + 40, height);
  
  //Eyes of skip 
   stroke(0);
   ellipseMode(CENTER);
   //Left eye
   fill(0,0,255);
   ellipse(width/2 - 20,height/4 - 10, 20, 20);
   //Right Eye
   fill(255,0,0);
   ellipse(width/2 + 20, height/4 - 10, 20, 20);
   
   //Mouth of Skip
   stroke(#FFB564);
   fill(0,255,0);
   arc(width/2,height/2 - 60,50,20,0,PI);
   
  //Body of Skip
  stroke(0);
  fill(#FF64B2);
  triangle(width/2,height/3 + 25,width/4,height - 50,width - 100,height - 50);
  
  //Skips Hat
  stroke(0);
  fill(100,100,100);
  triangle(width/2, height - height, width/2 - 20,height - height + 30,
  width/2 + 20, height - height + 30);
}


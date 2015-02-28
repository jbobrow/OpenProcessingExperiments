
PImage ingleberry;
float berry = 0;
float berryneg = 1;

void setup(){
  size(1000, 650);
  ingleberry = loadImage("ingleberry.png");
}

void draw(){
  background(0);
  
  
  if(mousePressed){
    background(255,244,10);
  }
  
  //top lights//
  fill(random(0,255),0,60);
  ellipse(175, 150, 150, 150);
  
   fill(0,random(0,255),0);
  ellipse(475, 150, 150, 150);
  
     fill(0,0, random(0,255));
  ellipse(775, 150, 150, 150);
  
  //bottom lights //
  fill(random(0,255),0,60);
  ellipse(175, 500, 150, 150);
  
   fill(0,random(0,255),0);
  ellipse(475, 500, 150, 150);
  
     fill(0,0, random(0,255));
  ellipse(775, 500, 150, 150);
  
  textSize(60);
  fill(255,random(0,255),0);
text("INGLEBERRY DANCE PARTY", 120, 350); 

 textSize(20);
  fill(255,random(0,255),0);
text("Click Mouse to TURNUP!", 120, 400);

  
  //Ingleberry head character//
  imageMode(CENTER);
  image(ingleberry, berry,mouseY);
  berry = berry + berryneg;
  
  if(berry >1000){ berryneg = -4;
}
  if(berry<0){berryneg = 4;
}
 //Ingleberry head character
 

 
}





  



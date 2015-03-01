


//PImage bubs;
void setup () {
  noStroke ();
  size (600,500);
  //bubs = loadImage("bubs.png");
  
}
void draw (){
  background (#FF4DFF);
  //background (bubs);
  //tail
  fill(random(255), random(255), random (255));
   //fill (#4DFFF2);
  triangle (width/2,400,350,475,250,475);
  //body
 fill(random(255), random(255), random (255));
   //fill (#4DFFF2); 
  ellipse(300,225,100,350);
  //fin1
  quad(325,150,365,170,365,270,325,320);
  //fin2
  triangle(300,200,150,300,300,250);
  //eyes
    
  fill(#1A03FA);
  ellipse(300,75,20,20);
  fill(5,5,5);
  ellipse(300,75,10,10);
}



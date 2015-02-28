
PImage img;

void setup(){
   img = loadImage("TIMEONAUT.jpg");
 
 size(400,550);
smooth();
frameRate (1);
}

void draw(){
   image(img, 0,0,width,height);
  textSize (20);
  fill (random (255), random (255), random (255));
  text ("1", 50,50);
 text ("2",100,100);
 text ("3", 380,330);
 text ("4", 380,500);
 text ("5", 300,400);
 text ("6", 200,540);
 text ("7", 100,400);
 text ("8", 80,450);
 text ("9", 128,438);
 text ("10", 260,30);
 text ("11", 12,430);
 text ("12", 124,74);

  fill (247,200,14);
  stroke (300,300,60);
  
 fill (0);
  rect (0,135,120,100); 
  
  //Armband links
  fill (247,200,14);
  stroke (300,300,60); //umriss
  
 fill (0);
  rect (380,135,120,100); //Armband rechts
 
  noFill ();
   
   fill (255);
     ellipse (15,185,10,10);
  ellipse (50,185,10,10);
    ellipse (85,185,10,10);
  //Mittelteil
  fill (0);
  ellipse (250,187,300,300); 
  
  
  fill (100);
  
fill (255);
  ellipse (250,187,190,190); 
  
for(int i = 0; i<60;i++){

pushMatrix(); 
translate(width/2,height/2);
rotate(radians(360/60*i));
fill(247,200,14);

if(i%5==0){
 
  fill (0);

ellipse(0,100,40,40);
 }
else{
 
ellipse(50,100,10,10);
}

popMatrix();
}

pushMatrix();
noStroke();
translate(width/2,height/2);
rotate(radians(360/60*second()));
fill(random (255),random (255),random (255));
ellipse(0,0,100,100);
fill (247,200,14);
rect(0,-2,130,4);
noFill ();
fill (247,200,14);
popMatrix();

pushMatrix();
noStroke();
translate(width/2,height/2);
rotate(radians(360/60*minute())-HALF_PI);

fill(0);
rect(0,-2,130,6);
fill(247,200,14);

popMatrix();

pushMatrix();
noStroke();
translate(width/2,height/2);
rotate(radians(360/60*hour())+PI);
fill(0);
rect(0,-2,70,4);
fill(0);
ellipse (0,0,20,20);

popMatrix();
}



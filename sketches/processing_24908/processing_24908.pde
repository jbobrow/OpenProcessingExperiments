

                
                void setup () {
  size(500,500);
  smooth();
    background (195,250,159);
}

void draw() {

  noStroke();
  fill (98,49,8);
  ellipse (250,290,210,225); //body
  ellipse (250,130,150,150); //head
  ellipse (200,50,50,50); //left ear
  ellipse (300,50,50,50); //right ear

 // noStroke();
  fill (178,118,68);
  ellipse (250,290,150,165); //body middle
  ellipse (250,160,90,60); //muzzle
  ellipse (150,240,45,40); //left top paw
  ellipse (350,240,45,40); //right top paw
  ellipse (160,370,50,50); //left bottom paw
  ellipse (340,370,50,50); //right bottom paw

  stroke(0);
  fill (222,208,197);
  ellipse (280,100,30,30); //right eye
  ellipse (220,100,30,30); //left eye

  fill(23,11,0);
  ellipse (250,150,50,20); //nose
  
 //map ( value/ data, actual min , actual max, target min, target max) 

  float leftPupil = map (mouseX, 0, width,  220-8, 220+8);
  float yValue = map (mouseY, 0, width, 100-8, 100+8);
  ellipse (leftPupil, yValue ,10,10); //left pupil

  float rightPupil = map (mouseX, 0, width,  280-8, 280+8);
//  map (mouseY, 0, width, 100-15, 100+15);
  ellipse (rightPupil, yValue ,10,10); //right pupil
}

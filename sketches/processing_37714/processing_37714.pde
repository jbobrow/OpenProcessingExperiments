
size(400, 400);
rectMode(CENTER);

background (0);	

stroke(245, 195, 12, 50); //transparency set
noFill();



for (int countX=0; countX<width/10; countX++) {//starting point of composition,X< spacing	
  for (int countY=0; countY<height/10;countY++) {	

    for (int rectSize=150; rectSize>=70; rectSize-=70) {//rectSize-size of object,next two concentrate on spacing

      ellipse(25+(countX*70), height/4.5+(countY*20), rectSize+50, rectSize+30);//countX*number controls spacing in horiz.
    }
  }
}	



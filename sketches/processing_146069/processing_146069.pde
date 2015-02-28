
int counter;

void setup(){           //this is a funktion of type void, thing happens once
  size(400,420);  
  frameRate(25);        //set the framerate
  //background(#0935DE); //here for a lot of objects

}
void draw(){           //this is a funktion of type void, more than once
  background(#0935DE);   //here for only one moving objekt

pushMatrix();
translate(mouseX-width/2, mouseY-height/2);

if (mousePressed) {
    fill(0, 0, 0);
    textSize(20);
    text("Don't click!", 20, 20);
  }
  else {
    textSize(1);
  }

if(mousePressed == true){translate(mouseX-width/2, mouseY-height/2);
//Kopf;
fill(#0935DE);
stroke(#000000);
ellipse(150,180,210,240);

//augen;
fill(#ffffff);
noStroke();
ellipse(100,180,80,40);
ellipse(200,180,80,40);
fill(#000000);
ellipse(100,187,20,20);
ellipse(200,187,20,20);

//Mund;
fill(#E81717);
ellipse(150,300,30,60);
fill(#000000);
ellipse(150,280,150,30);
stroke(0);
fill(#0935DE);
ellipse(150,240,30,80);



//Hut;
noStroke();
fill(#ffffff);
ellipse(150,90,150,40);
ellipse(150,60,120,80);
fill(#000000);
ellipse(150,75,115,10);

//Augenbrauen;
ellipse(100,160,80,10);
ellipse(200,150,80,10);

} else {
//Kopf;
fill(#0935DE);
stroke(#000000);
ellipse(150,180,210,240);

//augen;
fill(#ffffff);
noStroke();
ellipse(100,180,80,40);
ellipse(200,180,80,40);
fill(#000000);
ellipse(100,187,20,20);
ellipse(200,187,20,20);

//Mund;
ellipse(150,280,150,30);
stroke(0);
fill(#0935DE);
ellipse(150,240,30,80);

//Hut;
noStroke();
fill(#ffffff);
ellipse(150,90,150,40);
ellipse(150,60,120,80);
fill(#000000);
ellipse(150,75,115,10);

//Augenbrauen;
ellipse(100,150,80,10);
ellipse(200,150,80,10);
}

  //println(frameRate);   //print out the frame rate of the sketch


popMatrix();
}

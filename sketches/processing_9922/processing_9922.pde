
void setup (){

  size (925, 185); 
  background (255); 
  smooth(); 
  strokeWeight(5); 
  stroke(0); 
  rectMode(CORNER); 
}

void draw(){


  for (int i=  0; i <= width; i+=width/5){

    //Quadrate
    pushMatrix(); 
    pushStyle(); 
    translate(i, 0); 
    strokeWeight(1); 
    rect(0, 0, width/5, height);  
    popStyle(); 
    popMatrix(); 



    //Horizontale Linien
    if (i >=width/5){
      line (0, height/2, width, height/2);
    }

    if (i >= width/2){   
      line (i-width/5, height/4, width, height/4); 
    }

    if (i>= 3*width/5){

      line (3*width/5, (height/4)*3, width, (height/4)*3); 
    }

// vertikale Linien
    if (i==width/5){
      line ((width/5) /2, 0, (width/5) /2, height); 
    }

    if (i==2*width/5)
    {

      translate (width/5, 0); 
      line ((width/5)/4, 0, (width/5)/4, height); 
      line ((width/5)/4*2, 0, (width/5)/4*2, height);  

    }

    if (i==3*width/5)
    {
      translate (width/5, 0); 
      line ((width/5)/4, 0, (width/5)/4, height); 
      line ((width/5)/4*2, 0, (width/5)/4*2, height);  
    }
    if (i==4*width/5)
    {
      translate (width/5, 0); 
      line ((width/5)/4, 0, (width/5)/4, height); 
      line ((width/5)/4*2, 0, (width/5)/4*2, height);
      line ((width/5)/4*3, 0, (width/5)/4*3, height); 
    }

    if (i==width)
    {
      translate (width/5, 0); 
      line ((width/5)/4, 0, (width/5)/4, height); 
      line ((width/5)/4*2, 0, (width/5)/4*2, height);
      line ((width/5)/4*3, 0, (width/5)/4*3, height); 
    }


  }




}






int diam = 5;  

float centX, centY;

 

void setup() {

  size(400, 400);

  smooth();


  centX = width/2; 

  centY = height/8; 

  

  strokeWeight(2); 

  noFill(); 


  frameRate(10);

  smooth();

  background (211,234,19);

  centX = width/5; 

  centY = height/5; 

  stroke(94,243,238); 

  strokeWeight(2); 

  noFill(); 


}

 

//

void draw() {

  //si diam es menos o igual a 400 pasa algo

  if(diam <= 400){

    //background (180);

    //dibuja elipse

   stroke(random(278), random(278),random(278), random(278));

   strokeWeight(random (15));

    rect (centX, centY, diam, diam);
    
      ellipse(centX, centY, diam, diam);

   

    diam +=10;




  }

}


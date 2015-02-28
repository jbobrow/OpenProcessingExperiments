
// 2D particle Illustration 
// see step-by-step tutorial here:
// https://sites.google.com/site/createwithcode/ilustracoes-generativas/2d-particles-ilustration


size ( 400, 500);
background( 0); // random gray 
smooth(); 

// FIRST "LAYER" - 5000 particles, size between 0 and 3, opacity between 0 and 150
for ( int i = 0; i < 5000; i = i + 1){// repeat (loop) 10.000 times

      strokeWeight(random(3)); // give a random size for each particle
      stroke( 255, random(0,150)); // give a random white transparency
      point( random(width),random(height)); // give a random position

}


// SECOND "LAYER" - 200 particles, size between 3 and 8, opacity between 100 and 255
for ( int i = 0; i < 200; i = i + 1){// repeat (loop) 10.000 times

      
      strokeWeight(random(6,8)); // give a random size for each particle
      stroke( 255, 255); // give a random white transparency
      point( random(width),random(height)); // give a random position
  

}

//************

// THIRD "LAYER"- - 10 particles, size between 8 and 15, opacity between 180 and 255
for ( int i = 0; i < 10; i = i + 1){// repeat (loop) 10.000 times

      strokeWeight(random(100,150)); // give a random size for each particle
      stroke( 255, 255); // give a random white transparency
      // give a random position in a bounding box defined in the center of the image
      point( random(width/2-30,width/2+30),random(height/2-35,height/2+35)); 
}


for ( int i = 0; i < 10; i = i + 1){// repeat (loop) 10.000 times

      strokeWeight(random(40,50)); // give a random size for each particle
      stroke( 255, 255,0, 255); // give a random white transparency
      // give a random position in a bounding box defined in the center of the image
      point( random(width/2-10,width/2+10),random(height/2-10,height/2+10)); 

}




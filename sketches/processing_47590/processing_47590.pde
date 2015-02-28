








float rectSize = 20;




void setup () {

  size (1250, 580);
}





void draw () {


  if (mousePressed) {
  }
  //pixels 
  background (0);
  stroke (0, 255);

  smooth ();

  frameRate (6); 


  for (int i = 10; i < 500; i = i + 20) {
    for (int k = 0; k < 20; k++) {

      fill (240, 70 * k, 10 * i, 40);





      triangle (50 * k, 
      30 * k, 
      20, 
      20 * k, 
      rectSize, 
      rectSize);
      translate(width/6, height/6);
      rotate(PI/2.5 + mouseX + mouseY);

      quad (50 * k + random (-i, i), 30 * k, 80 + random (-k, k), 20, 69, 90, 30, 76);




      noStroke ();


     
    }
  }
}








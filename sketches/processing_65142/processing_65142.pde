
void experimental(){
  
  
 

//    if (( mouseX > 120) && (mouseX < 380) && 
//      (mouseY > 120) && (mouseY < 380)) {


      //background(255);
      noStroke();

      //for (int i =0; i < images.length; i++){
      textured();
      //rect(0, 0, width, height);
      i++;
      if (i==37) {
        i=0;

        tint(255, 200);
      }
      image(images[i], 0, 0);
      tint(255, 150);

 fill(255, 10);
      noStroke();
      rect(0, 0, width, height);
     
      fill(255, 10);
      noStroke();
      rect(0, 0, width, height);
      //}
      }


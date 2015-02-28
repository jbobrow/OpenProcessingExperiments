

  for (int i = 0; i < 10; i++) { 


    image(img8, mouseX * i, mouseY * i); 


  } 


  popMatrix(); 


  a += 0.2; 


} 


   


void keyPressed(){ 


     


  if(keyCode == ENTER){ 


    save("image01.png"); 


  } 

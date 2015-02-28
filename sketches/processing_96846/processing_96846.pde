



size (250 , 200);





smooth ();





background (40, 50, 15);





  





  





  





for (int y = 0; y < height; y +=2) {





  for (int x= 0; x < width; x +=15) {





    if(x>50) {





      rotate (3);}





      else {





        ellipse(x, y+6, 10, 10);





      fill(103, 6, 6);}





    rect (x+20, y+20,50, 50);





    fill(155, 0, 0, 70);





  }





}



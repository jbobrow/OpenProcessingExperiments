
int lastKeyPressed;




int currentKeyPressed;




int column;









void setup() {




  size(600, 600);




  // reduce text size

  textSize(16);




  textAlign(RIGHT);
}









void draw() {









  background(0);




  int column = 0;




  int i = 1;




  int j = 1;




  float x = 10;



  float y = 50;









  // for each row




  while (j < 10) {




    i = 1;




    x = 50;




    // an entry for each column




    while (i < 10) {




      int anwser = i * j;




      fill(255);




      text(anwser, x, y);




      if (j == 1)




      {




        if (i == currentKeyPressed)




        {




          fill(0, 255, 0);



          text(anwser, x, y);
        }
      }




      if (j == lastKeyPressed)




      {




        if (i == 1)




        {




          fill(0, 255, 0);



          text(anwser, x, y);
        }
      }




      if ( (i == currentKeyPressed) && (j == lastKeyPressed))




      {



        fill(255, 0, 0);




        text(anwser, x, y);
      }




      x = x + 60;




      i++;
    }




    y = y + 60;




    j++;
  }
}









void keyReleased() {




  if (column == 0)




  {




    currentKeyPressed = keyCode - 48;
  }




  if (column == 1)




  {




    lastKeyPressed = keyCode - 48;
  }




  column ++;




  if (column == 2)




  {




    column = 0;
  }




  println("current="+currentKeyPressed);




  println("last="+lastKeyPressed);
}



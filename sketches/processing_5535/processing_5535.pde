
//import processing.pdf.*;

int counter = 0;

void setup () {
  size(800,800);


}


void draw() {
  //beginRecord(PDF, "tartan.pdf");
  noStroke();
  background(37,41,124);

  //loop 2
  int y = 0;
  while(y<height){ 


    //loop 1
    int x = 0;

    while(x<width){



      //vertical green

      fill(32,111,33,100);
      rect(x+75,y,150,300);

      //horizontal green

      fill(32,111,33,100);
      rect(x,y+100,300,150);

      //vertical dark blue
      fill(5,4,100,150);
      rect(x+150,y,10,300);

      //horizontal dark blue
      fill(5,4,100,150);
      rect(x,y+170,300,10);

      //vertical light blue
      fill(80,159,234,mouseY/10);
      rect(x+140,y,10,300);
      fill(80,159,234,mouseX/10);
      rect(x+160,y,10,300);

      //horizontal light blue
      fill(80,159,234,mouseY/10);
      rect(x,y+160,300,10);
      fill(80,159,234,mouseX/10);
      rect(x,y+180,300,10);



      //horizontal white
      fill(255,255,255,mouseX/5);
      rect(x,y+20,300,10);

      //vertical white
      fill(255,255,255,mouseY/5);
      rect(x,y,10,300);




      x = x+300;

    }//end loop 1

    y = y+300;

  }//end loop 2

}

void mousePressed() {
  save("myPattern"+counter+".tif");

  counter = counter + 1;
 // endRecord();

}



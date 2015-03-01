
//100 random substrings...
//so for (i =0; i<100; i++)

//assign string by girlsname
//that has 18 character
//assign pfont
//assign fonttype at the tool
//use textfont
//use fill and text
//in text, use s. substring using random
//make it slanted diagonally
//in substring, use random between
//use random on the location of the text
//use random on the size of the text using textSize

String s = "KimMarineEvaNicole";
//18
PFont font;
float theta;


void setup()
{
  background(230);
  size(340, 680);
  font = loadFont("RaananaBold-200.vlw");
  textFont(font);
}

void draw()
{
  if (mousePressed) {
    background(230);

    for (int i = 0; i<100; i++) {
      for (float theta = PI/4; theta < PI/2; theta += PI/4) {
        //the reason why I use for loop is that for is just to count one hundred

        int substrStrt = (int) random(0, s.length()/2);
        int substrEnd =  (int) random(substrStrt, s.length());


        fill(random(50, 140));
        text(s.substring(substrStrt, substrEnd), random(0, width), random(0, height));
        textSize(random(0, 60));
        if (theta == PI/4) rotate(-theta);
      }
    }
  }
}




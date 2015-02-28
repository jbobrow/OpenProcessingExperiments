
for (int y = 10; y<=90; y+=10) { // run through the y dimension, this increases y by 10 everytime up until y is bigger than or equal to 90
  for (int x = 10; x<=90; x+=10) {// run through the x dimension, this increases x by 10 everytime up until x is bigger than or equal to 90
    point(x,y); //draw point for each value of x and y that we run through in the for loops
    println (x + " " + y + " "); //print so that we can see what is happening
  }
}



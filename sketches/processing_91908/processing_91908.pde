
  /* Author: Luke Undhjem
  *  Date: 3/4/2013
  *  Description: I used a very unique wallpaper that stuck out to me for the background
  *  to serve as a basis for the generative art. I used a color tool to match the most
  *  prominent greens, blues, and purples in the image, then used random() to generate
  *  a random number 0-5 that would determine the color of the star and its outline each
  *  time the mouse is clicked. The random numbers also determine the line's colors that come
  *  from the center of the image. The vectors of the custom shape used for the stars is
  *  the same provided for a star in the processing tutorial.
  */
     
   int x;
   int y;
   int r;
   PImage bg;
    void setup() {
       size(500, 374);
       stroke(255);
       bg = loadImage("indigo.jpg");
        background(bg);
     }
   
     void draw() {
       if(mousePressed){
         r = int(random(6));
         if(r == 0){
          stroke(24, 229, 109);}
         else if(r == 1){
          stroke(11, 174, 81);}
         else if(r == 2){
          stroke(160, 31, 203);}
         else if(r == 3){
          stroke(92, 28, 105);}
         else if(r == 4){
          stroke(20, 188, 190);}
         else if(r == 5){
          stroke(18, 31, 126);}
       line(width/2,height/2, mouseX, mouseY);
       }
     }
     
     void mousePressed() {
        r = int(random(6));
        translate(mouseX, mouseY);
        if(r == 0){
          fill(24, 229, 109);}
        else if(r == 1){
          fill(11, 174, 81);}
        else if(r == 2){
          fill(160, 31, 203);}
        else if(r == 3){
          fill(92, 28, 105);}
         else if(r == 4){
          fill(20, 188, 190);}
         else if(r == 5){
          fill(18, 31, 126);}
        strokeWeight(2);
        beginShape();
        vertex(0, -50);
        vertex(14, -20);
        vertex(47, -15);
        vertex(23, 7);
        vertex(29, 40);
        vertex(0, 25);
        vertex(-29, 40);
        vertex(-23, 7);
        vertex(-47, -15);
        vertex(-14, -20);
        endShape(CLOSE);
        x = mouseX;
        y = mouseY;
     }



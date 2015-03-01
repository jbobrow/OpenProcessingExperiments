
float num;
void setup(){
  size(640, 640);
  noStroke();
}

void draw(){
   /* Fading trick */
   fill(0, 10);
   rect(0, 0, width, height);
   
   translate(width/2, height/2);
   /* Make mouseX values between 100 and 200. */
   float maxX = map(mouseX, 0, width, 100, 200);
   /* Change i+=1 to i+=2 for a simpler effect */
   for(int i = 0; i < 360; i+=2){
     float x = sin(radians(i));
     float y = cos(radians(i));
     /* 
       Variable d is finding the distance from the stationary location (x and y) to the moving coords. The moving
       coords could of been put into their own variable but I like compact code so i chose a different way. Because the
       moving coords would have the same component as x and y but multiplied by different values, I chose to just
       multiply them in the variable d. 
       
       This is a little trick but look at the variable d. I multiply x and y by maxX which is the mouse movement, but
       I also multiply x and y by the moving values. 
     */
     float d = map(dist(x*maxX, y*maxX, x*(150+sin(i+num) * 50), y*(150+sin(i+num) * 50)), 0, 200, 1, 45);
     fill(0, 150, 255, 10+d);
     /* Same deal with the variable d. I also use d for size. */
     ellipse(x*(150+sin(i+num) * 50), y*(150+sin(i+num) * 50), d, d);
     ellipse(x*(50+sin(i-num) * 50), y*(50+sin(i-num) * 50), d, d);
   }
   num+=0.01;
}



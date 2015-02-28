
int x;
int y;

void setup(){
  size (800, 600, P2D);


}

void draw(){
  
  background(156, 250, 157);
  textSize(52);
  fill(247, 101, 250);
  text("Happy Birthday Dad", x-500, 300);
  if (frameCount > 60){
    x = x+4;
  }
  fill(240, 44, 57);
  ellipse(50, y+400, 50, 70);
  fill(0, 0, 0);
  line(50, y+435, 50, y+550);
  if(frameCount > 400){
    y = y-1;
  }
  fill(62, 44, 240);
  ellipse(400, y+350, 50, 70);
  fill(0, 0, 0);
  line(400, y+385, 400, y+550);
  if(frameCount > 420){
   y = y-1;
}
 fill(248, 252, 38);
 ellipse(240, y+430, 50, 70);
 fill(0, 0, 0);
 line(240, y+465, 240, y+530);
 if(frameCount > 450){
   y = y-1;
 }
 fill(252, 38, 228);
 ellipse(600, y+500, 50, 70);
 fill(0, 0, 0);
 line(600, y+535, 600, y+590);
 if(frameCount> 500){
   y = y-1;
 }
 fill(255, 155, 54);
 ellipse(450, y+410, 50, 70);
 fill(0, 0, 0);
 line(450, y+445, 450, y+550);
 if(frameCount > 400){
   y = y-1;
 }
 fill(163, 12, 240);
 ellipse(700, y+350, 50, 70);
 fill(0, 0, 0);
 line(700, y+385, 700, y+490);
 if(frameCount > 400){
   y = y-1;
 }
 if(frameCount > 480){
   textSize(18);
   fill(247, 101, 250);
   text("Thank you for supporting me when no one else does,", 200, 250);
   text("making me laugh when I need it,", 200, 300);
   text("and everything you've done for me.", 200, 350);
   text("Love, Alex", 250, 400);
 }

}

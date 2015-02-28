
class Robot {
  float cx = 200;
  float cy = 200;

  Robot () {
   
  }


  void display () {
    if (mouseX>20 && mouseX<530) {
      int cx = mouseX;
      int cy = mouseY;
      fill(133, 133, 133);
      //head 
      rect(cx, cy, 180, 250);
      //left eye
      ellipse(cx-60, cy, 100, 100);
      fill(20, 255, 0);
      ellipse(cx-60, cy, 50, 50);
      //right eye
      fill(133, 133, 133);
      ellipse(cx+60, cy, 100, 100);
      fill(20, 255, 0);
      ellipse(cx+60, cy, 50, 50);
      //left eyebrow
      fill(0);
      rect(cx-80, cy-70, 80, 30);
      //right eyebrow
      rect(cx+80, cy-70, 80, 30);
      //nose
      fill(20, 255, 0);
      rect(cx, cy+50, 35, 20);
      //left ear
      rect(cx-100, cy+70, 15, 20);
      line(cx-107, cy+70, cx-112, cy+70);
      ellipse(cx-120, cy+70, 5, 5);
      //right ear
      rect(cx+100, cy+70, 15, 20);
      line(cx+107, cy+70, cx+112, cy+70);
      ellipse(cx+120, cy+70, 5, 5);
      //antenna
      strokeWeight(5);
      line(cx, cy-127, cx, cy-140);
      line(cx, cy-140, cx-20, cy-150);
      line(cx-20, cy-150, cx+40, cy-150);
      line(cx+40, cy-150, cx, cy-165);
      line(cx, cy-165, cx, cy-170);
      ellipse(cx, cy-175, 5, 5);

      fill(20, 255, 0);
      strokeWeight(1);
      for (int i=0; i<125; i+=30) {
        rect(i+cx-60, cy+90, 15, 30);
      }

      fill(133, 133, 133);
      strokeWeight(1);
      //neck
      rect(cx, cy+150, 50, 50);
      //torso
      rect(cx, cy+270, 150, 200);
      //circles on torso
      fill(random(255),random(255),random(255));
      ellipse(cx, cy+250, 100, 100);
      fill(133, 133, 133);
      ellipse(cx, cy+250, 60, 60);
      //left arm
      fill(133, 133, 133);
      rect(cx-95, cy+300, 40, 260);
      fill(20, 255, 0);
      rect(cx-100, cy+200, 60, 60);
      //right arm
      fill(133, 133, 133);
      rect(cx+95, cy+300, 40, 260);
      fill(20, 255, 0);
      rect(cx+100, cy+200, 60, 60);
      //lower tummy
      //arc(x,y,width,height,start,stop)
      fill(133, 133, 133);
      arc(cx, cy+370, 130, 15, 0, PI);
      //left leg
      rect(cx-40, cy+450, 40, 150);
      fill(20, 255, 0);
      ellipse(cx-40, cy+450, 60, 60);
      //right leg
      fill(133, 133, 133);
      rect(cx+40, cy+450, 40, 150);
      fill(20, 255, 0);
      ellipse(cx+40, cy+450, 60, 60);
      //left foot
      fill(133, 133, 133);
      arc(cx-60, cy+550, 100, 60, PI, TWO_PI);
      //right foot
      arc(cx+60, cy+550, 100, 60, PI, TWO_PI);
    } 
    else if (mouseX<100 || mouseX>300) {
      background(0);
      textSize(50);
      fill(20, 255, 0);
      text("z3335315", 100, 700);
    } 
    else {
    }
  }
}




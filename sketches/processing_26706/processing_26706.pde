
void drawBall() {
  smooth ();
  stroke(0,0,0);
  fill(mouseX,mouseY,255,127);
  ellipse(mouseX,mouseY,eyeX-50,eyeX-50);

 smooth ();
  stroke(0,0,0);
  fill(mouseX,mouseY,255,127);
  ellipse(mouseX,mouseY,eyeY-30,eyeY-30);

  smooth ();
  stroke(0,0,0);
  fill(mouseX,mouseY,255,127);
  ellipse(mouseX,mouseY,eyeY-30,eyeY-30);
}


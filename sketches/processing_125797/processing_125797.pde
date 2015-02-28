
void setup () {
  size(600, 600);
}
  
  void draw() {
      background(255, 250, 152);
    if (mousePressed) {
      rectMode(CENTER); //corpo
      fill(56, 95, 20);
      rect(mouseX, mouseY, 50, 150);
      fill(247, 192, 140); //orecchie
      ellipse(mouseX-46, mouseY-70, 7, 15);
      ellipse(mouseX+46, mouseY-70, 7, 15);
      stroke(0); //faccia
      ellipse(mouseX, mouseY-70, 90, 90);
      fill(255); //occhi
      ellipse(mouseX-20, mouseY-70, 10, 25);
      ellipse(mouseX+20, mouseY-70, 10, 25);
      fill(0); //pupille
      ellipse(mouseX-20, mouseY-70, 5, 15);
      ellipse(mouseX+20, mouseY-70, 5, 15);
      fill(222, 168, 119); //naso
      ellipse(mouseX, mouseY-52, 15, 5);
      fill(131, 86, 44); //cappello
      stroke(131, 86, 44);
      ellipse(mouseX, mouseY-120, 50, 40);
      rectMode(CENTER);
      rect(mouseX, mouseY-110, 70, 20);
      fill(245, 220, 25); //papillon
      stroke(245, 220, 25);
      triangle(mouseX-20, mouseY-7, mouseX-20, mouseY-27, mouseX, mouseY-17);
      triangle(mouseX+20, mouseY-7, mouseX, mouseY-17, mouseX+20, mouseY-27);
      ellipse(mouseX, mouseY-17, 10, 10);
      ellipse(mouseX, mouseY+10, 5, 5); //bottoni
      ellipse(mouseX, mouseY+30, 5, 5);
      ellipse(mouseX, mouseY+50, 5, 5);
      stroke(0); //gambe
      line(mouseX-25, mouseY+75, mouseX-32, mouseY+120);
      line(mouseX+25, mouseY+75, mouseX+32, mouseY+120);
      line(mouseX-10, mouseY-40, mouseX+10, mouseY-40); //bocca
      fill(131, 86, 44); //scarpe
      stroke(131, 86, 44);
      rectMode(CORNERS);
      rect(mouseX-52, mouseY+120, mouseX-32, mouseY+130);
      rect(mouseX+52, mouseY+120, mouseX+32, mouseY+130);
      ellipse(mouseX-47, mouseY+123, 25, 15);
      ellipse(mouseX+47, mouseY+123, 25, 15 );
      stroke(0); //braccia
      line(mouseX-25, mouseY-30, mouseX-50, mouseY+20);
      line(mouseX+25, mouseY-30, mouseX+50, mouseY+20);
       line(mouseX-25, mouseY-88, mouseX-15, mouseY-88); //sopracciglia
      line(mouseX+25, mouseY-88, mouseX+15, mouseY-88);
      } else {
        rectMode(CENTER); //corpo
      fill(227, 49, 14);
      rect(mouseX, mouseY, 50, 150);
      fill(247, 192, 140); //orecchie
      ellipse(mouseX-46, mouseY-70, 7, 15);
      ellipse(mouseX+46, mouseY-70, 7, 15);
      stroke(0); //faccia
      ellipse(mouseX, mouseY-70, 90, 90);
      fill(255); //occhi
      ellipse(mouseX-20, mouseY-70, 10, 25);
      ellipse(mouseX+20, mouseY-70, 10, 25);
      fill(0); //pupille
      ellipse(mouseX-20, mouseY-70, 5, 15);
      ellipse(mouseX+20, mouseY-70, 5, 15);
      fill(222, 168, 119); //naso
      ellipse(mouseX, mouseY-52, 15, 5);
      fill(41, 99, 178); //cappello
      stroke(41, 99, 178);
      ellipse(mouseX, mouseY-120, 50, 40);
      rectMode(CENTER);
      rect(mouseX, mouseY-110, 70, 20);
      fill(255); //papillon
      stroke(255);
      triangle(mouseX-20, mouseY-7, mouseX-20, mouseY-27, mouseX, mouseY-17);
      triangle(mouseX+20, mouseY-7, mouseX, mouseY-17, mouseX+20, mouseY-27);
      ellipse(mouseX, mouseY-17, 10, 10);
      ellipse(mouseX, mouseY+10, 5, 5); //bottoni
      ellipse(mouseX, mouseY+30, 5, 5);
      ellipse(mouseX, mouseY+50, 5, 5);
      stroke(0); //gambe
      line(mouseX-25, mouseY+75, mouseX-32, mouseY+120);
      line(mouseX+25, mouseY+75, mouseX+32, mouseY+120);
      line(mouseX-10, mouseY-40, mouseX+10, mouseY-42); //bocca
      fill(41,99, 178); //scarpe
      stroke(41, 99, 178);
      rectMode(CORNERS);
      rect(mouseX-52, mouseY+120, mouseX-32, mouseY+130);
      rect(mouseX+52, mouseY+120, mouseX+32, mouseY+130);
      ellipse(mouseX-47, mouseY+123, 25, 15);
      ellipse(mouseX+47, mouseY+123, 25, 15 );
      stroke(0); //braccia
      line(mouseX-25, mouseY-30, mouseX-50, mouseY+20);
      line(mouseX+25, mouseY-30, mouseX+50, mouseY+20);
      line(mouseX-25, mouseY-88, mouseX-15, mouseY-85); //sopracciglia
      line(mouseX+25, mouseY-88, mouseX+15, mouseY-85);
      }
      }
      



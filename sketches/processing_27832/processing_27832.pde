
class Rain {
  float r = random(900);
  float y = random(-height);

  void fall() {
     y = y + 7;
    fill(104, 158, 181, rainOpacity);
    noStroke();
    ellipse(r, y, 8, 8);

   if(y > height) {
     r = random(mouseX - 250, mouseX + 70);
     y = 0;
    }
   }  
  }
  





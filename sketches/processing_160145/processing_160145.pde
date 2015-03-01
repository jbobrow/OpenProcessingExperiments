
void setup(){
  size(1000, 1000);
  colorMode(HSB);
  background(0);
  //frameRate(4);
}

void draw(){
  background(0);
  strokeWeight(3);
  int x = 50;
  int y = 50;
  
  
  while(x < 1000){
    while(y < 1000){
      stroke(250-x/4, y/(500/255), 5);
      line(x, y, x + (mouseX-x)/25, y + (mouseY-y)/25);
      stroke(250-x/4, y/(500/255), 15);
      line(x + (mouseX-x)/25, y + (mouseY-y)/25, x + 2*(mouseX-x)/25, y + 2*(mouseY-y)/25);
      stroke(250-x/4, y/(500/255), 25);
      line(x + 2*(mouseX-x)/25, y + 2*(mouseY-y)/25, x + 3*(mouseX-x)/25, y + 3*(mouseY-y)/25);
      stroke(250-x/4, y/(500/255), 35);
      line(x + 3*(mouseX-x)/25, y + 3*(mouseY-y)/25, x + 4*(mouseX-x)/25, y + 4*(mouseY-y)/25);
      stroke(250-x/4, y/(500/255), 45);
      line(x + 4*(mouseX-x)/25, y + 4*(mouseY-y)/25, x + 4*(mouseX-x)/25, y + 4*(mouseY-y)/25);
      stroke(250-x/4, y/(500/255), 55);
      line(x + 4*(mouseX-x)/25, y + 4*(mouseY-y)/25, x + 5*(mouseX-x)/25, y + 5*(mouseY-y)/25);
      stroke(250-x/4, y/(500/255), 65);
      line(x + 5*(mouseX-x)/25, y + 5*(mouseY-y)/25, x + 6*(mouseX-x)/25, y + 6*(mouseY-y)/25);
      stroke(250-x/4, y/(500/255), 75);
      line(x + 6*(mouseX-x)/25, y + 6*(mouseY-y)/25, x + 7*(mouseX-x)/25, y + 7*(mouseY-y)/25);
      stroke(250-x/4, y/(500/255), 85);
      line(x + 7*(mouseX-x)/25, y + 7*(mouseY-y)/25, x + 8*(mouseX-x)/25, y + 8*(mouseY-y)/25);
      stroke(250-x/4, y/(500/255), 95);
      line(x + 8*(mouseX-x)/25, y + 8*(mouseY-y)/25, x + 9*(mouseX-x)/25, y + 9*(mouseY-y)/25);
      stroke(250-x/4, y/(500/255), 105);
      line(x + 9*(mouseX-x)/25, y + 9*(mouseY-y)/25, x + 10*(mouseX-x)/25, y + 10*(mouseY-y)/25);
      stroke(250-x/4, y/(500/255), 115);
      line(x + 10*(mouseX-x)/25, y + 10*(mouseY-y)/25, x + 11*(mouseX-x)/25, y + 11*(mouseY-y)/25);
      stroke(250-x/4, y/(500/255), 125);
      line(x + 11*(mouseX-x)/25, y + 11*(mouseY-y)/25, x + 12*(mouseX-x)/25, y + 12*(mouseY-y)/25);
      stroke(250-x/4, y/(500/255), 135);
      line(x + 12*(mouseX-x)/25, y + 12*(mouseY-y)/25, x + 13*(mouseX-x)/25, y + 13*(mouseY-y)/25);
      stroke(250-x/4, y/(500/255), 145);
      line(x + 13*(mouseX-x)/25, y + 13*(mouseY-y)/25, x + 14*(mouseX-x)/25, y + 14*(mouseY-y)/25);
      stroke(250-x/4, y/(500/255), 155);
      line(x + 14*(mouseX-x)/25, y + 14*(mouseY-y)/25, x + 15*(mouseX-x)/25, y + 15*(mouseY-y)/25);
      stroke(250-x/4, y/(500/255), 165);
      line(x + 15*(mouseX-x)/25, y + 15*(mouseY-y)/25, x + 16*(mouseX-x)/25, y + 16*(mouseY-y)/25);
      stroke(250-x/4, y/(500/255), 175);
      line(x + 16*(mouseX-x)/25, y + 16*(mouseY-y)/25, x + 17*(mouseX-x)/25, y + 17*(mouseY-y)/25);
      stroke(250-x/4, y/(500/255), 185);
      line(x + 17*(mouseX-x)/25, y + 17*(mouseY-y)/25, x + 18*(mouseX-x)/25, y + 18*(mouseY-y)/25);
      stroke(250-x/4, y/(500/255), 195);
      line(x + 18*(mouseX-x)/25, y + 18*(mouseY-y)/25, x + 19*(mouseX-x)/25, y + 19*(mouseY-y)/25);
      stroke(250-x/4, y/(500/255), 205);
      line(x + 19*(mouseX-x)/25, y + 19*(mouseY-y)/25, x + 20*(mouseX-x)/25, y + 20*(mouseY-y)/25);
      stroke(250-x/4, y/(500/255), 215);
      line(x + 20*(mouseX-x)/25, y + 20*(mouseY-y)/25, x + 21*(mouseX-x)/25, y + 21*(mouseY-y)/25);
      stroke(250-x/4, y/(500/255), 225);
      line(x + 21*(mouseX-x)/25, y + 21*(mouseY-y)/25, x + 22*(mouseX-x)/25, y + 22*(mouseY-y)/25);
      stroke(250-x/4, y/(500/255), 235);
      line(x + 22*(mouseX-x)/25, y + 22*(mouseY-y)/25, x + 23*(mouseX-x)/25, y + 23*(mouseY-y)/25);
      stroke(250-x/4, y/(500/255), 245);
      line(x + 23*(mouseX-x)/25, y + 23*(mouseY-y)/25, x + 24*(mouseX-x)/25, y + 24*(mouseY-y)/25);
      stroke(250-x/4, y/(500/255), 255);
      line(x + 24*(mouseX-x)/25, y + 24*(mouseY-y)/25, mouseX, mouseY);
      y = y + 50;
    }
    x = x + 50;
    y = 50;
  }
}



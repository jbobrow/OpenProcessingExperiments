
int backzeit = 0;
int platteX = 230;
int platteY = 110;

void setup () {
//  boolean gebacken = false;
  size(640, 360);
}

void draw () {
  //Herd
  background (100);
  fill(200);
  rect(150, 50, 350, 270,20);
  herdplatten(0, 0);
  
  //Gas
  rect(205, 320, 40, 17);
  rect(267, 320, 40, 17);
  rect(340, 320, 40, 17);
  rect(400, 320, 40, 17);

  if(mousePressed){
    flammen(180, 65);
    if (backzeit < 200) {
      if (quad_distanz(mouseX, mouseY, platteX, platteY) < 100) {
        in_reichweite = true;
        backzeit++;
      }
    }
    pfanne(mouseX, mouseY-80);
  }
  text(str(backzeit* 0.5)+"%", 10,10);
}


int quad_distanz(x1, y1, x2, y2) {
  return (x1-x2) * (x1-x2) + (y1-y2) * (y1-y2);
}


void herdplatten(x, y) {
  fill(150);
  ellipse(420,110,100,90);
  ellipse(420,250,100,90);
  ellipse(230,250,100,90);
  if (mousePressed) {
    fill(230)
  }
  ellipse(230,110,100,90);  
}


void flammen(x, y) {
    scale(random(1, 1.008));
    fill(255);
    triangle(x+50,  y,    x+65, y+48, x+40, y+48);
    triangle(x+50,  y+95, x+65, y+48, x+40, y+48);
    triangle(x+100, y+48, x+40, y+65, x+40, y+35);
    triangle(x,     y+48, x+48, y+35, x+50, y+65);
}


void pfanne(x, y) {
    scale(random(1, 1.008));

    fill(100);
    ellipse(mouseX, mouseY, 80, 80);  // Pfanne
    rect(mouseX-8, mouseY, 15, 80);  // Griff

    ei(x, y+80);    
}

void ei(x, y) {
  scale(random(1, 1.01));
  
  // Eiweiss
  fill(240);
  if (backzeit >= 200) {
    fill(255);
  }
  ellipse(x, y, 60, 50);
  
  // Eigelb
  fill(200);
  if (backzeit >= 200) {
    fill(255, 255, 0);
  }
  ellipse(x, y, 20, 25);
}

 
 



  

  
  

 






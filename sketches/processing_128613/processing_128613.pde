
int monsterX;
int monsterY;
int richting;
int teller;
boolean test;

void setup() {
  size(200, 200);
  monsterY = 125;
  richting=5;
  teller= 0;
}


void draw() {
 achtergrond(); 
beweging();
monstertje();
 
}



void achtergrond() {
  background(255); 
  float w = width; 
  while (w > 0) { 
    stroke(0); 
    fill(0, 0, 255);
    ellipse(width/2, height/2, w, w); 
    w = w - 20; 
 
  }
} 




void monstertje() {
     if (test==true) {
      fill (0, 0, 255);
    }
    else {
      fill(0, 0, 0);
    }
  ellipse(monsterX-10, monsterY+50, 40, 30);
  ellipse(monsterX+20, monsterY+50, 40, 30);
  ellipseMode(CENTER);
  //lijf en kop
  ellipse(monsterX, monsterY, 60, 60);
  ellipse(monsterX, monsterY-40, 70, 70);
  // oog staafjes
  line(monsterX-10, monsterY-100, monsterX-15, monsterY-70);
  line(monsterX+40, monsterY-100, monsterX+20, monsterY-70);
  fill(255);
  //oog wit rondje
  ellipse(monsterX-14, monsterY-100, 18, 18);
  ellipse(monsterX+36, monsterY-100, 18, 18);
  fill(0);
  //oog pupil
  ellipse(monsterX-12, monsterY-100, 12, 12);
  ellipse(monsterX+33, monsterY-100, 10, 10);
  fill(0);
  //mond
  ellipse(monsterX, monsterY-30, 50, 30);
  fill(255);
  //tanden
  ellipse(monsterX-10, monsterY-40, 12, 10);
  ellipse(monsterX, monsterY-40, 12, 10);
  ellipse(monsterX+10, monsterY-40, 12, 10);
  ellipse(monsterX-10, monsterY-20, 12, 10);
  ellipse(monsterX, monsterY-20, 12, 10);
  ellipse(monsterX+8, monsterY-20, 12, 10);
}

void beweging() {
  monsterX= monsterX +richting;
  //als monster de rand raakt dan omkeren
  if (monsterX > width ||monsterX<0) {
    richting=-richting;
    teller=teller +1;
    println(teller);
  }



  if (teller==10) {
    teller=0;
    test=!test;
  }



}



Eye eyes1, eyes2;
Face face1, face2;
Mouth mouth1, mouth2;
Ear ear1, ear2, ear3, ear4;

int selectedKey;

void setup() {
  size(500, 400);
  smooth();
  frameRate(30);



  //rabbit 1
  float faceWidth = 150;
  face1 = new Face(180, 250, faceWidth, 150, color(220, 100, 100));
  eyes1  = new Eye(200, 245, 60, color (255, 80, 100), 90); //x,y,s,c,f
  mouth1 = new Mouth(200, 300, 30, 5);
  ear1 =  new Ear(150, 140, 40, 120, color(220, 100, 100));
  ear2 = new Ear(210, 140, 40, 120, color(220, 100, 100));
  
  
  //rabbit 2
  face2 = new Face(350, 220, 150, 150, color(150, 230, 220));
  eyes2  = new Eye(350, 220, 60, color (0, 50, 180), 100); //x,y,s,c,f
  mouth2 = new Mouth(355, 270, 30, 8);
  ear3 =  new Ear(320, 110, 40, 130, color(150, 230, 220));
  ear4 = new Ear(370, 110, 40, 130, color(150, 230, 220));
}


void draw() {
  background(50,30,30);

  //rabbit 1
  face1.display();
  eyes1.display();
  mouth1.update(selectedKey);
  mouth1.draw();
  ear1.display();
  ear2.display();
  
  //rabbit 2
  face2.display();
  eyes2.display();
  mouth2.update(selectedKey);
  mouth2.draw();
  ear3.display();
  ear4.display();
  
  //nose
  fill(255,0,0);
  ellipse (210, 265, 20, 20);
  
  
  fill(0,0,255);
  ellipse (353, 235, 20, 20);
  
}

//keyboard
void keyPressed() {
  if (key == CODED) {
    if (keyCode==UP) {
      selectedKey = UP;
    }
    else if (keyCode==DOWN) {
      selectedKey = DOWN;
    }
  }
}



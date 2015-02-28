
Cod[] cod = new Cod[16];

void setup() {
  size(1200, 1000);

  for (int i = 0; i < cod.length; i++ ) {
    cod[i] = new Cod(random(width), random(height), random(2, 6));
  }
}

void draw() {
  background(68, 148, 250, 90);

  if (mousePressed == true)
    for (int i = 0; i < cod.length; i++ ) { 
      cod[i].swimfast();
      cod[i].display();
    } 
  else {      
    for (int i = 0; i < cod.length; i++ ) { 
      cod[i].swim();
      cod[i].display();
    }
  }
}






/* @pjs preload="Gambit.jpg"; */
/* @pjs preload="docstrange.jpg"; */
size(800,600);
PImage img = loadImage("Gambit.jpg");
PImage img2 = loadImage("docstrange.jpg"); 
img.blend(img2, 5, 2, 33, 50, 17, 3, 33, 10, ADD);
image(img, 9, 0);
image(img2, 1, 20);
for (int i = 0; i<30; i++) {
  for (int j = 0; j<10; j++) {
    if ((i+j) % 200 == 0) {
      fill(cos(i)*5 + sin(j)*5, cos(2), cos(i)*3*sin(j)*4);
    }
    else {
      fill((cos(i)*200*sin(j)*1)%255);
    }
    image(img, i*20, 100);
    image(img2,i*30,200);
  }
}
ellipseMode(CORNER);
for (int i = 0; i < 900; i++) {
  for (int j = 0; j < 500; j++) {
    for(int a=5;a<300; a++){
    stroke(i*50, j, 200);
    point(i, j);
  }
}
}



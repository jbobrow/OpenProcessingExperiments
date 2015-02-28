
int option = 1;

void setup() {

  size(600, 600);

  smooth();

  noFill();

}

 

void draw() {

  background(255);

 

  if (option == 1) {

    // Option 1: Stitches

   for (int y = 0; y <= height; y += 70) {
for (int x = 0; x <= width; x += 70) {
fill(52,138,183);
rect(x, y, 50, 50);


      }

    }

  } 

  else if (option == 2) {

    // Option 2: Perspective

   for (int y = 0; y <= height; y += 70) {
for (int x = 0; x <= width; x += 70) {
fill(3,62, 93);
rect(x, y, 50, 50);
}}
for (int y = 0; y <= height; y += 70) {
for (int x = 0; x <= width; x += 70) {
fill(0);
ellipse(x, y, 50, 50);
}}
for (int y = 0; y <= height; y += 70) {
for (int x = 0; x <= width; x += 70) {
fill(255,255);
ellipse(x, y, 30, 30);

      }

    }

  } 

  else if (option == 3) {

    // Option 3: Overlapping circles

   
for (int y = 0; y <= height; y += 30) {
for (int x = 0; x <= width; x += 30) {
fill(95, 88,111);
triangle(x,y,y,x,450,600);
}}
for (int y = 0; y <= height; y += 30) {
for (int x = 0; x <= width; x += 30) {
fill(0 );
ellipse(y,x,30,30);
}}
for (int y = 0; y <= height; y += 30) {
for (int x = 0; x <= width; x += 30) {
fill(255,255 );
ellipse(y,x,15,15);


      }

    }

  } 

  else if (option == 4) {

    // Option 4: Rotating arcs


noStroke();


    int count = 0;
noStroke();

   for (int y = 0; y <= height; y += 30) {
for (int x = 0; x <= width; x += 30) {
fill(4,3,77);
ellipse(y,x,30,30);


      }

    }

  } 

  else if (option == 5) {

    // Option 5: Groups of fiv
   for (int y = 0; y <= height; y += 49) {
for (int x = 0; x <= width; x += 49) {
  ellipse(x,y,30,60);}
  fill(0);

   
    }
  }

else if (option == 6)


for (int y = 0; y <= height; y += 20) {
for (int x = 0; x <= width; x += 20) {
fill(0 );
ellipse(y,x,15,15);

}
}

 
}


 

void mousePressed() {

  option++;

  if (option > 6) option = 1;

}


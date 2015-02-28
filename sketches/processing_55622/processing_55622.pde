
size(800, 800);
background(222);
smooth();

int ed = 50; // eye diamater

rect(300, 300, 200, 200); //head
ellipse (340, 340, ed, ed); //eye
ellipse (460, 340, ed, ed);
rect(360, 450, 20, 20); //teeth
rect(380, 450, 20, 20);
rect(400, 450, 20, 20);
rect(420, 450, 20, 20);

ellipse (280, 380, 40, 120); //left ears
ellipse (240, 380, 30, 90);
ellipse (210, 380, 15, 60);

ellipse (520, 380, 40, 120); //right ears
ellipse (560, 380, 30, 90);
ellipse (590, 380, 15, 60);

rect(350, 520, 100, 400); //body

strokeWeight(2);
line(340, 580, 150, 370); //left arm
line(150, 370, 180, 190);





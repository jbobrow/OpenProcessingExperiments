
int option = 1;

void setup() {

size(400, 300);

smooth();

noFill();

}



void draw() {

background(255);



if (option == 1) {



for (int x = 100; x <= width-100; x += 20) {

for (int y = 100; y <= height-100; y+=20) {

ellipse (x, y, 100, 100);

ellipse (x, y, 100, 100);

}

}

} 

else if (option == 2) {



for (int x = 10; x <= width-10; x += 20) {

for (int y = 10; y <= height-10; y+=20) {
  
ellipse (x, y, 10,10);

ellipse (x,y, 20, 20);



}

}

} 

else if (option == 3) {



for (int x = 50; x <= width-50; x += 20) {

for (int y = 50; y <= height-50; y+=20) {

ellipse(x, y, 60, 60);

ellipse (x,y, 30, 30);

ellipse (x, y, 10,10);
}

}

} 

else if (option == 4) {




for (int x = 50; x <= width-50; x += 20) {

for (int y = 50; y <= height-50; y+=20) {

ellipse (x, y, 90,90);

}

}

} 

else if (option == 5) {


for (int x = 10; x < width-10; x += 50) {
for (int y = 10; y < height-10; y+=50) {

 ellipse (x,y,10,10);
 ellipse (x,y, 20,20);
 ellipse (x,y, 40,40);
 ellipse (x,y, 80,80);
 
}
}
}

else if (option ==6) {
}
}

  

void mousePressed() {

option++;

if (option > 5) option = 1;

}

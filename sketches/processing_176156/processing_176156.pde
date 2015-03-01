
line(15, 25, 70, 90); 
size(400, 400);
     background(192, 64, 0);
     stroke(255);
     line(150, 25, 270, 350);

stroke(255);               // sets the stroke color to white
     
void setup() {
       size(400, 400);
       stroke(255);
       background(192, 64, 0);
     } 

     void draw() {
       line(150, 25, mouseX, mouseY);
     }


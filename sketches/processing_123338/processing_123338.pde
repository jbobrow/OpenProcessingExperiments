

PImage box; // Declare object/variable


void setup(){
size(400, 400);
background (#eaab00);
smooth();
box = loadImage("box.jpg");

}

void draw(){
//lines inset by 10px around each edge
line(10, 10, 390, 10);//top
line(10, 390, 390, 390);//bottom
line(10, 10, 10, 390);//left
line(390, 10, 390, 390);//right

//small box made from 4 individule lines in the top left
line(20, 20, 40, 20);//top
line(20, 40, 40, 40);//bottom
line(20, 20, 20, 40);//left
line(40, 20, 40, 40);//right

//small box made from 4 individule lines in the top right
line(360, 20, 380, 20);//top
line(360, 40, 380, 40);//bottom
line(360, 20, 360, 40);//left
line(380, 20, 380, 40);//right

//small box made from 4 individule lines in the bottom left
line(20, 360, 40, 360);//top
line(20, 380, 40, 380);//bottom
line(20, 360, 20, 380);//left
line(40, 360, 40, 380);//right

//small box made from 4 individule lines in the bottom right
line(360, 360, 380, 360);//top
line(360, 380, 380, 380);//bottom
line(360, 360, 360, 380);//left
line(380, 360, 380, 380);//right


image(box, 150, 150, 100, 100);
}




int R = 99;
int G = 183; //declare a variable called G, that is an integer.
int B = 72;

void setup(){
  size (600, 500);
  background (R,G,B);
}

void draw(){
  background (R, G, B);
  println (mouseX + "" + mouseY);
  fill (50, 20, 50);
  noStroke();
ellipse (200, 100, 50, 50); // head 
ellipse (200, 200, 60, 150);

stroke (50, 20, 20);
strokeWeight (10);
line (176, 150, 120, 160);//arms
line (224, 150, mouseX, mouseY);

line (182, 255, 150, 400);//legs
line (218, 255, 270, 400);

fill(255,255,255);
noStroke();
ellipse (190, 90, 10, 10);//left eye
ellipse (214, 90, 10, 10);
fill (72, 175, 183);
ellipse (190, 91, 7, 7);//eye colour
ellipse (214, 91, 7, 7);


stroke (227, 78, 192); //mousth
strokeWeight (4);
line (195, 110, 206, 110);
line (206, 110, 210, 106);
line (190, 106, 195, 110);
//rect (196, 108, 8, 6);
//ellipse (200, 111, 6, 6);



}



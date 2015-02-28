
void setup(){
size(800,800);
 }
 void draw(){
fill(255);
stroke(255,0,0);
strokeWeight(7);
ellipse(400,400,400,400); //head
ellipse(311,333,177,180); // left eye
ellipse(489,333,177,180); //right eye
line(393,300,229,300); //left upper eye lid
line(407,300,570,300); //right upper eye lid
//line(393,366,229,366); //left lower eye lid
//line(407,366,570,366); //right lower eye lid
line(276,243,650,243); //Red's hat
fill(255,0,0);
ellipse(311,333,10,10); //left pupil
ellipse(489,333,10,10); // right pupil

noFill();
arc(400, 400, 20, 20, 0, PI);
bezier(388, 370, 311, 361, 311, 361, 235, 370); //left lower eye curve
bezier(407, 370, 489, 361, 489, 361, 570, 370); //right lower eye curve

}

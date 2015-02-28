
int y = 0;
int x = 0;
int dir = 1;
int r = 255; 
int b= 0; 
int temp;

void setup(){
size(800, 800);
smooth();
strokeWeight(5);
ellipseMode(RADIUS);
}

void draw(){
background(255);
  y=(y+1)%70;
  x=x+1;
  x = min(400,x);
  x = x + dir;
  
//Neck
stroke(3, 255, 219);      //Set stroke to light blue
line(266+x, 257, 266+x, 162); //Left
line(286+x, 257, 286+x, 162); //Right

//Antennae
line(276+x, 155+y, 246+x, 112); //Small
line(276+x, 155+y, 306+x, 56);  //Tall
line(276+x, 155+y, 342+x, 170); //Medium

//Body
noStroke();               //Diable stroke
fill(r, 172, b);       //Set to orange
ellipse(264+x, 377, 33, 33);//Antigravity orb
fill(r, r, b);        //Set to red
rect(219+x, 257, 90, 120);  //Main body
fill(r, b, r);        //Set back to light blue
rect(219+x, 274, 90, 6);    //light blue stripe

//Head
fill(r, b, r);        //Set to red
ellipse(276+x, 155+y, 45, 45);//Head
fill(r);                //Set to white
ellipse(288+x, 150+y, 14, 14);//Large eye
fill(b);                  //Set to black
ellipse(288+x, 150+y, 3, 3);  //Pupil
fill(b, r, b);       //Set to orange
ellipse(263+x, 148+y, 5, 5);  //Small eye 1
ellipse(296+x, 130+y, 4, 4);  //Small eye 2
ellipse(305+x, 162+y, 3, 3);  //Small eye 3
}
void mousePressed(){
  dir = -10 - dir;
  temp = r; r = b ; b = temp;
}




int a = 300;
int b = 380;
int c = 450; 

void setup (){

  size (500,500);
background (202,247,243); 

smooth ();
strokeWeight (3); }

void draw () {
if (mousePressed) { 
  
background (0); } else {
  background (202,247,243); }

  
  
fill (247,25,81);
ellipse (b-20,a-80,a-150,a-150);

fill(255,236,21);
ellipse (a-50,a-50,a-100,a-100);

fill(152,245,72);
ellipse (a-50,a-50,a-250,a-250);

fill (245,72,182);
triangle (a-60,a-150,a-140,a-100,a-160,a-220);

triangle (a-140,a-100,a-140,a,a-260,a-50);
triangle (a-80,b-30,a-210,b,a-140,a);


fill (250,114,23);

rect(b-15,a-50,a-260,a-260);

rect (a+20,a-20,a-240,a-240);

rect (a-50,a+20,a-220,a-220);


line (a-20,a-240,a-40,a-152);

line (a,a-220,a-20,a-148);

line (a+20,a-200,a-5,a-142);
}



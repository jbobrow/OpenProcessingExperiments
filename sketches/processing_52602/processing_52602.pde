
//PS1: Question 2
//Kim Sipkens 



void setup()   {
  size(400, 400);
smooth();

}

void draw()  {
  fill(255);
ellipse(140, 120, 60, 100);   //left ear
fill(219, 112, 147);
ellipse(140, 120, 20, 60);  //inside of left ear

fill(255);
ellipse(260, 120, 60, 100); //right ear
fill(219, 112, 147);
ellipse(260, 120, 20, 60);  //inside of right ear

fill(255);
ellipse(200, 200, 200, 200);  //head
ellipse(170, 170, 50, 50);   // left eye
ellipse(225, 170, 50, 50);   // right eye

fill(0);
ellipse(170, 170, 20, 20);  //left eyeball
ellipse(225, 170, 20, 20);  //right eyeball

fill(219, 112, 147);
ellipse(200, 210, 30, 35);  //nose


//translate(90, 160);  
strokeWeight(3);
line(120, 195, 180, 210);  //whisk
line(120, 215, 180, 215);  //whisk
line(120, 235, 180, 220);  //whisk

line(200, 227, 200, 240); //m
line(200, 240, 218, 245);  //m
line(185, 245, 200, 240);  //m

line(220, 210, 278, 195);  //whisk
line(220, 215, 278, 215);  // whisk
line(220, 220, 278, 235);  //whisk




}







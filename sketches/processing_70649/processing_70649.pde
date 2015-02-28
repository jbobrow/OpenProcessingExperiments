
void setup() {
  size(600,600);
}

void draw(){
background(0);

rectMode(CENTER);
ellipseMode(CENTER);

stroke(0); //lower jaw
fill(255,235,230);
triangle(mouseX-55,mouseY+50,mouseX,mouseY+180,mouseX+55,mouseY+50);

fill(0); // jaw blockers
stroke(0);
triangle(mouseX-25,mouseY+120,mouseX-15,mouseY+130,mouseX-35,mouseY+140);
triangle(mouseX-15,mouseY+130,mouseX,mouseY+138,mouseX-35,mouseY+140);
triangle(mouseX,mouseY+138,mouseX+15,mouseY+130,mouseX+35,mouseY+140);
triangle(mouseX+15,mouseY+130,mouseX+25,mouseY+120,mouseX+35,mouseY+140);
triangle(mouseX-35,mouseY+138,mouseX+35,mouseY+138,mouseX,mouseY+180);

stroke(255,200,200); //Gums
strokeWeight(4);
line(mouseX-48,mouseY+55,mouseX-20,mouseY+120);
line(mouseX-20,mouseY+120,mouseX-10,mouseY+130);
line(mouseX-10,mouseY+130,mouseX,mouseY+135);
line(mouseX,mouseY+135,mouseX+10,mouseY+130);
line(mouseX+10,mouseY+130,mouseX+20,mouseY+120);
line(mouseX+20,mouseY+120,mouseX+48,mouseY+55);

stroke(190);
strokeWeight(1);
fill(255,255,235);
ellipse(mouseX,mouseY+10,140,130); //head

fill(0,mouseX,mouseY,128);
triangle(mouseX-65,mouseY,mouseX-60,mouseY-10,mouseX-160,mouseY-30); //antennae
triangle(mouseX+65,mouseY,mouseX+60,mouseY-10,mouseX+160,mouseY-30);
triangle(mouseX-50,mouseY-30,mouseX-40,mouseY-35,mouseX-90,mouseY-120);
triangle(mouseX+50,mouseY-30,mouseX+40,mouseY-35,mouseX+90,mouseY-120);
triangle(mouseX-20,mouseY-40,mouseX-10,mouseY-40,mouseX-15,mouseY-140);
triangle(mouseX+10,mouseY-40,mouseX+20,mouseY-40,mouseX+15,mouseY-140);

stroke(255,255,235); // antennae line blockers
line(mouseX-65,mouseY,mouseX-60,mouseY-10);
line(mouseX+65,mouseY,mouseX+60,mouseY-10);
line(mouseX-50,mouseY-30,mouseX-40,mouseY-35);
line(mouseX+50,mouseY-30,mouseX+40,mouseY-35);
line(mouseX-20,mouseY-40,mouseX-10,mouseY-40);
line(mouseX+10,mouseY-40,mouseX+20,mouseY-40);

stroke(235,235,215);
fill(255,255,235);
triangle(mouseX,mouseY+120,mouseX-10,mouseY+90,mouseX+10,mouseY+90); // beak tip
triangle(mouseX-20,mouseY+90,mouseX-20,mouseY+80,mouseX-10,mouseY+90); // teeth beak 1
triangle(mouseX+20,mouseY+90,mouseX+20,mouseY+80,mouseX+10,mouseY+90); // 2
triangle(mouseX-20,mouseY+120,mouseX-10,mouseY+130,mouseX-10,mouseY+120); //teeth bottom 1
triangle(mouseX+10,mouseY+130,mouseX+10,mouseY+120,mouseX+20,mouseY+120); // 2
triangle(mouseX-30,mouseY+100,mouseX-20,mouseY+100,mouseX-25,mouseY+110); //teeth middle 1
triangle(mouseX+30,mouseY+100,mouseX+20,mouseY+100,mouseX+25,mouseY+110); // 2
triangle(mouseX-38,mouseY+80,mouseX-25,mouseY+80,mouseX-34,mouseY+90); //teeth top 1
triangle(mouseX+27,mouseY+80,mouseX+38,mouseY+80,mouseX+32,mouseY+90); // 2

stroke(240); // eyes
fill(220);
ellipse(mouseX-40,mouseY-20,20,10);
ellipse(mouseX+40,mouseY-20,20,10);
stroke(240); // pupils
strokeWeight(abs(pmouseX - mouseX));
fill(235,mouseX,mouseY);
ellipse(mouseX-40,mouseY-20,6,6);
ellipse(mouseX+40,mouseY-20,6,6);

stroke(130); // nostrils
fill(130);
ellipse(mouseX-20,mouseY+30,5,10);
ellipse(mouseX+20,mouseY+30,5,10);



//stroke(20);
//strokeWeight(abs(pmouseX - mouseX));
strokeWeight(2);
stroke(255,255,235);
fill(255,255,235);
triangle(mouseX-60,mouseY+40,mouseX+60,mouseY+40,mouseX,mouseY+100); // beak
stroke(235,235,215);
line(mouseX+10,mouseY+10,mouseX+60,mouseY+40);
line(mouseX-60,mouseY+40,mouseX-10,mouseY+10);
bezier(mouseX-10,mouseY+10,mouseX-5,mouseY,mouseX+5,mouseY,mouseX+10,mouseY+10);


stroke(225,225,205); //Mandible 1
triangle(mouseX-145,mouseY+85,mouseX-60,mouseY+40,mouseX-45,mouseY+55);
triangle(mouseX-145,mouseY+85,mouseX-105,mouseY+85,mouseX-45,mouseY+55);
triangle(mouseX-145,mouseY+85,mouseX-105,mouseY+85,mouseX-60,mouseY+125);
triangle(mouseX-105,mouseY+85,mouseX-60,mouseY+125,mouseX-35,mouseY+120);
triangle(mouseX-60,mouseY+125,mouseX-35,mouseY+120,mouseX-35,mouseY+130);
triangle(mouseX-35,mouseY+130,mouseX-35,mouseY+120,mouseX-20,mouseY+115);
triangle(mouseX-35,mouseY+130,mouseX-10,mouseY+115,mouseX-20,mouseY+115);
triangle(mouseX-20,mouseY+110,mouseX-20,mouseY+115,mouseX-10,mouseY+115);


stroke(225,225,205); // Mandible 2
triangle(mouseX+45,mouseY+55,mouseX+60,mouseY+40,mouseX+145,mouseY+85);
triangle(mouseX+45,mouseY+55,mouseX+105,mouseY+85,mouseX+145,mouseY+85);
triangle(mouseX+105,mouseY+85,mouseX+145,mouseY+85,mouseX+60,mouseY+125);
triangle(mouseX+105,mouseY+85,mouseX+35,mouseY+120,mouseX+60,mouseY+125);
triangle(mouseX+35,mouseY+120,mouseX+35,mouseY+130,mouseX+60,mouseY+125);
triangle(mouseX+35,mouseY+120,mouseX+35,mouseY+130,mouseX+20,mouseY+115);
triangle(mouseX+10,mouseY+115,mouseX+35,mouseY+130,mouseX+20,mouseY+115);
triangle(mouseX+10,mouseY+115,mouseX+20,mouseY+110,mouseX+20,mouseY+115);

stroke(255,255,235,160); // Mandible Line Blocker
line(mouseX-60,mouseY+40,mouseX-45,mouseY+55);
line(mouseX+45,mouseY+55,mouseX+60,mouseY+40);


}

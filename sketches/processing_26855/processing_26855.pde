
class Linea {



float pos1 = 50;
float pos2 = 80;
float pos3 = 79;
float pos4 = 68;
float ang = 45;

void muestraLinea (){

float pos3 = width/2 + (100 * sin(ang));
float pos4 = width/2 + (100 * cos(ang));


strokeWeight(10);
noStroke();
fill(255, 165, 0);
ellipse(pos4,70,pos3,22);
fill(199, 21, 133);
rect(pos4,200,pos2,20);
fill(255, 255, 0);
triangle(pos1, 355, 100, 355, 45, pos4);



ang+= 45;

}

}




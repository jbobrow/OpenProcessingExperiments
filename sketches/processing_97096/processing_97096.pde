
float posx = 20;
float posy = 10;
float velx = 2;
float vely = 2;

void setup(){
size(500,500);
background(131,196,245);
}

void draw(){
  posx = posx + velx;
posy= posy + vely;
 
 if ((posx + 290 >= width) || (posx - 40 <= 0)){
   velx = -velx;
 }
 
 if ((posy + 150>=height) || (posy - 210 <=0)){
 }

fill(245,205,131);
background(131,196,245);

fill(214,6,204);
noStroke();

ellipse(posx+40,posy+150,200,90);
 
ellipse(posx+40,posy+210,150,80);

fill(posx,posy,0,255);
ellipse(posx+290,posy+150,200,90);

ellipse(posx+290,posy+210,150,80);

fill(245,205,131);
rect(posx+190,posy+100,50,150);

noStroke();
fill(220,224,9);
ellipse(posx+140,posy+150,50,50);
fill(9,224,219);
ellipse(posx+140,posy+210,50,50);

noStroke();
fill(9,224,219);
ellipse(posx+290,posy+150,50,50);
fill(220,224,9);
ellipse(posx+290,posy+210,50,50);
}





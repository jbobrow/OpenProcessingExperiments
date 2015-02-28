


void setup() {
   size(400,400);
  smooth();
}



void draw() {

//Positionnement des variables au centre
 float x = width/2;
 float y = height/2;

//Ciel
background(13,83,255);

//Nuages
noStroke();
fill(255);
beginShape();
curveVertex(x+7,y-196);
curveVertex(x+40,y-131);
curveVertex(x-49,y-109);
curveVertex(x-121,y-71);
curveVertex(x-176,y-140);
curveVertex(x+40,y-131);
curveVertex(x-72,y+48);
endShape();


//Soleil
fill(255,175,0);
noStroke();
ellipse (x,y,125,125);



//Gazon
fill(22,137,0);
rect(0,200,400,200);



//Corps

stroke(255,3,19);
strokeWeight(85);
strokeJoin(ROUND);

line(x-125,y+100,x+125,y+100);

//Pattes
stroke(0);
strokeWeight(2);
for (int j =  65; j < 340; j += 10) {
  line(j, y+142, j , y+150);
  
//pieds
fill(0);
ellipse(j,351,3,2);
  
}


//yeux
noStroke();
fill(255);
arc(x-80,y+60,50,50,PI,TWO_PI);
arc(x+80,y+60,50,50,PI,TWO_PI);

//pupilles
fill(0);
ellipse(x-80,y+60,20,20);
ellipse(x+80,y+60,20,20);

//moustache
noStroke();
fill(57,44,1);
beginShape();
curveVertex(x-69,y+87);
curveVertex(x+69,y+123);
curveVertex(x,y+98);
curveVertex(x-75,y+123);
curveVertex(x,y+84);
curveVertex(x+69,y+123);
curveVertex(x-51,y+158);
endShape();

//nose
fill(173,133,0);
ellipse(x,y+87,20,20);

fill(0);
ellipse(x-5,y+87,5,5);
ellipse(x+5,y+87,5,5);

//bouche
noFill();
stroke(0);
strokeWeight(4);
arc(x,y+127,50,20,PI,6.20);

}



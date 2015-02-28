
size(500,700);

background(255);

//terra
fill(0);
quad(0,700,0,675,500,675,500,700);

fill(0);

//cara_rodona
ellipse(250,250,250,250);

//urelles
ellipse(150,100,130,130);
ellipse(350,100,130,130);

//braços
beginShape();
vertex(295,370);
vertex(310,370);
vertex(357,470);
vertex(300,550);
vertex(275,550);
vertex(337,470);
endShape(CLOSE); 

beginShape();
vertex(215,370);
vertex(190,370);
vertex(143,470);
vertex(200,550);
vertex(225,550);
vertex(163,470);
endShape(CLOSE); 

//cua
noFill();
strokeWeight(3);
bezier(250,450,150,600,110,520,70,550);
 
//cos
fill(255,0,0);
noStroke();
quad(165,470,165,500,335,500,335,470);
strokeWeight(3);
quad(180,500,240,500,240,595,180,595);
quad(320,500,260,500,260,595,320,595);
arc(250,500,170,170,0,PI,CHORD);
fill(0);
quad(205,350,295,350,320,470,180,470);

//botons
fill(255);
stroke(0);
strokeWeight(2);
ellipse(210,510,30,50);
ellipse(290,510,30,50);


//potes
fill(0);
quad(200,595,220,595,220,660,200,660);
quad(300,595,280,595,280,660,300,660);

//peus
noStroke();
fill(255,217,0);
arc(210,665,60,60,PI,TWO_PI,CHORD);
arc(290,665,60,60,PI,TWO_PI,CHORD);
quad(180,665,240,665,240,675,180,675);
quad(320,665,260,665,260,675,320,675);

//part_boca
noStroke();
fill(0);
ellipse(250,320,240,120);
fill(255);
ellipse(250,320,230,110);

//partblanca_ulls
noStroke();
fill(255);
ellipse(220,220,75,150);
ellipse(280,220,75,150);

//ulls
fill(0);
ellipse(235,220,20,90);
ellipse(265,220,20,90);
fill(255);
ellipse(240,200,5,10);
ellipse(270,200,5,10);

//nas
stroke(0);
strokeWeight(3);
noFill();
arc(250,298,100,70,PI+QUARTER_PI,TWO_PI-QUARTER_PI);


fill(0);
ellipse(250,285,55,30);

//boca
noFill();
arc(250,270,250,120,QUARTER_PI,HALF_PI+QUARTER_PI);
bezier(200,325,230,375,270,375,300,325);
strokeWeight(1);
bezier(230,365,245,372,255,372,270,365);





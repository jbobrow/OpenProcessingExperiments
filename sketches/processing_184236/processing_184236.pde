
//set canvas
size(400,400);
background(255);

//beginShape();
//vertex(100, 20);
//bezierVertex(100, 70, 80, 75, 30, 20);
//bezierVertex(50, 80, 60, 25, 100, 20);
//endShape();
//
//strokeWeight(8);
//stroke(255,0,0);
//bezier(120,80,120,300,180,280,80,320);
//
//strokeWeight(2);
//stroke(0,255,0);
//beginShape();
//vertex(120, 80);
//bezierVertex(120,300,180,280,80,320);
//endShape();

//trunk of the D
noFill();
strokeWeight(3);
stroke(250,200,50);
bezier(220,100,100,100,150,300,40,380);//first line
bezier(220,100,140,160,180,380,40,380);//third line

strokeWeight(2);
stroke(250,200,50,70);
bezier(220,100,120,150,150,360,40,380);//second line

//body of D
beginShape(); //use beginShape to create complex, outer curve
strokeWeight(4);
stroke(250,200,50);
vertex(40,340);
bezierVertex(5,340,20,300,40,300);
bezierVertex(120,300,350,500,380,200);
bezierVertex(380,0,100,0,60,60);
bezierVertex(0,150,140,200,140,120);
endShape();

//flourish on upper left
beginShape();
vertex(60,60);
bezierVertex(20,100,0,300,220,250);
bezierVertex(330,220,250,150,200,180);
bezierVertex(180,190,190,210,210,200);
endShape(0);

//inner lines of D body
bezier(260,40,340,50,330,370,260,365);
strokeWeight(2);
stroke(250,200,50,70);
bezier(260,40,380,60,390,350,260,365);

//decorative accents
noStroke();
fill(250,200,50);
ellipse(40,337,10,10);
ellipse(137,120,10,10);
ellipse(209,198,10,10);
//set canvas
size(400,400);
background(255);

//In this sketch I'm using bezier curves to create an illustrative dropcap of the letter D

//trunk of the D
noFill();
strokeWeight(3);
stroke(250,200,50);
bezier(220,100,100,100,150,300,40,380);//first line
bezier(220,100,140,160,180,380,40,380);//third line

strokeWeight(2);
stroke(250,200,50,70);//add opacity to center accent lines
bezier(220,100,120,150,150,360,40,380);//second line

//body of D
beginShape(); //use beginShape to create complex, outer curve
strokeWeight(4);
stroke(250,200,50);
vertex(40,340);
bezierVertex(5,340,20,300,40,300);
bezierVertex(120,300,350,500,380,200);
bezierVertex(380,0,100,0,60,60);
bezierVertex(0,150,140,200,140,120);
endShape();

//flourish on upper left
beginShape();
vertex(60,60);
bezierVertex(20,100,0,300,220,250);
bezierVertex(330,220,250,150,200,180);
bezierVertex(180,190,190,210,210,200);
endShape(0);

//inner lines of D body
bezier(260,40,340,50,330,370,260,365);
strokeWeight(2);
stroke(250,200,50,70); //add opacity to center accent lines
bezier(260,40,380,60,390,350,260,365);

//decorative accents, circles
noStroke();
fill(250,200,50);
ellipse(40,337,10,10);
ellipse(137,120,10,10);
ellipse(209,198,10,10);



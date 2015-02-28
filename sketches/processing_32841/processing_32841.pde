
PFont bootFont;
void setup(){
size(84,168);
background(5,169,118);
smooth();
}


void draw(){


//lines
strokeWeight(2);
stroke(255,255,255);
//straight line
line(22,0,18,108);
line(45,0,40,120);
line(65,0,63,125);
line(80,30,80,128);

//vertical line
line(0,13,84,15);
line(0,29,60,30);
line(0,48,84,53);
line(0,70,84,75);
line(0,93,84,103);

// left up area
strokeWeight(2);
stroke(0,0,0);
fill(222,222,233);
beginShape();
curveVertex(0,0);
curveVertex(18,0);
curveVertex(0,25);
curveVertex(0,25);
vertex(0,0);
endShape();

//right up area
strokeWeight(2);
stroke(0,0,0);
fill(222,222,233);
beginShape();
curveVertex(50,0);
curveVertex(50,0);
curveVertex(84,10);
curveVertex(84,10);
vertex(84,0);
endShape();

//right circle
strokeWeight(2);
stroke(0,0,0);
fill(222,222,233);
ellipse(84,60,70,80);

//down area
strokeWeight(2);
stroke(0,0,0);
fill(250,245,240);
beginShape();
curveVertex(0,100);
curveVertex(0,100);
curveVertex(40,120);
curveVertex(84,125);
curveVertex(84,120);
vertex(84,168);
vertex(0,168);
endShape();

//yellow area
fill(250,220,90);
noStroke();
beginShape();
vertex(15,110);
vertex(40,122);
vertex(25,168);
vertex(0,168);
endShape(CLOSE);

//down circle
strokeWeight(2);
fill(255,255,255);
stroke(160,160,156);
ellipse(16,168,28,43);

//circles
noStroke();
fill(160,160,156);
ellipse(10,164,5,5);
ellipse(17,155,5,5);
ellipse(24,167,5,5);

//down lines 
strokeWeight(2);
stroke(160,160,156);
line(10,155,17,168);
line(17,168,26,158);

strokeWeight(3);
stroke(160,160,156);
line(70,140,84,140);

 fill(0);
 bootFont = createFont("Helvetica",20,true);
 textFont(bootFont);
 text("grey",5,20);
 text("green",30,100);
 text("yellow",20,130);

}





color redo = #FF0000;
color redi = #FF0000;
color blue = #0000FF;
color white = #FFFFFF;
color wstar = #FFFFFF;
color black = #000000;
color blackT = #000000;
color whiteT = #FFFFFF;
String s = "Avengers Assemble";
int y = 50;
int y2 = 50;
void setup() {  //setup function called initially, only once
  size(400, 400);
  background(255);  //set background white
}

     

void draw() {

strokeWeight(40);

if (mouseX>1 && mouseX<50){ //outside red
  redo=#000000;
  redi = #FF0000;
  white= #FFFFFF;
  blue = #0000FF;
}
if (mouseX>=50 && mouseX<100) { //white 
  redo=#FF0000;
  redi = #FF0000;
  white= #000000;
  blue = #0000FF;
}
if (mouseX>100 && mouseX<150){ //inside red
  redo=#FF0000;
  redi = #000000;
  white= #FFFFFF;
  blue = #0000FF;
}
  
if (mouseX>150 && mouseX<175){ //blue
  redo=#FF0000;
  redi = #FF0000;
  white= #FFFFFF;
  blue= #000000;
}

if (mouseX>175 && mouseX<225){
  redo=#FF0000;
  redi=#FF0000;
  white=#FFFFFF;
  blue=#0000FF;
}

if (mouseX>225 && mouseX<250){ //blue
  redo=#FF0000;
  redi = #FF0000;
  white= #FFFFFF;
  blue= #000000;
}

if (mouseX>250 && mouseX<300){ //inside red
  redo=#FF0000;
  redi = #000000;
  white= #FFFFFF;
  blue = #0000FF;
}
  
if (mouseX>=300 && mouseX<350) { //white 
  redo=#FF0000;
  redi = #FF0000;
  white= #000000;
  blue = #0000FF;
}
if (mouseX>350 && mouseX<399){ //outside red
  redo=#000000;
  redi = #FF0000;
  white= #FFFFFF;
  blue = #0000FF;
}

stroke(redo); //Big Red Circle
fill(redo);
ellipse(200, 200, 330, 330);

stroke(white); //White Circle
fill(white);
ellipse(200,200,245,245);

stroke(redi); //Small Red Circle
ellipse(200,200,160,160);

fill(blue); //Small Blue Circle
stroke(blue); 
ellipse(200,200,85,85);

strokeWeight(10); //Star
stroke(wstar);
fill(wstar);
  beginShape();
  vertex(200, 150);
  vertex(214, 180);
  vertex(247, 185);
  vertex(223, 207);
  vertex(229, 240);
  vertex(200, 225);
  vertex(171, 240);
  vertex(177, 207);
  vertex(153, 185);
  vertex(186, 180);
  endShape(CLOSE); 
  
textSize(20);
textAlign(CENTER, CENTER);
fill(blackT);
text(s, 200, y); 

textSize(20);
textAlign(CENTER, CENTER);
fill(whiteT);
text(s, 200, y2); 

}
 
void mouseClicked() {
  if (y==50){
    y=350;
    y2=50;
    }
  else{ y=50; 
        y2=350;}
}
  



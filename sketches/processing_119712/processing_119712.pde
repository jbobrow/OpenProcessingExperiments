
void setup(){
size(500, 500);
background(0);
fill(127);
noStroke();
ellipse(width/2,height/1.5,500,400);

fill(0);
ellipse(width/2,height/1.5,475,350);
fill(127);
rect(2,360,496,400);
fill(0);
rect(0,365,500,400);
}

void draw(){
  fill(127);
noStroke();
ellipse(width/2,height/1.5,500,400);

fill(0);
ellipse(width/2,height/1.5,475,350);
fill(127);
rect(2,360,496,400);
fill(0);
rect(0,365,500,400);
  
translate(width/2, height/2); // stunde ----- Tankanzeige
//rotate(radians(1));
for (int i=130; i<250; i+=10) { 
pushMatrix();
rotate(radians(i)); // Um i rotieren
translate(0, 50); // Um Radius verschieben
noStroke();
 fill(255); 
rect(0, 0, 3.5, 5);
popMatrix();

}  
pushMatrix();
translate(0,0);
rotate(radians(-143));
 float h = map(hour(), 0, 23, 0, 110);
 rotate(radians(h));
 stroke(255,0,0);
 strokeWeight(4);
 line(0,0,40,0);
 popMatrix();  translate(-width/2, -height/2);


translate(width/4+20, height/1.5); // Sekunde ------- Drehzahl
rotate(radians(180));
for (int i=-90; i<70; i+=20) { 
pushMatrix();
rotate(radians(i)); 
translate(0, 100); 
noStroke();
if(i>20){
  fill(255,0,0);
}else{
 fill(255); 
}

rect(0, 0, 20, 10);
popMatrix();
}
pushMatrix();
translate(-10,-20);
 float sec = map(second(), 0, 59, 0, 100);
 rotate(radians(sec));
 stroke(255);
 strokeWeight(1);
 line(0,0,105,0);
 popMatrix();



translate(-200, 0); // Minute ----------------- Geschwindigkeit
rotate(radians(182));
for (int i=90; i<290; i+=17) { 
pushMatrix();
rotate(radians(i)); 
translate(0, 100); 
noStroke();
 fill(255); 
rect(0, 0, 20, 10);
popMatrix();
}
pushMatrix();
translate(0,20);
 float min = map(minute(), 0, 59, 0, 180);
 rotate(radians(min+180));
 stroke(255,0,0);
 strokeWeight(2);
 line(0,0,100,0);
 popMatrix();

}



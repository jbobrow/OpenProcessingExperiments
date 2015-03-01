
void setup(){
background(255);
size(500,500);
}


//Variablen
void draw(){
float sek = map(second(),0,60,0,2*PI);
println(sek);
float min = map(minute(),0,59,0,2*PI);
println(min);
float std = map(hour(),0,12,0,2*PI);
println(std);

//Sekunden
pushMatrix();
translate(width/2, height/2);
background(255);
rotate(sek);
fill(160,50,90);
noStroke();
ellipse(0,-200,20,20);
popMatrix();


//Minuten
pushMatrix();
translate(width/2, height/2);
rotate(min);
fill(100,30,70);
noStroke();
ellipse(0,-130,40,40);
popMatrix();

//Stunde
pushMatrix();
translate(width/2,height/2);
rotate(std);
fill(230,80,140);
noStroke();
ellipse(0,-40,60,60);
popMatrix();


}


void setup(){
  background(255);
  size(650,650);
}
//minion
void draw(){
noStroke();
fill(255,215,0);
rect(150,170,350,600,250);

  
//ull
  fill(0,0,0);
  rect(150,350,350,70); //varilla ullera
  fill(211,211,211);
  ellipse(325,390,225,225); //ullera
  fill(255,215,0);
  ellipse(325,390,160,160);//groc intern
  fill(255,255,255);
  ellipse(325,390,160,110);//parpella
  fill(139,69,19);
  ellipse(325,390,60,60); //iris marró
  fill(0,0,0);
  ellipse(325,390,30,30); //nineta
  fill(255,255,255);
  ellipse(320,380,10,10);//brillo ull
  
//somriure
noFill();
stroke(3,3,3);
strokeWeight(1);
arc(330,497,220,110,0,PI);

//Cabell
line(325,130,315,190);
line(290,130,300,190);
line(350,130,340,190);
line(260,130,270,190);
line(375,130,375,190);
line(400,130,410,190);
line(240,130,230,190);


//roba
fill(0,0,205);
rect(180,600,300,80);  //peto
fill(0,0,205);
rect(150,600,70,20); //tirant
rect(429,600,70,20); //tirant
fill(0,0,0);
ellipse(215,615,20,20); //botó esquerra negre
fill(211,211,211);
ellipse(215,615,10,10); //botó esquerra gris
fill(0,0,0);
ellipse(430,615,20,20); //botó dret negre
fill(211,211,211);
ellipse(430,615,10,10); //botó esquerra gris
fill(0,0,0);
arc(330,617,100,70,0,PI); //butxaca negra
fill(211,211,211);
arc(330,614,80,50,0,PI); //butxaca gris


//text
  textSize(120);
  fill(0,0,0);
  text("BANANA!!",50,125);
  
}

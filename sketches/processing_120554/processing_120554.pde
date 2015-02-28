
size(400, 565); //gamen no saizu
background(255,255,255); //haikei syoku

for (int i = 0; i < width; i++) {
  float ramdomNum = random(100); 
  if (ramdomNum < 50) stroke(0); 
  else stroke(255); 
  line(i, 0, i, height); 
}  //0~100no suujiwo ranndamu ni dasi 50 ijou no tokini tatesennni kuro no sennwo hiku 




strokeWeight(1); //sennnohaba


fill(250, 25, 55, 200);
ellipse(200, 150, 250, 250);   //enn

stroke(0);     
strokeWeight(1);     
line(250, 150, 360, 150);  //sen

stroke(0);     
strokeWeight(1);     
line(250, 350, 360, 350); //sen

stroke(0);     
strokeWeight(1);     
line(250, 150, 250, 350); //sen

stroke(0);     
strokeWeight(1);     
line(360, 150, 360, 350); //sen

 
fill(250, 72, 55, 200);
rectMode(CENTER);
rect(120, 320, 100, 250); //sikakkakkei


fill(25, 65, 85, 200);
strokeWeight(1);
triangle(55,45,75,25,200,150); //sannkakkei

fill(0, 2, 0, 255);
rectMode(CENTER);
rect(150, 450, 120, 50); //sikakkei

fill(200, 200, 85, 250);
strokeWeight(1);
triangle(185,105,255,25,280,150);//sannkakkei



fill(0);
textSize(20);
  text("EL LISSITZKY", 260, 480); // moji











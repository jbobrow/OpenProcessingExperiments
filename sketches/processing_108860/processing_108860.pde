
//variáveis montanhas
  float noiseScale=0.01;

//variáveis gramado
  color bg1;
  color bg2;


void setup() {
  size(500,500);
  
 //cores gramado
   bg1 = color(65, 85, 56);
   bg2 = color(88, 149, 56);

}

void draw(){
 //ceu 
  background(83,148,216);
  noStroke();
 //gramado
  colorMode(RGB);
  color grad;
  strokeWeight(1);
  for (int bg = 191; bg < height; bg=bg+1) {
    grad = lerpColor(bg1, bg2, map(bg, 1, height-1, 0, 1));
    stroke(grad);
    line(0, bg, width, bg);
  }

 //montanhas
  for (int x=0; x < width; x++) {
    float noiseVal = noise((x)*noiseScale,
                            mouseY*noiseScale);
    stroke(59, 93, map(noiseVal*255, 0, 255, 30, 80));
    line(x, map(mouseX, 0, height, height-380, height-410)+noiseVal*80, x, height-300);
  }
  //prédios paisagem
  noStroke();
  if(mouseY<250) {
  fill(237,232,187,150);}
  else{
  fill(155,139,142);}
  rect(0,215,100,height);
  if(mouseY<250) {
   fill(155,139,142);}
  else{
    fill(237,232,187,150);}
  rect(120,225,80,height);
  fill(158,173,180);
  rect(90,240,80,height);
  if(mouseY<250) {
  fill(237,232,187,150);}
  else{
  fill(155,139,142);}
  rect(335,215,100,height);
  if(mouseY<250) {
   fill(155,139,142);}
  else{
    fill(194,202,173);}
  rect(293,225,80,height);
  fill(158,173,180);
  rect(430,240,80,height);
  stroke(70);
  strokeWeight(3);//traço antena
  line(250,mouseY+30,250,mouseY+75);//antena
  stroke(90);
  strokeWeight(1);
  fill(128);
  ellipse(250,mouseY+72,10,20);//1 circ
  fill(130);
  ellipse(250,mouseY+84,20,30);//2 circ
  fill(132);
  ellipse(250,mouseY+95,30,36);//3 circ
  fill(135);
  ellipse(250,mouseY+106,42,39);//4 circ
  fill(145);
  ellipse(250,mouseY+129,58,63);//5 circ
  fill(150);
  ellipse(250,mouseY+149,70,73);//6 circ
  fill(160);
  ellipse(250,mouseY+170,81,80);//7 circ
   noStroke();
  rect(210,mouseY+170,80,100);///2 pavimento
  fill(70);//cor janelas
  for (int j=215; j < 285; j=j+20) {
    for (int k=mouseY+175; k < height; k=k+15) {
  rect(j,k,10,10); }//janelas
  }
  fill(170);//cor prédio
  stroke(170);
  rect(200,250,100,300);//base prédio
  fill(70);//cor janelas
  for (int j=205; j < 300; j=j+20) {
    for (int k=260; k < height; k=k+15) {
  rect(j,k,10,10); }//janelas
   }
  //gárgulas
  fill(170);
  quad(185,250,185,250+5,200,250+10,200,250);
  quad(300,250,300,250+10,315,250+5,315,250);
  stroke(120);
  line(200,250,300,250);
  line(185,250,200,250);
  line(300,250,315,250);
}


color bg1;
color bg2;

void setup() { 
  size(650, 650);
 background(50,150,150); 
 
 

 
  
 } 
  
  void draw () {
   
     bg2 = color(112+mouseX*0.05,147+mouseX*0.05,219+mouseX*0.05);
       bg1 = color(230-mouseX*0.3,232-mouseX*0.3,250-mouseX*0.3);
       
       
     background(230,232,250); 
 
    //--------------- fundo ----------
  color grad;
  strokeWeight(1);
  for (int bg = 0; bg < height; bg=bg+1) {
    grad = lerpColor(bg1, bg2, map(bg, 1, height-1, 0, 1));
    stroke(grad);
    line(0, bg, width, bg);}
    //-----------------------------
 
 stroke(0);
 
 fill(70);
 rect(0,600,650,50);
 

fill (180+mouseY*0.05);
  beginShape();//Parede alta da esquerda 
  vertex(260,360+mouseY*0.1);
  vertex(85,330+mouseY*0.1);
  vertex(65,512);
  vertex(250,505);
  vertex(260,360); 
  endShape(); 
  
  beginShape();// predio inferior esquerdo 
  vertex(250,505); 
  vertex(120,500); 
  vertex(4,525); 
  vertex(4,620); 
  vertex(120,625); 
  vertex(245,625); 
  vertex(250,505); 
  endShape();
  
  line(120,500,120,625);
  
  beginShape(); // Parede alta da direita 
  vertex(385,360); 
  vertex(390,505); 
  vertex(575,512); 
  vertex(555,330+mouseY*0.1); 
  vertex(385,360+mouseY*0.1); 
  endShape();
  beginShape();//predio infeior direito 
  
  vertex(390,505); 
  vertex(395,625); 
  vertex(535,625); 
  vertex(644,620); 
  vertex(644,525); 
  vertex(530,500); 
  vertex(390,505); 
  endShape(); 
  
  line(530,500,535,625);


  rect(280, 30+mouseY*0.2, 90, 595-mouseY*0.2);//janelas 
for (float i = 30+mouseY*0.2; i < 530; i = i+7) 
{ line(280, i, 370, i); }


    beginShape();//torre 
  vertex(245,625); 
  vertex(279,625); 
  vertex(295-mouseY*0.01,30+mouseY*0.2); 
  vertex(275-mouseY*0.01,17+mouseY*0.2); 
//  vertex(245,625);
  endShape();

  beginShape();//torre 
  vertex(375+mouseY*0.01,15+mouseY*0.2); 
  vertex(355+mouseY*0.01,30+mouseY*0.2); 
  vertex(360,625); 
  vertex(395,625); 
//  vertex(375,15); 
  endShape();

fill (92,51,23);
rect(290, 560, 60, 65);//porta
  
fill(0); //maçaneta
rect(322, 590, 3,10);
rect(315, 590, 3,10);

noStroke();
  fill(255,255,0,255-mouseX);
ellipse(100, 100, 55, 55);

    fill(255,0+mouseX);
ellipse(550, 100, 55, 55);
  
}


PImage b;
void setup() {
  
size(400,400);

b = loadImage("chattt.jpg");
background(b);
}

void draw () {



  
  rect(100,100,100,100); // tete de cookie
  line(150,203,150,215); // cou de cookie
  rect(124,218, 50,50); //corps de cookie
  
  line(126,101,110,66); // antene gauche de cookie
  line(173,102,189,66); // antene droite de cooki
  
  line(177,242, 193,237); // bras droit de cookie
  line(122,242, 109,238); // bras gauche de cookie
  
  line(147,272, 129,290); // jambe droite de cookie
  line(147,272, 165,290); // jambe gauche de cookie
  fill(255,191,243);
  ellipse(148,271,10,5); // boule haut des jambes de cookie
  ellipse (151,218,10,5); // boule cou 
 
  
  ellipse(110,239,5,5); // main gauche de cookie
  ellipse(192,236,5,5); // main droite de cookie
  
  fill(193,21,206);
  ellipse(122,291,30,20); // pied gauche
  ellipse(174,291,30,20); // pied droit
  
  fill(300,150,300);
  line(139,219,150,230); // motif corps
  line(150,230,162,218); // motif corps
  line(131,219,150,238); // motif corps
  line(150,238, 169,219); // motif corps
  line(150,244,124,218);// motif corps
  line(150,244,174,220); // motif corps
  line(124,270,149,245); // motif corps
  line(150,245,173,268); // motif corps
  line(134,267,150,251); // motif corps
  line(150,252,164,266); // motif corps
  line(142,267,150,259); // motif corps
  line(150,258,158,266); // motif corps
  line(125,226,143,244); // motif corps
  line(143,244,124,263); // motif corps
  line(125,232,136,243); // morif corps
  line(136,243,125,254); // motif corps
  line(174,226,155,245); // motif corps
  line(155,245,174,264); // motif corps
  line(174,232,162,244); // motif corps
  line(162,244,174,256); // motif corps
  
  
  colorMode(RGB); {

  
 }
 //contribution de karim lasfra (debut)
  float pX = (int) map(constrain(mouseX,0,width), 0, width, -5, 5);
  float pY = (int) map(constrain(mouseY,0,height), 0, height, -5, 5);
 //contribution de karim lasfra (fin) 
 
  fill(116,255,226); 
  ellipse(129,131,15,20); // oeil gauche de cookie
  ellipse(168,131,15,20); // oeil droit de cookie
  fill(0); 
  ellipse(129+pX,131+pY,5,5); // oeil gauche de cookie
  ellipse(168+pX,131+pY,5,5); // oeil droit de cookie
  fill(116,255,226);
  ellipse(149,171,10,5); // bouche de depart de cookie
  ellipse(126,99,10,5); // boule antene gauche 1
  ellipse(124,94,10,5); // boule antene gauche 2
  ellipse(176,99,10,5); // bule antene droite 1
  ellipse(177,95,10,5); // boule antene droite 2
  

 if (mousePressed) {
   
   ellipse (149,167,30,30); // bouche ouverte de cookie
 
  
  if(mousePressed) { 
    
  fill(206,255,116);
} else { 
  fill(30,75,200);
} 
   
  
  }
 
if (mousePressed) {
  

  line(294,60, 322,70); // eclair
  line(322,70,303,77); // eclair
  line(294,60, 269,75); // eclair
  line(269,75,299,97); // eclair
  line(303,77,332,99); // eclair
  line(332,99,292,128); // eclair
  line(299,101,268,120); // eclair
  line(268,121,257,127); // eclair
  line(257,127, 287,151); // eclair
  line (292,129, 315,154); // eclair
  line(315,154, 268,190); // eclair
  line(287, 152,268,190); // eclair
  
  line (190,234,188,231); // doigt main droite
  line(194,234,196,231); // doigt main droite
  line(195,237, 199,237); // doigt main droite
  line(111,237,112,233); // doigt main gauche
  line(108,238,105,234); // doigt main gauche
  line(108,241,103,242); // doigt main gauche
  ellipse(253,337,80,60); // bulle hahaha
  line(292,343,302,348);
  line(302,348,289,351);
  line(227,332,227,345); // hahaha
  line(227,339,233,339); // hahaha
  line(235,333,235,345); // hahaha
  line(238,344,243,334); // hahaha
  line(244,333,251,344); // hahaha
  line(241,340,248,340); // hahaha
  line(254,331,254,344); // hahaha
  line(254,337,259,337); // hahaha
  line(261,331,261,343); // hahaha
  line(264,344,269,330); // hahaha
  line(269,330,277,345); // hahaha
  line(266,339,273,339); // hahaha
  line(284,329,284,338); // !!!!!!
  ellipse(284,343,2,2); // !!!!!!!
  
  }
  
} 




void mousePressed() {

  println ("clique: x "+mouseX+" y " +mouseY);




  }



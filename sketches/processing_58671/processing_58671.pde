
size(600,800); // tamnho janela
background(0); // cor fundo


 stroke(185,75,69); // espessura do contorno
 strokeWeight(45); // espesuura do stroke
 fill(253,253,253); // cor da ellipse
 ellipse(300,400,400,400); // pontos ellipse
 noStroke(); // sem espessura
 fill(20,13,178); // cor do rectangulo
 rect (50,365,500,75); // pontos rectangulo
 
 PFont myFont;
 
 myFont = loadFont ("BNMachine-48.vlw"); // tipo de letra
 
 fill(255); // cor da letra
 textFont (myFont, 70); // tamanho letra
 text("MIND THE GAP", 90,428); // texto que aparece

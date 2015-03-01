
void setup() { 

  size(900, 900);
  background(255);  
  }
  void draw() {  
  
  fill(255,48,48);
  
  rect(350,700,50,200);//jambe gauche
  
   
  rect(500,700,50,200);//jambe droite
  
  fill(255,159,159);
   rect(300,850,100,50);//pied
   fill(96,195,255);
  rect(500,850,100,50);
  
  fill(255,227,191);
  rect(500,700,50,30);//jambes 2
  rect(350,700,50,30);
  
  fill(255,48,48);
  rect(350,300,200,400);//corps
  
  fill(255,227,191)
  rect(700,150,50,200);//avant bras
  rect(150,150,50,200);
  
   fill(255,227,191);
  ellipse(175,140,50,50);//main
  ellipse(725,140,50,50);
   
  fill(255,48,48);
  rect(550,300,200,50);//bras
  rect(150,300,200,50);
  
   fill(255,227,191);
 
  ellipse(450,200,200,250);//tete
 point(450,100);
  
     ellipse(450,200,10,30);//nez
     
     fill(159,0,0);
    ellipse(450,280,60,40);//bouche
    
    fill(252,255,255);
 ellipse(500,150,50,50);//yeux
 ellipse(400,150,50,50);
  
 fill(3,46,57);//pupils
 ellipse(500+mouseX/50,150+mouseY/50,10,10);
   ellipse(400+mouseX/50,150+mouseY/50,10,10);
  }

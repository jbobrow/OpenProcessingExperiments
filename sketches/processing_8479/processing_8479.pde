
void setup(){
  
  size(600, 300);
  background(255);
  smooth();
  
  //corps
  noStroke();
  fill(0);
  arc(270, 212, 450, 275, PI, TWO_PI);

}

void draw(){
  
  //contour qui passe du blanc au noir autour du corps pour l'effet frisson
  if(mousePressed==true){
    noFill();
    stroke(255, 200);
    strokeWeight(0.5);
    arc(270, 210, 450, 269, PI, TWO_PI);}
  else{
    noFill();
    stroke(0);
    strokeWeight(2.5);
    arc(270, 210, 450, 270, PI, TWO_PI);}
  //fin du contour-------------------------------------------------
    
  //les yeux-------------------------------------------------------
  
  //boucle for pour créer le deuxième oeil
  for(int i=150; i<=300; i=i+100){
  //globe
  fill(0);
  noStroke();
  ellipse(i, 155, 100, 100);
  strokeWeight(1.2); 
  stroke(255);
  noFill();
  arc(i, 155, 100, 100, PI, TWO_PI);
  
  if(mousePressed==true){
    //paupières closes
    stroke(255);
    line(100, 155, 300, 155);
    
    //cernes qui apparaissent
    for(int c=1; c<=20; c=c+5){
    noFill();
    stroke(250);
    strokeWeight(0.8);
    arc(i, 155, 100, 90+c, 0, PI);}
    
  }
    
    else{
     strokeWeight(1.2);
     noStroke();
     
     //paupières mi-closes
     fill(255);
     arc(i, 155, 100, 10, 0, PI);
     arc(i, 155, 100, 10, PI, TWO_PI);
     
     //pupilles
     fill(0);
     ellipse(i, 155, 20, 10); 
  
    //cernes qui disparaissent
    for(int c=1; c<=20; c=c+5){
    noFill();
    strokeWeight(1);
    stroke(0);
    arc(i, 155, 100, 90+c, 0, PI);}
    
    }
    
  }
  //fin des yeux---------------------------------------------------



  //les taches de sel----------------------------------------------
  
  float a=random(1,10);
  for(int s=10; s<=100; s=s+20){
    if(mousePressed==true){
      noStroke();
      fill(255, 150);
      ellipse(random(mouseX-s, mouseX+s), random(mouseY-s, mouseY+s), a, a);
    }
  }
  //fin des taches-------------------------------------------------
  
   /* là on capture ce qui est à l'écran et puis efface en remplissant avec du blanc. 
 Les captures sont dans le dossier du sketch.*/ 
 
  if (keyPressed == true) { 

  saveFrame();
  background(#FFFFFF); 
  //corps (pour le relancer)
  noStroke();
  fill(0);
  arc(270, 212, 450, 275, PI, TWO_PI);
};

  }



//STARS
float[] x1 = new float[50000];  //creo 50000 vettori che costituiranno le stelle
                                
//SHOOTING STAR
int radius = 200;  //indico raggio, 
int x2 = 20;      // centro,
int speed = 350;  // e velocità dell'elisse che costituirà la stella cadente

void setup() {    //creo la "finestra"
  size(500, 600);
  smooth();
  noStroke();
  
//STARS
  for (int s = 0; s < x1.length; s++) {   //ripetizione casuale delle stelle
    x1[s] = random(-500, 500);            
  }
}

void draw() {
  background(0);
  
//STARS
  for (int s = 0; s < x1.length; s++) {        
    x1[s] += 0.18;   //velocità di movimento delle stelle
    float y1 = s * 1;
    ellipse(x1[s], y1, 1, 1);
  }
    
//UFO      
   fill(#335D33);  
  ellipse(mouseX, mouseY, 60, 20); //le coordinate del centro coincidono con quelle del mouse
  fill(#15400C);
  arc(mouseX, mouseY, 35, 40, PI, TWO_PI); 
  arc(mouseX, mouseY, 35, 10, 0, PI);
     
//WINDOW
fill(#FFFCE0);                //bordi della finestra
rect(0, 0, 600, 10);
rect(0, 590, 600, 10);
rect(0, 10, 10, 580);
rect(490, 10, 10, 580);
rect(220, 10, 30, 580);
rect(250, 10, 30, 580);
fill(0);                  //apertura della finestra
rect(249, 0, 2, 600);
fill(#8B865B);                 //pomelli della finestra
ellipse(265, 300, 25, 25);
ellipse(235, 300, 25, 25); 

//SHOOTING STAR
  fill(255);
   if(mousePressed) {  //cliccando sul tasto sinistro del mouse attivo il blocco della stella 
    x2 += speed;  //movimento della stella
  rotate(PI/2.8);  //inclino il piano della stella in modo che scenda in modo obliquo
  ellipse(x2, 50, radius, 2);
  }
}



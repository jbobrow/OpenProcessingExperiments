
boolean trigger = false; // Gatillo
boolean increase = true;
int r = 249; // Vermell
int g = 242; // Verd
int b = 218; // Blau
float aleatori = 0; //Numero per fer l'efecte de cabrejat
float radiPupila = 10; //Radi per defecte de les pupil·les

void setup(){
  size(800,800);
  
}
 
void draw(){
  background(74);
  
 //Comprobem que s'ha press el botó i canviem el color
  if(trigger){
        
        //Efecte mogut
        if(increase == true && aleatori < 4){
          aleatori = aleatori + 2;
        }else if(increase == true && aleatori == 4){
          increase = false;
          aleatori = aleatori - 2;
        }else if(increase == false && aleatori > 0){
          aleatori = aleatori - 2;
        }else if(increase == false && aleatori == 0){
          increase = true;
          aleatori = aleatori + 2;
        }
        
       //Vermell
       if(r > 192){
       r --;
       }
       
       //Verd
       if(g > 26){
       g = g - 3;
       }
       
       //Blau
       if(b > 26){ 
       b = b - 3;
       }
    
  }else{
    
        //Efecte mogut en 0px;
        aleatori = 0;
        
       //Vermell
       if(r < 249){
       r = r + 2;
       }
       
       //Verd
       if(g < 242){
       g = g + 5;
       }
       
       //Blau
       if(b < 218){ 
       b = b + 5;
       }
       
  } 
 
  
  // --> Cara <-- \\
  fill(r,g,b);
  ellipse(aleatori+390,aleatori+395,500,600);
  
  // --> Ulls (Contorn) <-- \\
  fill(255); // Color blanc
  ellipse(aleatori+272,aleatori+355,100,60);
  ellipse(aleatori+500,aleatori+355,100,60);
  
   
   //Calculem la posició del cursor per saber si està dintre dels ulls. 
   if( (mouseX - (aleatori + 275)) * (mouseX - (aleatori + 275)) + (mouseY - (aleatori + 355)) * (mouseY - (aleatori + 355)) <= PI * 100 || (mouseX - (aleatori + 505)) * (mouseX - (aleatori + 505)) + (mouseY - (aleatori + 355)) * (mouseY - (aleatori + 355)) <= PI * 100){
    
        //Si es troba dintre, augmentem la mida de la pupila
        if(radiPupila < 25){
        radiPupila = radiPupila + 0.5;
        }
   
   }else{
    
        //Si es troba fora, disminuim la mida de la pupila.
        if(radiPupila > 10){
        radiPupila = radiPupila - 0.5;
        }
    
    }
    
  // --> Ulls (Iris) <-- \\
  fill(102,51,0);
  ellipse(aleatori+275,aleatori+355,40,40);
  ellipse(aleatori+505,aleatori+355,40,40);
   
  // --> Ulls (Pupiles) <-- \\
  fill(0);
  ellipse(aleatori+275,aleatori+355,radiPupila,radiPupila);
  ellipse(aleatori+505,aleatori+355,radiPupila,radiPupila);
   
  // --> Nas (contorn) <-- \\
  line(aleatori+365,aleatori+359,aleatori+365,aleatori+465);
  line(aleatori+420,aleatori+359,aleatori+420,aleatori+465);
  noFill();
  arc(aleatori+365,aleatori+480,30,30,1.5,4.7);
  arc(aleatori+420,aleatori+480,30,30,-1.5,1.5);
  line(aleatori+367,aleatori+494,aleatori+420,aleatori+494);
   
  // --> Nas (forats) <-- \\
  fill(40);
  arc(aleatori+373,aleatori+495,15,15,-3.1,0);
  arc(aleatori+410,aleatori+495,15,15,-3.1,0);
   
  // --> Cabell <-- //
  fill(0);
  triangle(aleatori+209,aleatori+193,aleatori+326,aleatori+145,aleatori+214,aleatori+42);
  triangle(aleatori+269,aleatori+160,aleatori+366,aleatori+139,aleatori+273,aleatori+38);
  triangle(aleatori+311,aleatori+134,aleatori+399,aleatori+138,aleatori+355,aleatori+31);
  triangle(aleatori+270,aleatori+160,aleatori+444,aleatori+146,aleatori+451,aleatori+24);
  triangle(aleatori+406,aleatori+126,aleatori+487,aleatori+161,aleatori+551,aleatori+45);
  triangle(aleatori+424,aleatori+147,aleatori+525,aleatori+176,aleatori+481,aleatori+30);
  triangle(aleatori+493,aleatori+158,aleatori+579,aleatori+199,aleatori+599,aleatori+90);
  triangle(aleatori+494,aleatori+166,aleatori+578,aleatori+199,aleatori+563,aleatori+58);
  triangle(aleatori+447,aleatori+148,aleatori+552,aleatori+164,aleatori+536,aleatori+69);
  rect(aleatori+209,aleatori+144,370,80);
  triangle(aleatori+183,aleatori+224,aleatori+210,aleatori+224,aleatori+211,aleatori+147);
  triangle(aleatori+569,aleatori+224,aleatori+598,aleatori+224,aleatori+587,aleatori+153);
 
  // --> Boca <-- \\
  fill(153,0,0);
  stroke(102);
   
  arc(aleatori+388,aleatori+580,196,60,-PI,0);
  arc(aleatori+388,aleatori+620,196,60,0,PI);
  fill(255);
  stroke(0);
   
   
  // --> Boca (Dents) <-- \\
  rect(aleatori+290,aleatori+580,15,20);
  rect(aleatori+305,aleatori+580,15,20);
  rect(aleatori+320,aleatori+580,15,20);
  rect(aleatori+335,aleatori+580,15,20);
  rect(aleatori+350,aleatori+580,15,20);
  rect(aleatori+365,aleatori+580,15,20);
  rect(aleatori+380,aleatori+580,15,20);
  rect(aleatori+395,aleatori+580,15,20);
  rect(aleatori+410,aleatori+580,15,20);
  rect(aleatori+425,aleatori+580,15,20);
  rect(aleatori+440,aleatori+580,15,20);
  rect(aleatori+455,aleatori+580,15,20);
  rect(aleatori+470,aleatori+580,15,20);
  rect(aleatori+290,aleatori+600,15,20);
  rect(aleatori+305,aleatori+600,15,20);
  rect(aleatori+320,aleatori+600,15,20);
  rect(aleatori+335,aleatori+600,15,20);
  rect(aleatori+350,aleatori+600,15,20);
  rect(aleatori+365,aleatori+600,15,20);
  rect(aleatori+380,aleatori+600,15,20);
  rect(aleatori+395,aleatori+600,15,20);
  rect(aleatori+410,aleatori+600,15,20);
  rect(aleatori+425,aleatori+600,15,20);
  rect(aleatori+440,aleatori+600,15,20);
  rect(aleatori+455,aleatori+600,15,20);
  rect(aleatori+470,aleatori+600,15,20);
   
 
  // --> Celles <-- \\
  strokeWeight(1);
  fill(0); // Color negre
   
  rotate(PI/18.0);
  ellipse(aleatori+330,aleatori+240, 180,40);
 
  rotate(PI/-9.0);
  ellipse(aleatori+440,aleatori+375, 180,40);
   
  // --> Orelles <-- \\
  fill(r,g,b);
   
  rotate(PI/9.0);
  arc(aleatori+202,aleatori+294,80,110,-4.9,-1.2);
  arc(aleatori+200,aleatori+295,40,40,-4.9,-1.2);
   
  rotate(PI/-9.0);
  arc(aleatori+565,aleatori+430,80,110,-2,1.7);
  arc(aleatori+565,aleatori+430,40,40,-2,1.7);
   
   
 
}

void mousePressed(){
  trigger = true;
}

void mouseReleased(){
 trigger = false; 
}


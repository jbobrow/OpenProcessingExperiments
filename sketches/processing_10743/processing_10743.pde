
int modulo=6;
int ancho=modulo*100;
int alto=modulo*100;


void setup(){
  size(ancho,alto);
  background(0);

  }
  
  
  void draw(){
    
 //primer paisaje
     if(((mouseX>0)&&(mouseX<ancho/3))&&((mouseY>0)&&(mouseY<=alto))){
       background(152,239,255);
        //arcoiris
        smooth();
        strokeWeight(2*modulo);
        stroke(255,0,0);
        noFill();
        arc(0, alto/4.8, ancho/1.72,alto/3.2, TWO_PI-PI/2, TWO_PI);
        stroke(242,154,39);
        arc(0, alto/4.8, ancho/1.85,alto/3.7, TWO_PI-PI/2, TWO_PI);
        stroke(242,242,39);
        arc(0, alto/4.8,ancho/1.98,alto/4.12, TWO_PI-PI/2, TWO_PI);
        stroke(39,173,242);
        arc(0,alto/4.8,ancho/2.12,alto/4.60, TWO_PI-PI/2, TWO_PI);
  
     //nubes
        noStroke();
        fill(255);
        ellipse(ancho/6,alto/4,ancho/5,alto/10);
        ellipse(ancho/4.5,alto/4.8,ancho/8,alto/10);
        ellipse(ancho/3,alto/4,ancho/5,alto/10);
        
         //pasto
       fill(190,222,65);
       ellipseMode(CENTER);
       ellipse(0,alto/1.2,ancho/0.8,alto/4);
       ellipse(ancho,alto/1.2,ancho/0.8,alto/4);
       rect(0,alto/1.2,ancho,alto);
     
     //sol
     
      fill(255,255,5);
      ellipse(ancho/1.2,alto/5.3,ancho/7,alto/7);
  
  
  
       }else{
         background(0);
         
         
         }
  
  //segundo paisaje     
     if(((mouseX>=ancho/3)&&(mouseX<ancho/1.5))&&((mouseY>0)&&(mouseY<=alto))){
       background(100);
       
           //pasto
       fill(12,101,20);
       ellipseMode(CENTER);
       ellipse(0,alto/1.2,ancho/0.8,alto/4);
       ellipse(ancho,alto/1.2,ancho/0.8,alto/4);
       rect(0,alto/1.2,ancho,alto);
       
        //nubes
        noStroke();
        fill(200);
        ellipse(ancho/6,alto/4,ancho/5,alto/10);
        ellipse(ancho/4.5,alto/4.8,ancho/8,alto/10);
        ellipse(ancho/3,alto/4,ancho/5,alto/10);
        
      
        
        //sol
     
      fill(193,193,26);
      ellipse(ancho/1.2,alto/5.3,ancho/7,alto/7);
      
      
       //nube tapa sol 
         fill(200);
        ellipse(ancho/1.5,alto/6,ancho/5,alto/10);
        ellipse(ancho/1.3,alto/6.8,ancho/8,alto/10);
        ellipse(ancho/1.2,alto/4.8,ancho/5,alto/9);
        
       
       
       }
       
       
  //tercer paisaje       
     if(((mouseX>=ancho/1.5)&&(mouseY<ancho))&&((mouseY>0)&&(mouseY<=alto))){
      // contNieve++;
       background(150);
        //pasto
       fill(255);
       noStroke();
       ellipseMode(CENTER);
       ellipse(0,alto/1.2,ancho/0.8,alto/4);
       ellipse(ancho,alto/1.2,ancho/0.8,alto/4);
       rect(0,alto/1.2,ancho,alto);
       
       
         //nube tapa sol 
         fill(200);
        ellipse(ancho/1.5,alto/6,ancho/5,alto/10);
        ellipse(ancho/1.3,alto/6.8,ancho/8,alto/10);
        ellipse(ancho/1.2,alto/4.8,ancho/5,alto/9);
        
        
         //nubes
        noStroke();
        fill(255);
        ellipse(ancho/6,alto/4,ancho/5,alto/10);
        ellipse(ancho/4.5,alto/4.8,ancho/8,alto/10);
        ellipse(ancho/3,alto/4,ancho/5,alto/10);
        
     for(int contadorNieve=0; contadorNieve<100; contadorNieve++){
     
     float puntoX1= random(0,ancho);
   float puntoY1= random(0,alto);
   strokeWeight(7);
   stroke(255);
 point(puntoX1,puntoY1);  
       
 }      
       }  
       
       }// cierra draw


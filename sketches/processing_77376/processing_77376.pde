
class Chose {
  //propriétés
  float x, y; //position
  
  //constructeur
  Chose (float x0, float y0) {
   x= x0;
   y = y0;
  }
  
  //méthodes
  void bouger() {
    x=x+random(-1, 1);
    y=y+random(-1, 1);
  }
  
  void dessiner() {
    stroke (1);
    fill(150,145,100,255);
    ellipse(x,y, 5, 5);
  }
  
  void action() {
    bouger();
    dessiner();
  }
}//end class Chose

class grosseChose extends Chose {
  //constructeur
  grosseChose(float x0, float y0){
   super(x0,y0); //constructeur classe parente 
  }
  //redéfinit une méthode
  void dessiner() {
    nounours (x,y,0.5);
    if (touche(mouseX,mouseY))nounoursB (x,y,0.5);    
  }
  
          void nounours (float x, float y, float s){
          //oreilles
            strokeWeight (1);
            stroke (0);
            fill (125,60,30);
              ellipse (x+20,y-100,30,30);
              ellipse (x-20,y-100,30,30);
              
            noStroke ();
            fill (200,150,75);
              ellipse (x+20,y-100,15,15);
              ellipse (x-20,y-100,15,15);
          
          //tête
            stroke (0);
            fill (125,60,30);
              ellipse (x,y-70,65,65);
            
            fill (0);
              ellipse (x+10,y-80,5,5);
              ellipse (x-10,y-80,5,5);
               
            noStroke ();     
            fill(255);
              ellipse (x-11,y-82,2,2);
              ellipse (x+9,y-82,2,2);
            
            fill (0);  
              triangle (x-5,y-70, x+5,y-70, x,y-65);              
              
            strokeWeight (7);
            stroke (75,35,5);
            noFill ();
              arc (x,y-70,60,60,-PI/4,PI/2);
            
          //ventre
            strokeWeight (1);
            stroke (0);
            fill (125,60,30);
              ellipse (x,y,100,100);
              
            noStroke ();
              fill (200,150,75);
              ellipse (x,y,75,75); 
              
            fill (125,60,30);
              ellipse (x,y+15,10,10);
                  
            strokeWeight (7);
            stroke (75,35,5);
            noFill ();
              arc (x,y,95,95,-PI/2+PI/8,PI/2);
        
            strokeWeight (3);      
              arc (x,y+15,5,5,-PI/2+PI/8,PI/2);
            strokeWeight (1);
        }

void nounoursB (float x, float y, float s){
          s = 1;
          //oreilles
            fill (200,135,100);   
            noStroke (); 
              ellipse (x+20,y-100,30,30);
              ellipse (x-20,y-100,30,30);
            
            fill (255,200,125);
              ellipse (x+20,y-100,15,15);
              ellipse (x-20,y-100,15,15);
          
          //tête
            fill (200,135,100);
              ellipse (x,y-70,65,65);

            fill (50);
              ellipse (x+10,y-80,5,5);
              ellipse (x-10,y-80,5,5);
            fill(255);
              ellipse (x-11,y-82,2,2);
              ellipse (x+9,y-82,2,2);
            fill (50); 
              triangle (x-5,y-70, x+5,y-70, x,y-65);
            strokeWeight (7);
            stroke (135,85,55);
            noFill ();
              arc (x,y-70,60,60,-PI/4,PI/2);
          //ventre
            noStroke ();
            fill (200,135,100);
              ellipse (x,y,100,100);
            fill (255,200,125);
              ellipse (x,y,75,75);
            fill (200,135,100);
              ellipse (x,y+15,10,10);
              
               strokeWeight (7);
            stroke (135,85,55);
            noFill ();
              arc (x,y,95,95,-PI/2+PI/8,PI/2);
        
            strokeWeight (3);      
              arc (x,y+15,5,5,-PI/2+PI/8,PI/2);
               strokeWeight (1);
        }


  Boolean touche(float xm, float ym) {
    //true si point xm,ym dans la chose
    return isInCircle(x,y, 50, xm, ym);
  }
}



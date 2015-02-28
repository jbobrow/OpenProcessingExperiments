
void setup(){
 size (800,800);
 smooth();
}

void draw(){
    background(#4da1c2);

    int anzahl = 5;
    
    for (int i=0; i<=width; i=i+1){
    for (int j=0; j<=height; j=j+1){
     monkey(i*(width/anzahl)-25,j*(height/anzahl)-20);
      }
    }

  }

void monkey(int x, int y){
  pushMatrix();
  translate(x, y);
  
 //Ohren
 fill(#754c24);
 noStroke();
 ellipse(65,85,30,30); //Ohr dunkel  links
 ellipse(135,85,30,30); //Ohr dunkel rechts
 
 fill(#c69c9d);
 noStroke();
 ellipse(65,85,15,15); //Ohr hell links
 ellipse(135,85,15,15); // Ohr hell rechts
 
 //Kopf
 noStroke();
 fill(#754c24);
 ellipse(100,96,75,70);
 
 //helle Gesichtsform
 noStroke();
 fill(#c69c6d);
 ellipse(95,90,30,30); //Auge links
 ellipse(105,90,30,30); //Auge rechts
 ellipse(100,108,55,33); //Mund
 
 //Augen schwarz
 fill(0);
 ellipse(93,92,8,10); //Auge links
 ellipse(107,92,8,10); //Auge rechts
  
 //Mund
 stroke(0);
 strokeWeight(2);
 noFill();
 arc (100,105,33,20,0,PI);
 
 //Nase
 fill(0);
 line(100,101,100,103);
 
 popMatrix();
}
                
                

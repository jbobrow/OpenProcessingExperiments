
/***************************************
* Create a graphic pattern that reacts 
  to the mouse position and mouse click.
****************************************/
import processing.pdf.*;

int counter;

void setup (){
  size(600,600);
  smooth();
  background(24);
  stroke(250,0,250,70);
}
 
void draw(){
 // background(255);
  fill(255,200,0,50);
  rect(0,0,width,height);
   
    for ( int x=0; x<=width; x+=25) {           //Raster erstellen: für jede spalte und
      for ( int y=0; y<= height; y+=20){        //jede Zeile
       float abstand = dist (mouseX,mouseY,x,y);  //rechne abstand zw. aktuellem punkt und maus-position

    float angle = atan2(mouseY-y,mouseX-x);    //rechne den winkel vom punkt zur maus
 
     pushMatrix();                             
     translate(x,y);           //verschiebe den zeichenpunkt auf den aktuellen puntk
     rotate(angle);     
     scale(abstand*abstand/3000);    
     rect(20,15,10,10);             
     popMatrix();
     }
   }
     endRecord();
 }

void keyPressed(){
  if(key == 's' || key == 'S'){
    counter++;
    beginRecord(PDF,"pattern"+counter+".pdf");
  }
}


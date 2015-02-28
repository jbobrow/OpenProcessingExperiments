
PImage pic;

float abstand = 10;



void setup(){
  size(700,500);
  pic = loadImage("jasmin_qf.jpg"); 
  //NICHT VERGESSEN: Bilddatei auf dieses Fenster ziehen
  smooth();
}



void draw (){
  background(0);
  noStroke();
  
  abstand = 10+mouseX/50.0;
  
  for(int i = 0; i < width/abstand; i++){
    for(int j = 0; j < height/abstand; j++){
      
      float val = brightness(pic.get(int(abstand*i), int(abstand*j)))/255;
      //val nimmt die Helligkeitswerte an der jeweiligen Bildstelle
      
//      fill(pic.get(int(abstand*i), int(abstand*j)));
//      //Farbe wird an der jeweiligen Stelle aus dem Bild genommen
      
      if (keyPressed == true){
        
        if (key == 'c' || key == 'C') {
          pushMatrix();
      
          strokeWeight(val*random(1,5));
          stroke(pic.get(int(abstand*i), int(abstand*j)),val*255);
          fill(0);
          ellipse(abstand*i, abstand*j, abstand*val, abstand*val);
        
          popMatrix();
        }
        
        if (key == 'g' || key == 'G') {
          pushMatrix();

          noStroke();
          fill(val*255);
          ellipse(abstand*i, abstand*j, abstand*val, abstand*val);
          //ellipsengröße abhängig von Helligkeitswert
        
          popMatrix();
        }
        
        
        if (key == 'r' || key == 'R') {
          //längliche rechtecke
          pushMatrix();
          
          fill(pic.get(int(abstand*i*val), int(abstand*j*val)));
//        rect(abstand*i, abstand*j, abstand/val*2, abstand/val*2); //quadrate
          rect(abstand*i, abstand*j, 5, 10*val);
        
          popMatrix();   
        }
 
 
        if (key == 'l' || key == 'L') {
          pushMatrix();
          
          translate(val, val);
          stroke(val*255);
          strokeWeight(val*2);
          line (abstand*i+random(-2,5), abstand*j+random(-2,5), abstand*i, abstand*j);

          popMatrix();   
        }       
        
      }
        
      else{
//    image(pic,0,0);   //nur das Bild anzeigen      
      pushMatrix();
      
      translate(abstand*i, abstand*j);
      stroke(val*255);
      strokeWeight(val*2);
//    line (i*abstand, j*abstand, random(i,500), random(j,700)); //nur ein durcheinander
      line (mouseX, mouseY, i, j);       

      popMatrix();
      }

         
    }
  
  
  }


}


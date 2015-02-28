

class Raios{
float x;
float y; 
int units; 
float angle;

Raios(){
 //rayos(x, y, units, angle); 
}
  
  void rayos(float x,float y, int units, float angle) { 
  pushMatrix(); 
  translate(x, y); 
 for (int i = units; i > 0; i--) { 

    stroke(255,192,15,170);
    strokeWeight(i/8); 
     point(0,0);
     rect(0,0,10,10);     
   
     stroke(25,192,15,145);
     point(70,70);
     rect(70,70,15,15);

     point(150,150);
  
     stroke(55,120,150,155);
     point(250,250);


    translate(0, -8); 
    rotate(angle); 
  } 
   

  popMatrix(); 
} 


}




class Raios{
float x;
float y; 
int units; 
float angle;

Raios(){
 rayos(x, y, units, angle); 
}
  
  void rayos(float x,float y, int units, float angle) { 
  pushMatrix(); 
   rotate(angle*10); 
  translate(20, 20); 
 for (int i = units; i > 0; i--) { 

    stroke(255,192,15,25);   
    strokeWeight(i/7); 
    line(0,0,10,0); 

      
     point(0,0);
     fill(24,27,100);
     point(0,0); 
     ellipse(0,0,15,15);   
     point(90,90);

     fill(170,15,18);
     ellipse(70,70,5,5);   
     point(150,150);
  
     stroke(55,200,150,155);
     point(250,250);
     rect(220,220,4,4);
     
    translate(20, -8); 
    rotate(angle*0.7);
  } 



  popMatrix(); 
} 


}


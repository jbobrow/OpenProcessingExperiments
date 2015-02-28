
void draw(){  
  for(int i = 0; i < pelos; i++){
    p[i].Pinta();

  }  
}  

class Pelo{  
  int x, y;  
  float diam;  
  color col;  
  boolean MP,MR;  


  Pelo(){  
    x = round(random(width));  
    y = 0;
    col = imagen.get(x,y);
  } 

  void Pinta(){ 

    float Mx = mouseX;
    float My = mouseY;
    smooth();
    noStroke();

    if(mousePressed){
      for(int i = 0; i < pelos; i++){  
        fill(imagen.get(round(Mx),round(My)));
        if(Mx<0||Mx>width){
          noFill();
        }
        if(My<0||My>height){
          noFill();
        }
        ellipse(Mx+random(-S,S),My+random(-S,S),T,T);
        ellipse(Mx+random(-S/2,S/2),My+random(-S/2,S/2),T,T);
        ellipse(Mx+random(-S/3,S/3),My+random(-S/3,S/3),T,T);
     

      }  
    }  
  }  
}





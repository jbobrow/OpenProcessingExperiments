

class atom { 
  public float lat,lon; 
  private float dlat,dlon; 
  private color col; 
  private float velo=1/200.0; //cambia
   
  public atom() { 
    lat=  random (-TWO_PI,TWO_PI); 
    lon=random(-PI,PI); 
    dlat=random(-PI,TWO_PI)*velo; 
    dlon=random(0,PI)*velo; 

  } 
   
  public atom(float _lat,float _lon) { 
    lat=_lat; 
    lon=_lon; 
    dlat=random(0,PI)*velo; 
    dlon=random(0,TWO_PI)*velo; 

  } 
   
  public void mueve(){ 

    lat+=velo*noise(dlat*0.005+frameCount,dlon*0.005+frameCount); 
    lon+=velo*noise(dlat*0.006+frameCount,dlon*0.006+frameCount); 
  } 
   
  public void draw() { 
    noStroke(); 
  
    
    float x=R*( sin(lat*valor)*cos(lon*valor)); 
    float y=R*(cos(lat)*sin(lon)); 
    float z=R*sin(lat*noise (valor)); 
    
    valor = valor+.000001;
    //println (valor);
    if (valor >= 5){
      valor = valor*-1;
    }
 
    pushMatrix(); 
   
 
    translate(x,y,z); 
      
   
   fill(200); 
rotateZ (TWO_PI+ rota);
rotateY (TWO_PI+ rota);
rotateX (TWO_PI+ rota);
rota = rota + .0001;
    box(25); 
  
    popMatrix(); 

   

} 

} 





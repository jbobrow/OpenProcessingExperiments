
class HPared{
    PVector esq1 =new PVector ();
    PVector esq2 =new PVector ();
    PVector esq3 =new PVector ();
    PVector esq4 =new PVector ();
    PVector relvec1 =new PVector ();
    PVector relvec2 =new PVector ();
    PVector relvec3 =new PVector ();
    PVector relvec4 =new PVector ();

    PVector particula;
    float ang;
    HPared (PVector es1, PVector es2, PVector es3, PVector es4){
      
      
      esq1.set(es1.x, es1.y, es1.z);
      esq2.set(es2.x, es2.y, es2.z);
      esq3.set(es3.x, es3.y, es3.z);
      esq4.set(es4.x, es4.y, es4.z);
      
      
    }
    
    float angulo1 (PVector part){
    relvec1.set(esq1.x, esq1.y, esq1.z);
    relvec2.set(esq2.x, esq2.y, esq2.z);    
    relvec1.sub(part);
    relvec2.sub(part);
    float ang1 = PVector.angleBetween(relvec1, relvec2);
    return ang1; 
    }
    
    float angulo2 (PVector part){
    relvec2.set(esq2.x, esq2.y, esq2.z);
    relvec3.set(esq3.x, esq3.y, esq3.z);
    relvec2.sub(part);
    relvec3.sub(part);
    float ang1 = PVector.angleBetween(relvec2, relvec3);
   
    return ang1; 
    
    }
    
    float angulo3 (PVector part){
    relvec3.set(esq3.x, esq3.y, esq3.z);
    relvec4.set(esq4.x, esq4.y, esq4.z);
    relvec3.sub(part);
    relvec4.sub(part);
    float ang1 = PVector.angleBetween(relvec3, relvec4);
    return ang1; 
    }
    
    float angulo4 (PVector part){
    relvec4.set(esq4.x, esq4.y, esq4.z);
    relvec1.set(esq1.x, esq1.y, esq1.z);
    relvec4.sub(part);
    relvec1.sub(part);
    float ang1 = PVector.angleBetween(relvec4, relvec1);
    return ang1; 
    }
    void draw(){
    stroke (0, 255, 0);  
    line (esq1.x, esq1.y, esq1.z, esq2.x, esq2.y, esq2.z);
    line (esq2.x, esq2.y, esq2.z, esq3.x, esq3.y, esq3.z);
    line (esq3.x, esq3.y, esq3.z, esq4.x, esq4.y, esq4.z);
    line (esq4.x, esq4.y, esq4.z, esq1.x, esq1.y, esq1.z); 
    stroke (255, 0, 255);
    /* line (0, 0, 0, relvec1.x, relvec1.y, relvec1.z);
     line (0, 0, 0, relvec2.x, relvec2.y, relvec2.z);
     line (0, 0, 0, relvec3.x, relvec3.y, relvec3.z);
     line (0, 0, 0, relvec4.x, relvec4.y, relvec4.z);*/
    }
    
  }


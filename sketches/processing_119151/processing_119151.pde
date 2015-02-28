
int suma(int [] t) {
    int s = 0;
    for ( int i=0; i<t.length; i++ ) {
        s += t[i];
    }
    return s;
}
   
  
  
void setup() {  //setup function called initially, only once
    size(400,300);
    background(225);
    int[] datos = {25,42,68,18};
    int total = suma(datos);
    fill(0);
    textSize(36);
    text("Sumatoria ="+total,80,150);
    
 }

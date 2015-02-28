
int suma(int [] t) {
    for ( int i=0, s=0; i<t.length; i++ ) {
        s += t[i];
    }
    return s;
}
    
   
   
void setup() {  //setup function called initially, only once
    size(200,100);
    background(255);
    int[] datos = {2,4,6,8};
    int total = suma(datos);
    fill(0);
    textSize(24);
    text("sumatoria ="+total,30,50);
}

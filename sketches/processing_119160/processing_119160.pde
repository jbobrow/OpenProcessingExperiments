
int suma(int [] t) {
    int s = 0;
    for ( int i=0; i<t.length; i++ ) {
        s += t[i];
    }
    return s;
}
   
  
  
void setup() {  //setup function called initially, only once
    int[] datos = {2,4,6,8};
    int total = suma(datos);
    println("resultado ="+total);
}

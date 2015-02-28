
int suma(int [] t) {
    int s = 0;
    for ( int i=0; i<t.length; i++ ) {
        s += t[i];
    }
    return s;
};
  
 
//println("resultado ="+total);
 
void setup() {  //setup function called initially, only once
    int[] datos = {2,4,6,8};
    int total = suma(datos);
     
    size(400,400);
    smooth();
    background(0,0,0);
    fill(255);
    textSize(24);
    println(2,4,6,8/n};
    text("sumatoria = "+total,50,100//n);

    
}
 
void draw() {  //draw function loops
}

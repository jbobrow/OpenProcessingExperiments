
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
    int y=0; 
    size(400,400);
    smooth();
    background(0,0,0);
    fill(255);
    textSize(24);
    for(int x=0;x<=3;x++){ 
        fill(255);
        textSize(14);
        text(""+datos[x],150,y+50);
       y=y+12;
        delay(2000);
        }
    text("sumatoria = "+total,50,100);
}
 
void draw() {  //draw function loops
}

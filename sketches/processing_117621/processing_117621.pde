
int suma(int [] t) {
    int s = 0;
    for ( int i=0; i<t.length; i++ ) {
        s += t[i];
    }
    return s;
};
  
   
int total = suma({2,4,6,8});
 
//println("resultado ="+total);
 
 
void setup() { 
size(400,400); 
  strokeWeight(30);
  textSize(36);

}
 
void draw() { 
background(255);
      stroke(255);
      fill(0,0,255);
      text("El resultado es "+total,50,100); //draw function loops
}

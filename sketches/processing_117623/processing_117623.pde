
int suma(int [] t) {
    int s = 0;
    for ( int i=0; i<t.length; i++ ) {
        s += t[i];
    }
    return s;
};
  
   
int total = suma({2,4,6,8});
 
println("resultado ="+total);
 
 
void setup() {  //setup function called initially, only once
}
 
void draw() {  //draw function loops
}

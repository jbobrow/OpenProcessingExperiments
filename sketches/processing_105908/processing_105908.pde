
int numInvaders = 5;
 
Invader[] bob = new Invader[numInvaders];
 
 
 /// ENRICA HELPED! ///
 
 
void setup() {
size(1200, 1200);
for (int i=0;i<bob.length;i++) { 
bob[i]=new Invader ();
bob[i].prime(i* width/bob.length,height/4);
     
 
}

}
 
void draw() {
background(255);
for (int i=0;i<bob.length;i++) {
bob[i].animate();
bob[i].move();
     
}
 
}

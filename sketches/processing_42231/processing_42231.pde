
int val=20;
void setup() {
size (600, 600);
background(250);
smooth();
}

void draw (){
 stroke (0); 
 fill(2);
 ellipse(mouseX,mouseY, val, val);
 if (mousePressed){
   noStroke ();
   val=val+5;
 }
 else {
 val=20;
 }
 }

                
                

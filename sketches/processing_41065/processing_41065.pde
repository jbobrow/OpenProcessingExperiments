
int val=0;
void setup() {
size (600, 600);
background(250);
smooth();
}

void draw (){
 stroke (0); 
 if (mousePressed){
   noStroke ();
   val=val+5;
   fill(val, val*3,0,40);
   ellipse(mouseX,mouseY, val, val);
 }
 else {
 val=0;
 ellipse(val,val, val, val);
 }
 }

                
                

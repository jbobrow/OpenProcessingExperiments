
void setup() {
size(400,400); 
background (255,56,89);
 frameRate(3);

strokeWeight(5);
stroke(255);
smooth();
}
int A=20;

void draw() { 
line(width,A,A,height/5);
line(A,height,width/5,A);
A=A+20; 

if (A>400) { //quando la A raggiunge il punto voluto 
  noLoop(); //fermiamo il loop
    }
}


void setup() {
 size(200, 200);
 background(0);
}

void draw() {
 rect(75, 75, 50, 50) ; //*fig1 P&B
 { //*inserção condicional
 if
 ( mouseX>=75 && mouseX <=125 && mouseY>=50 && mouseY<=125)
background(0);
 }
}//*fig2 P

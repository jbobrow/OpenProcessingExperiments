
// Sydney Music Festival Laser
       void setup() {
       background(0);
       smooth();
       size(400, 400);
}        
     void draw() {
       //Top Left
       stroke(57,147,219);
       line(0, 0, mouseX, mouseY);
        
       //Top Right
       stroke(219,57,57);
       line(400, 0, mouseX, mouseY);
        
       //Bottom Left
       stroke(138,57,219);
       line(0, 400, mouseX, mouseY);
        
       //Bottom Right
       stroke(57,219,134);
       line(400,400, mouseX,mouseY);
}
      
     void mousePressed() {
       background(0);
}
// Albert Cordero


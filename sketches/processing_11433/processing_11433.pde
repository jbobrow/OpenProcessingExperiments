
//si copias este codigo en Processing, veras como funciona la foto
void setup(){
background (232, 251, 244);
size (400, 400);
}
void draw(){
if (mousePressed)
fill(23, 213, 157);
line (pmouseX, pmouseY, mouseX, mouseY);

if (keyPressed){
fill (254, 238, 294);
}else{
  fill (254, 238, 194);

ellipse (mouseX, mouseY, key, key);
}
}



void setup () {
  size (500,500);
  background (#000000);
}

void draw () {



  
  if (mousePressed == true){
  stroke (#8A2BE2);
  line (mouseX, mouseY, mouseX+55, mouseY);
  line (mouseX, mouseY, mouseX, mouseY-55);
  line (mouseX, mouseY-55, mouseX+55, mouseY-55);
  line (mouseX+55, mouseY-55, mouseX+55, mouseY);
  
  line (mouseX+20, mouseY-40, mouseX+75, mouseY-40);
  line (mouseX+75, mouseY-40, mouseX+75, mouseY+15);
  line (mouseX+20, mouseY+15, mouseX+75, mouseY+15);
  line (mouseX+20, mouseY-40, mouseX+20, mouseY+15);
  
  line (mouseX, mouseY-55, mouseX+20, mouseY-40);
  line (mouseX+55, mouseY-55, mouseX+75, mouseY-40);
  line (mouseX+55, mouseY, mouseX+75, mouseY+15);
  line (mouseX, mouseY, mouseX+20, mouseY+15);
  
  }
   
  }


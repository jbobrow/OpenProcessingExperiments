
void setup(){
  size (515,500);
  background(175,227,247);
  smooth();
  for (int i = 25; i < 500; i = i + 50)
  {
    text("Lay My Bones in", 0, i, i);
    text("the Cobblestone", 0,i+20,i+20);
    text("Lay My Bones in", 100, i, i);
    text("Neat Little Rows", 100, i+20, i+20);
    text("Lay My Bones in", 200, i, i);
    text("the Cobblestone", 200, i+20, i+20);
    text("Lay My Bones in", 300, i, i);
    text("Neat Little Rows", 300, i+20, i+20);
    text("Lay My Bones in", 400, i,i);
    text("the Cobblestone", 400, i+20, i+20);
  }

}


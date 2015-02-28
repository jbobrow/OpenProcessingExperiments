
//Figure, Ground, Field Relationships

void setup() {
  size(300, 300);	
  //move mouse to left to see figure/ground without field.
  //move mouse to right to see field extended down from top figure and field from bottom figure extended to the left.
}

void draw() {
  background(100);  
  if (mouseX < width/2) { 
    fill(0, 50, 100);//blue figure
    rect(150, 160, 140, 130);
    fill(255, 204, 0);//yellow figure
    rect(10, 10, 100, 100);
  }
  else {	
    background(100);
    fill(255, 204, 0); //vertical figure/field
    rect(10, 10, 100, 150); 
    fill(0, 50, 100); //horizontal figure/field
    rect(10, 160, 280, 130);
    fill(29, 203, 39);
    rect(10, 160, 100, 130);
  }
}



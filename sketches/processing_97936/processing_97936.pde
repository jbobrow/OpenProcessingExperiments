
Picture [] pics = new Picture [5];
Picture2 [] pics2 = new Picture2 [5];
Picture3 [] pics3 = new Picture3 [4];

void setup(){
  size(500, 300);
  
  for(int i = 0; i < pics.length; i++){
    pics [i] = new Picture (i*100+0);
  }
  
  for(int i = 0; i < pics2.length; i++){
    pics2 [i] = new Picture2 (i*100+0);
  }
  for(int i = 0; i < pics3.length; i++){
    pics3 [i] = new Picture3 (i*100+0);
  }
  
}

void draw(){
  background(255);
  
    for(int i = 0; i < pics.length; i++){
      pics[i].display();
      pics[i].drag(mouseX, mouseY);

    }
  for(int i = 0; i < pics2.length; i++){
      pics2[i].display();
     pics2[i].drag(mouseX, mouseY);

    }
    for(int i = 0; i < pics3.length; i++){
      pics3[i].display();
      pics3[i].drag(mouseX, mouseY);

    }
}

void mousePressed(){
   for(int i = 0; i < pics3.length; i++){
      pics3[i].clickedOn();
      pics2[i].clickedOn();
      pics[i].clickedOn();


   
    }
}
void mouseReleased(){
      for(int i = 0; i < pics3.length; i++){
      pics3[i].stopDragging();
      pics2[i].stopDragging();
      pics[i].stopDragging();


   
    }
}

//ROW 1

class Picture{
  int x;
  int y;
  int w;
  int h;
  boolean on = false;
  int offsetX, offsetY;
  boolean dragging = false;

  
  Picture(int _xpos){
    x = _xpos;
    y = 0;
    w = 100;
    h = 100;
   fill(int (random(0, 255)), int (random(0, 255)), int (random(0, 255)));
   offsetX = 0;
    offsetY = 0;

  }
  
  void display(){
    rect(x, y, w, h);
  }
  
  void clickedOn(){
    if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h){
     on =!on;
     dragging = true;
       // rect(mouseX, mouseY, w, h);
    }
  }
  
  // Stop dragging
  void stopDragging() {
    dragging = false;
  }
  
  // Drag the rectangle
  void drag(int mx, int my) {
    if (dragging) {
      x = mx + offsetX;
      y = my + offsetY;
    }
  }

}
    
//ROW 2

class Picture2{
  int x;
  int y;
  int w;
  int h;
  boolean on = false;
  int offsetX, offsetY;
  boolean dragging = false;
  
  Picture2(int _xpos){
    x = _xpos;
    y = 100;
    w = 100;
    h = 100;
   fill(int (random(0, 255)), int (random(0, 255)), int (random(0, 255)));
   offsetX = 0;
    offsetY = 0;

  }
  
  void display(){
    rect(x, y, w, h);
  }
  
  void clickedOn(){
    if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h){
     on =!on;
     dragging = true;
       // rect(mouseX, mouseY, w, h);
    }
  }
  
  // Stop dragging
  void stopDragging() {
    dragging = false;
  }
  
  // Drag the rectangle
  void drag(int mx, int my) {
    if (dragging) {
      x = mx + offsetX;
      y = my + offsetY;
    }
  }

}    
    
//ROW 3

 class Picture3{
  int x;
  int y;
  int w;
  int h;
  boolean on = false;
  int offsetX, offsetY;
  boolean dragging = false;

  Picture3(int _xpos){
    x = _xpos;
    y = 200;
    w = 100;
    h = 100;
   fill(int (random(0, 255)), int (random(0, 255)), int (random(0, 255)));
    offsetX = 0;
    offsetY = 0;

  }
  
  void display(){
    rect(x, y, w, h);
  }
  
  void clickedOn(){
    if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h){
     on =!on;
     dragging = true;
       // rect(mouseX, mouseY, w, h);
    }
  }
  
  // Stop dragging
  void stopDragging() {
    dragging = false;
  }
  
  // Drag the rectangle
  void drag(int mx, int my) {
    if (dragging) {
      x = mx + offsetX;
      y = my + offsetY;
    }
  }


}       
    
    
    
    




void setup() {
  size(800, 800);
  background(20, 200, 200);
}

void draw() {
  //background(0);
  
  float num_x_boxes = random(0, 100);
  float num_y_boxes = random(0, 80);
  
  float w = width / num_x_boxes;
  float h = height / num_y_boxes;
  
  for(int x = 0; x < num_x_boxes; x += 1) {
    for(int y = 0; y < num_y_boxes; y += 1) {
      //int box_left = x * w;
      if(mouseX >= (x * w) 
      && mouseX <= (x * w + w)
      && mouseY >= y * h
      && mouseY <= (y * h + h)) {
        fill(10);
        rect(x * w, y * h, w, h);
      } else {
        /*String str_1 = "Golden beard!";
        String str_2 = "Lalalala AH!";
        String str_3 = "Peter AMAZING Goodman!!!";
        
        float t = random(0, 2);*/
        
        fill(100, 200, 210);
        ellipse(x + 50, y + 100, w, h);
        /*fill(200, 0, 100);
        textSize(40);
        text("PeTER     AMAZING      GoodMAN!", w + random(0, 5), h + random(0, 5));*/
        /*textSize(40);
        if(0 == t) {
          text(str_1, w, h); 
        } else if (1 == t) {
          text(str_2, w, h);
        } else if (2 == t) {
          textSize(100);
          text(str_3, w + 100, h + 100);*/
        }
      }

    }
  
  }
  
  






















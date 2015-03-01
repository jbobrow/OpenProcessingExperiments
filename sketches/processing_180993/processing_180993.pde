
int pos_x = 75;
int pos_y = 150;
int bob_factor = 0;
int move_factor = 10;
int drag_x_factor = 0;
int drag_y_factor = 0;

void setup(){
  size(600,800);
}

void draw() {
  pos_x = pos_x % width;
  pos_y = pos_y % height;
  
  background(100);

  fill(255,70,180);
  rect(pos_x-40- (1.5 * bob_factor) + drag_x_factor,pos_y + 250 + drag_y_factor,100,150); // leg left
  rect(pos_x + 80+ (1.5 * bob_factor) + drag_x_factor, pos_y + 250 + drag_y_factor,100,150); // leg right
  
  fill(0,0,255,200);
  rect(pos_x,pos_y,200,300); // body
  
  fill(0,0,255,240);
  rect(pos_x + 100 + bob_factor, pos_y - 100 + bob_factor,200,200); // head
  
  fill(0,0,100,200);
  rect(pos_x + 120 + (0.5 * bob_factor) + drag_x_factor, pos_y + (0.5 * bob_factor) - 80 + drag_y_factor,20,20);
  rect(pos_x + 260 - (0.5 * bob_factor) + drag_x_factor, pos_y + (0.5 * bob_factor) - 80 + drag_y_factor,20,20);


  if (bob_factor > 0) {bob_factor--;}
  if (drag_x_factor > 0) {drag_x_factor--;}
  if (drag_y_factor > 0) {drag_y_factor--;}
}

void mouseClicked() {
  bob_factor = 10;
  pos_x += move_factor;
}

void mouseDragged() {
 pos_x = pos_x + (mouseX - pmouseX);
 pos_y = pos_y + (mouseY - pmouseY);

 drag_x_factor = 2 * (pmouseX - mouseX);
 drag_y_factor = 3 * (pmouseY - mouseY);
 
}

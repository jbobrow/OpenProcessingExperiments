
float [] p1x = new float[0]; // hold the mouse pressed marks
float [] p1y = new float[0];
float [] p1z = new float[0];
float [] p2x = new float[0]; // hold the mouse pressed marks
float [] p2y = new float[0];
float [] p2z = new float[0];
int count=0;

int rect_x1; // catch the start dragging point x
int rect_y1; // catch the start dragging point y
int rect_x2; // record  moving mouseX
int rect_y2; // record moving mouseY
int rect_z1; // record mouseX releasing point
int rect_z2; // record mouseY releasing point.

boolean press, release, drag, drawRect;

void setup() {
smooth();
size(600,400);
stroke(255); 
fill(255,255,255,10); 
}

void draw() {
    background(50);  
Rect();
}

void Rect() {

  float sizex = rect_x2 - rect_x1;
  float sizey = rect_y2 - rect_y1;  
  for (int i=0; i<count; i++) {
    beginShape();
    vertex(p1x[i], p1y[i]);
    vertex(p2x[i], p1y[i]);
    vertex(p2x[i], p2y[i]);
    vertex(p1x[i], p2y[i]);
    endShape(CLOSE); 
  }
    if (mousePressed && mouseButton == LEFT) { 
        rect(rect_x1, rect_y1, sizex,sizey);
     }  
   }
 

   
  


void mousePressed() {
p1x= append(p1x, mouseX);
p1y= append(p1y, mouseY);
  rect_x1 = mouseX;
  rect_y1 = mouseY;
  mouseDragged(); // Reset vars
  
}

void mouseReleased() {
p2x= append(p2x, mouseX);
p2y= append(p2y, mouseY);
  rect_x2 = mouseX;
  rect_y2 = mouseY;
count++;
}

void mouseDragged() {
  rect_x2 = mouseX;
  rect_y2 = mouseY;
}
 





int hvy_clr = 0x9934A89B; // petrol green
int light_clr = 0xFF77B794; // olive green
int bg_clr = 0xFFF6F16F; // light yellow

int canvas_size = 600;

void generate() {

  fill(bg_clr);
  stroke(bg_clr);
  rect(0,0,canvas_size,canvas_size);
  
  int qx = 1;
  int qy = 1;
  int qteta = 1;
  
  int offsetX = 0;
  int offsetY = 0;
  
  switch(int(random(0,4))){
    case 0:
      qteta = -1;
      break;
     case 1:
       offsetX = canvas_size; qx = -1;
       break;
      case 2:
        qteta = -1;
        offsetX = canvas_size; qx = -1;
        offsetY = canvas_size; qy = -1;
        break;
      case 3:
        offsetY = canvas_size; qy = -1;
        break;
  }
  
  float x1 = offsetX + qx*random(canvas_size/12, 2*canvas_size/12);
  float y1 = offsetY+ qy*random(canvas_size/12, 2*canvas_size/12);
 
  float xB1 = (canvas_size-offsetX)-qx*random(canvas_size/4, 2*canvas_size/4);
  float yB1 = (canvas_size-offsetY)-qy*random(canvas_size/4, 2*canvas_size/4);

  
  float base1 = 150;
  float teta1 = qteta*random(0,PI/2);
  
  float base2 = 200f;
  float teta2 = qteta*random(0,PI/2);
  
  project_triangle(new Point(x1, y1),
                        new Point(xB1,yB1), base1, teta1);
                        
  project_triangle(new Point(x1, y1), 
                        new Point(xB1-(base1/2)*cos(teta1),
                                 (yB1-(base1/2)*sin(teta1))), base2, teta2);

  fill(0);
  textSize(96);  
  text("b lab", 60, 540);

}

void project_triangle(Point p, Point base_ctr, float base_sz, float base_teta){
  
  fill(hvy_clr);
  stroke(hvy_clr);
  
  Point p2 = new Point(base_ctr.x+(base_sz/2)*cos(base_teta), base_ctr.y+(base_sz/2)*sin(base_teta));
  Point p3 = new Point(base_ctr.x-(base_sz/2)*cos(base_teta), base_ctr.y-(base_sz/2)*sin(base_teta));
  
  triangle(p.x, p.y, p2.x, p2.y, p3.x, p3.y);
}

void setup() {
  size(600,600);
}

void draw(){
  if(millis() <= 2000.0){
    generate();
  }
}

void keyReleased(){
  generate();
}

void mouseClicked(){
  generate();
}

public class Point{
  
  public float x;
  public float y;
  
  public Point(float px, float py){
    x = px;
    y = py;
  }
  
}


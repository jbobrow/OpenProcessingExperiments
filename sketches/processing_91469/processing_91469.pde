
/*Nafis Sabir
Prof Calli Higgins
HW 5.2.1 part 2*/
int w = 30;//width of shapes
int h = 30;//height of shapes
int circx1 = 30;//left circle x
int rectx1;//left rect x
int circx2;//right circle x
int rectx2;//right rect x
int ycirc1 = 30;//left circle y
int yrect1 = 30;//left rect y
int yrect2 = 30;//right circle x
int ycirc2 = 30;//right rect x
int horz = 100;//horizontal spacing 
int vert = 50;//vertical spacing
int endRun = 500;//boundary for shapes


void setup(){
  size(400, 400);
}

void draw() {
  background(255);//white background
  fill(255, 0, 0);//red for circle
  ycirc1 = 30;//left circle location
  while (ycirc1 <= endRun) {//draw circles until the boundary is reached
    ellipse(circx1, ycirc1, w, h);
    ycirc1 = ycirc1 + vert;//spacing for circles
  }
  yrect1 = 30;
  while (yrect1 <= endRun) {//draw rects until the boundary is reached
    rectMode(CENTER);
    fill(0, 255, 0);//green for rect
    rect(rectx1, yrect1, w, h);
     rectx1 = circx1 + horz;//spacing for left rect
    yrect1 = yrect1 + vert;
  }
ycirc2 = 30;
  while (ycirc2 <= endRun) {//draw circles until the boundary is reached
    fill(0, 0, 255);//blue for circles
    ellipse(circx2, ycirc2, w, h);
    circx2 = rectx1 + horz;//spacing for right circle
    ycirc2 = ycirc2 + vert;
    
  }
  yrect2 = 30;
  while (yrect2 <= endRun) {//draw rects until the boundary is reached
    rectMode(CENTER);
    fill(random(255), random(255), random(255));//random color for rects
    rect(rectx2, yrect2, w, h);
     rectx2 = circx2 + horz;//spacing for right rect
    yrect2 = yrect2 + vert;
  }
}
 



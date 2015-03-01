
var points = Array();
var dragStartX = 0;
var dragStartY = 0;
var selectedPoint = 0;
  
void setup() {

  size(640, 640);
  noLoop();
  background(0);
}

void draw() {
  stroke(250);
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      
      for (i=0;i<points.length;i++){
        //moving here
        points[i].y++;
      }
      
    }
  } else {
    fill(0);
    rect(0, 0, width, height);
    points.splice(0);
  }
}

void mousePressed() {
  
  selectedPoint = 0;
  
  for (i=0;i<points.length;i++){
      if((sq(points[i].x-mouseX)+sq(points[i].y-mouseY))<20){
        selectedPoint = i;
      }
    }
    
    if(selectedPoint>0){
      cursor(MOVE);
    } else {
      cursor(ARROW);
      lines(mouseX, mouseY);
    }
}

void mouseMoved(){

    for (i=0;i<points.length;i++){
      fill(0);
      stroke(255,0,0);
      ellipse(points[i].x, points[i].y,8,8);
    }
   
   points.sort(filter);   
   
   for (i=0;i<3;i++){
      fill(255);
      noStroke();
      ellipse(points[i].x, points[i].y,6,6);
   }

}


function lines( int x, int y) {
  
  //int which = frameCount % num;
  
  var closest = Array();
  var newcolor = color(random(0,255),random(0,255),random(0,255));
  
  fill(0);
 // rect(0, 0, 100, 100);

  if (points.length>2) {
  
  
   points.sort(filter);  
   
   
   //not g=drawing very small ones
   //from - http://math.semestr.ru/line/triangle.php
   
   var sqare = ((x-points[1].x)*(points[0].y-points[1].y)
               -(points[0].x-points[1].x)*(y-points[1].y))/2;
  // if(sqare>10){
     
     for (i=0;i<3;i++){
       stroke(255);
       line(x,y,points[i].x,points[i].y);
     }
     
     fill(newcolor);
     triangle(x,y,points[0].x, points[0].y, points[1].x, points[1].y);
     
     fill(255);
     text(points.length, (x+points[0].x+points[1].x)/3,
                         (y+points[0].y+points[1].y)/3);
   //}
    
    
  } 
  else {
    fill(newcolor);
    point(x, y);
  }
  
  var t = Object();
  t.x=x;t.y=y;t.c=newcolor;
  points.push(t);
  
}

function filter(Array a, Array b) {
  
  var t = (sq(a.x-mouseX)+sq(a.y-mouseY)) -
          (sq(b.x-mouseX)+sq(b.y-mouseY));
    
  return t;
}




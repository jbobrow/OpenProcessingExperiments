
//Curve Example
//by Dongzhi Xia
//2012/10/18

int x1 = 30;
int y1 = 135;
int cx1 = 90;
int cy1 = 39;
int cx2 = 54;
int cy2 = 17;
int x2 = 26;
int y2 = 83;

int d = 5;

void setup(){
 size(200,200);
 smooth();
}

void draw(){
 background(255);
 drawCurves();
 drawLines();
 drawPoints();
 
 if(mousePressed){
   if((mouseX-x1)<d&&(mouseX-x1)>-d&&(mouseY-y1)<d&&(mouseY-y1)>-d){
     x1 = mouseX;
     y1 = mouseY;
     fill(74,211,0);
     noStroke();
     ellipse(x1,y1,2*d,2*d);
   } else if((mouseX-x2)<d&&(mouseX-x2)>-d&&(mouseY-y2)<d&&(mouseY-y2)>-d){
     x2 = mouseX;
     y2 = mouseY;
     fill(74,211,0);
     noStroke();
     ellipse(x2,y2,2*d,2*d);
   } else if((mouseX-cx1)<d&&(mouseX-cx1)>-d&&(mouseY-cy1)<d&&(mouseY-cy1)>-d){
     cx1 = mouseX;
     cy1 = mouseY;
     fill(74,211,0);
     noStroke();
     ellipse(cx1,cy1,2*d,2*d);
   } else if((mouseX-cx2)<d&&(mouseX-cx2)>-d&&(mouseY-cy2)<d&&(mouseY-cy2)>-d){
     cx2 = mouseX;
     cy2 = mouseY;
     fill(74,211,0);
     noStroke();
     ellipse(cx2,cy2,2*d,2*d);
   }
 }
}

void drawCurves(){
 noFill();
 stroke(0);
 strokeWeight(1);
 beginShape();
 vertex(x1,y1);
 bezierVertex(cx1,cy1,cx2,cy2,x2,y2);
 endShape();
}

void drawPoints(){
 fill(255,0,0);
 noStroke();
 ellipse(x1,y1,d,d);
 ellipse(cx1,cy1,d,d);
 ellipse(cx2,cy2,d,d);
 ellipse(x2,y2,d,d);
}

void drawLines(){
 noFill();
 stroke(200);
 strokeWeight(1);
 line(x1,y1,cx1,cy1);
 line(x2,y2,cx2,cy2);
}



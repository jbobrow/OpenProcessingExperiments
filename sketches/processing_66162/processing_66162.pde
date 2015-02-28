
void setup(){
size(400,400);
background(0);
noStroke();
smooth();
frameRate(999999999);

}

void draw(){
float x1=random(400);
float y1=random(400);
float x2=random((x1-50),(x1+50));
float y2=random((y1-50),(y1+50));

fill(random(256),random(256),random(256),random(100));

  if(x1>x2 && y1<y2){ //距离
    
    float cx2=random(x2,x1);
    float cy2=random(0,y1);
    float cx4=random(x2,x1);
    float cy4=random(y2,400);
    float  v=dist(x1,y1,x2,y2);
    float c=dist(cx2,cy2,cx4,cy4);
    if(v<c && c<1.5*v){
   
beginShape();
vertex(x1,y1);//v1
bezierVertex(x1,y1,cx2,cy2,x2,y2);//c1 c2 v2
bezierVertex(x2,y2,cx4,cy4,x1,y1);//c3 c4 v3
endShape();
    }
   
 }else{
    
    float cx2=random(x2,x1);
    float cy2=random(y2,400);
    float cx4=random(x2,x1);
    float cy4=random(0,y1);
    float  v=dist(x1,y1,x2,y2);
    float  c=dist(cx2,cy2,cx4,cy4);
    if(v<c && c<1.5*v){
  beginShape();
vertex(x1,y1);//v1
bezierVertex(x1,y1,cx2,cy2,x2,y2);//c1 c2 v2
bezierVertex(x2,y2,cx4,cy4,x1,y1);//c3 c4 v3
endShape();
    }


}
}

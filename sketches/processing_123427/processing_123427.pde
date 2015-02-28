


void setup() {  //setup function called initially, only once
  size(400, 400);
  
  }
  void draw() { 
var TMin = [];
var YMin= [];
var results = [[1,19],[-6,12],[-1,15],[5,20],[-2,18]];

for (var i=0; i<results.length; i++) {
    TMin[i] = results[i][0];
    YMin[i] = round(map(TMin[i],-10.0,30.0,300.0,50.0));
}

//  println(YMin);

noFill();
//fill(255, 0, 0);
stroke(200,0,0);
strokeWeight(6);
beginShape();
var x = 100;
curveVertex(x,YMin[0]);
for (var i=0; i<YMin.length; i++, x+=50) {
    curveVertex(x,YMin[i]);
}
curveVertex(x-50,YMin[i-1]);
endShape();

stroke(0);
strokeWeight(10);
x = 100;
for (var i=0; i<YMin.length; i++, x+=50) {
    point(x,YMin[i]);
}

}


var TMin = [];
var YMin= [];
var PMin= [];
var TMax = [];
var YMax= [];
var PMax= [];
var Tdia = [];
var Ttemp = [];
var p1 = 0;
var p2 = 0;

//minima y maxima.

var results = [[2,18],[2,30],[3,27],[3,20],[0,16],[39,13],[3,19]];

// Dias

var dia = [["Lunes"],["Martes"],["Mier."],["Jueves"],["Viernes"],["Sabado"],["Domingo"]];


var temp = [[-5],[0],[5],[10],[15],[20],[25],[30]];

//max

for (var i=0; i<results.length; i++) {
    TMax[i] = results[i][1];
    YMax[i] = round(map(TMax[i],-14.4,32.3,300.0,50.0));
}

void setup(){
size(500,400);


//  println(YMin); 

noFill();
//fill(100, 100, 100);
stroke(0, 26, 255);
strokeWeight(2);
beginShape();
var x = 50;
curveVertex(x,YMin[0]);
for (var i=0; i<YMin.length; i++, x+=50) {
    curveVertex(x,YMin[i]);
}
curveVertex(x-50,YMin[i-1]);
endShape();

//  println(YMax);

noFill();
stroke(51, 219, 0);
strokeWeight(2);
beginShape();
var x = 50;
curveVertex(x,YMax[0]);
for (var i=0; i<YMax.length; i++, x+=50) {
    curveVertex(x,YMax[i]);
}
curveVertex(x-50,YMax[i-1]);
endShape();
// puntos de C° Max.

stroke(0);
strokeWeight(7);
x = 50;
for (var i=0; i<YMax.length; i++, x+=50) {
    point(x,YMax[i]);
     fill(0, 0, 255);
    PMax = results[i][1];
    p1 = x-5;
    p2 = YMax[i]-10;
    text(PMax +"C", p1,p2);
}

// coordenadas

stroke(0, 0, 0);
strokeWeight(2);
line(40, 260, 40, 40);
stroke(0, 0, 0);
strokeWeight(2);
line(380, 260, 40, 260);


fill(163, 16, 16);
x = 35;
for (var i=0; i<7; i++, x+=50) {
    Tdia = dia[i];
    text(Tdia, x, 280);

}

fill(240, 46, 8);
x = 49;
for (var i=7; i>-1; i--, x+=29) {
    Ttemp = temp[i];
    text(Ttemp +"C",9 ,x );
    
  }
}

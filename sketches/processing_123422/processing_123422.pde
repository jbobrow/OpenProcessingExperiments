

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
var results = [[0,22],[0,14],[1,18],[1,14],[2,19],[1,18],[2,16  ]];
var dia = [["Lunes"],["Martes"],["Miercoles"],["Jueves"],["Viernes"],["Sabado"],["Domingo"]];
var temp = [[-5],[0],[5],[10],[15],[20],[25],[30]];


for (var i=0; i<results.length; i++) {
    TMin[i] = results[i][0];
    YMin[i] = round(map(TMin[i],-14.4,29.0,300.0,50.0));
}

for (var i=0; i<results.length; i++) {
    TMax[i] = results[i][1];
    YMax[i] = round(map(TMax[i],-14.4,29.0,300.0,50.0));
}

//  println(YMin);

noFill();
//fill(107, 87, 107);
stroke(118, 118, 240);
strokeWeight(5);
beginShape();
var x = 50;
curveVertex(x,YMin[0]);
for (var i=0; i<YMin.length; i++, x+=50) {
    curveVertex(x,YMin[i]);
}
curveVertex(x-50,YMin[i-1]);
endShape();

noFill();
//fill(255, 255, 0);
stroke(31, 242, 31);
strokeWeight(5);
beginShape();
var x = 50;
curveVertex(x,YMax[0]);
for (var i=0; i<YMax.length; i++, x+=50) {
    curveVertex(x,YMax[i]);
}
curveVertex(x-50,YMax[i-1]);
endShape();

stroke(13, 26, 179);
strokeWeight(8);
x = 50;
for (var i=0; i<YMin.length; i++, x+=50) {
    point(x,YMin[i]);
    fill(255, 0, 0);
    PMin = results[i][0];
    p1 = x-5;
    p2 = YMin[i]-10;
    text(PMin +"C", p1,p2);
}

stroke(35, 92, 17);
strokeWeight(8);
x = 50;
for (var i=0; i<YMax.length; i++, x+=50) {
    point(x,YMax[i]);
     fill(37, 37, 232);
    PMax = results[i][1];
    p1 = x-5;
    p2 = YMax[i]-10;
    text(PMax +"C", p1,p2);
}

stroke(77, 72, 77);
strokeWeight(3);
line(40, 260, 40, 40);

stroke(77, 72, 77);
strokeWeight(3);
line(380, 260, 40, 260);

stroke(90, 12, 97);
strokeWeight(8);
x = 50;
for (var i=0; i<7; i++, x+=50){
    point (x,260);
    
}

stroke(237, 14, 237);
strokeWeight(8);
x = 45;
for (var i=0; i<8; i++, x+=29){
    point (40,x);
}

fill(13, 15, 14);
x = 35;
for (var i=0; i<7; i++, x+=50) {
    Tdia = dia[i];
    text(Tdia, x, 280);

}

fill(46, 44, 46);
x = 49;
for (var i=7; i>-1; i--, x+=29) {
    Ttemp = temp[i];
    text(Ttemp +"C",9 ,x );
}


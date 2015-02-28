
/*

int
float
boolean
string
char

print
println

point
line
rect
ellipse
vertex

*/

int numberInt = 10;                  //eine ganzzahl + oder -
float numberFloat = 0.5;             //eine fließkommazahl + oder -
boolean boolA = true;                //1 oder 0 - wahr oder falsch - ja oder nein
String message = "hello world";      //ein text
char letter = 'a';                   //zeichen aus der ascii tabelle
char lineFeed = '\n';                //zeilenumbruch

print(numberInt + numberFloat);      //10 + 0.5 = 10.5
print(lineFeed);                     //nächste zeile
println(message + " " + letter);     //"hello world" + " " + 'a'

point(numberInt, 40);                //ein punkt (x = 10 , y = 40)
line(numberInt,numberFloat*10,50,5); //eine linie (x1 = 10, y1 = 5, x2 = 50, y2 = 5)
rect(30,30,30,numberInt*3);          //ein rechteck(x1 = 30, y1 = 30, x2 = 30, y2 = 30)
ellipse(30,30,30,numberFloat*60);    //ein kreis(x1 = 30, y1 = 30, x2 = 30, y2 = 30)

beginShape();                        //beginne einen vertex zu zeichnen
vertex(50,70);                       //ecke 1
vertex(80,60);                       //ecke 2
vertex(80,80);                       //ecke 3
endShape(CLOSE);                     //beende den vertex und schließe ihn



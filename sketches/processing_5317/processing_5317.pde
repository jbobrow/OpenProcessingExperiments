
void setup(){
size(600, 500);noStroke();background(100);
PFont f = loadFont("CenturyGothic-Bold-48.vlw");  
textFont(f,16); 
}
void draw() {
background(100);fill(0);
text("// Richard Monnier, Annecy school of art.",110,20); 
text("// a misuse of color variable",110,40);
text("// that yields more surprises",110,60);
text("// than a right use of a random function",110,80);

color a = color(mouseY/2, 0, 0);fill(a);String rou = str(a);
text("color COLOR1 = color(mouseY, 0, 0);             //result :" + rou,110,120);
color b = color(0, 0, mouseY/2);fill(b);String bleu = str(b);
text("color COLOR2 = color(0 ,0 ,mouseY);             //result :" + bleu,110,140);
fill(0);
text(" for(int i = 1; i<height; i=i+1",110,180);
text(" { ",110,200);
text("// Here it is the misuse of the color variable",110,220);
text("// as a common number : ",110,240);
text(" fill ((( COLOR1 + COLOR2 )/height)*i);",110,280);
text(" rect(0,i,100,i+1);                            //displaying the color",110,320);
text(" } ",110,340);

for(int i=1; i<255; i=i+1) { 
fill(((a+b)/255)*i);
rect(0,i*2,100,(i*2)+2);    }   
fill((a+b)/height); String unit = hex((a+b)/height,6); 
text("// fortunately, Processing find a color in this result: " + unit,110,380);
    }



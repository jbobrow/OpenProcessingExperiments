
String myText = "L5A 3S8";
String p1 = "L5A";
String p2 = "3S8";
PFont fnt1; //font 1
PFont fnt2; //font 2
 
void setup(){
size(250,250);
smooth();
}
  
void draw(){
background(0);
 
fnt2 = loadFont("HelveticaNeueLTCom-Roman-48.vlw");
 
for(int a=0; a<270; a+=20) {
  for(int b=0; b<270; b+=20){
    noStroke();
    fill(255,182,193,15);
    ellipse(a,b,50,50); //random ellipses to fill bkgrd
} 
   
textFont(fnt2, 12); 
fill(238,180,34); //bottom bar text (lower)
text(myText,a,220);
fill(238,180,34,85); //bottom bar text (upper)
text(myText,a,200);
fill(238,180,34); //side bar text (right)
text(myText,220,a);
fill(238,180,34,85); //side bar text (left)
text(myText,200,a);
}
 
fill(0);
fnt1 = loadFont("Harrington-48.vlw");
textFont(fnt1, 78); //big font
text(p1,35,83);
text(p2,40,163);
fill(255);
textFont(fnt1, 75);
text(p1,35,80);
text(p2,40,160);
}


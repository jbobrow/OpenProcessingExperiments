
String[] texto1= {"AFRAID","REAL","ICONIC","FRIGHTENED","RATIONAL",
                  "ANIMAL","LOST","OTHER","POOR","SELF"};
                           
String[] texto2= {"REAL", "ALIVE","FREE","IRRATIONAL","ALONE",
                  "HUMAN","ICONIC","AWAY", "US", "HIGH"};              

PFont font1;
int i,j;
void setup() {
  size(250,250);
  font1 = loadFont("Helvetica-Bold-50.vlw");
  frameRate(1);
  smooth();

 
}

void draw() {
   background(255);
  for (int m = 0; m < width; m = m + 2){
    for (int n = 0; n < height; n = n + 2){
      point(m,n);
    }
  }
  textAlign(CENTER);
  fill(1);
  textFont(font1,30);
   i = round(random(9));
   j = round(random(9));
        text(texto1[i],width/2,2.2*height/5);
        text(texto2[j],width/2,4.2*height/5);
        text("TOO",width/2,1.2*height/5);
        text("TO BE",width/2,3.2*height/5);
}


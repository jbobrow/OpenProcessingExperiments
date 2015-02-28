
float X=0;
float Y=0;
float K= random(-5,5); 
float L= random(-5,5);
float C;
float A;
float B;
float eyeE= random(0,255);
float eyeF= random(0,255);
float eyeG= random(0,255);
float S= random(-100, 100);
float Q= random(-100, 100);
float backD=random(0,256);
float backE=random(0,256);
float backF=random(0,256);
void setup() {
  size(1000,1000);
 smooth();
}
void draw() {
  background(A,B,C);
  stroke(10, 200, 50);
  fill(20,100, 170);
    rect(X + 400,Y + 400, 40 , 150);
    fill(eyeE, eyeF, eyeG);
    ellipse(X + 420,Y + 400, 100, 100);
    line(X + 400,Y + 550,X + 350,Y + 650);
    line(X + 440,Y + 550,X + 490,Y + 650);
    fill(X + 100,Y + 10, 10);
    ellipse(X + 390,Y + 400, X+30, Y+50);
    ellipse(X + 450,Y + 400, X+30, Y+50);
    A=random(0,255);
    C=random(0,255);
    B=random(0,255);
    X= X + K;
    Y= Y + L;
}




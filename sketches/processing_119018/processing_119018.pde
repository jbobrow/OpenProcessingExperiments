
void setup() {
 size(600,600);
 background(255);  
  smooth();
  noLoop();

 
 
}
 void draw (){}
   
void keyTyped() {
 //background(255);  
 //raggi palle
    float r = random(30,100);
    float p = random(30,100);
    float q = random(30,100);
    float s = random(30,100);

//coordinate palle
      float a= random(50, 550); 
      float b= random(50, 550);
      float c= random(50, 550);
      float d= random(50, 550);
      float e= random(50, 550);
      float f= random(50, 550);
      
      
//linee
//strokeWeight(0);
noStroke();

//line (a,b,c,d);
//line (e,f,b,c);
//line (c,d,b,c);
//line (e,f,a,b);
 fill(255, 50); 
beginShape();
vertex(a,b);
//vertex(b,c);
vertex(c,d);
vertex (e,f);
endShape(CLOSE);




//sistem
//stroke(255);
//strokeWeight(3);

 fill(241,198, 0,60); //arancio
    ellipse( a, b, r, r);
 fill(201, 206, 5,60); //verdino
     ellipse( b,c, p,p);
 fill(0, 175, 162,70); //azzurro
     ellipse( c, d,q,q);
 fill(178, 95, 170,70); //viola
     ellipse( e, f,s,s);   
}







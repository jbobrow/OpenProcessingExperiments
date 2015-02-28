
void setup() {
 size(600,600);
 background(0);  
  smooth();
  noLoop();
  frameRate(3);
}
 void draw (){
 //background(0);  
 //raggi palle
    float r = random(40,300);
    float p = random(50,200);
    float q = random(60,300);
    float s = random(30,550);

//coordinate palle
      float a= random(0, 550); 
      float b= random(550, 400);
      float c= random(10, 550);
      float d= random(49, 200);
      float e= random(20, 550);
      float f= random(90, 590);
      
//linee
strokeWeight(0);
noStroke();



 fill(random(255), random(255),random(255),30); 
beginShape();
vertex(a,f);
vertex(d,c);
vertex(c,a);
vertex (e,b);
endShape(CLOSE);




//system
stroke(random(255), random(50));
strokeWeight(3);

 fill(random(241),random(198), 0,random(60)); //arancio
    ellipse( b, a, r, r);
 fill(random(201), random(206), random(5),random(90)); //verdino
     ellipse( c,c, p,p);
 fill(0, random(175), random(162),random(50)); //azzurro
     ellipse( a, d,q,q);
 fill(random(178), random(95), random(170),random(60)); //viola
     ellipse( b, f,s,s);   
}




void keyTyped() {
  
  if (key==' '){background (0);}
  
  loop();
redraw ();

}

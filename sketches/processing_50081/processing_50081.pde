
void setup() {
 size(600,600);
 background(255);  
  smooth();
  noLoop();
  frameRate(14);
}
 void draw (){
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
strokeWeight(0);
noStroke();



 fill(0, 175, 162, 50); 
beginShape();
vertex(a,b);
vertex(b,c);
vertex(c,d);
vertex (e,f);
endShape(CLOSE);




//sistem
stroke(255);
strokeWeight(3);

 fill(241,198, 0); //arancio
    ellipse( a, b, r, r);
 fill(201, 206, 5); //verdino
     ellipse( b,c, p,p);
 fill(0, 175, 162); //azzurro
     ellipse( c, d,q,q);
 fill(178, 95, 170); //viola
     ellipse( e, f,s,s);   
}




void keyTyped() {
  
  if (key==' '){background (255);}
  
  loop();
redraw ();

}




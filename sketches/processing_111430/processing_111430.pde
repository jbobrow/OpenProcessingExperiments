
int v = 250;


void setup(){

  size (500,500);
  background(0);
 
  
}



void draw(){
 float v;
  v=mouseX;
  
  
//face
fill(255);
beginShape();
vertex(390,460);
vertex(90,480);
vertex(20, 20);
vertex(480,30);
endShape(CLOSE);

//mouth
fill(40);
//old value
//arc(250,250, v, 300, 0, PI );

//new value
arc(250,250, v-100, 300, 0, PI );


//eye L
beginShape();
// old values:
//vertex(v-70, v-150);
//vertex(v-50,v-150);

// new values:
vertex(v+50, v-200);
vertex(v+70,v-200);

vertex(200,200);
vertex(180,200);
endShape(CLOSE);

// eye r 
beginShape();
// old values:
//vertex(v, v-150);
//vertex(v+20,v-150);

//new values
vertex(v-100, v-150);
vertex(v-80,v-150);

vertex(270,200);
vertex(250,200);
endShape(CLOSE);



//Hair. A detail.
stroke(50);
for (int i=200; i<250; i+=10)
{
  line(i, 50, i-30, 70);
}

}


//line(200,350,320,380);


// origine x,y, circle diametres, and 2 points radius coordinate to slice


//convert angles to radians straight away
//arc(250,250,150,150, radians(45), radians(140)  );




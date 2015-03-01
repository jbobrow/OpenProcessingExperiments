
//import processing.pdf.*;


size (600,600);


background (#AD0000);
noStroke ();



for (int a=0;a<700;a+=20){
  for (int b=0;b<700;b+=50){
fill (25,0,0,50);
ellipse (a,b,90,10);
stroke(a,a,a, 500);

ellipse (a,b,3,40);
stroke(a,a,a, 50);

ellipse (a,b,40,40);

}

fill(255);
ellipse(50,50,50,50);

fill(255,1);
ellipse(100,100,50,50);

fill(255);
ellipse(150,150,50,50);

fill(255,1);
ellipse(200,200,50,50);

fill(255);
ellipse(250,250,50,50);

strokeWeight (12);
fill(255,3);
ellipse(400,410,300,300);
}


//endRecord();


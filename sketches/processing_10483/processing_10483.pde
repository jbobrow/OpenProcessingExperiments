

PShape kopf_aggr, kopf_norm, stern, koerper_norm, koerper_aggr;
PShape stadt_norm, stadt_aggr;


void setup()
{
size (400,400);
background (255);
smooth();
frameRate(25);
shapeMode(CENTER);
colorMode(HSB);


kopf_aggr = loadShape ("kopf_a.svg");
kopf_norm = loadShape ("kopf_n.svg");
stern = loadShape ("stern.svg");
koerper_norm = loadShape ("koerper_n.svg");
koerper_aggr = loadShape ("koerper_a.svg");
stadt_norm = loadShape ("stadt_n.svg");
stadt_aggr = loadShape ("stadt_a.svg");


}


void draw ()
{

  background (174, 44, mouseY/2+100); //80-100

//shape (kopf_norm, width/2, height/2);

//for (int i=0; i<100; i=i+10)
{
}

shape (stadt_norm, width/2, height/2);
shape (koerper_norm, width/2, height/2);
shape (kopf_norm,width/2, height/2);




        
       


if (mousePressed)
{

background (0,70,random(40,100));
shape (stadt_aggr, width/2,height/2);






pushMatrix();                        //betrifft nur innenteil
 translate( width/2, height/2 );    //mittelpunkt zentrieren
 rotate( frameCount / 12.0 ); 
shape (stern, 0, 0);
popMatrix();
 
 
 shape (koerper_aggr, width/2, height/2);
shape (kopf_aggr, width/2, height/2);



}



}




